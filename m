Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2A43FADF6
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691781; cv=none; b=MxQSGiT5dig3xxBFkZmpIiDNMIaecrHrdy+x3Ctbs5bCw0L6xwRw9q8zgDbmhfHGRqmzbEJmWAZFAQtyxB47qZFLvXyWM5evM7JGHhsqEV0rqR++xzhwWrK5Af/J/uyxT334tBZe4BHG8uZLy6q4cQerfHzgLxpnStWpvdrD0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691781; c=relaxed/simple;
	bh=W385AvVA0Vw07yKun72XFjG+VS1+Y22mCHiJErcDRo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DeyDypDTpDxJoFGRU6jnqv/XMKwpc+/8UxHSYL5pR2DKY6LAkMiAx8ZQ2qjdSYX+wG0gon0VltpSJyzuFrp/Borto3phbFXJQ+BZMRTSAWcuKSaxoTrj7r5+Vz0NWPJgkx8Z5nymi9c+ObG9iS2i3Pzg98JrHc+5sskaHm+mNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6DJi1ri; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6DJi1ri"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b159850b16so636435e87.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691777; x=1787296577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RxheUa8ene+3nkhh0cbFVjVvGtllAeUvjAAwrUnHvQ=;
        b=o6DJi1ri2h+sKNMkp/FPAk/72Y2IEq2DHCarX3cZPjcDZq7so8ohtSfX+HWMwLH9UB
         m+ulbUpBxkL50wiss7Cy0ATD4UfGNDeXB8Jm1cWC7XjjDcg5d06dqzmPFtO2/zSHzf9v
         z9V9uFvtK6LlHxjID5YW1DAr1LiInzXG7Jy6etxBbvTo0CA9wJfz+OGoeWRZjqbDgDgw
         +pW9CBLCsKPGIjXKob3GtxunOmmJCQt6fEDylUqfXx6rVsK3DWeDFpXqkgLI8CbaoEza
         qUWofukRz5T5AVdrgJ/RM9fKiMltnhQeg+2APKGGMno13C5Yg+KiDH8b5Jck2FGqWgls
         3jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691777; x=1787296577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RxheUa8ene+3nkhh0cbFVjVvGtllAeUvjAAwrUnHvQ=;
        b=pwPC9ClWEbeHN/gBoqi77rROooT9XvfRvBPP40PMrYX1S3yHO9vjtDfH2NapCkrGXT
         PpqOU4AbYf3iRsvC1tbj2o7HPIi4XdL5ZtBsSRK2DeFM6Tk9yLQwaOVgkZ0NLvyaW4Lq
         RhslESSyo0xy8LemdF32v5haHe3VTq/WBmcsqeiAVwVde3KcFY473jWO2sRIKgIZwU3M
         r96yO/ilaSJRD1SCkGU/nExI7S4HSFJZlEv18n+p15rOSvIFRwyV6XxyRKrnZaoSN2RK
         4Vsm3hluLFKnsvmjVGf1OuKmGsF8aLREwB+3zJXrNtTY9J1imSo16IriVlLH8xvLLFho
         /d2A==
X-Forwarded-Encrypted: i=1; AHgh+RpYWQUmTFkqhC8if2qEVJzFso5Id7ewn/qnD8wavJ5AvEL6prSXjZP51mPJWLVLohNJeZeo57xV++E8rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjouUKzNcmbGMdxPML1HknmboQiiDH3fm8H+rmvoPrL//bYxs
	ADnh7JhrpQ/Qrz0Wy9XqeF4rGpyE3RvAWwJLAYUrGD/mxVw1O8xG0HJL
X-Gm-Gg: AR+sD11bhOlu5ANLbJaXZjLf1KNf71y8LnOWDtYbMPCQ+K6IFT+oCWX8OMhd7tMM6ji
	FlG9jQZ8pvPqAMgDovKkvmMYCPN8Tj1+c+mkCSCCvFIqBu6RxxbwtlxVtDMDkiv8kYwD+3fv/X2
	WoQasu9w6NLWMKdUvZGAjmcspsbEJfLCgp5XwTL2RGJHkh3o7+m5bRnJSw56U6sOxcaQanFhb6N
	fNahNRhVE0nf7fJrVLYZi4nDHuS9XGJgUGscgdcCy9hKRLwHfM/8V5yT2DAJOyfVsCz4Pj2r2Ju
	Ty+tp1oTKV+IKIDqwV+l9GUckffCXM9veLL+O2M9O0R0+6UpwxIbqzSaxIG4yMhZ+ep1Xh6h9IE
	W22N3f44kGZ1qEUHSu4LD54jnn8WGMX3peqlGTKxq6aEtVNMVK8sWKmmY0FREzda5qhZPOACGWW
	swat13jIxB749rLos5Q2EqruFkw9QBmKV1Kkm5o0H/sDpHP6gJdoMejq8YxvmDltC7GJXvNs00w
	7bWDy0vCvJ0DWYk6dh/j/o=
X-Received: by 2002:a05:6512:1310:b0:5b0:113d:8ae5 with SMTP id 2adb3069b0e04-5b45910acfamr464251e87.10.1786691776649;
        Fri, 14 Aug 2026 00:16:16 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cd8e45sm4450491fa.20.2026.08.14.00.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:16:15 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only Controls
Date: Fri, 14 Aug 2026 09:40:00 +0300
Message-ID: <20260814094000.22118-3-andrey.golovko@gmail.com>
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

The read-only SDCA Controls are readings of device state, but the regmap
caches them and tas2783_reg_default[] gives each one a placeholder, so a
read is answered from the cache and never reaches the peripheral.  The
answer is whatever the cache happens to hold: on an ASUS ProArt PX13 a
read of the PDE23 actual power state returns the 0x3 placeholder, i.e.
PS3, while the Function is powered and a cache-bypassing read of the
same Control over the bus answers 0x0.  Once the cache has been given a
value it keeps it, so the Control reports a state the device left long
ago.

Mark those Controls volatile and drop their entries from the defaults.
regcache_read() and regcache_write() skip volatile registers, so a
read-only Control no longer enters the cache at all: reads reach the
peripheral, and a sync cannot attempt to write a reading back.  That is
what regcache_sync() asks for in the first place - "any registers that
should not be synced should be marked as volatile".

The list is the same one the writeable_reg callback needs, so move it
into a helper both callbacks use.  The File Download Status is not on
it, because the host writes that Control, but it is volatile all the
same: the device raises its own bits on its own schedule, and
sdca_fdl_process() reads the Control to see them.  A cached answer would
hide the device half of the handshake.

Nothing in the driver reads any of these Controls - it performs no
register reads at all - so the change is visible only through the
regmap.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
v2: File Download Status is no longer read-only, so mark it volatile
    on its own; its entry stays out of tas2783_reg_default[].
 sound/soc/codecs/tas2783-sdw.c | 68 ++++++++++++++--------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index caf8fe1bf4db..f3485ce4b0c5 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -185,35 +185,17 @@ static const struct reg_default tas2783_reg_default[] = {
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x01, 1), 0x1},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x0b, 1), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x01, 0), 0x1},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x06, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x07, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x09, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x0a, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS24, 0x02, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS21, 0x02, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS26, 0x02, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS28, 0x02, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23, 0x1, 0), 0x3},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x05, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x06, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU26, 0x06, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT29, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT29, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT26, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT26, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT28, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT28, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT24, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT24, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT23, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT23, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT28, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT28, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 1), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 2), 0x0},
@@ -222,40 +204,28 @@ static const struct reg_default tas2783_reg_default[] = {
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 5), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 6), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x01, 7), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x06, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x04, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x01, 0), 0x1},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x01, 1), 0x1},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x01, 2), 0x1},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x0b, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x0b, 1), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x0b, 2), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS127, 0x02, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x01, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x04, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x05, 0), 0x1},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x08, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x01, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x04, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x05, 0), 0x1},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x08, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x10, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x10, 0), 0x1},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x12, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x13, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x14, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x15, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x16, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS24, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS21, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS26, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS28, 0x10, 0), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23, 0x10, 0), 0x3},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_UDMPU23, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x10, 0), 0x1},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x11, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x12, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x11, 0), 0x0},
@@ -286,7 +256,6 @@ static const struct reg_default tas2783_reg_default[] = {
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x12, 5), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x12, 6), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x12, 7), 0x0},
-	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_CS127, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x10, 0), 0x0},
 	{SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x11, 0), 0x0},
@@ -495,15 +464,15 @@ static bool tas2783_readable_register(struct device *dev, unsigned int reg)
 	return tas2783_sdca_mbq_size(dev, reg) > 0;
 }
 
-static bool tas2783_writeable_register(struct device *dev, unsigned int reg)
+/*
+ * The read-only SDCA Controls the driver describes: the Latency of every
+ * Entity, the Clock Valid of every Clock Source, the actual power state of
+ * the Power Domain Entity, the protection status, the algorithm ready flag
+ * and the Extension Unit id, version and firmware download status.  None of
+ * them is a setting; every one is a reading of device state.
+ */
+static bool tas2783_read_only_control(unsigned int reg)
 {
-	/*
-	 * The Latency Control of every Entity, together with the Power Domain
-	 * actual state and the protection status, is read-only. They are
-	 * listed in tas2783_reg_default[] with a placeholder value, so without
-	 * this a regcache_sync() would try to write them back and the
-	 * peripheral would reject the transaction, aborting the sync.
-	 */
 	switch (reg) {
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21, 0x10, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU23, 0x10, 0):
@@ -538,16 +507,33 @@ static bool tas2783_writeable_register(struct device *dev, unsigned int reg)
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x04, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x04, 0):
-		return false;
+		return true;
 
 	default:
-		return tas2783_sdca_mbq_size(dev, reg) > 0;
+		return false;
 	}
 }
 
+static bool tas2783_writeable_register(struct device *dev, unsigned int reg)
+{
+	if (tas2783_read_only_control(reg))
+		return false;
+
+	return tas2783_sdca_mbq_size(dev, reg) > 0;
+}
+
 static bool tas2783_volatile_register(struct device *dev, u32 reg)
 {
+	if (tas2783_read_only_control(reg))
+		return true;
+
 	switch (reg) {
+	/*
+	 * The File Download Status is a handshake: the device raises its own
+	 * bits on its own schedule and the host writes back a response, so it
+	 * is writable, but it must never be answered from the cache.
+	 */
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x14, 0):
 	case 0x000 ... 0x080: /* Data port 0. */
 	case 0x100 ... 0x140: /* Data port 1. */
 	case 0x200 ... 0x240: /* Data port 2. */
-- 
2.53.0

