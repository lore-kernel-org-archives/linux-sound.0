Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716646;
	b=slqNUe3/+Or1bUpTfxh8SfwebT/dW0vEjryiYDYmx356mDKvToAEfh+IdTljcZrNtIPi
	 nOQMD8sUr+zFrdmQN6epafKdFG0THbfBR3M6k8NMhIIGZQw6opZVCjZ20xYUvD4VYU/fg
	 LoNulmVmcSR/mnTarPK/yOdwOUxygcUQ4aO3akaAwEOsC338rcchSqBDxttXj3wAsvORl
	 8ystYYFBlgzkt1JJZDd3hXQ+GyzAXSqqefmC1fvDdH9+SuqegPW27VXdODNUj/8vJQjf7
	 LS093zgx9LvNykU2q4jxvVnMrQsbOQQvn4x2PfXkV3Kc0BPUaId/l9zshCfZ/pKVkbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
	b=aNEh5QjQSlOy1QlyvrV0riZI2mk8Yb4llL90Op5dbliwmWSWsHMU9v552eB7w1XXTbzu
	 mOCIEIXjRH5S9b7BuGybbMqqTPA5OWIuTC/fHv68AcVBDUOmFCwcyuyi+C0N08WnT6Z6E
	 DpokLpQ/vpiAXfKGf+vaYNfX9EQTDMnbCTlioIhddMdrEOlAMo9imHqv4snezN2o6jOsV
	 SigpCKqf6wqh/MypdZ0l+jjdr9csro012DJJ6ultw9uGrIbm9QD2JWY/UmCtk7IIRUKvI
	 ZX4GMKTO02mY654kfNqOSnvYZ2EdnzmH7i8/poSKbCP9+Rokt1xkXjaBw/Y2g2o1pjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQIq5Vsk;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D2606A69C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38D2606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQIq5Vsk
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so6005594f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716644; x=1796321444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
        b=OQIq5VskqQRB450mdvMxDxAOhYiFXd88UbRsXEuVe6FNcxoGRGdvcKgRhE/eccKZ/O
         AdltUC6Tz2E5h2MtaaWMpOO64/hQmqLqM3zFr+mUp8iF/pmPEYXDdix0CPtzs7LZ5jCr
         a0Uhfxg1q9HNfJPy2C/FANc238WM6H9gMr6m9bLfOd9OIirp7WKB1woE0qNAYLYaGkNp
         B8/ngc0fNT/P1NQm1bY4FO1fMCazrUkZMtaAfuEEelq3pN/djI2/KoVQi0lF1ifOT13k
         tlPqeeJ/o1ICav4K/iUczJYd5riF3XRfxx2kv/q+XCYTtdeTNiaFbLf4+l+buCRKQjC1
         7AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716644; x=1796321444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
        b=UGUoHPGfQbeL8GXRp1kZEYi8EG9SFzmWQyWhRKivlJi8u7eepbf1A2FXHv6pSXvDih
         n2rPSu3dpaAWF4LRDbkYKJaOh9gZeWkNgJFIwaEFisKwhU0q9Wb9lXUpp59ne0htoB1O
         m6loVvAwi7QvCSR41UlJWCbDSkI5JmuGqN92gOMQ8XAtdwN4vHryJPybz8+JxPJpKKGe
         nOug1pjI9Zjrr0vJVUlRJ2sax7Yukyv82W9GkWQPVrCyzY2RLSb7WC2/qoQiFsz+TRf9
         tEPupMRRhzBdcYhL3KTVceMYTlwtaMtPzgAZDMKwzMS5FXnFzJJgCOgh523kXH3ve9ra
         voWA==
X-Forwarded-Encrypted: i=1; AL+hErFJgMGUkO0hzdi6wlRQ7BE3Cxl36kkORmJb1D3A5zEDunpjkPesW/2hj9dSxi7/DQxCvoMV62M4WP41Mg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/i4IhPepDEZA5MBSZPLLbagvSQnXvPeJ7DCHgWPmJ/Qu+W7smE
	qwzgu15OUXDU4QXePdmzmLpi0QRLn54DI2pDhmwBrZC0rrnEhkCxXKM=
X-Gm-Gg: AZFdTZfDOj2LgC4E3IgKK201KfbUiiNFSIkb3cpT/5gAyYdSxiIAEv27YkfIMExz98h
	PUvFjoH07yxmzhQ+91ZGr/0uZYpnxvGKnR79JGnukWBDxDhI0XyvsAZXUOvAoT/4u0dV59kxqm4
	F0eh22zXTMIfRd+IIc3PHAvykgk1BFZXv4ds6oSFFCHasHOIkIf11NTJrokH9o9qSlpn0LLU1ok
	FOxYW1LvyFnJadEWfqPRtu2SXOJTfzGelv48svxQu826MtC1q7cPtzlmkaaiubWhOPAbdeEoZQZ
	8g/DEeNyzlyGAheb0Wb4n9kEKDtR1zW/vL0jy4sMQ0px88i5pNiM8Wh6guHoKIZOhGUJfOVVU54
	nQPWOekx6bn+aoYyMdlkKAYF8qSj+p3H1dzTFRv1oiR6aXE6iAky2EsQRxADV9umjv/Tqm5DBqM
	2zTmxUzCJbDp3S3U1qvz7R0RfR8UoFNqcXWJM/4qJIh++HxmnRA2fJrcWiE6iIADb7WYlWD4TBP
	JLeoHpzXGqI/EhyM445U7K5xcPGyhQNrv5rVsbmMaVFIoOFYfqm9fhNoW35p/IWMtfWXcWZv0KI
	4w4ZglPhVXjdprR713eYhjId5j+cOkncZrbZFzTbOJiEg8H5hqhSaF1AaTCTgfWhqToBe1J+EC6
	g24cfs1XGD3OQEK+WvDDaeHERETK+ezLlxv3aIRkkgC3b8UIV/ujTomUVBmE=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr41676503f8f.51.1795716644105;
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:43 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 3/4] ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume controls
Date: Thu, 26 Nov 2026 19:10:37 +0100
Message-Id: <20261126181038.99595-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
References: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 provides analog bypass attenuators for both the direct
IN1L/IN1R-to-HPL/HPR bypass path (Page 1, Registers 22 and 23) and the
Left/Right Mixer Amplifier (MAL/MAR) path (Page 1, Registers 24 and 25):
- AIC32X4_IN1L2HPLVOL / AIC32X4_IN1R2HPRVOL: 0.0 dB (0x00) down to
  -72.3 dB (0x74) and MUTE (0x75)
- AIC32X4_MALVOL / AIC32X4_MARVOL: 0.0 dB (0x00) down to -30.1 dB (0x27)
  and MUTE (0x28)

Add the register definitions, piecewise DECLARE_TLV_DB_RANGE tables
approximating the non-linear TI SLAA557 curve within 0.1 dB while
staying under alsa-lib's 256-byte MAX_TLV_RANGE_SIZE limit, and the
corresponding Bypass Playback Volume controls.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
Note: Of the two TLV320AIC3204 boards used for testing, one wires IN1
with Line-Out (LOL/LOR) and the other wires IN3 with Headphone
(HPL/HPR). Since neither board wires both IN1 and HPL/HPR on the same
codec, 'IN1 Bypass Playback Volume' was verified via alsa-lib TLV dB
conversion and live I2C register readback (Page 1, Registers 22-23)
rather than end-to-end analog audio.

 sound/soc/codecs/tlv320aic32x4.c | 37 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320aic32x4.h |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index ff9cb9ce7cf77..92f77b26b4b40 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -264,6 +264,39 @@ static DECLARE_TLV_DB_SCALE(tlv_adc_vol, -1200, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_tas_driver_gain, -5850, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_amp_vol, 0, 600, 1);
 
+/*
+ * IN1L/IN1R to HPL/HPR bypass attenuation (Page 1, Reg 22-23, inverted).
+ * Kept within alsa-lib MAX_TLV_RANGE_SIZE (256 bytes, max 10 items).
+ */
+static const DECLARE_TLV_DB_RANGE(tlv_in1_hp_vol,
+	0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	1, 2, TLV_DB_SCALE_ITEM(-7230, 360, 0),
+	3, 5, TLV_DB_SCALE_ITEM(-6612, 174, 0),
+	6, 7, TLV_DB_SCALE_ITEM(-6020, 190, 0),
+	8, 10, TLV_DB_SCALE_ITEM(-5667, 124, 0),
+	11, 12, TLV_DB_SCALE_ITEM(-5370, 100, 0),
+	13, 18, TLV_DB_SCALE_ITEM(-5240, 50, 0),
+	19, 23, TLV_DB_SCALE_ITEM(-4921, 46, 0),
+	24, 47, TLV_DB_SCALE_ITEM(-4670, 50, 0),
+	48, 117, TLV_DB_SCALE_ITEM(-3450, 50, 0)
+);
+
+/*
+ * MAL/MAR Mixer Amplifier attenuation (Page 1, Reg 24-25, inverted).
+ * Kept within alsa-lib MAX_TLV_RANGE_SIZE (256 bytes, max 10 items).
+ */
+static const DECLARE_TLV_DB_RANGE(tlv_ma_vol,
+	0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	1, 2, TLV_DB_SCALE_ITEM(-3010, 350, 0),
+	3, 4, TLV_DB_SCALE_ITEM(-2410, 200, 0),
+	5, 8, TLV_DB_SCALE_ITEM(-2050, 120, 0),
+	9, 13, TLV_DB_SCALE_ITEM(-1602, 72, 0),
+	14, 21, TLV_DB_SCALE_ITEM(-1251, 47, 0),
+	22, 24, TLV_DB_SCALE_ITEM(-851, 34, 0),
+	25, 34, TLV_DB_SCALE_ITEM(-715, 47, 0),
+	35, 40, TLV_DB_SCALE_ITEM(-225, 45, 0)
+);
+
 static const char * const lo_cm_text[] = {
 	"Full Chip", "1.65V",
 };
@@ -291,6 +324,10 @@ static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
 	SOC_DOUBLE_R("LO DAC Playback Switch", AIC32X4_LOLGAIN,
 		     AIC32X4_LORGAIN, 6, 0x01, 1),
 	SOC_ENUM("LO Playback Common Mode Switch", lo_cm_enum),
+	SOC_DOUBLE_R_TLV("IN1 Bypass Playback Volume", AIC32X4_IN1L2HPLVOL,
+			 AIC32X4_IN1R2HPRVOL, 0, 0x75, 1, tlv_in1_hp_vol),
+	SOC_DOUBLE_R_TLV("Mixer Amp Bypass Playback Volume", AIC32X4_MALVOL,
+			 AIC32X4_MARVOL, 0, 0x28, 1, tlv_ma_vol),
 	SOC_DOUBLE_R("Mic PGA Switch", AIC32X4_LMICPGAVOL,
 		     AIC32X4_RMICPGAVOL, 7, 0x01, 1),
 
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index d0c2e1002e99e..70ea13198002d 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -95,6 +95,10 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
 #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
 #define TAS2505_HPVOL		AIC32X4_REG(1, 22)
+#define AIC32X4_IN1L2HPLVOL	AIC32X4_REG(1, 22)
+#define AIC32X4_IN1R2HPRVOL	AIC32X4_REG(1, 23)
+#define AIC32X4_MALVOL		AIC32X4_REG(1, 24)
+#define AIC32X4_MARVOL		AIC32X4_REG(1, 25)
 #define TAS2505_SPK		AIC32X4_REG(1, 45)
 #define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
 #define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
-- 
2.25.1

