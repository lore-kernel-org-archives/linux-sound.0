Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE5400994
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647122; cv=none; b=sPor/JyPVewO32/6RrUFiBCCGmeI3Xs6SmjXIZByiZ7q4afbnS5iIg6/gb0Xe1bkJtMGKYLQXfhwQUNawUBoH4Hp1F/ZuJaIAvRfdsSSl29orfklGkdRagUijld7/KCItABr7h+wy3XuxacLl+QqDg+8fSz2AX6yQ0aTXWZMY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647122; c=relaxed/simple;
	bh=WlzX7QjR+K0SMyuwE0lfD3wy9UU7XKXgOYF00eiJvlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YAV6/E1mJX6n9SSa6bRttJ8CCCR1OYQg+uv1A02Gr8p8ruLKPUCmwaAxSb+T3913fh62A7M/S6+wr9t2pNoE9KzGffzZfWo3SF3hUYamD0tXVU4J5FDXqn/CXhsLu+MUg7nIYc8NC2vJsmE69n9WprRyOHyDCPdvCp7kBlxzz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN0VgE1B; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN0VgE1B"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeba09900bso95514e87.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 11:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647119; x=1787251919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kklpn7VxInRBg9TFYdu9lqyJbnDAMQGsWzliyRcqOq0=;
        b=hN0VgE1BxSCJC8XVaEJiT8NkgJExeEUQZhBmTLU65aCthWbjvAU8egvnKY8MgSf8zs
         WO87zuLw7q/pTrwrg6v9stgd4xm/ZU6DAXiZRSXx1RB6qI++rjAiQBwcccdtjmlRyT2Y
         JKETUvciG9GlTYyELHIPktQNXrf1rfHwxDdTYIXIJIHi8DT1z30nPbj/p9NxyF11eZpX
         Xz1332FGhFIuUcFL0ZewOZLFDwC+kVQdtg+tF/mxqqn+sNctzw8hooVf5CGx3T8TwzzG
         DEn5QSxsY+D44IdYAYOQL2RTq+LMptiHvxf2jO++S7NnGzH4mdyypCJPEKIDAWo/0JLu
         70GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647119; x=1787251919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kklpn7VxInRBg9TFYdu9lqyJbnDAMQGsWzliyRcqOq0=;
        b=i1GjNelLKxWBSGCWM/57D3Kf/CLUoqT/VQWoCnJIFq+30CLjKN6JuAer9Mx7IiLyPz
         j618zeqEoWgzkVl+/6Br8ayKaaenD+2VrbSj+ZNORo5BdcUwUweEGoirJw9gHMgflQXs
         LxrTVZnD1nknRHabSPc7qbZIM+sZ+YmiWo/+/Ov07x/sN7lhcSA+27KvWXnUC9AtFtCo
         YGLPRyZs1zAh9dlTkN8+akL6kRUCmabNaH9elLrKjTCm0owoiAfRMuNGtXKnwXL7viod
         3wu5LCfIFfXLVzxWNQ4X7NlM71O19ZuTO93Je63UyzUisKiws/f267m4zOq3uiLMBAmh
         9Lrg==
X-Forwarded-Encrypted: i=1; AHgh+RqKP4GE/RxJ5dscBcdRPI4eFwyXo9vStI/UTH/iF6gViXj+jdpzWUTVdCx8Y0i6Vp42j1ajhleTPk2TSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZs0B56Cq+ZphGuKrzBUQcP7AVGQdUvRxUS4m6Qv/ug7CKkIoc
	L7jFoo/08GKLY30Ezp1ww2Pr7i5b98TPvgXScieHxT9QUDJMjoQ6QxRZ
X-Gm-Gg: AR+sD111VeA3pLz1VYwwcshkWhAoSWey/BQtxjQa1BLYeLW0jiGp7gkufCnWFhl94om
	wLQuaSKx6h6cpgO+qH+EviSk/7ykTuZyvFw40QkwhRFNGR4g44b2dgsdD42aPmtjAZFuuLue+Ak
	CF3RJbFZWdYsWHJMGm5G0lCCVgCYufQkho/vnwMdot1oQVV8kj2SuH0nMALKAYExlgDV2XENche
	jAm/lZsRiBFrZ0R8RrRVWSSMKu1VOHKMlc7c1EZZ4okjXWQR1PCSUAA0v2b6q21mEQK9KjnfwdL
	KEWLizUEZj7qOsl4ALU93dkflvfWB+QDXzQK5vS9lQckcTITNLmQ/QyjpiT0g7tyDvTLUaj/XAP
	DBk7MYoUR9Mtl6sJYUSqyt2RQMvj69phegH574/5lyEFEL8U549QdZ+ZXIVNcyaxAKfYmUIIZrW
	GOwbyGopPErihrU7kb8PzEdJ/yxGyYveDtElQinltv6pk2iEQt8r1ultNO9IKl+NlWdUf28UBTe
	Od+2ob/FqMHszteP+VWodM=
X-Received: by 2002:a05:6512:a82:b0:5ae:c27b:f7a0 with SMTP id 2adb3069b0e04-5b459153c85mr5032e87.11.1786647118296;
        Thu, 13 Aug 2026 11:51:58 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0ad38sm50948e87.76.2026.08.13.11.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:51:57 -0700 (PDT)
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
Subject: [PATCH] ASoC: tas2783-sdw: do not cache read-only Controls
Date: Thu, 13 Aug 2026 21:20:00 +0300
Message-ID: <20260813212000.13744-1-andrey.golovko@gmail.com>
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
into a helper both callbacks use.  Nothing in the driver reads these
Controls - it performs no register reads at all - so the change is
visible only through the regmap.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
Applies on top of "ASoC: tas2783-sdw: do not treat read-only Controls as
writable", Message-ID <20260813203500.12106-1-andrey.golovko@gmail.com>,
whose list of Controls this patch moves into a shared helper.

Tested on an ASUS ProArt PX13 HN7306EAC, two TAS2783 aggregated on SDW1,
on top of broonie/sound for-next.  After a cold start the firmware loads
as before and the calibration registers read back byte for byte what
they read without the patch.  A regmap read of the PDE23 actual power
state now answers 0x0 on both amplifiers - the state a cache-bypassing
read over the bus reports - where it answered the 0x3 placeholder from
the defaults table before.
 sound/soc/codecs/tas2783-sdw.c | 62 ++++++++++++----------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 6ed6121a93ee..549f5e621d65 100644
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
@@ -539,15 +508,26 @@ static bool tas2783_writeable_register(struct device *dev, unsigned int reg)
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
 	case 0x000 ... 0x080: /* Data port 0. */
 	case 0x100 ... 0x140: /* Data port 1. */
-- 
2.53.0

