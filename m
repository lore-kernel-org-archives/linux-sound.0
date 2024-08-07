Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31CC200138
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=F/YluMSAtw0EVGfE6tZDPdn0BK60sNTEH6fIGlb/i9G3F1mli3KIIgKV5s93Km6G763IM+XewtPxVuHIMYNXVZ6g4yEUMQosIJDjYQ7ORU4yyg58C/BDXIuaQ43IPNoKa/pjzrJRAPc5FSIgfUfZPQT67It7L1+GV9erPKdYrE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=AZxDzQKwxZ8QXe+yQ5SOwNeQDV1UW3lQDcEhBk6bL7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruGC4ftbDuIZ2dN7TegdyreDITbuECgCJxCUCQS4C454Vh/7+ftL/lj883iboc3m4tidOdFrb9yZWfo6wLHHGeVGa0CpUXBj32iNW7B4h6yoe2T73pj4/DUflN6qeEOVq+Ev2C0QdQ3GDRCe+wzo0GZsxCnYHDoMgyGrtHU+BUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WNJUL4kA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9SQCBdkk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WNJUL4kA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9SQCBdkk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WNJUL4kA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9SQCBdkk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WNJUL4kA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9SQCBdkk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 35BB41FB9C;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDCav1m4d3vh2gTPlXzpIrulaFfoQxqMEQJQ6PC8fLI=;
	b=WNJUL4kA8gFN1U3B4Ihyur23nNSpShG3xmYWYt1DaGuOI/AAfD6wnNeZFmCJD9z6FWsyfy
	sbwVGxoLP5sPqDg0KD8OtI2HF5ifH7jpvWDyRMV8kA26TNFz1ucC0Dqu+TBTOBiOvvMneT
	5fZt4QSylfdWlOkc/doLCj0BShBDcso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDCav1m4d3vh2gTPlXzpIrulaFfoQxqMEQJQ6PC8fLI=;
	b=9SQCBdkkGO+bB5rYSeE86ta/lKIbMlISaTxFSkTcyyRGQtwbG7MG311qypvjkM+TMrxH6N
	cm1t7vQ1IAaGSpCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDCav1m4d3vh2gTPlXzpIrulaFfoQxqMEQJQ6PC8fLI=;
	b=WNJUL4kA8gFN1U3B4Ihyur23nNSpShG3xmYWYt1DaGuOI/AAfD6wnNeZFmCJD9z6FWsyfy
	sbwVGxoLP5sPqDg0KD8OtI2HF5ifH7jpvWDyRMV8kA26TNFz1ucC0Dqu+TBTOBiOvvMneT
	5fZt4QSylfdWlOkc/doLCj0BShBDcso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDCav1m4d3vh2gTPlXzpIrulaFfoQxqMEQJQ6PC8fLI=;
	b=9SQCBdkkGO+bB5rYSeE86ta/lKIbMlISaTxFSkTcyyRGQtwbG7MG311qypvjkM+TMrxH6N
	cm1t7vQ1IAaGSpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DC0913A7D;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uJcYBt13s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 33/54] ALSA: sc6000: Use standard print API
Date: Wed,  7 Aug 2024 15:34:23 +0200
Message-ID: <20240807133452.9424-34-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.942];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Some functions are changed to receive a device pointer to be passed to
dev_*() calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 177 +++++++++++++++++++++++----------------------
 1 file changed, 90 insertions(+), 87 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 60398fced046..3115c32b4061 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -204,7 +204,7 @@ static int sc6000_read(char __iomem *vport)
 
 }
 
-static int sc6000_write(char __iomem *vport, int cmd)
+static int sc6000_write(struct device *devptr, char __iomem *vport, int cmd)
 {
 	unsigned char val;
 	int loop = 500000;
@@ -221,18 +221,19 @@ static int sc6000_write(char __iomem *vport, int cmd)
 		cpu_relax();
 	} while (loop--);
 
-	snd_printk(KERN_ERR "DSP Command (0x%x) timeout.\n", cmd);
+	dev_err(devptr, "DSP Command (0x%x) timeout.\n", cmd);
 
 	return -EIO;
 }
 
-static int sc6000_dsp_get_answer(char __iomem *vport, int command,
+static int sc6000_dsp_get_answer(struct device *devptr,
+				 char __iomem *vport, int command,
 				 char *data, int data_len)
 {
 	int len = 0;
 
-	if (sc6000_write(vport, command)) {
-		snd_printk(KERN_ERR "CMD 0x%x: failed!\n", command);
+	if (sc6000_write(devptr, vport, command)) {
+		dev_err(devptr, "CMD 0x%x: failed!\n", command);
 		return -EIO;
 	}
 
@@ -265,82 +266,86 @@ static int sc6000_dsp_reset(char __iomem *vport)
 }
 
 /* detection and initialization */
-static int sc6000_hw_cfg_write(char __iomem *vport, const int *cfg)
+static int sc6000_hw_cfg_write(struct device *devptr,
+			       char __iomem *vport, const int *cfg)
 {
-	if (sc6000_write(vport, COMMAND_6C) < 0) {
-		snd_printk(KERN_WARNING "CMD 0x%x: failed!\n", COMMAND_6C);
+	if (sc6000_write(devptr, vport, COMMAND_6C) < 0) {
+		dev_warn(devptr, "CMD 0x%x: failed!\n", COMMAND_6C);
 		return -EIO;
 	}
-	if (sc6000_write(vport, COMMAND_5C) < 0) {
-		snd_printk(KERN_ERR "CMD 0x%x: failed!\n", COMMAND_5C);
+	if (sc6000_write(devptr, vport, COMMAND_5C) < 0) {
+		dev_err(devptr, "CMD 0x%x: failed!\n", COMMAND_5C);
 		return -EIO;
 	}
-	if (sc6000_write(vport, cfg[0]) < 0) {
-		snd_printk(KERN_ERR "DATA 0x%x: failed!\n", cfg[0]);
+	if (sc6000_write(devptr, vport, cfg[0]) < 0) {
+		dev_err(devptr, "DATA 0x%x: failed!\n", cfg[0]);
 		return -EIO;
 	}
-	if (sc6000_write(vport, cfg[1]) < 0) {
-		snd_printk(KERN_ERR "DATA 0x%x: failed!\n", cfg[1]);
+	if (sc6000_write(devptr, vport, cfg[1]) < 0) {
+		dev_err(devptr, "DATA 0x%x: failed!\n", cfg[1]);
 		return -EIO;
 	}
-	if (sc6000_write(vport, COMMAND_C5) < 0) {
-		snd_printk(KERN_ERR "CMD 0x%x: failed!\n", COMMAND_C5);
+	if (sc6000_write(devptr, vport, COMMAND_C5) < 0) {
+		dev_err(devptr, "CMD 0x%x: failed!\n", COMMAND_C5);
 		return -EIO;
 	}
 
 	return 0;
 }
 
-static int sc6000_cfg_write(char __iomem *vport, unsigned char softcfg)
+static int sc6000_cfg_write(struct device *devptr,
+			    char __iomem *vport, unsigned char softcfg)
 {
 
-	if (sc6000_write(vport, WRITE_MDIRQ_CFG)) {
-		snd_printk(KERN_ERR "CMD 0x%x: failed!\n", WRITE_MDIRQ_CFG);
+	if (sc6000_write(devptr, vport, WRITE_MDIRQ_CFG)) {
+		dev_err(devptr, "CMD 0x%x: failed!\n", WRITE_MDIRQ_CFG);
 		return -EIO;
 	}
-	if (sc6000_write(vport, softcfg)) {
-		snd_printk(KERN_ERR "sc6000_cfg_write: failed!\n");
+	if (sc6000_write(devptr, vport, softcfg)) {
+		dev_err(devptr, "%s: failed!\n", __func__);
 		return -EIO;
 	}
 	return 0;
 }
 
-static int sc6000_setup_board(char __iomem *vport, int config)
+static int sc6000_setup_board(struct device *devptr,
+			      char __iomem *vport, int config)
 {
 	int loop = 10;
 
 	do {
-		if (sc6000_write(vport, COMMAND_88)) {
-			snd_printk(KERN_ERR "CMD 0x%x: failed!\n",
-				   COMMAND_88);
+		if (sc6000_write(devptr, vport, COMMAND_88)) {
+			dev_err(devptr, "CMD 0x%x: failed!\n",
+				COMMAND_88);
 			return -EIO;
 		}
 	} while ((sc6000_wait_data(vport) < 0) && loop--);
 
 	if (sc6000_read(vport) < 0) {
-		snd_printk(KERN_ERR "sc6000_read after CMD 0x%x: failed\n",
-			   COMMAND_88);
+		dev_err(devptr, "sc6000_read after CMD 0x%x: failed\n",
+			COMMAND_88);
 		return -EIO;
 	}
 
-	if (sc6000_cfg_write(vport, config))
+	if (sc6000_cfg_write(devptr, vport, config))
 		return -ENODEV;
 
 	return 0;
 }
 
-static int sc6000_init_mss(char __iomem *vport, int config,
+static int sc6000_init_mss(struct device *devptr,
+			   char __iomem *vport, int config,
 			   char __iomem *vmss_port, int mss_config)
 {
-	if (sc6000_write(vport, DSP_INIT_MSS)) {
-		snd_printk(KERN_ERR "sc6000_init_mss [0x%x]: failed!\n",
-			   DSP_INIT_MSS);
+	if (sc6000_write(devptr, vport, DSP_INIT_MSS)) {
+		dev_err(devptr, "%s [0x%x]: failed!\n", __func__,
+			DSP_INIT_MSS);
 		return -EIO;
 	}
 
 	msleep(10);
 
-	if (sc6000_cfg_write(vport, config))
+	if (sc6000_cfg_write(devptr, vport, config))
 		return -EIO;
 
 	iowrite8(mss_config, vmss_port);
@@ -348,7 +353,8 @@ static int sc6000_init_mss(char __iomem *vport, int config,
 	return 0;
 }
 
-static void sc6000_hw_cfg_encode(char __iomem *vport, int *cfg,
+static void sc6000_hw_cfg_encode(struct device *devptr,
+				 char __iomem *vport, int *cfg,
 				 long xport, long xmpu,
 				 long xmss_port, int joystick)
 {
@@ -367,10 +373,11 @@ static void sc6000_hw_cfg_encode(char __iomem *vport, int *cfg,
 		cfg[0] |= 0x02;
 	cfg[1] |= 0x80;		/* enable WSS system */
 	cfg[1] &= ~0x40;	/* disable IDE */
-	snd_printd("hw cfg %x, %x\n", cfg[0], cfg[1]);
+	dev_dbg(devptr, "hw cfg %x, %x\n", cfg[0], cfg[1]);
 }
 
-static int sc6000_init_board(char __iomem *vport,
+static int sc6000_init_board(struct device *devptr,
+			     char __iomem *vport,
 			     char __iomem *vmss_port, int dev)
 {
 	char answer[15];
@@ -384,14 +391,14 @@ static int sc6000_init_board(char __iomem *vport,
 
 	err = sc6000_dsp_reset(vport);
 	if (err < 0) {
-		snd_printk(KERN_ERR "sc6000_dsp_reset: failed!\n");
+		dev_err(devptr, "sc6000_dsp_reset: failed!\n");
 		return err;
 	}
 
 	memset(answer, 0, sizeof(answer));
-	err = sc6000_dsp_get_answer(vport, GET_DSP_COPYRIGHT, answer, 15);
+	err = sc6000_dsp_get_answer(devptr, vport, GET_DSP_COPYRIGHT, answer, 15);
 	if (err <= 0) {
-		snd_printk(KERN_ERR "sc6000_dsp_copyright: failed!\n");
+		dev_err(devptr, "sc6000_dsp_copyright: failed!\n");
 		return -ENODEV;
 	}
 	/*
@@ -399,52 +406,52 @@ static int sc6000_init_board(char __iomem *vport,
 	 * if we have something different, we have to be warned.
 	 */
 	if (strncmp("SC-6000", answer, 7))
-		snd_printk(KERN_WARNING "Warning: non SC-6000 audio card!\n");
+		dev_warn(devptr, "Warning: non SC-6000 audio card!\n");
 
-	if (sc6000_dsp_get_answer(vport, GET_DSP_VERSION, version, 2) < 2) {
-		snd_printk(KERN_ERR "sc6000_dsp_version: failed!\n");
+	if (sc6000_dsp_get_answer(devptr, vport, GET_DSP_VERSION, version, 2) < 2) {
+		dev_err(devptr, "sc6000_dsp_version: failed!\n");
 		return -ENODEV;
 	}
-	printk(KERN_INFO PFX "Detected model: %s, DSP version %d.%d\n",
+	dev_info(devptr, "Detected model: %s, DSP version %d.%d\n",
 		answer, version[0], version[1]);
 
 	/* set configuration */
-	sc6000_write(vport, COMMAND_5C);
+	sc6000_write(devptr, vport, COMMAND_5C);
 	if (sc6000_read(vport) < 0)
 		old = 1;
 
 	if (!old) {
 		int cfg[2];
-		sc6000_hw_cfg_encode(vport, &cfg[0], port[dev], mpu_port[dev],
+		sc6000_hw_cfg_encode(devptr,
+				     vport, &cfg[0], port[dev], mpu_port[dev],
 				     mss_port[dev], joystick[dev]);
-		if (sc6000_hw_cfg_write(vport, cfg) < 0) {
-			snd_printk(KERN_ERR "sc6000_hw_cfg_write: failed!\n");
+		if (sc6000_hw_cfg_write(devptr, vport, cfg) < 0) {
+			dev_err(devptr, "sc6000_hw_cfg_write: failed!\n");
 			return -EIO;
 		}
 	}
-	err = sc6000_setup_board(vport, config);
+	err = sc6000_setup_board(devptr, vport, config);
 	if (err < 0) {
-		snd_printk(KERN_ERR "sc6000_setup_board: failed!\n");
+		dev_err(devptr, "sc6000_setup_board: failed!\n");
 		return -ENODEV;
 	}
 
 	sc6000_dsp_reset(vport);
 
 	if (!old) {
-		sc6000_write(vport, COMMAND_60);
-		sc6000_write(vport, 0x02);
+		sc6000_write(devptr, vport, COMMAND_60);
+		sc6000_write(devptr, vport, 0x02);
 		sc6000_dsp_reset(vport);
 	}
 
-	err = sc6000_setup_board(vport, config);
+	err = sc6000_setup_board(devptr, vport, config);
 	if (err < 0) {
-		snd_printk(KERN_ERR "sc6000_setup_board: failed!\n");
+		dev_err(devptr, "sc6000_setup_board: failed!\n");
 		return -ENODEV;
 	}
-	err = sc6000_init_mss(vport, config, vmss_port, mss_config);
+	err = sc6000_init_mss(devptr, vport, config, vmss_port, mss_config);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot initialize "
-			   "Microsoft Sound System mode.\n");
+		dev_err(devptr, "Cannot initialize Microsoft Sound System mode.\n");
 		return -ENODEV;
 	}
 
@@ -491,39 +498,39 @@ static int snd_sc6000_match(struct device *devptr, unsigned int dev)
 	if (!enable[dev])
 		return 0;
 	if (port[dev] == SNDRV_AUTO_PORT) {
-		printk(KERN_ERR PFX "specify IO port\n");
+		dev_err(devptr, "specify IO port\n");
 		return 0;
 	}
 	if (mss_port[dev] == SNDRV_AUTO_PORT) {
-		printk(KERN_ERR PFX "specify MSS port\n");
+		dev_err(devptr, "specify MSS port\n");
 		return 0;
 	}
 	if (port[dev] != 0x220 && port[dev] != 0x240) {
-		printk(KERN_ERR PFX "Port must be 0x220 or 0x240\n");
+		dev_err(devptr, "Port must be 0x220 or 0x240\n");
 		return 0;
 	}
 	if (mss_port[dev] != 0x530 && mss_port[dev] != 0xe80) {
-		printk(KERN_ERR PFX "MSS port must be 0x530 or 0xe80\n");
+		dev_err(devptr, "MSS port must be 0x530 or 0xe80\n");
 		return 0;
 	}
 	if (irq[dev] != SNDRV_AUTO_IRQ && !sc6000_irq_to_softcfg(irq[dev])) {
-		printk(KERN_ERR PFX "invalid IRQ %d\n", irq[dev]);
+		dev_err(devptr, "invalid IRQ %d\n", irq[dev]);
 		return 0;
 	}
 	if (dma[dev] != SNDRV_AUTO_DMA && !sc6000_dma_to_softcfg(dma[dev])) {
-		printk(KERN_ERR PFX "invalid DMA %d\n", dma[dev]);
+		dev_err(devptr, "invalid DMA %d\n", dma[dev]);
 		return 0;
 	}
 	if (mpu_port[dev] != SNDRV_AUTO_PORT &&
 	    (mpu_port[dev] & ~0x30L) != 0x300) {
-		printk(KERN_ERR PFX "invalid MPU-401 port %lx\n",
+		dev_err(devptr, "invalid MPU-401 port %lx\n",
 			mpu_port[dev]);
 		return 0;
 	}
 	if (mpu_port[dev] != SNDRV_AUTO_PORT &&
 	    mpu_irq[dev] != SNDRV_AUTO_IRQ && mpu_irq[dev] != 0 &&
 	    !sc6000_mpu_irq_to_softcfg(mpu_irq[dev])) {
-		printk(KERN_ERR PFX "invalid MPU-401 IRQ %d\n", mpu_irq[dev]);
+		dev_err(devptr, "invalid MPU-401 IRQ %d\n", mpu_irq[dev]);
 		return 0;
 	}
 	return 1;
@@ -534,7 +541,7 @@ static void snd_sc6000_free(struct snd_card *card)
 	char __iomem *vport = (char __force __iomem *)card->private_data;
 
 	if (vport)
-		sc6000_setup_board(vport, 0);
+		sc6000_setup_board(card->dev, vport, 0);
 }
 
 static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
@@ -558,7 +565,7 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	if (xirq == SNDRV_AUTO_IRQ) {
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
+			dev_err(devptr, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
@@ -566,42 +573,39 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	if (xdma == SNDRV_AUTO_DMA) {
 		xdma = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA\n");
+			dev_err(devptr, "unable to find a free DMA\n");
 			return -EBUSY;
 		}
 	}
 
 	if (!devm_request_region(devptr, port[dev], 0x10, DRV_NAME)) {
-		snd_printk(KERN_ERR PFX
-			   "I/O port region is already in use.\n");
+		dev_err(devptr, "I/O port region is already in use.\n");
 		return -EBUSY;
 	}
 	vport = devm_ioport_map(devptr, port[dev], 0x10);
 	if (!vport) {
-		snd_printk(KERN_ERR PFX
-			   "I/O port cannot be iomapped.\n");
+		dev_err(devptr, "I/O port cannot be iomapped.\n");
 		return -EBUSY;
 	}
 	card->private_data = (void __force *)vport;
 
 	/* to make it marked as used */
 	if (!devm_request_region(devptr, mss_port[dev], 4, DRV_NAME)) {
-		snd_printk(KERN_ERR PFX
-			   "SC-6000 port I/O port region is already in use.\n");
+		dev_err(devptr,
+			"SC-6000 port I/O port region is already in use.\n");
 		return -EBUSY;
 	}
 	vmss_port = devm_ioport_map(devptr, mss_port[dev], 4);
 	if (!vmss_port) {
-		snd_printk(KERN_ERR PFX
-			   "MSS port I/O cannot be iomapped.\n");
+		dev_err(devptr, "MSS port I/O cannot be iomapped.\n");
 		return -EBUSY;
 	}
 
-	snd_printd("Initializing BASE[0x%lx] IRQ[%d] DMA[%d] MIRQ[%d]\n",
-		   port[dev], xirq, xdma,
-		   mpu_irq[dev] == SNDRV_AUTO_IRQ ? 0 : mpu_irq[dev]);
+	dev_dbg(devptr, "Initializing BASE[0x%lx] IRQ[%d] DMA[%d] MIRQ[%d]\n",
+		port[dev], xirq, xdma,
+		mpu_irq[dev] == SNDRV_AUTO_IRQ ? 0 : mpu_irq[dev]);
 
-	err = sc6000_init_board(vport, vmss_port, dev);
+	err = sc6000_init_board(devptr, vport, vmss_port, dev);
 	if (err < 0)
 		return err;
 	card->private_free = snd_sc6000_free;
@@ -613,25 +617,24 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 
 	err = snd_wss_pcm(chip, 0);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX
-			   "error creating new WSS PCM device\n");
+		dev_err(devptr, "error creating new WSS PCM device\n");
 		return err;
 	}
 	err = snd_wss_mixer(chip);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "error creating new WSS mixer\n");
+		dev_err(devptr, "error creating new WSS mixer\n");
 		return err;
 	}
 	err = snd_sc6000_mixer(chip);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "the mixer rewrite failed\n");
+		dev_err(devptr, "the mixer rewrite failed\n");
 		return err;
 	}
 	if (snd_opl3_create(card,
 			    0x388, 0x388 + 2,
 			    OPL3_HW_AUTO, 0, &opl3) < 0) {
-		snd_printk(KERN_ERR PFX "no OPL device at 0x%x-0x%x ?\n",
-			   0x388, 0x388 + 2);
+		dev_err(devptr, "no OPL device at 0x%x-0x%x ?\n",
+			0x388, 0x388 + 2);
 	} else {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
@@ -645,8 +648,8 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 					MPU401_HW_MPU401,
 					mpu_port[dev], 0,
 					mpu_irq[dev], NULL) < 0)
-			snd_printk(KERN_ERR "no MPU-401 device at 0x%lx ?\n",
-					mpu_port[dev]);
+			dev_err(devptr, "no MPU-401 device at 0x%lx ?\n",
+				mpu_port[dev]);
 	}
 
 	strcpy(card->driver, DRV_NAME);
-- 
2.43.0

