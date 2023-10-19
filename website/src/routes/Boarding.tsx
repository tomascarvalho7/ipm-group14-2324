export const Boarding = () => {
  return (
    <div className="boarding">
    
      <div className="boarding-col">
      
        <div className="labels">
          <div className="small-label">Mobile App</div>
          <div className="title-label">
              <div className="start">Sync</div>
              <div className="end">Shop</div>
          </div>
          
          <p className="description-label">
            Say goodbye to shopping list chaos and hello to seamless household collaboration with SyncShop! Download
            today and simplify your family's life, one task at a time.
          </p>
          
        </div>
        
        <div className="boarding-download">
          <button className="boarding-button">
            <div className="download-label">Download</div>
          </button>
          <div className="description-download">for android phones.</div>
        </div>
    
      </div>

      <div className="mobile-app">
          <img className="mobile-display" alt="mobile_display" src="mobile_display.png" /> 
      </div>
      
    </div>
  );
};
