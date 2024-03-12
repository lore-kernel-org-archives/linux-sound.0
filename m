Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867E13D2EE
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268458; cv=none; b=oQ0w/HE5taAqDpVWvXqz3CkMT6OdQ4Z+dAzRSSMazughmLVD/JEgn81Cv69EkMSS02D2yAz7oeA0ew+1NWIEAQ/dGhDCt+aUTowRMAPvDKqcDnkiY+11UvCIMgnYaI2TZ4C1/V9vMxf846onCNB8Kj0oOpEf+1T35b5iXKspIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268458; c=relaxed/simple;
	bh=Sw5wfBrGNDzxFVaOiKtxcunHWOhb7J838+BA+Rpqylo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/s+yhnsDlnopOBbmZ+tsJKo78K4kv83H7Y3vHqrmlCoRDyb/cMyXzH1vncURi2FlajTnEXXDciOK78oLh2+3cOydDXOscjtRNijuqKyOEwGor6V6fl69XOUTCzNEBQ/scse56StVwnKmqfJEXzY6ZicSAAPdzpYn+xiro9yWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=SKXVDevC; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="SKXVDevC"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 09C69604B628; Wed, 13 Mar 2024 05:04:14 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 09C69604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268454; bh=/oxY8cz0VkKojDihZRMLMue48sz5bVgWcUoRwT5P1gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKXVDevCYiWy2Uh00r3Fy8su3VmWmRE/AXTWRVdVLkPThqW+4Q5Eo5Qfatqfu/WhO
	 DgYOw73me8BRdoeCCQ9F8w5g6S4WlcZpnayEP2zcR2yBAFOCi0drBcvCpXf7cbzin1
	 r3rD9dQtnf+GVvgwRyDzCdHLiyBSrhLWcyR/eOsETt1IsAxfjGRQwIYPkXb6jknnQo
	 ZIYAUrvhbL9WL5IJ/BeWfUmnSoYtynsoREjtA6PQn5X2j+g4gKIos5gl2CF+UiEF/+
	 9Me94dIDhYrcZadZjvpQTmiI5mqEQgziy39BUyNh/GnEdf6tgRGgnZrsTI1pGKt6dO
	 QB0QSS6Ciy1sQ==
Date: Wed, 13 Mar 2024 05:04:14 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 02/14] ALSA: scarlett2: Implement handling of the ACK
 notification
Message-ID: <452d1263c40fa8eba1cfb24e2055e40a84cbc437.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710264833.git.g@b4.vu>

After scarlett2_usb() sends a command, it seems that we should wait
for an ACK before attempting to read the response. Not doing that
didn't seem necessary previously but seems to be causing occasional
issues with 4th Gen devices.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 8390b646c0ae..02c488c80b7e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -321,6 +321,7 @@ struct scarlett2_notification {
 	void (*func)(struct usb_mixer_interface *mixer);
 };
 
+static void scarlett2_notify_ack(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_sync(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer);
@@ -343,7 +344,7 @@ static void scarlett2_notify_pcm_input_switch(
 /* Arrays of notification callback functions */
 
 static const struct scarlett2_notification scarlett2_notifications[] = {
-	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000001, scarlett2_notify_ack },
 	{ 0x00000008, scarlett2_notify_sync },
 	{ 0x00200000, scarlett2_notify_dim_mute },
 	{ 0x00400000, scarlett2_notify_monitor },
@@ -353,14 +354,14 @@ static const struct scarlett2_notification scarlett2_notifications[] = {
 };
 
 static const struct scarlett2_notification scarlett3a_notifications[] = {
-	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000001, scarlett2_notify_ack },
 	{ 0x00800000, scarlett2_notify_input_other },
 	{ 0x01000000, scarlett2_notify_direct_monitor },
 	{ 0, NULL }
 };
 
 static const struct scarlett2_notification scarlett4_solo_notifications[] = {
-	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000001, scarlett2_notify_ack },
 	{ 0x00000008, scarlett2_notify_sync },
 	{ 0x00400000, scarlett2_notify_input_air },
 	{ 0x00800000, scarlett2_notify_direct_monitor },
@@ -371,7 +372,7 @@ static const struct scarlett2_notification scarlett4_solo_notifications[] = {
 };
 
 static const struct scarlett2_notification scarlett4_2i2_notifications[] = {
-	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000001, scarlett2_notify_ack },
 	{ 0x00000008, scarlett2_notify_sync },
 	{ 0x00200000, scarlett2_notify_input_safe },
 	{ 0x00400000, scarlett2_notify_autogain },
@@ -387,7 +388,7 @@ static const struct scarlett2_notification scarlett4_2i2_notifications[] = {
 };
 
 static const struct scarlett2_notification scarlett4_4i4_notifications[] = {
-	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000001, scarlett2_notify_ack },
 	{ 0x00000008, scarlett2_notify_sync },
 	{ 0x00200000, scarlett2_notify_input_safe },
 	{ 0x00400000, scarlett2_notify_autogain },
@@ -942,7 +943,9 @@ struct scarlett2_device_info {
 struct scarlett2_data {
 	struct usb_mixer_interface *mixer;
 	struct mutex usb_mutex; /* prevent sending concurrent USB requests */
+	struct completion cmd_done;
 	struct mutex data_mutex; /* lock access to this data */
+	u8 running;
 	u8 hwdep_in_use;
 	u8 selected_flash_segment_id;
 	u8 flash_write_state;
@@ -1960,6 +1963,17 @@ static int scarlett2_usb(
 		goto unlock;
 	}
 
+	if (!wait_for_completion_timeout(&private->cmd_done,
+					 msecs_to_jiffies(1000))) {
+		usb_audio_err(
+			mixer->chip,
+			"%s USB request timed out, cmd %x\n",
+			private->series_name, cmd);
+
+		err = -ETIMEDOUT;
+		goto unlock;
+	}
+
 	/* send a second message to get the response */
 
 	err = scarlett2_usb_rx(dev, private->bInterfaceNumber,
@@ -6702,6 +6716,18 @@ static void scarlett2_notify_pcm_input_switch(struct usb_mixer_interface *mixer)
 	scarlett2_notify_mux(mixer);
 }
 
+/* Handle acknowledgement that a command was received; let
+ * scarlett2_usb() know that it can proceed
+ */
+static void scarlett2_notify_ack(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	/* if running == 0, ignore ACKs */
+	if (private->running)
+		complete(&private->cmd_done);
+}
+
 /* Interrupt callback */
 static void scarlett2_notify(struct urb *urb)
 {
@@ -6718,6 +6744,12 @@ static void scarlett2_notify(struct urb *urb)
 
 	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
 
+	/* Ignore notifications except ACK during initialisation.
+	 * ACK is 0x00000001 on every device.
+	 */
+	if (private->running < 2)
+		data &= 1;
+
 	while (data && notifications->mask) {
 		if (data & notifications->mask) {
 			data &= ~notifications->mask;
@@ -6738,6 +6770,8 @@ static void scarlett2_notify(struct urb *urb)
 	    ustatus != -ESHUTDOWN) {
 		urb->dev = mixer->chip->dev;
 		usb_submit_urb(urb, GFP_ATOMIC);
+	} else {
+		complete(&private->cmd_done);
 	}
 }
 
@@ -6889,6 +6923,8 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 			 transfer_buffer, private->wMaxPacketSize,
 			 scarlett2_notify, mixer, private->bInterval);
 
+	init_completion(&private->cmd_done);
+
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
 
@@ -6911,6 +6947,24 @@ static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Set up the interrupt polling for notifications.
+	 * When running is:
+	 * 0: all notifications are ignored
+	 * 1: only ACKs are handled
+	 * 2: all notifications are handled
+	 */
+	err = scarlett2_init_notify(mixer);
+	if (err < 0)
+		return err;
+
+	/* sleep for a moment in case of an outstanding ACK */
+	msleep(20);
+
+	/* start handling ACKs, but no other notifications until the
+	 * ALSA controls have been created
+	 */
+	private->running = 1;
+
 	/* step 1 */
 	private->scarlett2_seq = 1;
 	err = scarlett2_usb(mixer, SCARLETT2_USB_INIT_1, NULL, 0, NULL, 0);
@@ -7308,10 +7362,8 @@ static int snd_scarlett2_controls_create(
 		scarlett2_phantom_update_access(mixer);
 	}
 
-	/* Set up the interrupt polling */
-	err = scarlett2_init_notify(mixer);
-	if (err < 0)
-		return err;
+	/* Start handling all notifications */
+	private->running = 2;
 
 	return 0;
 }
-- 
2.43.0

