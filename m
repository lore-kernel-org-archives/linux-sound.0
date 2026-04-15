Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6582C11FA;
	Wed, 15 Apr 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265459; cv=none; b=X5nEWDjI70bCVJPJPHVxNK99MSk+L/zmflCTZXnu8AbV2gUW1p6qsdHr/5oEp7Ce9jzZeddg6hJFL7PXoLhcKUwwA9GfoY1RzFsBcMCcie/iGKqvrRiQm3LnqM77Xg7eHtUE5Z+S2O6MJQhjd/Ysbbm7LOiKFElCOu1lL7XKmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265459; c=relaxed/simple;
	bh=BM8qgB6lWhS0NOLxgV5xCucJJwUqPX+tF4iKGroq+Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqJp6z/FT7enIxSdaXE7GNOZtILHMpAWkuUEMY/u0KWtfr3hckXPeD3pRUs3T28Juc/M9Ap6T/GftDyjJXuCGWXfCao8gIKuTFrdQ9OTpU0xLPKRle7O3678kTNNmGR2cNwf+eMbNIqnWJLq/nolZGvUW3+vhkpAMCg1wDYZKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddk4jD1O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddk4jD1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776265458; x=1807801458;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BM8qgB6lWhS0NOLxgV5xCucJJwUqPX+tF4iKGroq+Fs=;
  b=ddk4jD1ON4aXR163A6PAUq2JsxgD8BqIZXvkMQNkyJ702dK/vcuYSdaz
   XaXr/OJkdnlYuu4lmirepb39d4H4jm0dTBr8TtbSaYB5mbuIbkE9R8XYT
   H5im1LwVyFlbloOpbNO7GxtR+jk0E1vcouPTHeC9KOG0TSDa2OggKSiEF
   XV/5GnHfrRQDRHESKWCSkw/tbP7dEHpxS+xxH/CaUy2RBnM0AeWp/GycP
   vkVYKCTuPgh/nro4r274xMXp6eoW2awZyoWh/T10QyQVWzzEOjVL3UKBj
   5h7tRd3RKSUfbdbzWS89AEeQcVGTlGsCwr4C0kORMfmd7wOSFpk4wCY+U
   A==;
X-CSE-ConnectionGUID: EvQEsXqOQVmYUrMX2jeOmw==
X-CSE-MsgGUID: MqHdWveSQRe6yPATDfBucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94815862"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94815862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 08:04:17 -0700
X-CSE-ConnectionGUID: 3hLKX1BQRKaEOGATyUnNEQ==
X-CSE-MsgGUID: ZANtQXLDSAu4vsXaECGXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253678781"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2026 08:04:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1B7095; Wed, 15 Apr 2026 17:04:13 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Wed, 15 Apr 2026 17:03:36 +0200
Message-ID: <20260415150412.365989-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to open code the devm_gpiod_get_optional() wrapper.
Instead of checking for a certain error code, check for NULL.
This improves readability of the code.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: rebased on top of the latest changes to the driver
v2: added tag (Peng), rebased on top of latest ASoC tree

 sound/arm/pxa2xx-ac97-lib.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 79eb557d4942..47889f6003c1 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -330,16 +330,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
-		if (IS_ERR(rst_gpio)) {
-			ret = PTR_ERR(rst_gpio);
-			if (ret == -ENOENT)
-				reset_gpio = -1;
-			else if (ret)
-				return ret;
-		} else {
-			reset_gpio = desc_to_gpio(rst_gpio);
-		}
+		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		ret = PTR_ERR(rst_gpio);
+		if (ret)
+			return ret;
+
+		reset_gpio = rst_gpio ? desc_to_gpio(rst_gpio) : -1;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
-- 
2.50.1

