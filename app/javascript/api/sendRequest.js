import axios from 'axios';

const sendRequest = async ({ url, method, body, isMultipart = false, headers = {} }) => {
  try {
    const options = {
      method,
      url,
      headers,
    };

    if (body) {
      if (isMultipart) {
        options.data = body; // for multipart requests, send data as 'data'
      } else {
        options.data = body; // JSON body
      }
    }

    const response = await axios(options);

    if (response.status === 204) {
      return {
        success: true,
        message: "No Content",
      };
    }

    // Handle specific file requests
    if (
      url.endsWith('.xlsx') ||
      url.includes('.xlsx') ||
      url.includes('export_attendence') ||
      url.includes('download_qr_code') ||
      url.includes('export_projects_profiles')
    ) {
      return response; // return the full response for file requests
    } else {
      return response.data; // return the response data for JSON responses
    }
  } catch (error) {
    throw error;
  }
};

export default sendRequest;
