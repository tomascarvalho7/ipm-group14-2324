import { useNavigate } from "react-router-dom";

export function TopBar() {

    const navigate = useNavigate();

    return <div className="topbar">
        <div className="projectname" onClick={() => navigate("/", {replace: true})}>
            Project name
        </div>
        <div className="groupnumber">Group number</div>
    </div>
  }