Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD122372EF5
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314281; cv=none; b=n+YJ2ZWM1XtD0YVjqsQm8jdPIb3rYxWWdZrMWkhh1AkaxXs1VN5wqqCkagy5azkSx/ZJH/koKEfUHBL2LMOQFsSfllnAMmZVkE0jXbD+sXPSKPT94dWLd88GhZGb8jRbji4xBQPwaJQ3sgIgVOshopBn0hXH1iTYmAb8ZntdJEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314281; c=relaxed/simple;
	bh=pFvQhFQQJ5WA/63YO6fbaol7JkoGlogjVPnUu1ZrqmY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+702+nIPqtHd4OtBfynJe4QgTy4HlEywDBDfD/3+Z9K7z0thUSm2XAqEycf5ebBX7tW52bzuUTacMo3go3erum4pJl9YbIr228CqIRistivn7WVGce/hy7FG2fMVWS5xr+tDzTAm3Hh62oOtXzyJIFlmMIBqzRhNDBuIXlGr00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oMH0i5vO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KFdUZ9hw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gCSylWoe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tVkwIRRN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oMH0i5vO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KFdUZ9hw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gCSylWoe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVkwIRRN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 951E23E05;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mSeo3uodoIBGvdfasWEiXfzXz1ZXNlGx+eu98txtKE=;
	b=oMH0i5vOkICioTITQ8UKVb2n/WWTp1e8YxXY8waUe4r8CMaBk78s75cjeGmoy87wpFBhI7
	wwwQs7hqjkl+ZUNWRXX6kG10b0oIFaQQO+cuEujn0KJ4QJif4qj+Z8/ay+RFcz2BN2B+nI
	x6JZ5G77G7/ero3cj8Q941BC2/pes3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mSeo3uodoIBGvdfasWEiXfzXz1ZXNlGx+eu98txtKE=;
	b=KFdUZ9hwzHIdMBXHCNskKLQbgqZvYC158D/Gyx+irrtuHbdJaJBj0/sdJdT9kA4hLOjMoK
	h5eMCv87oaYah0Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mSeo3uodoIBGvdfasWEiXfzXz1ZXNlGx+eu98txtKE=;
	b=gCSylWoepiQR7+Kwz8hVSbqoeROszojrF37rh0ZxR+7V2/6hUxqTSo+vUD1ixLU7d1MQQ5
	tGK61o9aioCxBxn6767ol5ZbASoloNpjd+Zpr6+ioDQzlyqhOa9+auvnOPRfpdfwUxIsFo
	hrUcTSdgtFIDjoQWpwUco4wcceobC3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mSeo3uodoIBGvdfasWEiXfzXz1ZXNlGx+eu98txtKE=;
	b=tVkwIRRNdcAocft0rOR1nlfGV8b5izVHy53M+kKgj3HX+ZengOv/3U8lNpaalKcn+DWWAJ
	ibtZW6mNrLvZ3mCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73FD5779B1;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4PUiG9e7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/14] ALSA: 6fire: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:19 +0200
Message-ID: <20260729083735.120219-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Clean up the code for managing the firmware loading in the 6fire
driver with __free(firmware) and __free(kfree), so that the loaded
firmware and the name string are cleaned up automatically.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/firmware.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 123c1c6539b8..d9dd8f44b047 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -194,23 +194,20 @@ static int usb6fire_fw_ezusb_upload(
 	int ret;
 	u8 data;
 	struct usb_device *device = interface_to_usbdev(intf);
-	const struct firmware *fw = NULL;
-	struct ihex_record *rec = kmalloc_obj(struct ihex_record);
+	struct ihex_record *rec __free(kfree) = kmalloc_obj(struct ihex_record);
 
 	if (!rec)
 		return -ENOMEM;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, fwname, &device->dev);
 	if (ret < 0) {
-		kfree(rec);
 		dev_err(&intf->dev,
 			"error requesting ezusb firmware %s.\n", fwname);
 		return ret;
 	}
 	ret = usb6fire_fw_ihex_init(fw, rec);
 	if (ret < 0) {
-		kfree(rec);
-		release_firmware(fw);
 		dev_err(&intf->dev,
 			"error validating ezusb firmware %s.\n", fwname);
 		return ret;
@@ -219,8 +216,6 @@ static int usb6fire_fw_ezusb_upload(
 	data = 0x01; /* stop ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
 	if (ret) {
-		kfree(rec);
-		release_firmware(fw);
 		dev_err(&intf->dev,
 			"unable to upload ezusb firmware %s: begin message.\n",
 			fwname);
@@ -231,8 +226,6 @@ static int usb6fire_fw_ezusb_upload(
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, rec->address,
 				rec->data, rec->len);
 		if (ret) {
-			kfree(rec);
-			release_firmware(fw);
 			dev_err(&intf->dev,
 				"unable to upload ezusb firmware %s: data urb.\n",
 				fwname);
@@ -240,8 +233,6 @@ static int usb6fire_fw_ezusb_upload(
 		}
 	}
 
-	release_firmware(fw);
-	kfree(rec);
 	if (postdata) { /* write data after firmware has been uploaded */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, postaddr,
 				postdata, postlen);
@@ -270,19 +261,18 @@ static int usb6fire_fw_fpga_upload(
 	int ret;
 	int i;
 	struct usb_device *device = interface_to_usbdev(intf);
-	u8 *buffer = kmalloc(FPGA_BUFSIZE, GFP_KERNEL);
+	u8 *buffer __free(kfree) = kmalloc(FPGA_BUFSIZE, GFP_KERNEL);
 	const char *c;
 	const char *end;
-	const struct firmware *fw;
 
 	if (!buffer)
 		return -ENOMEM;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, fwname, &device->dev);
 	if (ret < 0) {
 		dev_err(&intf->dev, "unable to get fpga firmware %s.\n",
 				fwname);
-		kfree(buffer);
 		return -EIO;
 	}
 
@@ -291,8 +281,6 @@ static int usb6fire_fw_fpga_upload(
 
 	ret = usb6fire_fw_ezusb_write(device, 8, 0, NULL, 0);
 	if (ret) {
-		kfree(buffer);
-		release_firmware(fw);
 		dev_err(&intf->dev,
 			"unable to upload fpga firmware: begin urb.\n");
 		return ret;
@@ -304,15 +292,11 @@ static int usb6fire_fw_fpga_upload(
 
 		ret = usb6fire_fw_fpga_write(device, buffer, i);
 		if (ret < 0) {
-			release_firmware(fw);
-			kfree(buffer);
 			dev_err(&intf->dev,
 				"unable to upload fpga firmware: fw urb.\n");
 			return ret;
 		}
 	}
-	release_firmware(fw);
-	kfree(buffer);
 
 	ret = usb6fire_fw_ezusb_write(device, 9, 0, NULL, 0);
 	if (ret) {
-- 
2.55.0

