Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA53D47C6
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668124; cv=none; b=Kqe4nv5bmw5SHoFeSmDy4GtNOy5GiWTrrUVOjmKW4Ob3vhuhRuQQAFEDMt8oONr5+BSJrA2q/KuBzJdQpyqVldDnWcu6W8Tl8jwssNLOd+LziVKokLP3qXnu1634d8/BtrZztPZU1Vr1xnjQRzBk62OI2tQ2rCswW0dFRrxztyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668124; c=relaxed/simple;
	bh=rcpwryuEThlZF4upS3cCoE0WjIeBtxUV+f2V6hrTY+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oUQQidCPbAg1hVgsrHwUoBbMWSRn0PjnMm36nPNLAETTKXEBTM0vxOdLQKiDbhMfB+U9RzVVeOFatv74XgXJTmvAxUzRUbBX7VAVOsJSAobMJKhOHA8lASjk+8A6G+nlA6oH6VKwjlKku83jFihh0pydhC9vj4NEDkWtkOqXJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSNtX1w2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSNtX1w2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82748257f5fso761606b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668122; x=1776272922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKkzFs5JDjxn2dtILtgHOZXS7Y3HfRJU6U7EopQqpaY=;
        b=TSNtX1w214BSPl2VezCLMReh0SPW51z2diyAm29o8Ep9aiW+L/845QVwAXWdCIJ4wY
         c0ixJQh075X3z6Kv17aZ9i/f4/TN3SKHbCmJcHF3LcmmOuq5CoWgne3kOA4LZN/Yi/i4
         9mF8Al5LfLw+3ssk7x5+nzUvMkHqcJl/YLKMAfyMxnbhKDDveuV35LgirEjfYo5Rqagl
         rI8z4DfHUGtOzn9CO+tyTmY5WrVTjdjj+tZkpWC3O/9Wk32SIgTjZoB83egpmQa4TpGD
         003bZZPJ646t6NGFRPd0HKlf4ZrV9B1Xv4jVjI1GSZNmuMGnasH1qE4PFa9MW5oaU5j7
         u3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668122; x=1776272922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EKkzFs5JDjxn2dtILtgHOZXS7Y3HfRJU6U7EopQqpaY=;
        b=BrWj8oAlCF6ofW8fk6UcLKdu6BtCJm2KlGWGLC2UTTBGWZwOb8I+fohxtWN4euTUxg
         yVs+iMlP1cwmy9hItGeJ9digcy/qTo53iUemx/l2DWusqlAPeuyqa4cDSM0N13M0C0Ps
         kDjja8E+n5Svnm5u44kDHmcHOxw8q8gvbO2tE2HdX3TTZ+e4F6mxSR8QoobK1s3RAQJ6
         YQuM186pAAUpWsIpY/3OGFcHYkYtCLq3IVFevDYHIFVS3IYfommwwgu1kOf61ZUYS0vy
         qaho+RCjnJxQEolW+9c/mfdqiYfTMgdsc2i07BRZajXlbKg8gwxiNVTvmTdoi266h4nl
         NDfA==
X-Forwarded-Encrypted: i=1; AJvYcCUpGYmG0jB3OmLVZFxL4pSSuKvxgFoOQeV40ax2qkIZppdqWAm7T+sxsUciNKu8t1fOhA0F3h7VsNygUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqZIF57sBDTu8J+JQ+uQQ8e5aIRFdVMVhghtCXdYQgiF7j7EQ
	bZMYLTFj9U6wQxSri+9m4Vv/qT2dLD6e+K8HXu7IzGoCKwWqslMNE4QR
X-Gm-Gg: AeBDieuHHqB+1wMvz2O0flpUKf/A0YROKioxTIdt+v97114rZwuF17pv4mHv2c6lyvp
	i4tANFoBSolOy5NelpHRHwbh8O9GZ/KWmlAm2I+463Q9qNa08mhYLAuJw91TFjl3+dMoGyQKSU5
	wXG5+YAQNGrX25dYK1doNZzkBx0n527CJWgA/d5jfFhUuKfk9Ab6f7Pm0Hr2akVDTOLzflb1Y1K
	2J6wYq/dOz1chl/AWTMHR5XpKuq0MuqSjn+D92xiD25McrcOo6IH9XpNzXFGZtpf7yoqipQeYcQ
	SOYJqyGTnnh8pvUxBE5J3Df3qSwXRHAxb/vvY4KAqI08Nh0WQajm5v1APqhAC4BibAZHaLHLEgX
	ln2H7vfx/c0ORIPHk5UxPMvqWW5I8Kje8lqzrIHpsp4QXxhfGRKkCLDib4CnIlX2w/U4Pz5RloX
	/I9f4Ocj7UUENdTe8Bg+UiapOJCZEAdTPw1rR1Tajofsn8igbj36FwI18rP+5J0ZkKog8kUQJMd
	ghoCu/szACEsQT5X7E5IhI4E3rD+EwS89meYzcaxlNohRpe+RW3qApvqA==
X-Received: by 2002:a05:6a20:918b:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39fc936e551mr285412637.9.1775668122444;
        Wed, 08 Apr 2026 10:08:42 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2694csm21775091b3a.2.2026.04.08.10.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:08:41 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: tegra210_amx: simplify byte map get/put logic
Date: Wed,  8 Apr 2026 22:38:18 +0530
Message-Id: <20260408170818.70322-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408170818.70322-1-piyushpatle228@gmail.com>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The byte-map controls ("Byte Map N") already expose a value range of
[0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
"disabled" sentinel. The driver stored this state as a byte-packed
u32 map[] array plus a separate byte_mask[] bitmap tracking which
slots were enabled, because 256 does not fit in a byte. As a result
get_byte_map() had to consult byte_mask[] to decide whether to
report the stored byte or 256, and put_byte_map() had to keep the
two arrays in sync on every write.

Store each slot as a u16 holding the control value directly
(0..255 enabled, 256 disabled). This is the native representation
for what userspace already sees, so get_byte_map() becomes a direct
return and put_byte_map() becomes a compare-and-store. The
hardware-facing packed RAM word and the OUT_BYTE_EN mask are now
derived on the fly inside tegra210_amx_write_map_ram() from the
slot array, which is the only place that needs to know about the
hardware layout.

The byte_mask scratch buffer is allocated dynamically using
kcalloc() based on soc_data->byte_mask_size, removing dependency
on SoC-specific constants. The byte_mask field is dropped from
struct tegra210_amx.

A new TEGRA_AMX_SLOTS_PER_WORD constant replaces the literal '4'
used for byte slots per RAM word, and BITS_PER_BYTE /
BITS_PER_TYPE() from <linux/bits.h> replace the literal '8' and
'32' shifts.

Slots are initialised to 256 in probe() so the default reported
value stays "disabled", matching previous behaviour. Values written
from userspace that fall outside [0, 255] are clamped to 256
("disabled") exactly as before -- no userspace-visible change.

As a side effect this also fixes a latent bug in the previous
put_byte_map(): because it compared the enable mask rather than the
stored byte, changing a slot from one enabled value to another
enabled value (e.g. 42 -> 99) would early-return without persisting
the new value, and the next CFG_RAM flush would still program the
old byte. The new implementation compares the stored value itself,
so this case is now handled correctly.

Addresses TODO left in tegra210_amx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes since v1:
 - Allocate byte_mask[] dynamically using kcalloc()
 - Propagate -ENOMEM from write_map_ram()
 - Replace magic numbers with TEGRA_AMX_SLOTS_PER_WORD
 - Use BITS_PER_BYTE and BITS_PER_TYPE()
 - Add <linux/bits.h> and <linux/slab.h>

 sound/soc/tegra/tegra210_amx.c | 96 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_amx.h |  6 ++-
 2 files changed, 54 insertions(+), 48 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..bc808fabe171 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -4,6 +4,7 @@
 //
 // tegra210_amx.c - Tegra210 AMX driver
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -12,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -58,23 +60,48 @@ static const struct reg_default tegra264_amx_reg_defaults[] = {
 	{ TEGRA264_AMX_CFG_RAM_CTRL, 0x00004000},
 };
 
-static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
+static int tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 {
+	const unsigned int bits_per_mask = BITS_PER_TYPE(*amx->map) * BITS_PER_BYTE;
+	unsigned int *byte_mask;
 	int i;
 
+	byte_mask = kcalloc(amx->soc_data->byte_mask_size, sizeof(*byte_mask),
+			    GFP_KERNEL);
+	if (!byte_mask)
+		return -ENOMEM;
+
 	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
 		     TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < amx->soc_data->ram_depth; i++)
+	for (i = 0; i < amx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < TEGRA_AMX_SLOTS_PER_WORD; b++) {
+			unsigned int slot = i * TEGRA_AMX_SLOTS_PER_WORD + b;
+			u16 val = amx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * BITS_PER_BYTE);
+			byte_mask[slot / bits_per_mask] |= 1U << (slot % bits_per_mask);
+		}
 		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA + amx->soc_data->reg_offset,
-			     amx->map[i]);
+			     word);
+	}
 
 	for (i = 0; i < amx->soc_data->byte_mask_size; i++)
 		regmap_write(amx->regmap,
 			     TEGRA210_AMX_OUT_BYTE_EN0 + (i * TEGRA210_AMX_AUDIOCIF_CH_STRIDE),
-			     amx->byte_mask[i]);
+			     byte_mask[i]);
+
+	kfree(byte_mask);
+
+	return 0;
 }
 
 static int tegra210_amx_startup(struct snd_pcm_substream *substream,
@@ -134,9 +161,7 @@ static int tegra210_amx_runtime_resume(struct device *dev)
 		TEGRA210_AMX_CTRL_RX_DEP_MASK,
 		TEGRA210_AMX_WAIT_ON_ANY << TEGRA210_AMX_CTRL_RX_DEP_SHIFT);
 
-	tegra210_amx_write_map_ram(amx);
-
-	return 0;
+	return tegra210_amx_write_map_ram(amx);
 }
 
 static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
@@ -212,26 +237,8 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int enabled;
-
-	enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
 
-	/*
-	 * TODO: Simplify this logic to just return from bytes_map[]
-	 *
-	 * Presently below is required since bytes_map[] is
-	 * tightly packed and cannot store the control value of 256.
-	 * Byte mask state is used to know if 256 needs to be returned.
-	 * Note that for control value of 256, the put() call stores 0
-	 * in the bytes_map[] and disables the corresponding bit in
-	 * byte_mask[].
-	 */
-	if (enabled)
-		ucontrol->value.integer.value[0] = bytes_map[reg];
-	else
-		ucontrol->value.integer.value[0] = 256;
+	ucontrol->value.integer.value[0] = amx->map[mc->reg];
 
 	return 0;
 }
@@ -243,22 +250,20 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int value = ucontrol->value.integer.value[0];
-	unsigned int mask_val = amx->byte_mask[reg / 32];
+	unsigned int value = ucontrol->value.integer.value[0];
 
-	if (value >= 0 && value <= 255)
-		mask_val |= (1 << (reg % 32));
-	else
-		mask_val &= ~(1 << (reg % 32));
+	/*
+	 * Match the previous behaviour: any value outside [0, 255] is
+	 * treated as the "disabled" sentinel (256). Negative values from
+	 * userspace fold in through the unsigned cast and are caught here.
+	 */
+	if (value > 255)
+		value = 256;
 
-	if (mask_val == amx->byte_mask[reg / 32])
+	if (amx->map[mc->reg] == value)
 		return 0;
 
-	/* Update byte map and slot */
-	bytes_map[reg] = value % 256;
-	amx->byte_mask[reg / 32] = mask_val;
+	amx->map[mc->reg] = value;
 
 	return 1;
 }
@@ -727,7 +732,7 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tegra210_amx *amx;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
 	if (!amx)
@@ -750,16 +755,15 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(amx->regmap, true);
 
-	amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
-				GFP_KERNEL);
+	amx->map = devm_kcalloc(dev,
+				amx->soc_data->ram_depth * TEGRA_AMX_SLOTS_PER_WORD,
+				sizeof(*amx->map), GFP_KERNEL);
 	if (!amx->map)
 		return -ENOMEM;
 
-	amx->byte_mask = devm_kzalloc(dev,
-				      amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
-				      GFP_KERNEL);
-	if (!amx->byte_mask)
-		return -ENOMEM;
+	/* Initialise all byte map slots as disabled (value 256). */
+	for (i = 0; i < amx->soc_data->ram_depth * TEGRA_AMX_SLOTS_PER_WORD; i++)
+		amx->map[i] = 256;
 
 	tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
 			amx->soc_data->max_ch;
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
index 50a237b197ba..2c125a191a1a 100644
--- a/sound/soc/tegra/tegra210_amx.h
+++ b/sound/soc/tegra/tegra210_amx.h
@@ -8,6 +8,8 @@
 #ifndef __TEGRA210_AMX_H__
 #define __TEGRA210_AMX_H__
 
+#include <linux/types.h>
+
 /* Register offsets from TEGRA210_AMX*_BASE */
 #define TEGRA210_AMX_RX_STATUS			0x0c
 #define TEGRA210_AMX_RX_INT_STATUS		0x10
@@ -73,6 +75,7 @@
 #define TEGRA210_AMX_SOFT_RESET_SOFT_RESET_MASK		TEGRA210_AMX_SOFT_RESET_SOFT_EN
 
 #define TEGRA210_AMX_AUDIOCIF_CH_STRIDE		4
+#define TEGRA_AMX_SLOTS_PER_WORD		4
 #define TEGRA210_AMX_RAM_DEPTH			16
 #define TEGRA210_AMX_MAP_STREAM_NUM_SHIFT	6
 #define TEGRA210_AMX_MAP_WORD_NUM_SHIFT		2
@@ -105,8 +108,7 @@ struct tegra210_amx_soc_data {
 
 struct tegra210_amx {
 	const struct tegra210_amx_soc_data *soc_data;
-	unsigned int *map;
-	unsigned int *byte_mask;
+	u16 *map;
 	struct regmap *regmap;
 };
 
-- 
2.34.1

