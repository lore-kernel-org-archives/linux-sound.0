Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A710245008
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786298767; cv=none; b=uQ7OH4ZJ4vIsrWPqT82mVDBikKtv6HowACoP/9kLBECCGg0OZvR3Vu2tDJ9AbsUT2Xk9CzLM+qLESzKIVdkMZGCb3CmsLWFIfekUmHuXY0CWgaeg3irlwJypdtOibD7UVMFtpL66bpDyT6oZJtRiANKbsfmqvaz7q9FZLSxzyXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786298767; c=relaxed/simple;
	bh=eJh8UZbTL5n6WYbCKqNJQigOl5zMtMND9LDxQYoM3OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez5JmbVTyfeXu+rt92Tzcm/CEQZRky0fC3R/xszIMb54kTbfaGcsge0aDJpclDbh8xdvZykowERklmfH5rgWLm96dO1vDkQvo8mbkQLC+5AfoOlnug8fDGttP84oOX62yVcSoTDjCz8S8XZqggHsGdUZRxNxaJOwI1s5ZADVFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=taPteIe1; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="taPteIe1"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 45B5967FD8D8; Mon, 10 Aug 2026 03:36:01 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 45B5967FD8D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1786298761; bh=Nkc+1r9DRhP71d2I9/s+W90+tEIuRHK2XtvUmqLXoLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taPteIe16to1C4X0FhzfFNr1DfED/pi3RlVX64m/nDCzOdecf1UXmdbGrFeuAKD9V
	 I+ZuJalOJ8mV5dvhwBJagbPXNO0zz2Vm2d6mJNHbkDtsFgVd9hthaozFc2IREYpL/h
	 kS6Z8YzVEtZvcjR/tKOA+bKj4syh0WUX1mG3rGBnZoS+q7xlWn2g4pM3M397QInepk
	 wEnSNPSR0WkSkfKqyCqI7TAIq4Q1iBROanVNL/tEU6AFCvjDMiFr+MiDXGvX5109dq
	 aiy8gnZ5rD0jFVvM6IkpjBy0+cZ4rlKfmAGv3nRizl2s2UbT1r31Zhlf3JnY5he/zf
	 M5rK56ZpTcvIg==
Date: Mon, 10 Aug 2026 03:36:01 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: FCP: Use a private URB for the notification
 endpoint
Message-ID: <2cad281e6434024ca48a9ecc94fa19d6777e9be7.1786290885.git.g@b4.vu>
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

fcp_init_notify() used mixer->urb, which snd_usb_mixer_status_create()
allocates for the optional UAC2 status interrupt endpoint and mixer.c
kills, resubmits and frees. On a device with that endpoint,
fcp_init_notify()'s "already set up" early return fires on the status
URB and returns success without doing anything. No FCP notification
URB is submitted, and cmd_done is left zeroed because it is
initialised past that early return and nowhere else. fcp_init() then
issues init1_opcode and wait_for_completion_timeout() would crash
adding to the zeroed wait.head. fcp_cleanup_urb() would also kill and
free mixer.c's status URB.

Use a separate URB in fcp_data, and initialise cmd_done in
fcp_init_private() where fcp_data is allocated. fcp_init_notify() is
reached again after suspend via fcp_reinit(), and the URB kill path in
fcp_notify() completes cmd_done, leaving a stale count that would
satisfy the next command's wait before the device ACKs. Use
reinit_completion() to clear it.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/fcp.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 6f5dcd35e1d4..6c7da5508bc3 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -82,6 +82,7 @@ struct fcp_data {
 	struct mutex mutex;         /* serialise access to the device */
 	struct completion cmd_done; /* wait for command completion */
 	struct file *file;          /* hwdep file */
+	struct urb *urb;            /* FCP notification endpoint */
 
 	struct fcp_notify notify;
 
@@ -186,7 +187,7 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 	const int max_retries = 5;
 	int err;
 
-	if (!mixer->urb)
+	if (!private->urb)
 		return -ENODEV;
 
 	struct fcp_usb_packet *req __free(kfree) = NULL;
@@ -301,7 +302,7 @@ static int fcp_reinit(struct usb_mixer_interface *mixer)
 {
 	struct fcp_data *private = mixer->private_data;
 
-	if (mixer->urb)
+	if (private->urb)
 		return 0;
 
 	void *step0_resp __free(kfree) =
@@ -893,13 +894,15 @@ static int fcp_hwdep_init(struct usb_mixer_interface *mixer)
 
 static void fcp_cleanup_urb(struct usb_mixer_interface *mixer)
 {
-	if (!mixer->urb)
+	struct fcp_data *private = mixer->private_data;
+
+	if (!private->urb)
 		return;
 
-	usb_kill_urb(mixer->urb);
-	kfree(mixer->urb->transfer_buffer);
-	usb_free_urb(mixer->urb);
-	mixer->urb = NULL;
+	usb_kill_urb(private->urb);
+	kfree(private->urb->transfer_buffer);
+	usb_free_urb(private->urb);
+	private->urb = NULL;
 }
 
 static void fcp_private_free(struct usb_mixer_interface *mixer)
@@ -970,37 +973,37 @@ static int fcp_init_notify(struct usb_mixer_interface *mixer)
 	int err;
 
 	/* Already set up */
-	if (mixer->urb)
+	if (private->urb)
 		return 0;
 
 	if (usb_pipe_type_check(dev, pipe))
 		return -EINVAL;
 
-	mixer->urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!mixer->urb)
+	private->urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!private->urb)
 		return -ENOMEM;
 
 	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
 	if (!transfer_buffer) {
-		usb_free_urb(mixer->urb);
-		mixer->urb = NULL;
+		usb_free_urb(private->urb);
+		private->urb = NULL;
 		return -ENOMEM;
 	}
 
-	usb_fill_int_urb(mixer->urb, dev, pipe,
+	usb_fill_int_urb(private->urb, dev, pipe,
 			 transfer_buffer, private->wMaxPacketSize,
 			 fcp_notify, mixer, private->bInterval);
 
-	init_completion(&private->cmd_done);
+	reinit_completion(&private->cmd_done);
 
-	err = usb_submit_urb(mixer->urb, GFP_KERNEL);
+	err = usb_submit_urb(private->urb, GFP_KERNEL);
 	if (err) {
 		usb_audio_err(mixer->chip,
 			      "%s: usb_submit_urb failed: %d\n",
 			      __func__, err);
 		kfree(transfer_buffer);
-		usb_free_urb(mixer->urb);
-		mixer->urb = NULL;
+		usb_free_urb(private->urb);
+		private->urb = NULL;
 	}
 
 	return err;
@@ -1051,6 +1054,7 @@ static int fcp_init_private(struct usb_mixer_interface *mixer)
 		return -ENOMEM;
 
 	mutex_init(&private->mutex);
+	init_completion(&private->cmd_done);
 	init_waitqueue_head(&private->notify.queue);
 	spin_lock_init(&private->notify.lock);
 
-- 
2.55.0

