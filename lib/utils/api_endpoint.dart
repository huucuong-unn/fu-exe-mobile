class ApiEndpoint {
  static final String baseUrl = 'http://localhost:8086/api/v1';
  // 'https://tortee-463vt.ondigitalocean.app/api/v1';
  static _AuthEndpoint auth = _AuthEndpoint();
  static _CampaignEndpoint campaign = _CampaignEndpoint();
  static _MentorEndpoint mentor = _MentorEndpoint();
  static _AccountMenteeEndpoint accountMentee = _AccountMenteeEndpoint();
}

class _AuthEndpoint {
  final String login = '/auth/login';
  final String logout = '/auth/logout';
}

class _CampaignEndpoint {
  final String getAll = '/campaigns';
  final String getActive = '/campaign/campaign-status-true?page=1&limit=1';
}

class _MentorEndpoint {
  final String getAll = '/mentors';
  final String getActive = '/mentor/mentor-status-true?page=1&limit=1';
}

class _AccountMenteeEndpoint {
  final String getOne = '/account/account-mentee-info/';
}
