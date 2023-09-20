import { useNavigate } from "react-router-dom";

export function TopBar() {

    const navigate = useNavigate();

    return <div className="topbar">
        <div className="projectname" onClick={() => navigate("/", {replace: true})}>
            SyncShop
        </div>
        <div className="groupnumber">Group 14</div>
    </div>
  }