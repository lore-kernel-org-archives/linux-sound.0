Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D436385D9C
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941108; cv=none; b=bboDFI7rl49uiXQmiMNi/4xucZ2y3IMsOQl6Gn/GmHp0smkvCya3eNw5d/Z09P3QUE9AByTL90pN4ko1DUFEr3ACtWNbot9M8erTntJOwVw+R5BuGIGD6M8JvmY4khMopcuR7BIgJ/vIitOAKkh0p5vRQZWTGzhivlGYB5wWBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941108; c=relaxed/simple;
	bh=u9ViO5wzsanGUP0DJvwXSLDltZEdr3dIfh9vZYYpQlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQnykoWYRt7sbkIl5bC+nYA5aorSLXY+BVXeIqocdlgwaH/O6Wz4kgyfOGjxIGF7O7PT00N1IPpPn0cXKOlIHE6tGNVtbkZtQZt6Vt0Wa0uQlmGh/DzTi1QKV6qecHxhrnfTpgdwRg3sKcsYr3IgYw5ebZ2xL3p7SXOk6pbr1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHVoFbE/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHVoFbE/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso701544f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941102; x=1786545902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp99Lm03C4UFOochSrutYLTEc1y6+PyuNbkXC4zIRQc=;
        b=dHVoFbE/2nDNS+YkLwHCcBI05PwIgFpsE9Rx3TZDzL+pEsyhgUE7y5jTUp5hreb1ee
         wGl8TykMdHK7O3VR6hkCeFC6Xh33heNMFRHAg4KCrIfK3Vr6jZWYDgAUlvSbPhdDGjvn
         uOcb0sAZk1bq/JvXLwRWzsP1ta2Qq1idhVPmz86xy0EvuH2KKDy4NBGlwiOt9KUXybjT
         xlZr8jbJYpCIFuVguFmG+f4RE/ew7vuljl4LQlVYRQd35QVo9TIIGcP8ccjByZTp1DrB
         rUtdwSsS1llN4dlM3c4QkRgGd9jQG96QYVhDNOzFqxbMUtwAX/rgTQmQKtoY9W59Q/GT
         yPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941102; x=1786545902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp99Lm03C4UFOochSrutYLTEc1y6+PyuNbkXC4zIRQc=;
        b=fFjLes14b4OfeZLcHJZbt47Udaqp57TT2Jo3l2OzoLdoP+M/uV+XBwXF96xvePKhh5
         Buoeme7JP8q30XyXKHO06jOqT43Z+hqua3DwhcS+2UYpOLntv2wIl9WnqftJ68yP1nV4
         wd3K9vquKoICsW9KRcv9jHj2vA1A3pyx7vfja3AN9matpTwdj3vd002jcu6a0pZyzrsp
         Wm1OP64poMOGN+BxGQaXutK++Al+RE85wVuZ0HbJN0NsZVfGAxvpHhdr8YrDxQoNgb8/
         kbNCl1zp3p+j6Vi/Tn6RQ2nLlXbDr+TeKIKzNs0LeWiuGHQSrb/0JQo8JkbkjNBCv/A6
         /pRA==
X-Gm-Message-State: AOJu0Yz/n72tYwwi1WbBg5bmiCNakGi0FhumuGJT6XRB7oJ6n8Pf0iHl
	I+3/CE/g4cXhCgLHykP9wNVazMnadE2CvgjTE5sGXABsDipd04fWJ/kH
X-Gm-Gg: AR+sD11eHRSODvOBLWoUSzE4LwhpW/4P5uNT4TcBwNaWB3an3KiERSzKyNaMIkMWuMO
	CWQwtkHsbyS961vO9XJbAjLDWjtIZ5SffRYRl5YIRx8DKg2m0stFYpjSh+6jVsXg0Ygrzk18bEY
	3/OKz58qzNcnWiIYs1Yztk0irW9T8CX8zvI4dIXygPyQ089O1GXqkku+mls4ae1pBIZZDa6w9LJ
	1y+4gDCdrpPABed1zSmarhJUz7u0VFhuUz2MZr6Ilg00e7IVCuGmnpRr471AgkghMxSa3ZjUFSQ
	hZjFQSlJe/6eFY5mwz5I0AB3EwighZ/W55R3rut1wAsaC8MsDNHYEVJs0Po73aYk4CM9fnIoFpy
	GeP4AIkM2YxJF4rVULqMpDvXTEH4yAMJoq+j1P9KmuPTBbfzyeZ960Q6vVG6ZAx5wRcC8SWZWZm
	c1jzqE/wCbLFOL2yQEeg2VTSCTUzer53Y3We6u2tg0+FE7jQovfWz5JBvWnKX6xgMK5SL6Uk9QT
	UerF4P8Fg==
X-Received: by 2002:a05:6000:4803:b0:46e:230f:d095 with SMTP id ffacd0b85a97d-47fec511cedmr13819861f8f.7.1785941102360;
        Wed, 05 Aug 2026 07:45:02 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10499376f8f.26.2026.08.05.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:45:01 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 1/2] ASoC: cpcap: Remove modem-specific voice call support
Date: Wed,  5 Aug 2026 17:44:33 +0300
Message-Id: <20260805144434.1290261-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
References: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 0dedbde5062d ("ASoC: cpcap: Implement set_tdm_slot for
voice call support").

The reverted implementation was added to support a modem driver that
directly locates and configures the codec DAI using snd_soc_find_dai()
together with snd_soc_dai_set_sysclk(), snd_soc_dai_set_fmt() and
snd_soc_dai_set_tdm_slot().

The DAI configuration should instead be provided by the ASoC DAI link,
allowing the machine driver or DT to describe the interface rather than
having a client driver configure the codec directly.

Remove the ad hoc voice call implementation.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/codecs/cpcap.c | 127 +--------------------------------------
 1 file changed, 2 insertions(+), 125 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 6b80c455b074..987c63fc5fa4 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -26,14 +26,6 @@
 /* Register 9 - CPCAP_REG_INTS2   --- Interrupt Sense 2 */
 #define CPCAP_BIT_PTT_S                   11 /* Push To Talk */
 
-/* Register 512 CPCAP_REG_VAUDIOC --- Audio Regulator and Bias Voltage */
-#define CPCAP_BIT_AUDIO_LOW_PWR           6
-#define CPCAP_BIT_AUD_LOWPWR_SPEED        5
-#define CPCAP_BIT_VAUDIOPRISTBY           4
-#define CPCAP_BIT_VAUDIO_MODE1            2
-#define CPCAP_BIT_VAUDIO_MODE0            1
-#define CPCAP_BIT_V_AUDIO_EN              0
-
 /* Register 513 CPCAP_REG_CC     --- CODEC */
 #define CPCAP_BIT_CDC_CLK2                15
 #define CPCAP_BIT_CDC_CLK1                14
@@ -239,7 +231,6 @@ struct cpcap_reg_info {
 };
 
 static const struct cpcap_reg_info cpcap_default_regs[] = {
-	{ CPCAP_REG_VAUDIOC, 0x003F, 0x0000 },
 	{ CPCAP_REG_CC, 0xFFFF, 0x0000 },
 	{ CPCAP_REG_CC, 0xFFFF, 0x0000 },
 	{ CPCAP_REG_CDI, 0xBFFF, 0x0000 },
@@ -1391,121 +1382,8 @@ static int cpcap_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-
-/*
- * Configure codec for voice call if requested.
- *
- * We can configure most with snd_soc_dai_set_sysclk(), snd_soc_dai_set_fmt()
- * and snd_soc_dai_set_tdm_slot(). This function configures the rest of the
- * cpcap related hardware as CPU is not involved in the voice call.
- */
-static int cpcap_voice_call(struct cpcap_audio *cpcap, struct snd_soc_dai *dai,
-			    bool voice_call)
-{
-	int mask, err;
-
-	/* Modem to codec VAUDIO_MODE1 */
-	mask = BIT(CPCAP_BIT_VAUDIO_MODE1);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_VAUDIOC,
-				 mask, voice_call ? mask : 0);
-	if (err)
-		return err;
-
-	/* Clear MIC1_MUX for call */
-	mask = BIT(CPCAP_BIT_MIC1_MUX);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
-				 mask, voice_call ? 0 : mask);
-	if (err)
-		return err;
-
-	/* Set MIC2_MUX for call */
-	mask = BIT(CPCAP_BIT_MB_ON1L) | BIT(CPCAP_BIT_MB_ON1R) |
-		BIT(CPCAP_BIT_MIC2_MUX) | BIT(CPCAP_BIT_MIC2_PGA_EN);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
-				 mask, voice_call ? mask : 0);
-	if (err)
-		return err;
-
-	/* Enable LDSP for call */
-	mask = BIT(CPCAP_BIT_A2_LDSP_L_EN) | BIT(CPCAP_BIT_A2_LDSP_R_EN);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXOA,
-				 mask, voice_call ? mask : 0);
-	if (err)
-		return err;
-
-	/* Enable CPCAP_BIT_PGA_CDC_EN for call */
-	mask = BIT(CPCAP_BIT_PGA_CDC_EN);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXCOA,
-				 mask, voice_call ? mask : 0);
-	if (err)
-		return err;
-
-	/* Unmute voice for call */
-	if (dai) {
-		err = snd_soc_dai_digital_mute(dai, !voice_call,
-					       SNDRV_PCM_STREAM_PLAYBACK);
-		if (err)
-			return err;
-	}
-
-	/* Set modem to codec mic CDC and HPF for call */
-	mask = BIT(CPCAP_BIT_MIC2_CDC_EN) | BIT(CPCAP_BIT_CDC_EN_RX) |
-	       BIT(CPCAP_BIT_AUDOHPF_1) | BIT(CPCAP_BIT_AUDOHPF_0) |
-	       BIT(CPCAP_BIT_AUDIHPF_1) | BIT(CPCAP_BIT_AUDIHPF_0);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CC,
-				 mask, voice_call ? mask : 0);
-	if (err)
-		return err;
-
-	/* Enable modem to codec CDC for call*/
-	mask = BIT(CPCAP_BIT_CDC_CLK_EN);
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
-				 mask, voice_call ? mask : 0);
-
-	return err;
-}
-
-static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
-				    unsigned int tx_mask, unsigned int rx_mask,
-				    int slots, int slot_width)
-{
-	struct snd_soc_component *component = dai->component;
-	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
-	int err, ts_mask, mask;
-	bool voice_call;
-
-	/*
-	 * Primitive test for voice call, probably needs more checks
-	 * later on for 16-bit calls detected, Bluetooth headset etc.
-	 */
-	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
-		voice_call = true;
-	else
-		voice_call = false;
-
-	ts_mask = 0x7 << CPCAP_BIT_MIC2_TIMESLOT0;
-	ts_mask |= 0x7 << CPCAP_BIT_MIC1_RX_TIMESLOT0;
-
-	mask = (tx_mask & 0x7) << CPCAP_BIT_MIC2_TIMESLOT0;
-	mask |= (rx_mask & 0x7) << CPCAP_BIT_MIC1_RX_TIMESLOT0;
-
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
-				 ts_mask, mask);
-	if (err)
-		return err;
-
-	err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, slot_width * 1000);
-	if (err)
-		return err;
-
-	err = cpcap_voice_call(cpcap, dai, voice_call);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static int cpcap_voice_set_mute(struct snd_soc_dai *dai, int mute, int direction)
+static int cpcap_voice_set_mute(struct snd_soc_dai *dai,
+				int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
@@ -1526,7 +1404,6 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.hw_params	= cpcap_voice_hw_params,
 	.set_sysclk	= cpcap_voice_set_dai_sysclk,
 	.set_fmt	= cpcap_voice_set_dai_fmt,
-	.set_tdm_slot	= cpcap_voice_set_tdm_slot,
 	.mute_stream	= cpcap_voice_set_mute,
 	.no_capture_mute = 1,
 };
-- 
2.39.5

