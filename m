Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC4339B482
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776164361; cv=none; b=YDcfu9UDBkRiY//nfZmJEzdtWjxaFvk3YDqxbI2tsDgyIC2Ebd4d+TsBTmZpgoE6+79982b+VRiALsw/GKuCUCejtVjgT2sRYVM1X4QxhO5TdhESZK43dOXqB89fh3EcHNHd1NTuG4lQYdwy/ru1B2qylhnu2t/dFA4y+mMN5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776164361; c=relaxed/simple;
	bh=WudhJuaxC3KlFkYg/y5F//hNKp1wR+Fd8YTsKWhL+IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E5CQJ4+0KNglS4k68SLGjb4I6TYa6UK37Kbpp+cbZbYg9zDeF9eT4YldG/j/SP8nOIv+u7xSA747mtmfcGBP9jYDa/F8R/R0S/0yP5R1+0CMQadyHf72TqBBaUCcirROkRAvmKYuzxyslCWmLRDoLcZuw8y+WjCFiNkZjDjd2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S4ow4ex+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BH0fAi8e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1jSFxS43; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CZFvBRIX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S4ow4ex+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BH0fAi8e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jSFxS43";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CZFvBRIX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE69D5BDBB;
	Tue, 14 Apr 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776164358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2LyxE1L7/2rqJB3TRTo5K436UEg7VYHz6VFjEQokUsQ=;
	b=S4ow4ex+Y+3WS6/7iO+wlTdApZZabJTe6/IbMygRe+jTBA5njE+d+O9FJL+/J8deuKVLKu
	qfKi8QYNTGR4SGZaE23kplef5SWVZF9QooFOsY9g4Gn/pg7qZJjK0mWZgI7fxuFP4vRwMZ
	3lTmQXU8M0+bn4lbkOR/3buMtBHKHYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776164358;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2LyxE1L7/2rqJB3TRTo5K436UEg7VYHz6VFjEQokUsQ=;
	b=BH0fAi8e6lXVtzH90x0mueORNl3V0EH7BlbPQvQ5Y08BXUL5Abhl87BaB3zONjjNze1Ycc
	KC1y6m6kRccNHWAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776164357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2LyxE1L7/2rqJB3TRTo5K436UEg7VYHz6VFjEQokUsQ=;
	b=1jSFxS43Iz2zQKkLPuisvoAqhFN1ak5Mf6eXxYeUXBDmkshDehW2wOOeU8ueMZ90gdQSP6
	/yIFzkBfJO707ycxAlLaYVc7t1DX7leh/PcK0yR9sMW+OMPLKjLtgeKB2pfHEoZHBNotDF
	qE9B5ZB7H2nr8IFRV8KIoJezAHPU15o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776164357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2LyxE1L7/2rqJB3TRTo5K436UEg7VYHz6VFjEQokUsQ=;
	b=CZFvBRIX891p9ORYCRDnlR3qN9EVUmE81LU/y99KzKl3I6PKUnojhYs1QIZ58/hbb6PywK
	LfaiSYJ5uWIqGwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF24C4B3EA;
	Tue, 14 Apr 2026 10:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T95mMQUe3mnIKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 10:59:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH] ALSA: caiaq: Handle probe errors properly
Date: Tue, 14 Apr 2026 12:59:00 +0200
Message-ID: <20260414105916.364073-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The probe procedure of setup_card() in caiaq driver doesn't treat the
error cases gracefully, e.g. the error from snd_card_register() calls
snd_card_free() but continues.  This would lead to a UAF for the
further calls like snd_usb_caiaq_control_init(), as Berk suggested in
another patch in the link below.

However, the problem is not only that; in general, this function drops
the all error handlings (as it's a void function) although its caller
can propagate an error to snd_probe(), which eventually calls
snd_card_free() as a proper error path.  That said, we should treat
each error case in setup_card(), and just return the error code
promptly, which is then handled later as a fatal error in snd_probe().

This patch achieves it by changing the setup_card() to return an error
code.  Also, the superfluous snd_card_free() call is removed, too.

Note that card->private_free can be set still safely at returning an
error.  All called functions in card_free() have checks of the
unassigned resources or NULL checks.

Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/20260413034941.1131465-2-berkcgoksel@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/device.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 51177ebfb8c6..8af0c04041ee 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -290,7 +290,7 @@ int snd_usb_caiaq_set_auto_msg(struct snd_usb_caiaqdev *cdev,
 					  tmp, sizeof(tmp));
 }
 
-static void setup_card(struct snd_usb_caiaqdev *cdev)
+static int setup_card(struct snd_usb_caiaqdev *cdev)
 {
 	int ret;
 	char val[4];
@@ -325,8 +325,10 @@ static void setup_card(struct snd_usb_caiaqdev *cdev)
 		snd_usb_caiaq_send_command(cdev, EP1_CMD_READ_IO, NULL, 0);
 
 		if (!wait_event_timeout(cdev->ep1_wait_queue,
-					cdev->control_state[0] != 0xff, HZ))
-			return;
+					cdev->control_state[0] != 0xff, HZ)) {
+			dev_err(dev, "Read timeout for control state\n");
+			return -EINVAL;
+		}
 
 		/* fix up some defaults */
 		if ((cdev->control_state[1] != 2) ||
@@ -347,33 +349,43 @@ static void setup_card(struct snd_usb_caiaqdev *cdev)
 	    cdev->spec.num_digital_audio_out +
 	    cdev->spec.num_digital_audio_in > 0) {
 		ret = snd_usb_caiaq_audio_init(cdev);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(dev, "Unable to set up audio system (ret=%d)\n", ret);
+			return ret;
+		}
 	}
 
 	if (cdev->spec.num_midi_in +
 	    cdev->spec.num_midi_out > 0) {
 		ret = snd_usb_caiaq_midi_init(cdev);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(dev, "Unable to set up MIDI system (ret=%d)\n", ret);
+			return ret;
+		}
 	}
 
 #ifdef CONFIG_SND_USB_CAIAQ_INPUT
 	ret = snd_usb_caiaq_input_init(cdev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "Unable to set up input system (ret=%d)\n", ret);
+		return ret;
+	}
 #endif
 
 	/* finally, register the card and all its sub-instances */
 	ret = snd_card_register(cdev->chip.card);
 	if (ret < 0) {
 		dev_err(dev, "snd_card_register() returned %d\n", ret);
-		snd_card_free(cdev->chip.card);
+		return ret;
 	}
 
 	ret = snd_usb_caiaq_control_init(cdev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "Unable to set up control system (ret=%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void card_free(struct snd_card *card)
@@ -499,8 +511,11 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	scnprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
 		       cdev->vendor_name, cdev->product_name, usbpath);
 
-	setup_card(cdev);
 	card->private_free = card_free;
+	err = setup_card(cdev);
+	if (err < 0)
+		return err;
+
 	return 0;
 
  err_kill_urb:
-- 
2.53.0

