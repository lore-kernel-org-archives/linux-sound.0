Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C738424E
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715872; cv=none; b=XVRUdNl4BQAaOue1nfYTPn+v9pdwHevc1IoZXpFeQNYsaNxptYczCt/omPuvGEed2FFO6L/bl3j4ysrpgvvm5YrAJNQSADE0C1HmqJwsdwFxHar+sLwMu4wlSp5SAQpjt2Y5T/nMKxUAZMnukTDdQ8pGwF6uOFmQwjo/xeLvyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715872; c=relaxed/simple;
	bh=3KfOv3i/OsYsrZIiy/HDtUWmL6cXT4AKZOa6Gvbaags=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c6cKole8P5XluLsa1q2bn/sXpMMLaYcBSFMtswbYTtVC0WO58yasqpA89bXtCHjCLA3Y0lNACn1/aaelwB2D7/kS0xOW5qtFIkiixBY69P32MU12YQY0ohh208UoO1UiYsYrEo0eA1FpXHGASdRNtrq5J/xGCKIYx9n9HWses6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TT28Slyn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7u1LMbs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pXseqvCj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YkTpJLfY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TT28Slyn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N7u1LMbs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pXseqvCj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YkTpJLfY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C89223F947;
	Thu,  5 Mar 2026 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rFJGYjES0WuFIV/b/TeYHIk+vroB25prRFZIWSqZYkg=;
	b=TT28Slyn3nBNb7ID2gOBO7Ns3yJ7SKd9G9vQfRFrhP+FV2sh02E8aCkl9uew2wU4v5nAcz
	20IMmkgge+VVO/4sTtpUB6piBagZZMcPTmOkdBqv784C58wSTA2nKSLUzocNb56hXXPBpG
	zNnyVDOIwl1FgqlRRGBIDbSabYl7IYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rFJGYjES0WuFIV/b/TeYHIk+vroB25prRFZIWSqZYkg=;
	b=N7u1LMbsCwNchuA1NuhuagL5zM7aeaVM6u6Fv9cq91GlXEQY+VfRED61XFxnEZewY2mY63
	ThbNddSJSW5xzHCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pXseqvCj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YkTpJLfY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rFJGYjES0WuFIV/b/TeYHIk+vroB25prRFZIWSqZYkg=;
	b=pXseqvCjcuXsBneqALewoqpw3LpsNLJPx9fR6tefl8TotvmGfUpDlYtrc55edNrUqqMCdu
	QtL2E3fZYaT8dROT6lylwCcCCSBt+8jReysQDzSzgkb43c18TetQsw61Eggi7KKVuAFikH
	zYk25zsEtK4izTgOZ4jXYkoNdItiT6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rFJGYjES0WuFIV/b/TeYHIk+vroB25prRFZIWSqZYkg=;
	b=YkTpJLfYhj46NLYV1jnvzefEGwptxvNlNqpONGtHtiR59LURBF9nmGYtFuCWn4HYmjRzu2
	Fse6Etj0pB+JVqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3A223EA68;
	Thu,  5 Mar 2026 13:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nh6rJlx/qWmuGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 13:04:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co
Date: Thu,  5 Mar 2026 14:04:25 +0100
Message-ID: <20260305130426.975604-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C89223F947

The USB core already prepares the strings for manufacturer, product
and serial number, and we don't have to extract the string at each
time.  Replace the manual usb_string() calls with the corresponding
pointers in struct usb_dev as a code cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c  | 20 ++++++++------------
 sound/usb/midi2.c |  6 ++----
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 270dad84d825..fd81f32a66fb 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -631,9 +631,9 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 	}
 
 	/* retrieve the device string as shortname */
-	if (!dev->descriptor.iProduct ||
-	    usb_string(dev, dev->descriptor.iProduct,
-		       card->shortname, sizeof(card->shortname)) <= 0) {
+	if (dev->product && *dev->product) {
+		strscpy(card->shortname, dev->product);
+	} else {
 		/* no name available from anywhere, so use ID */
 		scnprintf(card->shortname, sizeof(card->shortname),
 			  "USB Device %#04x:%#04x",
@@ -668,15 +668,11 @@ static void usb_audio_make_longname(struct usb_device *dev,
 	else if (quirk && quirk->vendor_name)
 		s = quirk->vendor_name;
 	*card->longname = 0;
-	if (s && *s) {
-		strscpy(card->longname, s, sizeof(card->longname));
-	} else {
-		/* retrieve the vendor and device strings as longname */
-		if (dev->descriptor.iManufacturer)
-			usb_string(dev, dev->descriptor.iManufacturer,
-				   card->longname, sizeof(card->longname));
-		/* we don't really care if there isn't any vendor string */
-	}
+	if (s && *s)
+		strscpy(card->longname, s);
+	else if (dev->manufacturer && *dev->manufacturer)
+		strscpy(card->longname, dev->manufacturer);
+
 	if (*card->longname) {
 		strim(card->longname);
 		if (*card->longname)
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index ef602e81576d..3546ba926cb3 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -1057,10 +1057,8 @@ static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
 			strscpy(ump->core.name, ump->info.name,
 				sizeof(ump->core.name));
 		/* use serial number string as unique UMP product id */
-		if (!*ump->info.product_id && dev->descriptor.iSerialNumber)
-			usb_string(dev, dev->descriptor.iSerialNumber,
-				   ump->info.product_id,
-				   sizeof(ump->info.product_id));
+		if (!*ump->info.product_id && dev->serial && *dev->serial)
+			strscpy(ump->info.product_id, dev->serial);
 	}
 }
 
-- 
2.53.0

