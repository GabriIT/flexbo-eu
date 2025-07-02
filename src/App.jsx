import React from 'react';

function App() {
  return (
    <div style={{ padding: '2rem', textAlign: 'center' }}>
      <h1>Welcome to Flexbo EU</h1>

      <video width="640" height="360" controls>
        <source src="/assets/Install_Open_Close_Lid.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>

      <video width="640" height="360" controls>
        <source src="/assets/Install_tap_valve.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>


      <h2>Gallery</h2>
      <div style={{ display: 'flex', justifyContent: 'center', gap: '20px', marginTop: '1rem' }}>
        <img src="/assets/2inches_valves.jpg" width="200" alt="Asset 1" />
        <img src="/assets/image2.png" width="200" alt="Asset 2" />
      </div>
    </div>
  );
}

export default App;
