/**
 * Einfacher Session-basierter Passwortschutz
 * WARNUNG: Dies ist KEINE echte Sicherheit! Nur zur Abschreckung neugieriger Besucher.
 */

(function() {
  'use strict';
  
  const VALID_USERNAME = 'gast';
  const VALID_PASSWORD = 'htl-leonding';
  const SESSION_KEY = 'senioren-it-auth';
  const LOGIN_PAGE = '/senioren-it-kurs/login.html';
  
  /**
   * Prüft ob Benutzer eingeloggt ist
   */
  function isAuthenticated() {
    try {
      const authData = sessionStorage.getItem(SESSION_KEY);
      if (!authData) return false;
      
      const data = JSON.parse(authData);
      // Prüfen ob Session noch gültig (max. 4 Stunden)
      const fourHours = 4 * 60 * 60 * 1000;
      if (Date.now() - data.timestamp > fourHours) {
        sessionStorage.removeItem(SESSION_KEY);
        return false;
      }
      
      return data.authenticated === true;
    } catch (e) {
      return false;
    }
  }
  
  /**
   * Setzt Authentication Status
   */
  function setAuthenticated() {
    sessionStorage.setItem(SESSION_KEY, JSON.stringify({
      authenticated: true,
      timestamp: Date.now()
    }));
  }
  
  /**
   * Validiert Login-Credentials
   */
  function validateLogin(username, password) {
    return username === VALID_USERNAME && password === VALID_PASSWORD;
  }
  
  /**
   * Logout Funktion
   */
  function logout() {
    sessionStorage.removeItem(SESSION_KEY);
    window.location.href = LOGIN_PAGE;
  }
  
  /**
   * Redirect zu Login wenn nicht authentifiziert
   */
  function requireAuth() {
    if (!isAuthenticated()) {
      // Aktuelle URL speichern für Redirect nach Login
      sessionStorage.setItem('senioren-it-redirect', window.location.pathname + window.location.search);
      window.location.href = LOGIN_PAGE;
    }
  }
  
  // Export functions
  window.SeniorenAuth = {
    isAuthenticated: isAuthenticated,
    setAuthenticated: setAuthenticated,
    validateLogin: validateLogin,
    logout: logout,
    requireAuth: requireAuth
  };
})();
