async function printUSB(escposData) {
    try {
        const printer = await navigator.usb.requestDevice({ filters: [{}] });

        if (!printer) {
            console.log("No USB printer found.");
            return;
        }

        await printer.open();
        await printer.selectConfiguration(1);
        await printer.claimInterface(0);

        const encoder = new TextEncoder();
        const data = encoder.encode(escposData);

        await printer.transferOut(1, data);
        console.log("Print job sent!");
    } catch (error) {
        console.error("USB Print Error: ", error);
    }
}
