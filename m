Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB3378833
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793829; cv=none; b=KIkBp3fmou2pDuQQg64CrmmA6GiTfMPuAi3xuvYiisbrEvgr8xr5TbS3NahaPWJKVCXKM0BrFQaCFMuWDJPbhs4/UJ7GguJJJEyeXK8dgXSjC5IOwsFJMXBjcfqNl/pL3MuqwNPEkrKPFzKKzzYvS7gmkuJiLlKqZ+XBEjmdRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793829; c=relaxed/simple;
	bh=bFiso7/5bo2qxT7JVBiB6HAnxRgKouO81GPHXA0xeG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaRlj5frxtso35NuHeV+PyGpJAhhrQaAnyLraRiUl1xbM9Pwp0m1VArYKcc7BDhh/LZXQ8XO3ClcFMJ85KomxZ0iNUAk1IX0Efbz/KDsHMYjy+eVda8POkQjH/uMFbmVl2Fqq9Oy9Wrl62QEX0Z7eixQWx7cZ1E56nmP351vnkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChOvNQl0; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChOvNQl0"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so14067941fa.3
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793825; x=1787398625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITTecIXlxtWR6cUn9ksAsBIcZ/nNQKXG0g9oEXa5NjI=;
        b=ChOvNQl0RrizKzE7cpfEj8y4WZcJePCQ0EhVUVZvGjIkqcCs808E58vcEjoPDUTyDc
         68r8CmZG8MB0lkEDu4wSWzd9degVSo9EDaXvfzp4GrPGnaf5vW8zsCeRjCcHKuw0XYY0
         2b0qQLSMJ89SEkvD5bkhw3aiZxjU+7ru9hW+HR7ODIR4GriP2jPFTmLgmyYVURe2EXqH
         IVl8uRoI+4/yaXiiWNgR5ayhfurdsWwBPGpFu6Y01PH6q78yDWpKB/EV0LnKiSDzvkvN
         dWv8U420iJ+DaBXfzs/joBsVLpYjgbJseOD14H/LS6M9XdTSo8rUqh/eHqfD3TkTlKBn
         +15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793825; x=1787398625;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITTecIXlxtWR6cUn9ksAsBIcZ/nNQKXG0g9oEXa5NjI=;
        b=Fh35rei1Hj4LfqKlCXCnNVN0Hrtxvadp7BGWyweFjcmh1NXFMhYOZ1u/OFswvjD3rv
         lLwc+szCNADIULReM55GaR17z3hiKzf3eimmoKrLupgjaLqEDp8QwZJOetrEmdZckUQG
         3kVXt1l1s9LF+Sze/IDlXmkyEoM8bR8QtuHR+fFYtt+brAcriAHIyKXUhNeh2DfW6x1X
         npUsDVawHKGxG1hzbpY5HiMFO5Z7kHVddKbPn6V89+v6dr3PVh/WdZ4pELClnMTTUoMr
         Xypwjr/0RCJfHTsWa/KLIW3xpO7+mWC4lSb263JUcXexeZHo+7p26uMlzG35fj3x1J7H
         RQsw==
X-Forwarded-Encrypted: i=1; AHgh+RohL2Yt3Fi8c6C1S4Rdqds6v9LprN+JE28JQ9BWEqoYIWBN5HlTnESt6NO3oKAuB0kvT5gZzGl+ds+Xsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+z5atQrjYtqkAHljZ8Ym2B4/j2TZ/5vdytTY+Y0tedDZATiAJ
	owBzUCftvKgwjxcntuu0dBupRwHAeNS+c1kHvXDNQFbaDXmUUL/47QV1
X-Gm-Gg: AR+sD13fqEwr0bNunvFIEZHrhYKCmsAo0CyqMfdrgzOEhYwqLEN2zrMi/WAkba5Vnik
	E7VOpdSHS/foYPv7muLyjjBk0hg4A7woc+j7RLvmaO5b/wdXpj3vzOogo/eNWxotzHNslS6LAem
	lpPXe0W2iipxGr12G2i5t3F9xQtPTCcoaik0aODPyMQIKZ3JQp1XzF9DPTjsbcOMCxQ//RBrQHp
	o92JBAXZ5lrsY8IR5Nzbr+pznMIgDecDRyqePFKeeLN8bvNEmKlQJ5qJEb9ha0s6PV1cSTS3rmq
	66j/aZwusWxDAPbWsiccAzw0YG8Zh67lGuzU5OIMwou0D3HxHENG+4vjYoC+HF1LhR2z7y1820D
	TkAEJM+e+alKcsUmZYX0lIgVS6PvNqRc+cBkyerO8Z6hM95PCh+VHnwUWB9mlicm2a/kgnyu26s
	F/HMUSQvsl2g1IcB/O5X1+v3i4gq4/s73k0RRjFRTXH+HX1cwzp+kfAuZxLBJyaKo3aPEYSn+O5
	dd6/4dP5pVk9D4HagdtgLA=
X-Received: by 2002:a05:651c:a347:b0:3a1:3191:2dbc with SMTP id 38308e7fff4ca-3a1327cbe76mr10906951fa.22.1786793824841;
        Sat, 15 Aug 2026 04:37:04 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130872f84sm10436161fa.1.2026.08.15.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:37:04 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ASoC: tas2783-sdw: do not cache read-only Controls
Date: Sat, 15 Aug 2026 14:40:00 +0300
Message-ID: <20260815112000.4180-3-andrey.golovko@gmail.com>
In-Reply-To: <20260815112000.4180-1-andrey.golovko@gmail.com>
References: <20260815112000.4180-1-andrey.golovko@gmail.com>
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
v3: rebased onto for-7.3, behind 1/2, which is what makes the
    multi-byte Controls readable once they stop being cached.
    No other change since v2.
v2: File Download Status is not read-only, so it is marked volatile
    on its own; its entry stays out of tas2783_reg_default[].
 sound/soc/codecs/tas2783-sdw.c | 68 ++++++++++++++--------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index b657ad031306..e859749ac825 100644
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

