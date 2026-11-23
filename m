Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477269;
	b=20Wz5lOPY5sRpOw/q3FGoahpySB8mVnyRYeIhEbR0UuRSX62tTrkYJFP7/GbtSuQuBM/
	 dpWydqrQ90ra8jiCL25vyDrQQu8ypuvCmO0LTmsI54E1GUTZaP1W+mIKqqMCMRONpT3H7
	 fB2qkkzrc2CYc559MabrzVRleV69D7jnGCKcoiB3DQ9TQOIAH6lIv7QOA0mml8bggryS9
	 lL6xHyMO87ruScU1ckFbus4MjqujHqt5A3fB6kuxeCB7dFfc4u0LjH8whlsCjrvOdRqYc
	 vY9bPBHO1beirtC6a2SILfPSjjwQtYTYHVBRlzS8SKuQUdH2+HJB4IOJvEdEFogu7SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zZAqCzjJUfkUCcYg5LkQHLRNQkTovP/fVdErxmvlRYI=;
	b=x42Uqsilc/EYehJNqfFau0h94OoEYPQer3+kN5+OU5M+HRFbJiXxEP7TrUVbNoN21rVd
	 pA6X2ZqNUf7RIK5XaKbMFx2PaCLFwhz0HvfUXdcZeBfvD4vs7M8x8ZaX0RRO0A7hQGsPR
	 eDQXz/JrzYr+J7tiyMjG4HBWeQX6HM3mimqEQ2LaJY+Usa0V4E2b5nMQ4mXHXZzqaaynu
	 Zzq75JnuPxLPZmEHQhSbIJo9qs7C3HZf9jmJySeYC78j7SfU17+UTyyPRPWomMF7DxA+N
	 ZYEEl56SZ4xvW2jA3rg4Ukwo0unSqWYW4c1gwgjOWurFw8ciTu33Qae7W4+kSKHogmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSx8ODW8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E855606A322
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E855606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSx8ODW8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so17655695e9.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477267; x=1796082067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZAqCzjJUfkUCcYg5LkQHLRNQkTovP/fVdErxmvlRYI=;
        b=hSx8ODW8SPFVFuq/xjZSgYXBKkWXj5tE4oAqMXC86A3sXWUm5S0gwThQh90Kzw88zK
         Dlj96EN1VLcbd2uG7Q4cWp0XjHUcye3msgDxRtfclq2+Eg9dLXEc0yQ9ORlncYqXXq7e
         3QbuMtGiH9M2stTSrZJet94Q0Vncb5MOYf4iVKRMoxDy+C9c4M5BjhxyYmPxqqEztGT1
         NREmjyOin5Im5EaosSzY9rv286GYVubqmZb0tAdYDDR7hhEtMZLZM8hNnXSmQ+CZI4SD
         KMfZ0WxD7h4DXkASWfT3bYf/Cw19+YBSyjpZKav+Ln5q2alEwTYpW7qU6skQyjkY5Sii
         OL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477267; x=1796082067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZAqCzjJUfkUCcYg5LkQHLRNQkTovP/fVdErxmvlRYI=;
        b=IQ4XO6ER+7hCvRazkgP9F3i/uMyiuRwD5S86zB4jgHi7Tsv9AUkqrO3dx+EBXr1XA6
         d+rgJWxqmF4Nin7BL9eiF8DubM5RJBoU0PststI4v7tfeFQyfm/1dd0c642yruUgDLDZ
         +THBcxu4iC//3tbXm6pP/kf2PTIhcEi5b/kRnoEtFELvjvKTmDK1IzNL16tBD3iGgucI
         rmWxpePPoXws0ciwzoIDsSn4T42FvmRX4vYxDRNcH+n7kwU2e74r/Vgtd260VAtolhyU
         9odAZgZbg/gAHWMrbzsNYTCi0TeeuQ7/nzOAodXGJOcARr5ocEQE42SSXjRY6VX3uZOQ
         Jkrg==
X-Forwarded-Encrypted: i=1; AL+hErFvBfjZPqm2exkjMpsgp2X90HMoSZVv6xB2rAfG5E7nyHfeLAcxrnBldsBgylBjTIoV48+PIyOGGJBSRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+aL1rHKmJjdwTJwTFl+tBc7L0Q+r9EMNGfoo3w1zUR3G2J3yTE
	Nhcc1dhLOfFoyTrkRQMTM/LLI04+PM+YhUx8ZVBws6zFzuUXy1+WXX7eqfYjHHbgiQ==
X-Gm-Gg: AZFdTZfziLX1MmrpNXyR5pD9q0ZPyuV1hPYXTUGVYjKxL7BZ6sgvF5hlXz3MNBUz3wY
	YpBtfcEpx/Se0m6bNbQGHwfqH3wb9ngwmPTCi2ILQ1sQkIPxYNDlbuAy62nGUIMIvQi0BSpAoAX
	xfp81bE5sP0WdGVN2T40+7MtesMWO/rAJPIS8/Qr0cg3T3kz3rAnSVoNKFDWnP0AscerlY1Tr3M
	f4I9mosFAo7opXQ2TZH1YlpMlipWtCugtazTblPN5ZGnyPWW8rK3D7ODiJyg0Y/YjWz9lyF+qbL
	bh7IJMjBrFdaobvB0+umW1GVTZ3EF4/n5HpXzzU58B8lYa0F2c8KZbWxntVhHO98PEAwVuLrxdb
	h0jsfupzLQSq0+oYbL0km/M06o6hUR+VJ1xXxZn9Uoy/0I+wETDq1Cho35njaxHEIX7zoAcocNd
	U1HlrrK1KlA5BPUZwe/YHrZ21dqtp+vqPJK8BWKaEkn4XOO2k/srDmaEWMW9CdQJhVLbrh4nNWd
	VqGTOl8ZAxN1Ig3ZHTqQpNhgWID6wUyFl5c/yq2pkJC7arHjUjtPaAgPSN2THrLLZA3tn3q/3Uu
	i40gn/4FZrf+XwTh5JfF5ZGt4Nv/ZvyX/ci5jMWD78gSo29hxW75wQ==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr286927725e9.14.1795477266822;
        Mon, 23 Nov 2026 15:41:06 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:05 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume controls
Date: Tue, 24 Nov 2026 00:40:49 +0100
Message-Id: <20261123234050.150364-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
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
index 9f90e41076992..80ff52c6bbbe1 100644
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

