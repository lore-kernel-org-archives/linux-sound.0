Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54F15622E
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=dNMT+rj0YNDv3EkuzAv1vQ/TyJowYH57LE88oNd9UmQJLmaM+hI9MKseI5zZzUj33Hw2YBWQESB8Fv4F8ynLIEW4Y8p0sZ7qcHXzimwVbs1P3KuKjKSyk1kTqViqS42M5qYXDDZnzpQmu1cuP3qsEntmjHDkR9na9bUFciuvd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=Zi0bqHJLBNAHq6Uam/jDRGwR/HhQYhmceR0EZW2GcDY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhjzeumdxjZAJmXn3MAFYHE1Q9Z0Fk8DLKmk+CuA2fLJk4ofWFjKLQa907lvYX7tGPoPC+o4oGaSBF8voTxXhh10dlEWpBXcQ6Z7CLgHh133dIVzB8thrrN1pHqwZLQG72mvPizCogs9NERo/DvR7wIya35lXVKvVeayHwYhBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jxoN1ae1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ySvnVx6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jxoN1ae1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ySvnVx6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jxoN1ae1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ySvnVx6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jxoN1ae1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ySvnVx6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B4D71F7A3;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgqfZWt5W+QjAsrLv46CEkTzmpwrLBHNSucsy6lt6ZY=;
	b=jxoN1ae1Qgc/LYSnNjbZhXpWW4N3hZ5kZRWsYTt94GOkYtW66Dy9LTJMx7rSTL9m2BB3Hg
	VXRdiGgeEMjMmqpNJnjANkj7MQCxILWaIKAgrr2cQyz2KxQOQdyZ676psgKV7axKSQAaa9
	/e8TMJCPlFZbhoz7kDQ7W1L8MlF3bJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgqfZWt5W+QjAsrLv46CEkTzmpwrLBHNSucsy6lt6ZY=;
	b=5ySvnVx6j80LsTaPpKOX83yRt9OAR9KNIUlGxF6KbmrWT3NKS4nXi2fwBqgW9GTDNzQSbq
	8wsOPWO+Q2WxDADg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jxoN1ae1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5ySvnVx6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgqfZWt5W+QjAsrLv46CEkTzmpwrLBHNSucsy6lt6ZY=;
	b=jxoN1ae1Qgc/LYSnNjbZhXpWW4N3hZ5kZRWsYTt94GOkYtW66Dy9LTJMx7rSTL9m2BB3Hg
	VXRdiGgeEMjMmqpNJnjANkj7MQCxILWaIKAgrr2cQyz2KxQOQdyZ676psgKV7axKSQAaa9
	/e8TMJCPlFZbhoz7kDQ7W1L8MlF3bJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgqfZWt5W+QjAsrLv46CEkTzmpwrLBHNSucsy6lt6ZY=;
	b=5ySvnVx6j80LsTaPpKOX83yRt9OAR9KNIUlGxF6KbmrWT3NKS4nXi2fwBqgW9GTDNzQSbq
	8wsOPWO+Q2WxDADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EFC41386E;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4L/SFL4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/12] ALSA: hda: cs4809: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:51 +0200
Message-ID: <20240506161359.6960-9-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.59 / 50.00];
	BAYES_HAM(-1.58)[92.31%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7B4D71F7A3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -1.59

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio generic cs8409 driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_cs8409.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index e41316e2e983..26f3c31600d7 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -909,7 +909,6 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 	cs42l42_enable_jack_detect(cs42l42);
 }
 
-#ifdef CONFIG_PM
 static void cs42l42_suspend(struct sub_codec *cs42l42)
 {
 	struct hda_codec *codec = cs42l42->codec;
@@ -948,7 +947,6 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	spec->gpio_data &= ~cs42l42->reset_gpio;
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, spec->gpio_data);
 }
-#endif
 
 static void cs8409_free(struct hda_codec *codec)
 {
@@ -1003,7 +1001,6 @@ static void cs8409_cs42l42_jack_unsol_event(struct hda_codec *codec, unsigned in
 	}
 }
 
-#ifdef CONFIG_PM
 /* Manage PDREF, when transition to D3hot */
 static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 {
@@ -1025,7 +1022,6 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 
 	return 0;
 }
-#endif
 
 /* Vendor specific HW configuration
  * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
@@ -1080,9 +1076,7 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 	.init = cs8409_init,
 	.free = cs8409_free,
 	.unsol_event = cs8409_cs42l42_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = cs8409_cs42l42_suspend,
-#endif
 };
 
 static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
@@ -1310,9 +1304,7 @@ static const struct hda_codec_ops cs8409_dolphin_patch_ops = {
 	.init = cs8409_init,
 	.free = cs8409_free,
 	.unsol_event = dolphin_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = cs8409_cs42l42_suspend,
-#endif
 };
 
 static int dolphin_exec_verb(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
-- 
2.43.0

