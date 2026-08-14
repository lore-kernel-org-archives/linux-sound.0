Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEC3F928B
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691777; cv=none; b=aU1SRUL49GIJlMXJDJNkXBExYnvpquZUIQqtwkCtMEnnXreUyv9LYf7lVrGNLQT8Pe3O/INQs6Li1Ca1gPVhVemlDnD3sFAtQqLfDC9yv0QfUCfD+Zm/ttUHhMNCEw/LQYi1zBQSoGQfberMc3PtADfpiEYi27omUAgF7fYO2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691777; c=relaxed/simple;
	bh=OsLkjUDHWzDyvqm4KPfio0UC/UX8egpa2KA2JScp78U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUDoxTJycBYZMr8Vmz6HKCAlBvpC80+cIX763qFu242YNmSjvbD6suFcuuFfgAs9WBY42DHBI7qqsCAUzxKQZmjugtPi0OC6CFePqE4msFQzeDo2IwDx2LEF78Fx1IEx9spkILEu42m8Sd1GLXjAONvA7ugAoMvxdHRxFU4Uh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+CfZjwf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+CfZjwf"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso5988201fa.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691774; x=1787296574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zIrCmpRf2DRLLuc849ehmEaLf02KEJ1ekukF2fQlqD0=;
        b=b+CfZjwfCd7PNGCVW8F6LXQDYtlI/fvfeOWAjAoEb106bwbYkVhOEmEuF+2MZmGlTG
         JpEfJNB/kfd5V6fge5YQUVbZMmEkUNemkUOwPq27RyRu4oIssTI0BSSKiDybCNaL/PMR
         HRW0GI8CTb2VHyNTkLtV4TBzBx8AmkjJlT1XUbgZjdbBdZB0J44Dikn5GPpODLX0T1jy
         YB9CjCOvNc2KzeULotKNpiiFVwqKsSz5zEsfXdriw/vzFT3SUWZR0QBzRzCJpqOEP5fU
         Jr2I0MdT9xa0APvWcV2I1wj2EVWa2cCQ/uyV9o4Y14k+4DGuMunbUAkn7xCiAPkCajih
         LrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691774; x=1787296574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIrCmpRf2DRLLuc849ehmEaLf02KEJ1ekukF2fQlqD0=;
        b=aSWfnQH8CF91W+N5oofUPRbdDoiJHPm13WNVS+T1HNvMUVzuqyrk/ykkGxwP/j9p5v
         x/mtwv7hB1uUlm9aOswBHto+Awf7jJH0ZkSY9ICnrAKm7nKCVFTnfAC3WUTjUwx5hbuh
         hlpc7dzkQxh8AVLGyhxAGaslQt4WTklvChn/P3/bDQlkxsyplDa465xH1EqbOzMAJC5p
         0nNVM12Kug4mCbbIw5oFsMtBlU9erSkOp3NyPankpVitpAhuBgjLSjwi7wARNJqseiCZ
         Lo1XNdX5XkLRSjMYQNSzCLpaInFgqjIUKRAysIsZ8n36m8nGqVm57xKJvPrH1/svVQ3z
         XawQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ZtHSqj2MDyTzfO0hIVUoSXkAUA27YFPaSnPly1EFUTcnqrRpTfC/hjsuAgLaw9teYxWHed95UGuGDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22C5mxAUdaBh7H2hWamG0YUqVcPSR/59n8YzbiIW4xmy8qXcq
	/53E8+YpyCOKuvExt+WWHK2sOh/WP6PCEfj04rIc0y/Y/UegjuWwJbuf
X-Gm-Gg: AR+sD11z1V8mRSoRtPDYuMfUoAoDu+c7gL7vW20LeS71W44V0ecIKgsW+lqskN9HiMt
	qnRq+GJ3k5X+6ooJj8/0T8DOBcybekWeakn5f5GGZDDtimkroHP2tPCvmKyPsf7lPdy0rgcog3n
	YXPNvklWuxBwoZwq2zatBc3udpIanbBy7BT/hlx9e3GqMNu7fI9BKBXiiPbWVN+qOAlC/o+HmF4
	Al4YdBEMBcs5INiM9JEU/0cXQhc6PG3QmluHpFHZyLQXAe4e/1O4Wy3rOWsFcjnU/H3ICSZ6ZSO
	xgnVRAf/R3x/o7gFMtyondQ3zx6ME7WpLRgxvxP1jUcHj71JsPnmDviVw8J8MnO3lcYbt04c7ny
	JWdT8dkedbcCk1vzvSsObq29YXkbb5eBsCWBg2leDQfRbjLJV4JQo8INxuyuIq1E10OrCSzRkFD
	k0dc7l5UiCvZ1Dy0uww+sSKTQ2ts8XxOGde23mE1qlbVaea3hiKLCCvhPYftEQVvp7XeNakScQ/
	0nQQfRYS349K8F4/uNGHFlWY2CZeGpZAA==
X-Received: by 2002:a05:651c:43c7:20b0:39b:1b6d:5027 with SMTP id 38308e7fff4ca-3a1324053f2mr2449811fa.11.1786691773396;
        Fri, 14 Aug 2026 00:16:13 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1308cb071sm3940031fa.17.2026.08.14.00.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:16:12 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: tas2783-sdw: do not treat read-only Controls
 as writable
Date: Fri, 14 Aug 2026 09:40:00 +0300
Message-ID: <20260814094000.22118-2-andrey.golovko@gmail.com>
In-Reply-To: <20260814094000.22118-1-andrey.golovko@gmail.com>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
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
Extension Unit id and version.  Most of them are also listed in
tas2783_reg_default[] with a placeholder of zero, even though a default
for, say, a latency reading is meaningless.

Reading such a Control caches its real value, which no longer matches
the placeholder, so regcache_sync() then tries to write it back.  The
peripheral rejects the transaction with -ENODATA and the sync aborts,
leaving the rest of the cache unrestored.

Add a writeable_reg callback that refuses the read-only Controls and
otherwise keeps the previous behaviour.  Every selector it lists is the
read-only Control of its Entity type in sdca_function.h, and none of the
Controls the driver writes is affected: the requested power state, the
mutes, the Cluster Index, the protection mode, the algorithm enable and
the file download Controls all stay writable.

The list is static because the BIOS on the affected machines describes
no Smart Amp SDCA function, so the driver runs its fallback tables and
sdca_regmap_writeable() is not available to it.  It would be good to
have the list confirmed against the hardware documentation, and to know
whether the read-only Controls belong in tas2783_reg_default[] at all.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
v2: dropped the XU22 File Download Status (0x14) from the list; Mark
    pointed out that the host writes it.  Reworded the changelog to
    match.
 sound/soc/codecs/tas2783-sdw.c | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index c217da5fccdf..caf8fe1bf4db 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -495,6 +495,56 @@ static bool tas2783_readable_register(struct device *dev, unsigned int reg)
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
@@ -516,6 +566,7 @@ static const struct regmap_config tas_regmap = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.readable_reg = tas2783_readable_register,
+	.writeable_reg = tas2783_writeable_register,
 	.volatile_reg = tas2783_volatile_register,
 	.reg_defaults = tas2783_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_default),
-- 
2.53.0

