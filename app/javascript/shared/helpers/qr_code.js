import axios from 'axios';
// import { router } from 'dashboard/routes/index';

/**
 * Writes a text string to the system clipboard.
 *
 * @async
 * @param {string} text text to be written to the clipboard
 * @throws {Error} unable to copy text to clipboard
 */
export const fetchQRCode = async qrData => {
  try {
    if (qrData != null) {
      const url = 'http://65.0.73.210:3000/get-qrcode';

      const resp = await axios.get(url, {
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
      });

      return resp.data; // check json object
    }

    return { qrData: '' };
  } catch (error) {
    throw new Error('Unable to fetch QR Code');
  }
};

// export const fetchQRCode = (qrData, socket) => {
//   return new Promise((resolve, reject) => {
//     try {
//       if (qrData != null && socket != null) {
//         // Send a request message to the WebSocket server
//         socket.send('/get-qrcode');

//         // Event handler for receiving responses from the WebSocket server
//         socket.addEventListener('message', event => {
//           const responseData = JSON.parse(event.data);
//           resolve(responseData); // Resolve the Promise with the received data
//         });

//         // You can also add error handling logic for WebSocket errors here
//       }
//     } catch (error) {
//       reject(new Error('Unable to fetch QR Code'));
//     }
//   });
// };
