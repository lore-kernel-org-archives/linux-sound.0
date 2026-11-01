Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543440;
	b=Q+w9+l53hvY2obgAOqGSL27H7pnQt04a3RUIxoVg8DT6LiiemLAdsR7ihQgxXO/VhxkM
	 9uUJsfhTrvXXcQ2FvW90BcOHZK6bGklNbalO/8iE1vBPBLnG0csb46N48w0eIaouLc9tk
	 TjetqcdrrG/SbnfnYFpNadxBIc8UeNcgHKDMZe5g01ww+MXM4+EDBenS+XxZ/De0o1FVC
	 PlZ+7B6ZL0DdmNFg0IktvU6CRDCSFJyMb593EC/XtSZMwZ2j3PTsMIese/xP/gqjtEB4C
	 jcGf1QtcXRWNFBnbEJH9LiSGMCp7R+AdXKiYqyIgtCxFv0gTDG1vOIrQR3vgpkhh+dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
	b=aXg8qsdQ6CWnIoxjrKqMsyDXzzpbCjgLe70AcBK/o02Hz1JhZsP7k9/HIgjQVkqIyTT9
	 LVA5gfmlp+kR+VVDd7gr/xTFHYmjppVqbmbKgPlTmzZfLInIN7KTL1cTA/Hx6E069HG1O
	 YmS+6Madm893nrYfAKzVamB89VIOP64SNgU99GN7Qll3EIEC9TM6yN4qD0FUkHeta/TCm
	 qptO8/UvMFCk5Y5xzZ+vYVpezgaUT0L4V1xGFdfFgnM39qcV8fXx5fiVHv1h5iUDwh9o2
	 JF2u+XjtGxP8DPiLLThesOALfEmPlZydJOIusLYzYzaOutg9uORjH1pPoUCfq3EQGCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8B606A339
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 14:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F8B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so20259715e9.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=A+M1Wa+n9o6Ai1aDy5wIuMQ1Qwkbm9uj6N1YCs0axvyRq7zp/S7yNcm1HxCpeoriTL
         zUnYBMuGWUzpBFYEOgmnCb2zGtGGMm4c3BdODeDl8X5kDIkr8cVgmGz4ByekK/bl8pVN
         jlsUoSoWe6slMLaDpSMbNHI8j5mIKBjQ6BkqKzfBSLey/wSh7FU9UI9b95ZHUH1etdy/
         gmxHgT2czUkR0YvQiOTmKJeGoE0uOyNvbRzDjQEeUVphq/ar6VwmK3kJMVb70OaOpU32
         mybNpWC2JN/pg42L6iPUBn0HyZFEBy/p5s49JO7MKlLwA5sMzpr+XG6ZOdTC42GQg0h7
         iYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=phmmjpw4qqoBvAerCZBv5pen0Su5pkuml1gBJvpIrmYmQ7oGEryNm5TFD1wzeXUwni
         zR89hy4zIxrqla7pFin06p9+2sIx1mjnEGvmvsqh4UcuYahWrEYVB4yCQCbd6xF8HtDT
         8eyDNNGHHy444h59aX25Hs1v3xZ6iGW/1nRp49c17kJVCDvYeuXiCl37dx5eLWKMZK/I
         QyBR9HZHwm9SxtQx7pYk9BBPL7qxGrEHA5Q96DvmDvowEiCZLPkukL9QKF6PRvAcWWvL
         YRjiZczh6mGkHGi7arKj2x2Pls3QAreprro2/OgUL98bojXYb7ZvdjTzQjngbcv3KMez
         eFVg==
X-Forwarded-Encrypted: i=1; AKwUvBwDJs2sBeeJrEr24BR1ppa4CwzYhpae6szOAhJEiPLEM8F9Zv+lUlq8tnODD9jjFDZEuHBM/XpN77YmbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLV66eJV5VqoDMpD+Z79U59A/+IRKgH5vGzOXm8A3LIH+bBAAW
	P6raYrvKSOA3zvRcaD59mV8mvP/B7CMcGUfZF1tlP5P/mFrHcKonkOPt
X-Gm-Gg: AYBFou2c5sCAQdVDMtUa9UtsyjJV0ZJHhpBNEBePQd/OXTqS6hLiYVXfQe5pM1N+GaR
	LIp3X7h8DR9cD+t2gj4BEoWHO4AyGNfo1Lg00DLZD3r0LBGj2rmKnWwKZ9ooKDmEQH/A9lTt/Jq
	iPOsfpJPYP56/Q0anuRfvl1IHJKTOBRlVHUTuQyPkFi0/0QcB4rwtVqApyPyjhfHU9XKqr3Yc8G
	LGVZN3FFtZzzGnDWe0kW7MlpOjFwrbBuJx6YGztzKaeMPAfVvJQm/Y53FEA49ZkE5zbPT074HQb
	wK+Z0d4lWBBvc9xdwTGjRVEVj6FvbGvGqe/Q+SBO9+QPeWT0VUXTewokLpEPhU6qCVTGlHnPAx0
	8NalxpQ39J68EMQ0+azu+Tz714E9ThKxxS8LFT0Dobk+lbgBHRaf1MYaEePgeR+FM8BuCXk44IY
	CdKOYh2Wcbe9r7xPzCGZE9LMhLEv0chOI5XMYDImp5cQNGjDrtvGeVBsWoouZvKa7ZSp6J0lECc
	Og2muoqNtJQXXsBD0n5WYgqe8lfUHlh+QkQL9JtA+R0mccWQ7LKAwNjdd1iDDugdYLGOR4fNM2Z
	DGS5SbRKY9plAsJf9c8sVsiOGNEiYjBWKNWHKkHOdibz0580E8yd7Xv402PyoDPFY995aQgmrPU
	WpC5h5FhA6o+cGl+9eFoRDYxVu4Bg9SYP7G/eqHlRkid6vg==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr184744515e9.29.1793543438534;
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun,  1 Nov 2026 15:30:35 +0100
Message-ID: <20261101143035.880469-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

When the RT5631 master clock comes from a SoC clock output, nothing in
the codec driver keeps it running, and the clock framework turns it off
at boot as an unused clock.

Get an optional "mclk" clock in the I2C probe and enable it while the
codec is active, from the PREPARE bias level, as rt5616 does. The rate
is left to the CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..d523d6d3a2 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -27,6 +28,7 @@
 
 struct rt5631_priv {
 	struct regmap *regmap;
+	struct clk *mclk;
 	int codec_version;
 	int master;
 	int sysclk;
@@ -1536,10 +1538,19 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
-	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(rt5631->mclk);
+		} else {
+			ret = clk_prepare_enable(rt5631->mclk);
+			if (ret)
+				return ret;
+		}
+		fallthrough;
+	case SND_SOC_BIAS_ON:
 		snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD2,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL);
@@ -1726,6 +1737,11 @@ static int rt5631_i2c_probe(struct i2c_client *i2c)
 	if (IS_ERR(rt5631->regmap))
 		return PTR_ERR(rt5631->regmap);
 
+	rt5631->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5631->mclk),
+				     "failed to get the mclk clock\n");
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5631,
 			rt5631_dai, ARRAY_SIZE(rt5631_dai));
-- 
2.43.0

