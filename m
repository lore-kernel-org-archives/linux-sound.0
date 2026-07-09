Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC933A3E6F
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573204; cv=none; b=NS6GwZXK5vQgs3pXuFL+vPh7IMVdsVw/lA3fcBLhuu/sXNHu46ZQtnElEdxtNTILCqWJKbnL8abxExrtB7hXiRpNqyjvwUFaAHfG/eXGpxqqjIXa9OCpKvEqnvqKLny9eOouZsVDdS1LXDKqkIrfV8pxnyxh7mJolUtuxK6jQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573204; c=relaxed/simple;
	bh=W+FH/hihk45TjXu/Dl+KwPA0SNPvmFDimRQIFSI/5qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CasjCR+9x4BpJWtLKDWQTspQwrBSi6ISoG73XjPTaLEcmzm1qkzxIlc4AyePjTP6pU7ANys1YRQkpn4AFBIyIkxNV0XAIWAt2n8olKb4pcx1NIFKZ1z251hc+CbwCEpKcVQqX5P6rw7RRpYkhAT/6I2ItrIRExBZuH2JAqclAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qx6yFfbu; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qx6yFfbu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381065a7a03so996858a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573202; x=1784178002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=Qx6yFfbufhlz2Eigoj7H4zRgQ9vyqeiIaMOrI6yZJlX7QckTMlXOAdtNC/GKTRPZXD
         LJBf1XencXDQ8nQhlHhqaAsgrd3pUzT7aJXNSLyX4uSFUQm6RWTBRvTz0bY9fb658AP+
         zW4czuscVRYxXr6RxCZLN6fQvBE6SuVdf55AomH4ZtUbRYuMe2XXyLl/TeoQpf6TxKkT
         2qi04ptOdgF+Xf8tY+gpWDSAVw5f68e42WpASObDuBCpi8JZsoRWJW/HgvHTrVmw9Vi0
         SBx4yAmHy/DW44/jAhyYOFTkzsSijpmKDqB0lMJKSAzgyFIGQEt92ytGuXfkRpliPVnl
         oxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573202; x=1784178002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=bIKL0N9XiCcXD99JYG0znT2sE8hi0HzbTjiEYBefRohJuAn26yyk7yR0h43P5eVQut
         sVyBiUi7o+ZqetXxY62dgVE0zrz1LxkuSKuTSIh25c8YAwj39zskJdp1V0WXPGsBFzEq
         KR7C7WsS4umgyquWhJNitdda5mM/SHzXhKP60s/mvDDuVajoUp4ItbbbbMyoE32kvVvp
         CxLKOdN+EF3/LHPlxD1yd64Twx+kSKJwvm3s5hnJ0TCXUHH1BOC+bPaNbb7Oogq2cGFd
         cbM1bwc81nwmKTZRUNylZRKrqlPa8V23kG3xe4oMhmk4XLTasnF0h1djSDa/sFvz5Btr
         IkpQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/RZsu89VKPScmaNVJlOR/sSAXR+UusiV2WLkaTb4+6+ctGccME54ZlxrFWXq5f3XEF090DTBWxa+mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhl8lIfMG44vrAsoyn/zcHJ21M4YBOg4MVqSm4fku0VqdeWLbO
	Qlxu+hZVLRPWPUb8xm4CEvXWFOPWaxL1uYhzPmOG8eP2T2qIOiS4uEn1
X-Gm-Gg: AfdE7cmus5I0+cNLroQAWB1mV2OU49SBKEVbZ9rV9SZUXo+Oftonoo9cVOrnuXC9+pT
	oKovn26ZTuBnbaQt1ErupO9qbscd6LY3s5kBpLuIgKJHvPybr7jzvlEPzEcFOSdcFlA5d/OXRlB
	V2+80j0CL0MaziUiUwbN1uYoO+KAhjlJ6AZRNsRg5UH+gVzar2nHksZcSMfXVNXM6AHy4ha211t
	GXBy98boA2VNyg++cQbGu16UvprTRUyD3rhMA7MDIvFi0hGQbSR9ir4YELQueYbADctGw8Vtjy+
	2aIb+Hs1WJTLC76S6ClXi2ykbWNzKLwqWJfy0Z3UIlPzD5l4O5+PKZMCr3SZH/MnBkm3hGlBAgM
	7IyaYyWm1wTEzzkXgYpHvQFu/hxOc4NK5A0FGqRx0y2S1cyxaiP7kQt0rgmeK5uBykVUisUOZ1A
	7waLLE+AuwKMHh8FHQPnRp+rMwXD2gHC6hX8+FFJB4nOZHHdc=
X-Received: by 2002:a17:90b:5384:b0:387:e0bb:57fe with SMTP id 98e67ed59e1d1-389421ae15amr5296615a91.37.1783573202444;
        Wed, 08 Jul 2026 22:00:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 22:00:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Thu,  9 Jul 2026 11:58:37 +0700
Message-ID: <20260709045902.498848-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/da7219.c | 62 ++++++++++++---------------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..f6d371e93549 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -256,13 +257,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +268,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +279,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +290,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +411,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +444,11 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+				       &val_new, sizeof(val_new));
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (da7219->clk_src == clk_id && da7219->mclk_rate == freq)
 		return 0;
-	}
 
-	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (freq < 2000000 || freq > 54000000) {
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1203,17 +1186,13 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		freq = clk_round_rate(da7219->mclk, freq);
 		ret = clk_set_rate(da7219->mclk, freq);
 		if (ret) {
-			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
-				freq);
-			mutex_unlock(&da7219->pll_lock);
+			dev_err(codec_dai->dev, "Failed to set clock rate %d\n", freq);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1296,13 +1275,10 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->pll_lock);
-	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	return ret;
+	return da7219_set_pll(component, source, fout);
 }
 
 static int da7219_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
-- 
2.43.0

