Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F73D0915
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581428; cv=none; b=pCjPR/dlmR5BxAMNyo5FRvQcUG6zMzNR6tjzXGR/xW19NUUqc1Bc4kKeQ4o9Wl8Hh0rlvuHDehUOzNyxaejK3KlWpYOWampkm+JnXo1iWH2vJdqXuuDwr6/wXVPiDXLDTROgtgzKslbFNA5t71WzkwTQntpDSGvmdF83QstLJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581428; c=relaxed/simple;
	bh=LEaAiWuc2iDIokGArBD4Y2Hs4D2o0VD9O5lvKNgWjEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M5wMS/LOso0918H8PSeD7j9McWEzREZoDEN1yLtGZYtUfHKUCt1pFZjKZOSOAl1JW7wef33GA7VZhQ6w85w60s8Klw2R3gIeN4G0ADFPtfrpSVK1TCD1Ib8kaCsDjY9dMsuacCr0ezhD585ecfyS+ieb3eacQY2q8+WoaSIsoyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGQIXz5n; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGQIXz5n"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76c067bc51so1901648a12.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775581426; x=1776186226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fesHMBqfmQJa8k2eFKVrT51rcc3PDADSOTcCGgAHuI=;
        b=eGQIXz5n3boH74uQVLyhloS2PGw2S9ZJu3TKHSzEXjmWJh1Y3rVGXD9m2qNm6pfT0s
         TC9IPdZsxn6WKl8zzAO39M7joL+DY0PQ0zopd4mAa54nd4qwrLG8NstuPzNchPIUOaPf
         LIzCDXgmq840lmExwyx+npq8VFT2nH/2nFEEaCrj8y9Yz/1ICBoZWvWLYKZ12P9Q40I9
         k+wxxFlPK6o+dkTkzGM6UrUW7JZ6e5kIHPGq/VbF/vzM50IwzDj/7t8+AEtmOTPfgaIW
         UxraawVvXXKHv28b0vWLYV96pjhsSV3f+KTVVYoAdCBU8Q2BMSpjV8uY+2cx7FGKNBK4
         XQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581426; x=1776186226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fesHMBqfmQJa8k2eFKVrT51rcc3PDADSOTcCGgAHuI=;
        b=ACQXnUEDiDZ6Bfapkue8HyPTxLXvEaEKHLo7BpeaxIOifB3/3BWOZPZE8d1+DhMCwe
         HivU0f2v3q0LA+x5uCo55e/Afvk9tZ0Ik71A2RhkbKkvZBeCXxej9DkrcE0jdc/bdB8e
         Fyi8BjDfRN3SyvElfjRbIA3H82oOSSuoIvEDcDVslMfXjsJno3zCH2Zjr/942nczxRh9
         g+gXD/HLxR3l9NA1M6c5fcCCK0pdjZkFh+KX9EaKPuD6fq+TdHtUYkn8YViBBCstKo7m
         oMaRTYy+qc/uEAizGlO/5NVP/OMbHDOER5hgsx0xxrBcwZdoYRFplNA/zEnIVePexU/2
         8Dwg==
X-Forwarded-Encrypted: i=1; AJvYcCVCRxHmwHmHyyI+QpL3bPyXUxVBLjUSruyhxmipPOaHi2jd8o4fa7tJDufZ0BPnmVyQWAyzZnQozSjGBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0GlewHoYSYgoSnDN74BVQDu9uif8i5ATAOj/wQEUgg3dRnKvX
	1ryiskpwluXMpn91N7PQcCDclYp+TbMUeUahOZP5g+cQeSdFyMKmeZE1
X-Gm-Gg: AeBDieu+JuXrbwWmz2DVe1cSuf1M5r7QoZYOqITT8BgJzGYL+EsEMYjQUp+LfZsvRoG
	3TwDt+eV/mvjjWRPh5VH0dTXdRshUC7mT1CvPLALAf5KtI6IGCfsSkab9DaBhQemeoECEW3C2el
	EcvCadV6mOcUV1/vUJmhhPjvcle3qb1Id5Ge4Alvg7tcDgFWSx6tLSDUjLzwHNMn0DXsc6WeGIB
	AxLK8nME13D5Z7RF0H1dBlDKh2QhECne2EqCgKa8nMVpPUYMsEZUuYBWgGvUGb+v55u9RwSvZJL
	bfQVfEXt+d2f/7nqMgHO6Sptj8TshAF0KV4+ERHZr0j4o35uAJvnwZ0QH8HAGN9nqwXkml2eeE2
	vADnB44n+aKxT5d1j+HLUQ9Koo3SOV8ezkubalaMiz7p5K66rsXU2c3YFRDj7LgC/yMAhUEd+8t
	uR1lHag/Q5z1t+2/kQV/KzntNht+i32uERjv7sd+oz+fbqylPmKomdn6nFKyhqc4Ifcnvo3DOVZ
	COLcFnVxoz2IgKbs4kFtmE8z8v+NGLu6f2qLuMIwrq+Li1eMzblJQEc/A==
X-Received: by 2002:a17:902:f541:b0:2b2:4e5a:9473 with SMTP id d9443c01a7336-2b2816dcedbmr171355955ad.21.1775581426079;
        Tue, 07 Apr 2026 10:03:46 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm196617905ad.29.2026.04.07.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 10:03:45 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: tegra210_amx: simplify byte map get/put logic
Date: Tue,  7 Apr 2026 22:33:08 +0530
Message-Id: <20260407170308.100238-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407170308.100238-1-piyushpatle228@gmail.com>
References: <20260407170308.100238-1-piyushpatle228@gmail.com>
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
hardware layout. This also lets us drop the byte_mask field from
struct tegra210_amx.

Slots are initialised to 256 in probe() so the default reported
value stays "disabled", matching previous behaviour. Values written
from userspace that fall outside [0, 255] are clamped to 256
("disabled") exactly as before -- no userspace-visible change.

As a side effect this also fixes a latent bug in the previous
put_byte_map(): because it compared the enable mask rather than the
stored byte, changing a slot from one enabled value to another
enabled value (e.g. 42 -> 99) would early-return without persisting
the new value.

Also fix a potential undefined behavior when constructing the packed
RAM word by ensuring the shift operates on a u32 value.

Addresses TODO left in tegra210_amx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 sound/soc/tegra/tegra210_amx.c | 77 ++++++++++++++++------------------
 sound/soc/tegra/tegra210_amx.h |  5 ++-
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..4dd158e6e974 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -60,6 +60,7 @@ static const struct reg_default tegra264_amx_reg_defaults[] = {
 
 static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 {
+	unsigned int byte_mask[TEGRA264_AMX_BYTE_MASK_COUNT] = { 0 };
 	int i;
 
 	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
@@ -67,14 +68,28 @@ static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < amx->soc_data->ram_depth; i++)
+	for (i = 0; i < amx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < 4; b++) {
+			unsigned int slot = i * 4 + b;
+			u16 val = amx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * 8);
+			byte_mask[slot / 32] |= 1U << (slot % 32);
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
 }
 
 static int tegra210_amx_startup(struct snd_pcm_substream *substream,
@@ -212,26 +227,8 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int enabled;
 
-	enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
-
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
@@ -243,22 +240,20 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
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
@@ -727,7 +722,7 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tegra210_amx *amx;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
 	if (!amx)
@@ -750,16 +745,14 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(amx->regmap, true);
 
-	amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
-				GFP_KERNEL);
+	amx->map = devm_kcalloc(dev, amx->soc_data->ram_depth * 4,
+				sizeof(*amx->map), GFP_KERNEL);
 	if (!amx->map)
 		return -ENOMEM;
 
-	amx->byte_mask = devm_kzalloc(dev,
-				      amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
-				      GFP_KERNEL);
-	if (!amx->byte_mask)
-		return -ENOMEM;
+	/* Initialize all byte map slots as disabled (value 256). */
+	for (i = 0; i < amx->soc_data->ram_depth * 4; i++)
+		amx->map[i] = 256;
 
 	tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
 			amx->soc_data->max_ch;
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
index 50a237b197ba..6df9ab0fe220 100644
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
@@ -105,8 +107,7 @@ struct tegra210_amx_soc_data {
 
 struct tegra210_amx {
 	const struct tegra210_amx_soc_data *soc_data;
-	unsigned int *map;
-	unsigned int *byte_mask;
+	u16 *map;
 	struct regmap *regmap;
 };
 
-- 
2.34.1

