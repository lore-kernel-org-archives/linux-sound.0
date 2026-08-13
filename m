Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC68499F17
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640910; cv=none; b=LTdTx0422CNcn5E1R+TMkRGqV9V79CmgaK3FvHBOX0p7XvzJPjnU8JA4G6cq3E3KanhkrmfMEbVAQfqRR/Bwe0KAsOtiMYwdIVFI+bXC4Tm7YsS+dJb5ema96KO/4xp0IKMm5yJ5gbsiIj8n9Ny4GOcNPcb928EX9OIMbEjd/z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640910; c=relaxed/simple;
	bh=yM5NB7ExSnOeT2wAp60hxzlR17VmRrqAbnHtU0oTUn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DoXzM6ZjlXQ9fxDtUIliqYwNQEMNuTWYmNbqsUAcBd0KxkpjjjDGAJz28qLYB+PGFiGUJ9X29dKFyCjY22HcyVI1DjVVPE+7YZ0Y8vbwTImQJ8wo8ToaJSVkgMinbruoo6WUxCDJmCES3ieOgBqLE6rR/vCr5rsOU5zZyBebbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEjDgdcp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEjDgdcp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b021916bd3so14649e87.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640906; x=1787245706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogooIdHl9fWPnCb9gS6bwKdYU4rkBQ/yfpHsfr6udLM=;
        b=DEjDgdcpqjnD59Ro5EqKvU/1tX37sRaEkADtSQNF2MdfR8lZbKhFAPXqzXNYrLE/l3
         9zXm64DFCItMjZVnn8lWJN0AT0V4gDxqQ7PbirR1z3pItoDGc8KUdIYDA5exeDTVG3aV
         iKfmaHZYGtr5sVzmLl/gT9pR/obfImvsHhlRY8m2udba71yKa7Ir3ZjgyNujaqDctpKl
         ZKhpZRi6MFd3B8SP4EhLmwHfBHGpy8D3mSGKQiffQn5g2DvDxwoFiUpxbgjpfytZn0uS
         HmIp14GxwbBBbLiCd1fMFlvUk47Agh+cvvAoEIlAotr32LwrRC4CmwHmlMpqFvKxK6//
         N3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640906; x=1787245706;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogooIdHl9fWPnCb9gS6bwKdYU4rkBQ/yfpHsfr6udLM=;
        b=Iq+ZLnKeWjCAbte+QSa3uzmptNWHEHM0TRdCFt7TfR5tV09jKIsJNSJKbuxUA0erxx
         QF3DYjB+1kDvMK7DkAxOQ8vsOz4jkdDBzsJwGdWNoDL769raY+GEsZKYIxDj8Gcrwuhu
         364LM7HkDhjVwLIOR0qZ9CH8cRZCH/HcfCfZlXZ7NrWks/p8yvr5A8CFDmU9mCgp3f4I
         tTWlfQ5OoUcI10f33Ad6LFPSwNTBg1dn+tANSNunC8kv6BrK6Rakc6sQT033vyPiAQGt
         MDuH2mSVafhpJaFscVFcign4G3u77z4LytGzvapmpJLCdphhpp1PksC/WpdvRnTNMChG
         wOsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3e90NDlTKcejyAsf0ZRcI/5KBg+HrOq4tLqse8/Lzcd74ggVfMjd8tCsPJXEeds7mlQdmF49gHXgBiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwySAGcf5vfaRBxbV5/nd6bL7pbBBYWl+/tkemItQ92arj69PjH
	bPdqRw9CilkbEj74iaDJRTy7FmbSoLrDLrUqh7/lNuNrSPCBfzdOhiG9
X-Gm-Gg: AR+sD10WxwYcovn/uhDJkHDsppmV81UxXTQOlMx84zF/6+L/ZylqcgQeGcHXgjwou9m
	fPcMHi8rC5485fn3fAhTua1FVxvBZ3Gye9wT6ONj0d+u8h4/Fzf6PiJcODMkiq7y2pOL3qSwRkV
	5nSDakQkrf9orNcxQcR3LvnRPZEN36UFrhX8YFq3Rhdi28fUlltf2st46BEbkm/HhOeX4TOa6z8
	DgYfE4M45Q4FLRpcBSMvSkG1eG/CjD/+EC9bggWDwOkrFh9yFXRFnaJQ5EJMhmIZhZ81OSP+kqe
	ZhVQrzgGrNw3yTaSEn5QoAhAYyTqpjK0o/9qo5bvMpnwDuN0/qgSiqrHyxhffPeek9sD/18J0Zx
	WjZDEB07/dJOmUxZ+lenHA2ncBPI4Tk6qDWA5E473EbkM7exWvlfW6SsuofB+MC3EldIMNqIU8r
	kjNXYkzFYowj74KjMVi/poDXA+d5Qy2mMpZI1Q9Qahg1JDRp/E3hNhzahxxyEfOgjF1pcwKGL5r
	oMBOdf+xaxr6UEWYo+y7Sw=
X-Received: by 2002:a05:6512:3b24:b0:5b2:e890:e6b4 with SMTP id 2adb3069b0e04-5b453f82eb4mr1071682e87.36.1786640906205;
        Thu, 13 Aug 2026 10:08:26 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c108d1sm8354e87.84.2026.08.13.10.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:08:25 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2783-sdw: do not treat read-only Controls as
 writable
Date: Thu, 13 Aug 2026 20:35:00 +0300
Message-ID: <20260813203500.12106-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The regmap has no writeable_reg callback, so regmap considers every
register up to max_register writable.  That includes the read-only SDCA
Controls the driver itself describes: the Latency of every Entity, the
Clock Valid of every Clock Source, the actual power state of the Power
Domain Entity, the protection status, the algorithm ready flag and the
Extension Unit id, version and firmware download status.  Most of them
are also listed in tas2783_reg_default[] with a placeholder of zero,
even though a default for, say, a latency reading is meaningless.

Reading such a Control caches its real value, which no longer matches
the placeholder, so regcache_sync() then tries to write it back.  The
peripheral rejects the transaction with -ENODATA and the sync aborts,
leaving the rest of the cache unrestored.

Add a writeable_reg callback that refuses the read-only Controls and
otherwise keeps the previous behaviour.  Every selector it lists is the
read-only Control of its Entity type in sdca_function.h, and none of the
Controls the driver writes is affected: the requested power state, the
mutes, the Cluster Index, the protection mode, the algorithm enable and
the firmware download Controls all stay writable.

The list is static because the BIOS on the affected machines describes
no Smart Amp SDCA function, so the driver runs its fallback tables and
sdca_regmap_writeable() is not available to it.  It would be good to
have the list confirmed against the hardware documentation, and to know
whether the read-only Controls belong in tas2783_reg_default[] at all.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index c217da5fccdf..794d8b7cf4f9 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -495,6 +495,57 @@ static bool tas2783_readable_register(struct device *dev, unsigned int reg)
 	return tas2783_sdca_mbq_size(dev, reg) > 0;
 }
 
+static bool tas2783_writeable_register(struct device *dev, unsigned int reg)
+{
+	/*
+	 * The Latency Control of every Entity, together with the Power Domain
+	 * actual state and the protection status, is read-only. They are
+	 * listed in tas2783_reg_default[] with a placeholder value, so without
+	 * this a regcache_sync() would try to write them back and the
+	 * peripheral would reject the transaction, aborting the sync.
+	 */
+	switch (reg) {
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21, 0x10, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU23, 0x10, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU26, 0x10, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x06, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x07, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x14, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS24, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS21, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS25, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS26, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS28, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PDE23, 0x10, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_UDMPU23, 0x06, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x05, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x11, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU21, 0x06, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU26, 0x06, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT21, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT29, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT26, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT28, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT24, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT23, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT25, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT28, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MU26, 0x06, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT127, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU127, 0x10, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS127, 0x02, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x04, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x04, 0):
+		return false;
+
+	default:
+		return tas2783_sdca_mbq_size(dev, reg) > 0;
+	}
+}
+
 static bool tas2783_volatile_register(struct device *dev, u32 reg)
 {
 	switch (reg) {
@@ -516,6 +567,7 @@ static const struct regmap_config tas_regmap = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.readable_reg = tas2783_readable_register,
+	.writeable_reg = tas2783_writeable_register,
 	.volatile_reg = tas2783_volatile_register,
 	.reg_defaults = tas2783_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_default),
-- 
2.53.0

