Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DAD34D935
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894035; cv=none; b=Tiuk2YENnlU+TGRmNMY1FWG6O6t3f+J0QjKcAGrjFkPNkX7cENRUUORMTrkIf2i8WTi4SV+jt2wShvKGXNUICU0Ab7fytI+Dhv/h+4C+KWLVePkzc2XQQLGpWKsv11E/8/GT8hXzxJc6OMr8orUpYZd8VCMsgtmBT4XMtj1pExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894035; c=relaxed/simple;
	bh=tiwTA0HIPc275KdlIDcJgBCW2FeyZ03ou7jNoH+7900=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGek7LHiXKwip/OoAOM2ck/XBHnkXZ8L5LV9e2p/GmSPaYklwYCuiTMZwejuo1jOP3f8xEpgVGZ7CB2EEMkGjikGRdEf2mPUdpzZtiHsJIdVlryqHhY66sKaUFbzL8Rm+eVfi0VK1EvRSbr9vOLqHpYtG//zkC2Ca2h1INcO+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=coY5gWzO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V+sCZVsK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=coY5gWzO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V+sCZVsK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="coY5gWzO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V+sCZVsK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="coY5gWzO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V+sCZVsK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BB50336B4;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXZIcvhnW06b/TrANgA2OfzQPUXKaG/EKnKanf1xMVo=;
	b=coY5gWzODUIE0QA9tLdOKzJaYo5X+8DCjVTfJydAq3j7NvN/2coIt51CHGuYULa1M5jD8h
	57V/LhW1Xu5expAqHXmza/Jj9M32nwMh22zPiIyAQjeDA6HgvlzLQ9WWZPDV4cIFcsu4Kf
	rJNOUTHthU5QvHbl32OsC43+4ytvGJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXZIcvhnW06b/TrANgA2OfzQPUXKaG/EKnKanf1xMVo=;
	b=V+sCZVsKw/BgyFIr0mSDim5nOFZj+MO8Ul0hm6gKGdf3aWmgCtKO8WV+QPusPpFjVemS3x
	aDo/ykGppgp1eYAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXZIcvhnW06b/TrANgA2OfzQPUXKaG/EKnKanf1xMVo=;
	b=coY5gWzODUIE0QA9tLdOKzJaYo5X+8DCjVTfJydAq3j7NvN/2coIt51CHGuYULa1M5jD8h
	57V/LhW1Xu5expAqHXmza/Jj9M32nwMh22zPiIyAQjeDA6HgvlzLQ9WWZPDV4cIFcsu4Kf
	rJNOUTHthU5QvHbl32OsC43+4ytvGJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXZIcvhnW06b/TrANgA2OfzQPUXKaG/EKnKanf1xMVo=;
	b=V+sCZVsKw/BgyFIr0mSDim5nOFZj+MO8Ul0hm6gKGdf3aWmgCtKO8WV+QPusPpFjVemS3x
	aDo/ykGppgp1eYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 291513EA68;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OI96CXNnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/11] ALSA: usb-audio: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:33 +0100
Message-ID: <20251216140634.171890-12-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.78
X-Spam-Level: 
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.899];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Note that there are still a few remaining __free(kfree) with NULL
initializations; they are because of the code complexity (the data
size calculation).

Fixes: 43d4940c944c ("ALSA: usb: scarlett2: Clean ups with guard() and __free()")
Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Fixes: f7d306b47a24 ("ALSA: usb-audio: Fix a DMA to stack memory bug")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c             | 36 ++++++++++++++++++------------------
 sound/usb/mixer_scarlett2.c | 21 ++++++++++-----------
 sound/usb/quirks.c          | 13 ++++++-------
 3 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 11e9a96b46ff..1f4595d1e217 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -182,10 +182,6 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 {
 	struct fcp_data *private = mixer->private_data;
 	struct usb_device *dev = mixer->chip->dev;
-	struct fcp_usb_packet *req __free(kfree) = NULL;
-	struct fcp_usb_packet *resp __free(kfree) = NULL;
-	size_t req_buf_size = struct_size(req, data, req_size);
-	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	int retries = 0;
 	const int max_retries = 5;
 	int err;
@@ -193,10 +189,14 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 	if (!mixer->urb)
 		return -ENODEV;
 
+	struct fcp_usb_packet *req __free(kfree) = NULL;
+	size_t req_buf_size = struct_size(req, data, req_size);
 	req = kmalloc(req_buf_size, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
+	struct fcp_usb_packet *resp __free(kfree) = NULL;
+	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	resp = kmalloc(resp_buf_size, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
@@ -300,16 +300,17 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 static int fcp_reinit(struct usb_mixer_interface *mixer)
 {
 	struct fcp_data *private = mixer->private_data;
-	void *step0_resp __free(kfree) = NULL;
-	void *step2_resp __free(kfree) = NULL;
 
 	if (mixer->urb)
 		return 0;
 
-	step0_resp = kmalloc(private->step0_resp_size, GFP_KERNEL);
+	void *step0_resp __free(kfree) =
+		kmalloc(private->step0_resp_size, GFP_KERNEL);
 	if (!step0_resp)
 		return -ENOMEM;
-	step2_resp = kmalloc(private->step2_resp_size, GFP_KERNEL);
+
+	void *step2_resp __free(kfree) =
+		kmalloc(private->step2_resp_size, GFP_KERNEL);
 	if (!step2_resp)
 		return -ENOMEM;
 
@@ -464,7 +465,6 @@ static int fcp_ioctl_init(struct usb_mixer_interface *mixer,
 	struct fcp_init init;
 	struct usb_device *dev = mixer->chip->dev;
 	struct fcp_data *private = mixer->private_data;
-	void *resp __free(kfree) = NULL;
 	void *step2_resp;
 	int err, buf_size;
 
@@ -485,7 +485,8 @@ static int fcp_ioctl_init(struct usb_mixer_interface *mixer,
 	/* Allocate response buffer */
 	buf_size = init.step0_resp_size + init.step2_resp_size;
 
-	resp = kmalloc(buf_size, GFP_KERNEL);
+	void *resp __free(kfree) =
+		kmalloc(buf_size, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
 
@@ -619,7 +620,6 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 {
 	struct fcp_meter_map map;
 	struct fcp_data *private = mixer->private_data;
-	s16 *tmp_map __free(kfree) = NULL;
 	int err;
 
 	if (copy_from_user(&map, arg, sizeof(map)))
@@ -641,7 +641,8 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 
 	/* Allocate and copy the map data */
-	tmp_map = memdup_array_user(arg->map, map.map_size, sizeof(s16));
+	s16 *tmp_map __free(kfree) =
+		memdup_array_user(arg->map, map.map_size, sizeof(s16));
 	if (IS_ERR(tmp_map))
 		return PTR_ERR(tmp_map);
 
@@ -651,17 +652,16 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 
 	/* If the control doesn't exist, create it */
 	if (!private->meter_ctl) {
-		s16 *new_map __free(kfree) = NULL;
-		__le32 *meter_levels __free(kfree) = NULL;
-
 		/* Allocate buffer for the map */
-		new_map = kmalloc_array(map.map_size, sizeof(s16), GFP_KERNEL);
+		s16 *new_map __free(kfree) =
+			kmalloc_array(map.map_size, sizeof(s16), GFP_KERNEL);
 		if (!new_map)
 			return -ENOMEM;
 
 		/* Allocate buffer for reading meter levels */
-		meter_levels = kmalloc_array(map.meter_slots, sizeof(__le32),
-					     GFP_KERNEL);
+		__le32 *meter_levels __free(kfree) =
+			kmalloc_array(map.meter_slots, sizeof(__le32),
+				      GFP_KERNEL);
 		if (!meter_levels)
 			return -ENOMEM;
 
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f2446bf3982c..0d4d9a392234 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2377,18 +2377,18 @@ static int scarlett2_usb(
 {
 	struct scarlett2_data *private = mixer->private_data;
 	struct usb_device *dev = mixer->chip->dev;
-	struct scarlett2_usb_packet *req __free(kfree) = NULL;
-	struct scarlett2_usb_packet *resp __free(kfree) = NULL;
-	size_t req_buf_size = struct_size(req, data, req_size);
-	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	int retries = 0;
 	const int max_retries = 5;
 	int err;
 
+	struct scarlett2_usb_packet *req __free(kfree) = NULL;
+	size_t req_buf_size = struct_size(req, data, req_size);
 	req = kmalloc(req_buf_size, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
+	struct scarlett2_usb_packet *resp __free(kfree) = NULL;
+	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	resp = kmalloc(resp_buf_size, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
@@ -3919,9 +3919,9 @@ static int scarlett2_input_select_ctl_info(
 	struct scarlett2_data *private = mixer->private_data;
 	int inputs = private->info->gain_input_count;
 	int i, err;
-	char **values __free(kfree) = NULL;
+	char **values __free(kfree) =
+		kcalloc(inputs, sizeof(char *), GFP_KERNEL);
 
-	values = kcalloc(inputs, sizeof(char *), GFP_KERNEL);
 	if (!values)
 		return -ENOMEM;
 
@@ -9083,8 +9083,6 @@ static long scarlett2_hwdep_read(struct snd_hwdep *hw,
 		__le32 len;
 	} __packed req;
 
-	u8 *resp __free(kfree) = NULL;
-
 	/* Flash segment must first be selected */
 	if (private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_SELECTED)
 		return -EINVAL;
@@ -9122,7 +9120,8 @@ static long scarlett2_hwdep_read(struct snd_hwdep *hw,
 	req.offset = cpu_to_le32(*offset);
 	req.len = cpu_to_le32(count);
 
-	resp = kzalloc(count, GFP_KERNEL);
+	u8 *resp __free(kfree) =
+		kzalloc(count, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
 
@@ -9267,7 +9266,6 @@ static ssize_t scarlett2_devmap_read(
 	loff_t                 pos)
 {
 	struct usb_mixer_interface *mixer = entry->private_data;
-	u8           *resp_buf __free(kfree) = NULL;
 	const size_t  block_size = SCARLETT2_DEVMAP_BLOCK_SIZE;
 	size_t        copied = 0;
 
@@ -9277,7 +9275,8 @@ static ssize_t scarlett2_devmap_read(
 	if (pos + count > entry->size)
 		count = entry->size - pos;
 
-	resp_buf = kmalloc(block_size, GFP_KERNEL);
+	u8 *resp_buf __free(kfree) =
+		kmalloc(block_size, GFP_KERNEL);
 	if (!resp_buf)
 		return -ENOMEM;
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index f38330b095e9..9a76f35d331c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -555,7 +555,6 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 
 	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
@@ -566,8 +565,8 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
 				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
-
-		new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+		struct usb_device_descriptor *new_device_descriptor __free(kfree) =
+			kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
 		if (!new_device_descriptor)
 			return -ENOMEM;
 		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
@@ -910,7 +909,6 @@ static void mbox2_setup_48_24_magic(struct usb_device *dev)
 static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 	u8 bootresponse[0x12];
 	int fwsize;
@@ -945,7 +943,8 @@ static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "device initialised!\n");
 
-	new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+	struct usb_device_descriptor *new_device_descriptor __free(kfree) =
+		kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
 	if (!new_device_descriptor)
 		return -ENOMEM;
 
@@ -1267,7 +1266,6 @@ static void mbox3_setup_defaults(struct usb_device *dev)
 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 	int descriptor_size;
 
@@ -1280,7 +1278,8 @@ static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
 
-	new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+	struct usb_device_descriptor *new_device_descriptor __free(kfree) =
+		kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
 	if (!new_device_descriptor)
 		return -ENOMEM;
 
-- 
2.52.0

