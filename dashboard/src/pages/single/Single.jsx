import './single.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import Navbar from '../../components/navbar/Navbar';
import Chart from '../../components/chart/Chart';
import TableList from '../../components/tablelist/TableList';
import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'axios';
import Loading from '../../components/Loading/Loading';
// import { Button } from '@mui/material';
const Single = () => {
  const { userId } = useParams();
  const [user, setUser] = useState(null);
  const [bookings, setBookings] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchUserDetails = async () => {
      try {
        const accessToken = localStorage.getItem('accessToken');

        if (!accessToken) {
          throw new Error('Access token is not available');
        }
        const response = await axios.get(`http://localhost:8000/v1/admin/user-detail/${userId}`,{
          headers: {
            'Authorization': `Bearer ${accessToken}`
          }
        });
        setUser(response.data.user);
        setBookings(response.data.bookings);
      } catch (error) {
        console.error('Error fetching user details:', error);
      } finally {
        setTimeout(() => {
          setLoading(false);
        }, 2000);
      }
    };

    fetchUserDetails();
  }, [userId]);

  if (loading) {
    return <><Loading/></>;
  }

  return (
    <div className='single'>
      <Sidebar />
      <div className="singleContainer">
        <Navbar />
        <div className="top">
          <div className="left">
            {/* <div className="editButton">Edit</div> */}
            <h1 className="title">Information</h1>
            <div className="item">
              <img
                src={user?.profileImage || "https://images.unsplash.com/photo-1574701148212-8518049c7b2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwZ2lybHN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"}
                alt="profile pic"
                className='itemImg'
              />
              <div className="details">
                <h1 className="itemTitle">{user?.fullName || "N/A"}</h1>
                <div className="detailItem">
                  <span className="itemKey">Email: </span>
                  <span className="itemValue">{user?.email || "N/A"}</span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">Phone: </span>
                  <span className="itemValue">{user?.phoneNo || "N/A"}</span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">Age: </span>
                  <span className="itemValue">{user?.age || "N/A"}</span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">Country: </span>
                  <span className="itemValue">{user?.country || "N/A"}</span>
                </div>
                <div className="detailItem">
                  <button className='recoverBtn'>Recover Account </button>
                  
                </div>
              </div>
            </div>
          </div>
          <div className="right">
            <Chart aspect={3/1} title="Transactions Last 6 months"/>
          </div>
        </div>
        <div className="bottom">
          <div className="title">Booking Details</div>
          <table className="tableList">
          {!bookings?<p> No Bookings yet </p> : <thead>
              <tr>
                <th>Booking ID</th>
                <th>User Full Name</th>
                <th>Hostel Name</th>
                <th>Date of Booking</th>
              </tr>
            </thead>}
            <tbody>
              {<p>No Bookings yet</p> || bookings.map(booking => (
                <tr key={booking.bookingId}>
                  <td>{booking.bookingId}</td>
                  <td>{booking.userFullName}</td>
                  <td>{booking.hostelName}</td>
                  <td>{new Date(booking.bookingDate).toLocaleDateString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Single;
