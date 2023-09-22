import { useNavigate } from "react-router-dom";

export function TopBar(props: {showInfo: () => void}) {

    const navigate = useNavigate();

    return <div className="topbar">
        <div className="projectname" onClick={handleProjectNameClick}>
            SyncShop
        </div>
        <div className="groupnumber">Group 14</div>
    </div>

    function handleProjectNameClick() {
        navigate("/", {replace: true});
        props.showInfo();
    }
  }