Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743300;
	b=x5O+eGb6E2P1HOShQPEjXbYzvnB+ZnGIxnikkKK44CeNrCWAic6WOiJyJPtUg9C4BfNx
	 34Y0rF6AEVZTRgHh+6O6QvyJFS4l85EzlpK2kJQEQ7PZmJHLTNQRe164qGJjSGgEYl6iA
	 UeF2Cj6bnuFh5H0yQWu9DuWu+IInqP07d/D9u0Ugyk9b5H449yan9QsvoNUg9U0B9qUV8
	 wQn0mcyd2M79b47kEB37ijMd35b1ujF7fmfSqR3Dgx/xqa0c5hljNxgsXg6KBgtrU/4J0
	 EDbJtXHhVTXn0DQWtqwqnbdvvScEJ1ALcg8pVXBq3PDbzhnUwREU7p9k3hXUael2UMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P0AHCCvoov2mwLYCcDbXNIv3zKf0YewFWJ4SjQy4/S4=;
	b=DayA7YA9FFfnNUkt2A3LT6dReADzcD72HRv8Iu7S0Hp3wG+Du9UpUpIaA6Sf7gxmX3pb
	 ATuEEsEGzD0k8r9jsb3idAYWJUQ8bFImAF1o4BDv2vGMXBY0iokC5HVXm/XkEsjXjoM2h
	 nr+sr+udFR9I8XwxzFfq4xebh0/Pr8bY7dHT/uIHMdZ6PfonNeN/gYu983qzsylb5wYUq
	 s4/0Amid5pEoqRL+cFyqhm0GEEH/l2MB5qAz7W3o/qLabBQHMhNHcV3a+TPNj3lI6Y2Np
	 k49GplSL/nyszgbdokNRcsGD5q00jzcPpluSWQ0Qs4kFbqsAMCSAqHqf+IljkUTXEeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=snA8PoGz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E9606A32F
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6E9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=snA8PoGz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4650375e9.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743298; x=1793348098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0AHCCvoov2mwLYCcDbXNIv3zKf0YewFWJ4SjQy4/S4=;
        b=snA8PoGzB4BK6TvU/pvF+LanpiD3k50TM+HBR8Tvai/MYVzCUPowfwGSjQdRTCT9CS
         tyz1sXdC9b54O9O4cwh64l9y7WlFjIJyBz5KoVgr2GaN7R9kyeEk1Us8QHg/CYYvZxII
         4Zv7lUmBwVEl54RSn6a8enajdQEyZCRd4lgG9Yb2FwTJy2ssTLVizfSHXiny0Xsn+DUa
         ex25XpQrKqa8ptkDmF1RufeoYsG3vvrQZ9OdXz0hV3unDdoGQ4BGJzMwf1P5PREAph2y
         4x9S9z3WC6tRQfUpCtqhuXO2i0HY4nvDXr7ws89Y0obK3YV3AjzLWKFz1peFT539Qmcn
         AH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743298; x=1793348098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0AHCCvoov2mwLYCcDbXNIv3zKf0YewFWJ4SjQy4/S4=;
        b=oQhlxi7GLmOgaoqF7lUFhE4gzA0GLLRvlo0mp8KzfmguZEq4+EjXenm8PV+lKF07Qy
         DKn5PunaA8EcH18Ozcl5uOJlemo6C5pFiVYRuj9HSLaMqDfauMz541s1Zm2jLhXcR8B2
         HXKmATFX+UlKJcaNGIexm+ticnmwFA4rwcSjXY5e/eZt/cJFxs5C6qaMY7FGcjt5ELxP
         3uLwJszys00ke29uXsNEuyCgmynSJnWc9xf+bMhRCuAdF+WI527guwMwGAGTZ9XyOGPP
         2plQn3llw9qVJXzSYT+LAFzqjZ8CXQ4SFsT2q697wg4mQAu2+1Y41oe80ULduarg3nT5
         z59w==
X-Forwarded-Encrypted: i=1; AKwUvBz+qDMmi1MMxHPDlHni5cvYHek+YqkQvoWGOX1M7PE99IiEQWVPaOs57w3SxIeWOfisc5sY1yB2poHFIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHffRRPMV2LHGCQt7UBBVv+C2fTbyq5p/27EbLSFm9t3WxQoJo
	Eq91lQ49AyLssJhq9DaKgWMslYyNcL5ytnWr3vj1mN6ebCEv6LjnbDxVNoFkFndTDos=
X-Gm-Gg: AYBFou3Wf8IwwpKUnvrO66elR2yNaqZ2kAzu0v4ZDnObJCYDNAwX6wJTMq9TBvCpjlq
	QdAThg7iR+7Hsx2povEjrIxVqElF3O5FdY1jBv8JFtzXGUq2tDFGem6g+TbDroi9sl5uhlluZpt
	B2gyWNFF4xBjglPJ9Flfe7duMixPAe3j1sn0VIPmeSkKmpmP+rGjjJLuIwxgScZpDKqYt2WoXwa
	KAhiYlXIxRx0WCPq65oI7WiWZBuUgD+layVpC0Qg6lnZsld8K2sqQLM2a+91GM3QwrNixILSgR+
	ZPNVXa8HQHDz79zWiVrV51v0gh2npXVmR/V9DSc5NvzGO7O+6TUQanFR/xWpspR3NdlbGZ9Zbpq
	LWAvKYBvEMvSsCMOBWwFJo57ygXqTAAIx2ya7USqRxQ/PZ9PVCBhe647T4voYagOCvTRTqPXhAR
	C8hU2Jyq6KJHmWAJ1FPMy4kcqQsaKvi62pdF+CCc9hMPnJRqYS3WBtYSm/VjLf8daqQvDQut4g8
	KAJ9Um4+76NctIMMyZh4atY2nmM/u1vkpOqEPahoy091u9gqZMFGKnd0cBbuOqKivKOrmDKCnKM
	RIEcLJSbXBEg
X-Received: by 2002:a05:600c:1c20:b0:4a2:b60:70b5 with SMTP id 5b1f17b1804b1-4a211f023fbmr24283645e9.13.1792743298222;
        Fri, 23 Oct 2026 01:14:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21029c9b2sm58535495e9.2.2026.10.23.01.14.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:57 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC] ASoC: cs43130: Take the frame layout from set_tdm_slot
Date: Fri, 23 Oct 2026 10:14:57 +0200
Message-ID: <20261023081457.44579-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hw_params() derives the slot width from the frequency given to the DAI's
set_sysclk(), which it takes for SCLK. Generic cards pass MCLK there: the
simple-audio-card of a HiBy R1 (Ingenic X1600 as I2S master, 64 bit
clocks per frame, mclk-fs = 512) hands over 22.5792 MHz, so the driver
sets up 256-bit slots for a 44.1 kHz stream and the CS43131 plays white
noise.

Add a set_tdm_slot() callback so the card can say the layout instead:
two slots of 16 to 32 bits. When set, it takes precedence over the width
derived from set_sysclk(); zero slots go back to deriving it.

Tested on a HiBy R1, on v7.3, with dai-tdm-slot-num = <2> and
dai-tdm-slot-width = <32> on the codec node.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
RFC because the way to set the layout is a choice: set_tdm_slot() is what
simple-audio-card can express from the device tree (dai-tdm-slot-num and
dai-tdm-slot-width on the codec node), without a board-specific machine
driver. I would also be fine with the codec deriving the layout from
the sample width, or from a bclk ratio set with set_bclk_ratio(), if you
prefer one of those.

Tested on v7.3 on a HiBy R1; build-tested on 734bef548a96 (v7.3-7363).
Only the CS43131 is covered, as PCM at 44.1 and 48 kHz.

 sound/soc/codecs/cs43130.c | 50 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/cs43130.h |  1 +
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 48d88dad4ceb..8450794654c6 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -952,18 +952,24 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
-		/* Calculate SCLK in master mode if unassigned */
-		sclk = params_rate(params) * bitwidth_dai *
-		       params_channels(params);
+	if (cs43130->dais[dai->id].slot_width) {
+		/* The slot width set with set_tdm_slot() */
+		bitwidth_sclk = cs43130->dais[dai->id].slot_width;
+	} else {
+		if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
+			/* Calculate SCLK in master mode if unassigned */
+			sclk = params_rate(params) * bitwidth_dai *
+			       params_channels(params);
+
+		if (!sclk) {
+			/* at this point, SCLK must be set */
+			dev_err(cs43130->dev, "SCLK freq is not set\n");
+			return -EINVAL;
+		}
 
-	if (!sclk) {
-		/* at this point, SCLK must be set */
-		dev_err(cs43130->dev, "SCLK freq is not set\n");
-		return -EINVAL;
+		bitwidth_sclk = (sclk / params_rate(params)) /
+				params_channels(params);
 	}
-
-	bitwidth_sclk = (sclk / params_rate(params)) / params_channels(params);
 	if (bitwidth_sclk < bitwidth_dai) {
 		dev_err(cs43130->dev, "Format not supported: SCLK freq is too low\n");
 		return -EINVAL;
@@ -1609,12 +1615,36 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Sets the frame layout directly: two slots of slot_width bits, which then
+ * takes precedence over the layout derived from the set_sysclk() frequency.
+ * Generic sound cards pass MCLK to set_sysclk(), not SCLK. Zero slots go
+ * back to the derived layout.
+ */
+static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
+
+	if (!slots) {
+		cs43130->dais[dai->id].slot_width = 0;
+		return 0;
+	}
+	if (slots != 2 || slot_width < 16 || slot_width > 32)
+		return -EINVAL;
+
+	cs43130->dais[dai->id].slot_width = slot_width;
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.set_tdm_slot	= cs43130_set_tdm_slot,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index dbdb5b262f1b..6026c14514c0 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -495,6 +495,7 @@ static const char *const cs43130_supply_names[CS43130_NUM_SUPPLIES] = {
 
 struct cs43130_dai {
 	unsigned int			sclk;
+	unsigned int			slot_width;
 	unsigned int			dai_format;
 	unsigned int			dai_mode;
 	unsigned int			dai_invert;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

