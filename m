Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E080050
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529028; cv=none; b=DXthV3fA9JRdpHzDVXFCK0g4Qb9AfiF3ERwrosA/w4l20DMN/sxdQVk8ewPeyECnymhiv9Y6AaJQRo5pcqbtaI3RLJYVTWnAK/e9uc5m1yl9MceL07fvQP6FeIQV7LYphiAMqgGAFFELsub2nzvaF+H1OASusU12oreRSwyPmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529028; c=relaxed/simple;
	bh=BXL7zP4AWoU74NVuXh75FzHEXhJzzz7hn04HPQZ5I4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=djLApjHRbRbawIZ1nSWwFlRedlNUDRKoFUun2apuE+w1MxVTDFaBA01kTESb4VQuxr2smZc0T3WScMQHecNgoyJmTLGo99BOA0kE6/lW1sqk8jASp0gL0x5sQXEcPw3jlcCfRBgdT/66KS899S8Dli2TmdjJhyAtvqrLQFltXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mrt/L8U8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mrt/L8U8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529026; x=1740065026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BXL7zP4AWoU74NVuXh75FzHEXhJzzz7hn04HPQZ5I4o=;
  b=Mrt/L8U8USOSJSLUoSm/KpyPM7jAcaRGdrTtyAk7vV1HHSoSWH0vwQNM
   //hs+hx658lrEpg22CagAaHA/p7I+xgh7DCxrz2he5ZDtlV5bwPcWuR7q
   h9aXvOPhWv52BHjSiiVdbbrpMmoyz6vDuZCBXCq2QbCudZD/u08CSp1uz
   slSwa49V4tqTz0PwIZttAytnP14Ci2yaqB5ePwRth/np0ustz0qL8a9GQ
   5lezCvG2Qysngkvc4wjEJaKgbVrQT7hdMQQ4tCaPln5q0oeq3Byum3Ztp
   qqbj+O0Nxxo8cmVpL9PC8Nx2TZBQzG/8+xfLjj9QzEE/0LFXqtlOWR7z7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104776"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374243"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/6] ASoC: codecs: da7213: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:11 +0100
Message-Id: <20240221152516.852353-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/da7213.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 0e5c527687a2..369c62078780 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2101,18 +2101,14 @@ static int da7213_probe(struct snd_soc_component *component)
 	pm_runtime_put_sync(component->dev);
 
 	/* Check if MCLK provided */
-	da7213->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(da7213->mclk)) {
-		if (PTR_ERR(da7213->mclk) != -ENOENT)
-			return PTR_ERR(da7213->mclk);
-		else
-			da7213->mclk = NULL;
-	} else {
+	da7213->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(da7213->mclk))
+		return PTR_ERR(da7213->mclk);
+	if (da7213->mclk)
 		/* Do automatic PLL handling assuming fixed clock until
 		 * set_pll() has been called. This makes the codec usable
 		 * with the simple-audio-card driver. */
 		da7213->fixed_clk_auto_pll = true;
-	}
 
 	/* Default infinite tone gen, start/stop by Kcontrol */
 	snd_soc_component_write(component, DA7213_TONE_GEN_CYCLES, DA7213_BEEP_CYCLES_MASK);
-- 
2.25.1

