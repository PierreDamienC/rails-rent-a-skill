import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const displayCalendar = () => {
   const bookingForm = document.getElementById('booking-form-div');

   if (bookingForm) {
    const bookings = JSON.parse(bookingForm.dataset.bookings);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": bookings,
    })
  };


};

const displayBookingDetails = () => {
  console.log("Hi from booking details");

  const startDate = document.getElementById("range_start");
  const endDate = document.getElementById("range_end");
  const totalDays = document.getElementById("total-days")

  const dynamicPrice = () => {
    let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
    let nbrOfDays = (dateDiffInMilliseconds / 86400000)+1;
    console.log(nbrOfDays)
    if(startDate.value && endDate.value) {
      totalDays.innerText = nbrOfDays
    }
  };

  [startDate, endDate].forEach (date => {
    date.addEventListener("change", (event) => {
      dynamicPrice();
    });
  })

}


export {displayCalendar};
export {displayBookingDetails}

