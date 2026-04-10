Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91732E729
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 03:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775793285; cv=none; b=EvLgA2asJIdZRrDnzotMlx/Mda3qoZ7o4OUjJ0gsj4JZ7Xywdn4KLSTOkHbQhDP6PR4mLl3KNAJHBA8rArdMtf9lKTs1g9gWMSleC+9tWqePiesP+lDI5xdBLj6PdESTiMtiTYUOPkEoEo9+I42hVAzAN3oIzNTXWEr3AWJZ0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775793285; c=relaxed/simple;
	bh=IvldKGOLmHdW8pdoImeD2pBQaA24fYgV7bwhtFe2CYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vdn2JHHiQzvwSO6KGvVts5Cs8IiwmipKd2vkOv3W4qrHcefigUWEiXkhqiHK5lihbKsnc25yaPZQIjPjRHUg84UVLZnxIYBD66Bsh7lKmwnPjpxbCir06+jbcNtmIgxWxAwXv14qvf+a5s1X3SQzmwy7L0yjyC94UuqUkwKsYgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjIS2v2i; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjIS2v2i"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c56aa62931so2538372eec.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 20:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775793283; x=1776398083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9UG8ztc+GdbvGutk5La1epJ8u3EDy/BC540q0LhPZ0=;
        b=gjIS2v2iK/dyr24XjNTyLYTsEtGiOZMgjvkTm9PHKXUAe2XiykayVIN0zq/ZdjsUH8
         AIkpVSK4HHFtN6nXCwTQe6tInNM553rrBFfPeS7x+y9JyDdy2c7EFCCrIg3nAcAUz4jb
         94NWi2nTF2x1MgfqN5qrUwjuNfTDgJSPsopLKRaARnKsxTESiSjp6GDPcD7RrzJKQw5l
         dlzXpJ/s9yplC6o+TTxN33uSgW0NGTzdlXGfKaDAgvVu5z/9hMLlvceB4PrDFVHk5z7J
         yp6sUkFqmLl8Epl3TONDqXCqCCsoxrl75AV/seaMnB9iFdk9j9Ma/GnBZFtlr3ctzNZM
         0IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793283; x=1776398083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9UG8ztc+GdbvGutk5La1epJ8u3EDy/BC540q0LhPZ0=;
        b=TsqVE9+1ukjnCrvlRljwpTUwPm5QDm+3KjlSWlQCn6C2pfHkiZdA2eD2wrlDiuNNWU
         eTnnAhtvQw1iKO/2Zje4b8/d0OEU6YVrml50N+U94XHMIiH89VN5FjHjkW4Pgb5UufBC
         OC8r6cTd6PMdPz551pymVW5RbqOWOvOsbJVFImB6bG2bPpe/tj2Vb6eaTW/2vcEzTKQK
         MezbS6plPx/QOLmYLGPa830ykwrPK39oJva7orTm+JSZJ5G5PQVhgpES49SEa1jucmTA
         dbhijof6dZbJHUtJ82OSOcW+a9dpRSE53c/F5czMuVcYqonjtJMmUuKAsf/z+yV5P2uJ
         DM5w==
X-Gm-Message-State: AOJu0Yy/3o1dCJD5f6RpdLPApcB9HZaBrYXEum5aZxjsRlvWuOA5bLUB
	yNMIU17cZisOgKrLpTH9H3c7+Ob3kKyDDJfRCMq22NhTxVlfVb/VXB7L
X-Gm-Gg: AeBDieu22ofjxVDM8kCfPPVyVCHOVkKR31FBOmNzkBvLV9GGsmolwbfFDkRiQMuzdjS
	rVHXUfJSaC9/oFeJR8oN5w5Ge5sbiTWqDrYUvj3b8mO+BMq2/olgnGXXwVXXczJxasVKdULqSrH
	vxx3MJHVGdcWWfD6/rmt4jhYq7bfnbr/PlZ/UxxJXk2M2I+AxgCh1t8kZMxNjOS5heQqWOqodG+
	NZ3Y+mIxW4LPdNFVF1JA7sL9ovesUGvzcbsSxiGOraVVFcJVdLv5zJD47VT7tEceTuXXIrrOgUm
	J1ws4fApUXBw2FeTXryYSWpcIvxYFps0uii8nJT2+aqew68h19IZj8QVn52o22GlhSqbVl6mnDu
	fZ8RmwjgEtLMCneyoQR/DBUCm5CHb5Q5Hs0xXM3+uYVZ+ZGO8tqRsuiA0kThHEroTURpCgeTC4C
	5t255XK7/GlKeL8+3gWZybZ6IMnl/PWgjO/3mVyWmACcnHAQX+YBCtolBzIseFhLCeWSMS3soVx
	ToT
X-Received: by 2002:a05:7300:4313:b0:2d3:dff7:1396 with SMTP id 5a478bee46e88-2d5899a3df7mr1006844eec.21.1775793282764;
        Thu, 09 Apr 2026 20:54:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a2a06sm2495371eec.30.2026.04.09.20.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:54:42 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 10 Apr 2026 00:54:32 -0300
Subject: [PATCH 1/2] ALSA: sc6000: Keep the programmed board state in
 card-private data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-alsa-sc6000-pm-v1-1-4d9e95493d26@gmail.com>
References: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
In-Reply-To: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8798;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=IvldKGOLmHdW8pdoImeD2pBQaA24fYgV7bwhtFe2CYw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3SmofTy3msGA7cPOy89ozu/pOPLrsprh313VF7p4tV
 9UD338q6ihlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJvLjJ8E9v94vwxc7rYji/
 uzWzyU96H5k11UiHmVH3habSf+2e/1MZ/umd6X3jW9cVdniGgxVXCmOafs8unw7BKddP7vv4ib1
 XjRsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The driver may auto-select IRQ and DMA resources at probe time, but
sc6000_init_board() still derives the SC-6000 soft configuration from
the module parameter arrays.  When irq=auto or dma=auto is used, the
codec is created with the selected resources while the board is
programmed with the unresolved values.

Store the mapped ports and generated SC-6000 board configuration in
card-private data, build that configuration from the live probe
results instead of the raw module parameters, and keep the probe-time
board programming in a shared helper.

This fixes the resource-programming mismatch and leaves the driver
with a stable board-state block that can be reused by suspend/resume.

Fixes: c282866101bf ("ALSA: sc6000: add support for SC-6600 and SC-7000")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/sc6000.c | 152 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 92 insertions(+), 60 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 6d618cc2ba45..9949e06403f6 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -100,6 +100,15 @@ MODULE_PARM_DESC(joystick, "Enable gameport.");
 #define PFX "sc6000: "
 #define DRV_NAME "SC-6000"
 
+struct snd_sc6000 {
+	char __iomem *vport;
+	char __iomem *vmss_port;
+	u8 mss_config;
+	u8 config;
+	u8 hw_cfg[2];
+	bool old_dsp;
+};
+
 /* hardware dependent functions */
 
 /*
@@ -267,7 +276,7 @@ static int sc6000_dsp_reset(char __iomem *vport)
 
 /* detection and initialization */
 static int sc6000_hw_cfg_write(struct device *devptr,
-			       char __iomem *vport, const int *cfg)
+			       char __iomem *vport, const u8 *cfg)
 {
 	if (sc6000_write(devptr, vport, COMMAND_6C) < 0) {
 		dev_warn(devptr, "CMD 0x%x: failed!\n", COMMAND_6C);
@@ -353,8 +362,7 @@ static int sc6000_init_mss(struct device *devptr,
 	return 0;
 }
 
-static void sc6000_hw_cfg_encode(struct device *devptr,
-				 char __iomem *vport, int *cfg,
+static void sc6000_hw_cfg_encode(struct device *devptr, u8 *cfg,
 				 long xport, long xmpu,
 				 long xmss_port, int joystick)
 {
@@ -376,27 +384,83 @@ static void sc6000_hw_cfg_encode(struct device *devptr,
 	dev_dbg(devptr, "hw cfg %x, %x\n", cfg[0], cfg[1]);
 }
 
-static int sc6000_init_board(struct device *devptr,
-			     char __iomem *vport,
-			     char __iomem *vmss_port, int dev)
+static void sc6000_prepare_board(struct device *devptr,
+				 struct snd_sc6000 *sc6000,
+				 unsigned int dev, int xirq, int xdma)
+{
+	sc6000->mss_config = sc6000_irq_to_softcfg(xirq) |
+			     sc6000_dma_to_softcfg(xdma);
+	sc6000->config = sc6000->mss_config |
+			 sc6000_mpu_irq_to_softcfg(mpu_irq[dev]);
+	sc6000_hw_cfg_encode(devptr, sc6000->hw_cfg, port[dev], mpu_port[dev],
+			     mss_port[dev], joystick[dev]);
+}
+
+static void sc6000_detect_old_dsp(struct device *devptr,
+				  struct snd_sc6000 *sc6000)
+{
+	sc6000_write(devptr, sc6000->vport, COMMAND_5C);
+	sc6000->old_dsp = sc6000_read(sc6000->vport) < 0;
+}
+
+static int sc6000_program_board(struct device *devptr,
+				struct snd_sc6000 *sc6000)
+{
+	int err;
+
+	if (!sc6000->old_dsp) {
+		if (sc6000_hw_cfg_write(devptr, sc6000->vport,
+					sc6000->hw_cfg) < 0) {
+			dev_err(devptr, "sc6000_hw_cfg_write: failed!\n");
+			return -EIO;
+		}
+	}
+
+	err = sc6000_setup_board(devptr, sc6000->vport, sc6000->config);
+	if (err < 0) {
+		dev_err(devptr, "sc6000_setup_board: failed!\n");
+		return -ENODEV;
+	}
+
+	sc6000_dsp_reset(sc6000->vport);
+
+	if (!sc6000->old_dsp) {
+		sc6000_write(devptr, sc6000->vport, COMMAND_60);
+		sc6000_write(devptr, sc6000->vport, 0x02);
+		sc6000_dsp_reset(sc6000->vport);
+	}
+
+	err = sc6000_setup_board(devptr, sc6000->vport, sc6000->config);
+	if (err < 0) {
+		dev_err(devptr, "sc6000_setup_board: failed!\n");
+		return -ENODEV;
+	}
+
+	err = sc6000_init_mss(devptr, sc6000->vport, sc6000->config,
+			      sc6000->vmss_port, sc6000->mss_config);
+	if (err < 0) {
+		dev_err(devptr, "Cannot initialize Microsoft Sound System mode.\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int sc6000_init_board(struct device *devptr, struct snd_sc6000 *sc6000)
 {
 	char answer[15];
 	char version[2];
-	int mss_config = sc6000_irq_to_softcfg(irq[dev]) |
-			 sc6000_dma_to_softcfg(dma[dev]);
-	int config = mss_config |
-		     sc6000_mpu_irq_to_softcfg(mpu_irq[dev]);
 	int err;
-	int old = 0;
 
-	err = sc6000_dsp_reset(vport);
+	err = sc6000_dsp_reset(sc6000->vport);
 	if (err < 0) {
 		dev_err(devptr, "sc6000_dsp_reset: failed!\n");
 		return err;
 	}
 
 	memset(answer, 0, sizeof(answer));
-	err = sc6000_dsp_get_answer(devptr, vport, GET_DSP_COPYRIGHT, answer, 15);
+	err = sc6000_dsp_get_answer(devptr, sc6000->vport, GET_DSP_COPYRIGHT,
+				    answer, 15);
 	if (err <= 0) {
 		dev_err(devptr, "sc6000_dsp_copyright: failed!\n");
 		return -ENODEV;
@@ -408,54 +472,17 @@ static int sc6000_init_board(struct device *devptr,
 	if (strncmp("SC-6000", answer, 7))
 		dev_warn(devptr, "Warning: non SC-6000 audio card!\n");
 
-	if (sc6000_dsp_get_answer(devptr, vport, GET_DSP_VERSION, version, 2) < 2) {
+	if (sc6000_dsp_get_answer(devptr, sc6000->vport,
+				  GET_DSP_VERSION, version, 2) < 2) {
 		dev_err(devptr, "sc6000_dsp_version: failed!\n");
 		return -ENODEV;
 	}
 	dev_info(devptr, "Detected model: %s, DSP version %d.%d\n",
 		answer, version[0], version[1]);
 
-	/* set configuration */
-	sc6000_write(devptr, vport, COMMAND_5C);
-	if (sc6000_read(vport) < 0)
-		old = 1;
-
-	if (!old) {
-		int cfg[2];
-		sc6000_hw_cfg_encode(devptr,
-				     vport, &cfg[0], port[dev], mpu_port[dev],
-				     mss_port[dev], joystick[dev]);
-		if (sc6000_hw_cfg_write(devptr, vport, cfg) < 0) {
-			dev_err(devptr, "sc6000_hw_cfg_write: failed!\n");
-			return -EIO;
-		}
-	}
-	err = sc6000_setup_board(devptr, vport, config);
-	if (err < 0) {
-		dev_err(devptr, "sc6000_setup_board: failed!\n");
-		return -ENODEV;
-	}
-
-	sc6000_dsp_reset(vport);
-
-	if (!old) {
-		sc6000_write(devptr, vport, COMMAND_60);
-		sc6000_write(devptr, vport, 0x02);
-		sc6000_dsp_reset(vport);
-	}
+	sc6000_detect_old_dsp(devptr, sc6000);
 
-	err = sc6000_setup_board(devptr, vport, config);
-	if (err < 0) {
-		dev_err(devptr, "sc6000_setup_board: failed!\n");
-		return -ENODEV;
-	}
-	err = sc6000_init_mss(devptr, vport, config, vmss_port, mss_config);
-	if (err < 0) {
-		dev_err(devptr, "Cannot initialize Microsoft Sound System mode.\n");
-		return -ENODEV;
-	}
-
-	return 0;
+	return sc6000_program_board(devptr, sc6000);
 }
 
 static int snd_sc6000_mixer(struct snd_wss *chip)
@@ -538,10 +565,10 @@ static int snd_sc6000_match(struct device *devptr, unsigned int dev)
 
 static void snd_sc6000_free(struct snd_card *card)
 {
-	char __iomem *vport = (char __force __iomem *)card->private_data;
+	struct snd_sc6000 *sc6000 = card->private_data;
 
-	if (vport)
-		sc6000_setup_board(card->dev, vport, 0);
+	if (sc6000->vport)
+		sc6000_setup_board(card->dev, sc6000->vport, 0);
 }
 
 static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
@@ -552,15 +579,17 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	int xirq = irq[dev];
 	int xdma = dma[dev];
 	struct snd_card *card;
+	struct snd_sc6000 *sc6000;
 	struct snd_wss *chip;
 	struct snd_opl3 *opl3;
 	char __iomem *vport;
 	char __iomem *vmss_port;
 
 	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-				0, &card);
+				sizeof(*sc6000), &card);
 	if (err < 0)
 		return err;
+	sc6000 = card->private_data;
 
 	if (xirq == SNDRV_AUTO_IRQ) {
 		xirq = snd_legacy_find_free_irq(possible_irqs);
@@ -587,7 +616,7 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		dev_err(devptr, "I/O port cannot be iomapped.\n");
 		return -EBUSY;
 	}
-	card->private_data = (void __force *)vport;
+	sc6000->vport = vport;
 
 	/* to make it marked as used */
 	if (!devm_request_region(devptr, mss_port[dev], 4, DRV_NAME)) {
@@ -600,12 +629,15 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		dev_err(devptr, "MSS port I/O cannot be iomapped.\n");
 		return -EBUSY;
 	}
+	sc6000->vmss_port = vmss_port;
 
 	dev_dbg(devptr, "Initializing BASE[0x%lx] IRQ[%d] DMA[%d] MIRQ[%d]\n",
 		port[dev], xirq, xdma,
 		mpu_irq[dev] == SNDRV_AUTO_IRQ ? 0 : mpu_irq[dev]);
 
-	err = sc6000_init_board(devptr, vport, vmss_port, dev);
+	sc6000_prepare_board(devptr, sc6000, dev, xirq, xdma);
+
+	err = sc6000_init_board(devptr, sc6000);
 	if (err < 0)
 		return err;
 	card->private_free = snd_sc6000_free;

-- 
2.53.0

