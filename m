Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF53E8665
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801326; cv=none; b=V+u0m2U+XFoEeA7qLrIhsW0Ca6TJV9TAFyuYNNu07XTibx5g6LhIg6FuChvLV89lN9zgpjU5R1Wv9qZhyKHcwr4p6h4vp9/9I0G8ThgF8MPcTmJQXYUThcN7AcC+o2AkxnNIq9FVL3XbRWUxkpLCTCWcR1Y94Q5AzxsczKXXYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801326; c=relaxed/simple;
	bh=VXhKHHn9ZGwsz2BBhKT+WqePWKagL9CFfeB24cowb3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNPyi47N7bJQKxarAAgLP2r+0Kv/2Z3LZU2qLPRd51Q+8vZ5RzA8CM4z92nxpYnRoRfeqBfpWD1I9N81jju3hkhcqBat3MGu5/l2dX1z1g3qeWNVlW5FyrYPnl39GfaX02n0mtvUdeF9+qiqtm7JEayJJ3EefR88ymlEva9OchM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX959knD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX959knD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845e363246aso1934414b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801322; x=1783406122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=VX959knDvXuT8wlo0qIF7KgX8e/d6D8OyinTCKkDRqWKUPVrdt3MfHd/iAPK2WCsSW
         q5KLclx2pd2Q9/QYcOOiW5CSU5BgO3xkLS+jZ+aZ8tp7IYvPpuZFij2T3qm0QYBHgyTq
         s53aor4Zsqsf7p5NuIKwXLLoP2rvkEqWBJiZfPsoBP9GPKtJCdflzXJQo0B7bSTzOUXP
         VcidATGofgj0NYyYum7eBhUjAN1xtw07oQHAhMlfjzm2/MBTC61Igtcnp/NXubvI2rnr
         MUU9Nxw99A5+cpjEqsVDe4ZPtWMlthz/m8MFOfHfqHfHEkU2p+elV94EzvysQTLj1eJy
         +AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801322; x=1783406122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=cSH4wiKYcterhiotMis7+NzLKqJbNPDn8akJWg5RGyCFhu1iMa02Il96XE8xvJBPtq
         of2qTEeWHbO1ujDHZuxp+YXsASZVW8ws5dcSrpmM93aoUl6ziqnhNd3NDgdYDgvj6LS5
         j1154cbf6/pxxFSWxp63Zv/imZKa8ZkqTYUKTzca1qjP/25H5K0976qYjhw3C4ZfpQ4S
         XeCm/AVFF1xslhHkNKqflKoRcNHq7vR6zA7Zi0CVp2zGAQot2PomwFpT3/DZ6wcQ2vHk
         MiVRa58vHj8xtC3JLnNwyZ1LweMrZ+uzMBxXlieh7F4M+m4nIy+6U8f+LR6YU1HbK7P4
         jZhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+ogZD1YQH6mNQzgvACqq0MjrvRt4yIQ8uVsOcW1ehRp8p3ryAtrHp9XzhVzOI97+LfI0dCgmcO/CgIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJ3LtN+7ipM7gNyh1npxtX8L/OltGSmH62zUEaMA+f8wNrCRQ
	z3xErD9ynpCPga3hrjnpKUNO7NhRue1yM4yFbPI0OJU3P0YhE+0kuMHg
X-Gm-Gg: AfdE7ckJHl4xOWnykCAkQrubgeSTe9EbXE+ga+5bYVm0fX620Jka8uQjPl8FTTXThuu
	RgS/yAxd3XXCgSwMQflXW2pGniAuzCl2y7rbmsgkxuJ8idRetOrxMnwSCuVTGnJIgaZ0tUy+jfA
	xuZ+8aoddDaIfNNqFWoxsLE7Ua/eaCI637hjlmvWzPOeoLPK60v8r+u4Sp1cVLzLfUb3BLZR5K7
	NZ8XPBuEVRfNSccX0XnVd2LzZsDjSCKTiyW0SCijH0qqOe6aFkMYHRIpZ9QtvR5IH5zOuPATATF
	wbE+bdo5TAoCvW1GvmWYlWuq//po8BA8SDw7RW6sqesyM0R43QKfye9MDmxFANneyGdd3q0JIyV
	fkTeN8bbAP9y4ggshevIrvEBK0Q4TMycipm6BQGnmz/rspLB9cje2f1WwBsVp064GrgztBs+U5f
	HaSMvjf7ES22nx8w1TEN3MCvT1L86wh0jLuL0+mZ/jXjSohdo=
X-Received: by 2002:a05:6a00:b481:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-8479f1702f7mr1952682b3a.27.1782801322126;
        Mon, 29 Jun 2026 23:35:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:21 -0700 (PDT)
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
Subject: [PATCH 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:24 +0700
Message-ID: <20260630063449.503996-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7219.c | 55 ++++++++++++---------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..915b1d3b05ff 100644
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
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0

