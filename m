Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F42EDD40
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070351; cv=none; b=R64XOvSrurrJk21gj8k1HBcRf9VtI13dOa3HWFkcMkucDpVSIIBf3hkpG1RHFOcLKkHIuo2awol+w8lDMthp2N/EG/GQXcyYZRZAdCvhkAHnHVwoo8hLTLgTcrZ/rI9vMs0jQncty/71chh/KpgJsQ7QXg47cdoi4y6Jj6aIaGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070351; c=relaxed/simple;
	bh=zIzI+RWN8I+PPp7gM10QfdwWfky+ttRAA/4WGgQBPSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nh9seKLxyF7xA4wBxf4Ucg9RKw4b4Gg4KIowCNNnSPgCLzzGdBNrwlHLB/W8vNy2lZtNpw8wjW6EOOvIftMgqKnXKHKMk9ztSVAGf7PZdXoQS50vlyP06/g1cL9FFBVN/qpRv7MInSNk3L+X/X+UNAKV2ArpFS/I9QEhgQPZjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vWFZS-00080k-Oi; Thu, 18 Dec 2025 16:05:38 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vWFZR-006IkO-2Q;
	Thu, 18 Dec 2025 16:05:37 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vWFY1-00000002kPh-224q;
	Thu, 18 Dec 2025 16:04:09 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 18 Dec 2025 16:04:16 +0100
Subject: [PATCH v2 10/10] ASoC: tlv320adcx140: add channel sum control
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-sound-soc-codecs-tvl320adcx140-v2-10-3c2270c34bac@pengutronix.de>
References: <20251218-sound-soc-codecs-tvl320adcx140-v2-0-3c2270c34bac@pengutronix.de>
In-Reply-To: <20251218-sound-soc-codecs-tvl320adcx140-v2-0-3c2270c34bac@pengutronix.de>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Dan Murphy <dmurphy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kevin Lu <luminlong@139.com>, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Emil Svendsen <emas@bang-olufsen.dk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766070249; l=1805;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=0KnIM+Y4QBq/N0NnDfRAKNRfpAubDFVWi/5K2Fijr9k=;
 b=DyJ5K/YS/KOBuHz5cwQlYzcr0nvB/FdzrWmoR44Zs8aFCe7Sk41MiXXjEHNgiXZLlUfHPNc9G
 6NklkWiv0bxBTpIa0UV9MLLlthEnECv1LBoi0AZVS3CvQfH8VJaRqY5
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org

From: Emil Svendsen <emas@bang-olufsen.dk>

Add control for channel summation.

3 modes are supported:

1. "Disabled": Normal operation

2. "2 Channel": Every two channels are summed and divided by 2

  Out 1 <- (CH1 + CH2) / 2
  Out 2 <- (CH1 + CH2) / 2
  Out 3 <- (CH3 + CH4) / 2
  Out 4 <- (CH3 + CH4) / 2

3. "4 Channel": Every four channels are summed and divided by 4

  Out 1 <- (CH1 + CH2 + CH3 + CH4) / 4
  Out 2 <- (CH1 + CH2 + CH3 + CH4) / 4
  Out 3 <- (CH1 + CH2 + CH3 + CH4) / 4
  Out 4 <- (CH1 + CH2 + CH3 + CH4) / 4

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/codecs/tlv320adcx140.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index e7c607af642f43b2b783597f3cba3a8cbb31de4a..ac6aab8d722409b2c47b4e1df2a23760bebe795b 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -222,6 +222,13 @@ static const struct snd_kcontrol_new decimation_filter_controls[] = {
 	SOC_DAPM_ENUM("Decimation Filter", decimation_filter_enum),
 };
 
+static const char * const channel_summation_text[] = {
+	"Disabled", "2 Channel", "4 Channel"
+};
+
+static SOC_ENUM_SINGLE_DECL(channel_summation_enum, ADCX140_DSP_CFG0, 2,
+			    channel_summation_text);
+
 static const char * const pdmclk_text[] = {
 	"2.8224 MHz", "1.4112 MHz", "705.6 kHz", "5.6448 MHz"
 };
@@ -711,6 +718,8 @@ static const struct snd_kcontrol_new adcx140_snd_controls[] = {
 	ADCX140_PHASE_CALIB_SWITCH("Phase Calibration Switch"),
 
 	SOC_SINGLE("Biquads Per Channel", ADCX140_DSP_CFG1, 5, 3, 0),
+
+	SOC_ENUM("Channel Summation", channel_summation_enum),
 };
 
 static int adcx140_reset(struct adcx140_priv *adcx140)

-- 
2.47.3

