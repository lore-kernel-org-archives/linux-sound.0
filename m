Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=cigHVBXjCYsP7qUZHmvt3kRc6lnSI9lgKRFx/dKfAH4ZTMng38gIoMztURmFIOiTw2Yh
	 HLfHfb4+RY11yaYhhBMZs1mGfZCwNcRrSu96DpD+BBGaPznofb66u1C7epSGWnufF5ri9
	 mdNHJ1Z8IfHQwWN8qYdD4fdniQkTWdfj1ooGdzBgy443uBnGO2L/sysN3GVPV/IJJi7IW
	 Pvb8Uvcro6wsqhpYF+XrTkrzh8t4XISE1mpsqoM+34L2wztnQY1g3D3KyC0ICei6By9l2
	 3W+al7S3shHMdYiieqYQyJsjwvaL+7SITpKb0OHRtmK4WfjTUysX4VE6UTibfectwzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
	b=WGMj51+Eo+1Z1vrBZhQouvhx04tOZKK0bmWqVZEoadikSRgru2OSFlcypH65Ec0tN7tu
	 LLgkg8NPCaiBK3ObtUsexyB/6E7fuj7VcXB1emHUp7A72As1QkcgUNf+VWemFZOQcaYwp
	 zTxVJ5Y7dct8GBbO4Vi11LMAp8vSMyQoGPGtWrFbR+v/FT/krl1IZwxApBoLkuhLpskq6
	 aPu1KKQA9THxwq+0gA5Zaku4GZEM3Ea4DEQN9mWJmVWF2Jpk1//8J5Re+3R3OSfo/6Nz8
	 3uXrjc4+0UPIr6bkiKociY3U8ZR+sqkAg7jG0nsXXyxCQom1bhVT8ms0otTvilUY7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FEF606A32D
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FEF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1384962f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940037; x=1793544837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=KOgjbhA6K/o5voVjgsil0QuJV98aIIrN1blNN1fB95Ej5DhKLlAy64XOHuJDD3L7gX
         pkeOUO00OX3pa1eeiPSeIwsCE+QKO61LdkkY4RlAhw8gJgZ7eliGhdWNK/HHcgjTObAL
         m7O11Vv7oh8FjiCGmUN5ikyV0fLbCjTYLpwIkKBXSkwt4bkLSZR9wcWaYJBrbWkfjfLk
         Z1GtHHRSdxQD1EafHWsGqVmMqtSM3r8P4lMr5IFMB65QwI04jLsX7+vF19Pd9q/zOqAG
         SZ8QUqYRW7nc85FNUGw9OMLHQZUQll0PB5DnEVPiEBdddKbvsiZ1V5jjtcYjoYW571qw
         5XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940037; x=1793544837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=L6Bk0SFXkgE76pBspQywPQWozxV2QAMwP647zEB7FY/LrT3ZaAL5+Y+09R3Ix3Sgy4
         v5G/G+s/w3I86tcLH0aEZYalr1QhWaOsQ1VZGGH3CsMDXild4Fa5TczVctodYccctvZn
         eAfovppOMZ5jUa5aiXRu6ePQReIFIS/DgZXNxGKSCuMWHwMsivv/IuK71bOoshfoVpYa
         7kpeRAPeRGrlRLNfYYDYhjxVdYbXTsuzn6SEAM0o/uRzN0vGDgmdgv8FJWZcY2EntJ3k
         a2e3cYtX9cImECfR9pmgEvSXhO8X0ZMainJqNJ8/QQI7rhJNnVuaLoKJhfZEWmxD5f3K
         Atxw==
X-Forwarded-Encrypted: i=1; AKwUvBw7Ht3/O+gOjxTK91aCel8Lmo8lg6PFBKubBg03M7nLZ7D3Hv1rZpJEjqrfAUsOoTzx1AaTSkDoR34EmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTPWiHDnfgGuSJkAcUyv5j8QGgn3o2Ief/iT/4abBX3kEPf0Rk
	gJsid/2aX27tDPVUh8Y8EJcan278lMw/RxcFpXbYfn0zu1pkbevDPIJD
X-Gm-Gg: AYBFou0upHWndWAfdZNeId0z+m8hHG3HQIpwEkg1LBnrnVAqoCZV4nqB2WZPvzmUzgH
	wFrHMpqRdlwB9nR5fy3sIP7vaBrnEUoeQMacb28Q1OBprub2bei5gEL4p8+q91XAljW0Wha0vuK
	X/tmXlRj/kgRZWWTH9E0Plh25Zr+xkpsYnZuarFestTs3luYMkj8M9lJhboKkhG62uXCVLkaeB3
	3987rGAzixtR+DEiyL6XJLuScjTE7EUKiT7OSTKd5apelqk7jDrTB710qHwElZJ36Nva94eiLov
	8juSyuuNvewp3ZxHI9LFPs8QrzgXZjrhMODN4RFTgQ2fPU4pw+zFrApFPx0KvEpZUMALs70kbfQ
	RvATdrY9tY+jEWtW8DAOS+9/sqjUxP/+9wbseB0j/6g+YC2DiLKiL9tuDvbmkqMd/gt4seL9F8u
	+IODxMeuqk/D4dgWhD11iXq0EQR1e3Na23Hhs082qh3toh5CkqwVxaeOrWqhAEQSEOqedDYECla
	7o7r89sxPrXZyNklpNemJc0PG557tk5MxTo8zTG5D0i015Lz6OCaY7ZEtKpidOm+MvGQHcZMvVq
	Xydxfd2K4ppquZYx+nthQby8UMigVP0Hc4anwCOocplkXH94qEzv1pLIfuiM8enPA4wT2oY=
X-Received: by 2002:a05:6000:615:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e3eba976cmr8372603f8f.57.1792940036702;
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 15:53:54 +0100
Message-ID: <20261025145354.3476371-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
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

Get an optional "mclk" clock and enable it while the codec is active,
from the PREPARE bias level, as rt5616 does. The rate is left to the
CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..82d5e8b9c8 100644
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
@@ -1579,6 +1590,10 @@ static int rt5631_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val;
 
+	rt5631->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return PTR_ERR(rt5631->mclk);
+
 	val = rt5631_read_index(component, RT5631_ADDA_MIXER_INTL_REG3);
 	if (val & 0x0002)
 		rt5631->codec_version = 1;
-- 
2.43.0

