Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF19A358D32
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786298775; cv=none; b=UTM9KACHvkTjJwYHyNmoBJMkbdJSiQT/VK3SQkHy1n+4Z1yGIyl8++hFHD6ZHc7C7A9PEXYLhTmzb0SkwPTBq3DRYYbDTSRPT7wOBLyhEqCHFDXydjZoYfVC7iBR9DvWwP/Ksk1czYT+YCO/bxdK+47mVC2Ol0T77IS4OHG2IjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786298775; c=relaxed/simple;
	bh=hDKyLMgFZGx+2DoBS66M/KW07G9g60YUX4/jwyS3ot0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJbNfwpAIgwE6W+XUCXWCQF9zxHEXN523veDe6kstdt8IZBDO9DXrxjgBBdObo+reTStBf5M48pDoVMmvg+8P05C4ESxEMoBmNJn3U/F/lNe3E8YuzB4743R00UpJW1shiq1Jg4vVae5eKZPmk15ZRL16vAZzl+XoiiSjEPKVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=ZOcHyfVu; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="ZOcHyfVu"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8875267FD8F8; Mon, 10 Aug 2026 03:36:11 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8875267FD8F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1786298771; bh=CgZZRsQE0phvXuoQB7O1dsMDF4YyIqm4pACxWUmw3Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOcHyfVuCwqCYcDFPuCUk4++bh9asvPzNC/STqYt690QGBWSid1nRh+ZKhS86J4Rj
	 St1J/ArubXDkh5eDTjWL6I/s2qebLVoG4gAKa7b7XK3DRsarwmjR5OC+fr8sceGLxR
	 N+6Pp+iqoMOI6eGdARX1lcoeb4KLZotUg2yeF/i8rGi0oRA+hI9DxGyhm2fvmeh3ao
	 YOvy7tg/cFQQK44c/LTFvCkuhmHgpPNKkTmfXo2jGTlbgX3LSLZf1DiJX/6ZaJgwAI
	 CSaw07hn2PfQdJXYCVNPr6moBvW7SDNfWwvocNyv4xsEBFOJg6BnlenPTNW6bkneD9
	 o8yxCLKWZhbGQ==
Date: Mon, 10 Aug 2026 03:36:11 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: scarlett2: Use a private URB for the notification
 endpoint
Message-ID: <ffb8ba37d5d605dfdfd8576949d67098651f9349.1786290885.git.g@b4.vu>
References: <cover.1786290885.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786290885.git.g@b4.vu>

scarlett2_init_notify() used mixer->urb, which
snd_usb_mixer_status_create() allocates for the UAC2 status interrupt
endpoint and mixer.c manages. On a device with that endpoint, the
"already in use" check fires on the status URB and returns 0 for
success without doing anything. No notification URB is submitted, and
cmd_done is left zeroed because it is initialised past that check and
nowhere else. scarlett2_usb_init() then issues SCARLETT2_USB_INIT_1
and wait_for_completion_timeout() would crash adding to the zeroed
wait.head.

Use a separate URB in scarlett2_data, as done for FCP, and initialise
cmd_done in scarlett2_init_private(). mixer.c was also freeing the URB
in snd_usb_mixer_free() and resubmitting it in
snd_usb_mixer_activate(), so scarlett2 must now do both: add
scarlett2_cleanup_urb(), called from private_free and private_suspend,
and a private_resume callback to re-establish the URB after resume.
scarlett2_init_notify() is reached from there, and the URB kill path
in scarlett2_notify() completes cmd_done, leaving a stale count that
would satisfy the next command's wait before the device ACKs. Use
reinit_completion() to clear it.

Also free the URB if the transfer buffer allocation fails, and both if
usb_submit_urb() fails. Move scarlett2_init_notify() up next to
scarlett2_cleanup_urb() so scarlett2_init_private() can reference it
without a forward declaration.

Fixes: 1b65088958ca ("ALSA: scarlett2: Implement handling of the ACK notification")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer.c           |  6 +++
 sound/usb/mixer.h           |  2 +
 sound/usb/mixer_scarlett2.c | 98 ++++++++++++++++++++++++-------------
 3 files changed, 71 insertions(+), 35 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 703c118f9d4e..5de182181ede 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3935,6 +3935,12 @@ int snd_usb_mixer_resume(struct usb_mixer_interface *mixer)
 	struct usb_mixer_elem_list *list;
 	int id, err;
 
+	if (mixer->private_resume) {
+		err = mixer->private_resume(mixer);
+		if (err < 0)
+			return err;
+	}
+
 	/* restore cached mixer values */
 	for (id = 0; id < MAX_ID_ELEMS; id++) {
 		for_each_mixer_elem(list, mixer, id) {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 3fa1bd96f858..037b446d8b6f 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -18,6 +18,7 @@ struct usb_mixer_interface {
 	struct usb_host_interface *hostif;
 	struct list_head list;
 	unsigned int ignore_ctl_error;
+	/* UAC2 status interrupt endpoint; owned by mixer.c */
 	struct urb *urb;
 	/* array[MAX_ID_ELEMS], indexed by unit id */
 	struct usb_mixer_elem_list **id_elems;
@@ -42,6 +43,7 @@ struct usb_mixer_interface {
 	void *private_data;
 	void (*private_free)(struct usb_mixer_interface *mixer);
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
+	int (*private_resume)(struct usb_mixer_interface *mixer);
 };
 
 #define MAX_CHANNELS	64	/* max logical channels */
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 78fb72e626ca..502854cc9f9f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1403,6 +1403,7 @@ struct scarlett2_data {
 	struct usb_mixer_interface *mixer;
 	struct mutex usb_mutex; /* prevent sending concurrent USB requests */
 	struct completion cmd_done;
+	struct urb *urb;        /* notification endpoint */
 	struct mutex data_mutex; /* lock access to this data */
 	u8 running;
 	u8 hwdep_in_use;
@@ -8565,13 +8566,70 @@ static void scarlett2_notify(struct urb *urb)
 	}
 }
 
-/*** Cleanup/Suspend Callbacks ***/
+/*** Notification URB and Cleanup/Suspend Callbacks ***/
+
+/* Submit a URB to receive notifications from the device */
+static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
+{
+	struct usb_device *dev = mixer->chip->dev;
+	struct scarlett2_data *private = mixer->private_data;
+	unsigned int pipe = usb_rcvintpipe(dev, private->bEndpointAddress);
+	void *transfer_buffer;
+	int err;
+
+	/* Already set up */
+	if (private->urb)
+		return 0;
+
+	if (usb_pipe_type_check(dev, pipe))
+		return -EINVAL;
+
+	private->urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!private->urb)
+		return -ENOMEM;
+
+	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
+	if (!transfer_buffer) {
+		usb_free_urb(private->urb);
+		private->urb = NULL;
+		return -ENOMEM;
+	}
+
+	usb_fill_int_urb(private->urb, dev, pipe,
+			 transfer_buffer, private->wMaxPacketSize,
+			 scarlett2_notify, mixer, private->bInterval);
+
+	reinit_completion(&private->cmd_done);
+
+	err = usb_submit_urb(private->urb, GFP_KERNEL);
+	if (err) {
+		kfree(transfer_buffer);
+		usb_free_urb(private->urb);
+		private->urb = NULL;
+	}
+
+	return err;
+}
+
+static void scarlett2_cleanup_urb(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (!private->urb)
+		return;
+
+	usb_kill_urb(private->urb);
+	kfree(private->urb->transfer_buffer);
+	usb_free_urb(private->urb);
+	private->urb = NULL;
+}
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
 	cancel_delayed_work_sync(&private->work);
+	scarlett2_cleanup_urb(mixer);
 	kfree(private);
 	mixer->private_data = NULL;
 }
@@ -8582,6 +8640,8 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 	if (cancel_delayed_work_sync(&private->work))
 		scarlett2_config_save(private->mixer);
+
+	scarlett2_cleanup_urb(mixer);
 }
 
 /*** Initialisation ***/
@@ -8701,11 +8761,13 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 
 	mutex_init(&private->usb_mutex);
 	mutex_init(&private->data_mutex);
+	init_completion(&private->cmd_done);
 	INIT_DELAYED_WORK(&private->work, scarlett2_config_save_work);
 
 	mixer->private_data = private;
 	mixer->private_free = scarlett2_private_free;
 	mixer->private_suspend = scarlett2_private_suspend;
+	mixer->private_resume = scarlett2_init_notify;
 
 	private->info = entry->info;
 
@@ -8722,40 +8784,6 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	return scarlett2_find_fc_interface(mixer->chip->dev, private);
 }
 
-/* Submit a URB to receive notifications from the device */
-static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
-{
-	struct usb_device *dev = mixer->chip->dev;
-	struct scarlett2_data *private = mixer->private_data;
-	unsigned int pipe = usb_rcvintpipe(dev, private->bEndpointAddress);
-	void *transfer_buffer;
-
-	if (mixer->urb) {
-		usb_audio_err(mixer->chip,
-			      "%s: mixer urb already in use!\n", __func__);
-		return 0;
-	}
-
-	if (usb_pipe_type_check(dev, pipe))
-		return -EINVAL;
-
-	mixer->urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!mixer->urb)
-		return -ENOMEM;
-
-	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
-	if (!transfer_buffer)
-		return -ENOMEM;
-
-	usb_fill_int_urb(mixer->urb, dev, pipe,
-			 transfer_buffer, private->wMaxPacketSize,
-			 scarlett2_notify, mixer, private->bInterval);
-
-	init_completion(&private->cmd_done);
-
-	return usb_submit_urb(mixer->urb, GFP_KERNEL);
-}
-
 /* Cargo cult proprietary initialisation sequence */
 static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 {
-- 
2.55.0

