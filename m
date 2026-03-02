Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C8430BB1;
	Mon,  2 Mar 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465179; cv=none; b=eyvvVnxaw2SYpHO3MaScl4BnN5qwGfntC1ICiRfg7IGlz5izMThvS3jUS7Tv/OI2PuwoLoE949/5jc+ZcuN2GGnF12BePSDeu7tTlQD9J7IcJ8Zdie9sGE5oGiTyAQ4ujqvfTIZTy+vgKHgfjz526bmrkqAq6iVO3bZdftKgzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465179; c=relaxed/simple;
	bh=WzWOK/weu/eua8sM2vFaS4HQZPDtBCH3vWv4YoQlErw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fg4UEz0f7DEi4cwkfWqPehv49VD53rvbvjl31DQdvv5iBUW8iua9cwFWxwkfNShkkKngG0RIZ5nUrnLJN/4tKZiH1CiuwvOheacuiQW7/1if+4nEYVgm8VTslDrDC1SucZWOU5P8EXWDmu63i0+zdgxKXcc/Fwh7Rh+KYWuSthE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELNrbG18; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELNrbG18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772465176; x=1804001176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WzWOK/weu/eua8sM2vFaS4HQZPDtBCH3vWv4YoQlErw=;
  b=ELNrbG18+SjcVWrd7Wg3wdNOu6hQDwrhJ8nFuTyNuJ8tCcBZQIt/B0/N
   Q1XcEDOyWjy1Yvu/u17NhNSE4k+ahI0sJK40N7YpRKP2tqloATs9I0UeW
   x64+edbGQFLPnvocRZu4jsmCUclRK2Kv6UPr8I50+GoHO0Rc7X5nRXwnm
   ArvaM1cLnlb2R+szM5VplJ3n4BumjsK0GTvp/mn0e4Rrz10h8o/5cTzlM
   yGDq6+6j4bPW8r3Bw/gmcEnVIwQ5mB1e+fTWEkdSrOVG+6exnoBEDu5r/
   /kHAqI4vj8caaD4KQlIqRNJbSCqErFJVEi27yndpd+eKit6WwppEy30cM
   g==;
X-CSE-ConnectionGUID: c5YUEmeoTca+YraNRAL6Jw==
X-CSE-MsgGUID: DHRwYYuhQdGfyPk/Ss141Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73660167"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73660167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:26:16 -0800
X-CSE-ConnectionGUID: FknM8oHgTpeOXx//eIUwAQ==
X-CSE-MsgGUID: Z8sn/fjkSUeb9NrwbUp0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="222187198"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2026 07:26:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1000798; Mon, 02 Mar 2026 16:26:13 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Mon,  2 Mar 2026 16:26:05 +0100
Message-ID: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: added tag (Peng), rebased on top of latest ASoC tree

 sound/arm/pxa2xx-ac97-lib.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 1e114dbcf93c..47889f6003c1 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -330,13 +330,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset", GPIOD_OUT_HIGH);
 		ret = PTR_ERR(rst_gpio);
-		if (ret == -ENOENT)
-			reset_gpio = -1;
-		else if (ret)
+		if (ret)
 			return ret;
-		reset_gpio = desc_to_gpio(rst_gpio);
+
+		reset_gpio = rst_gpio ? desc_to_gpio(rst_gpio) : -1;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
-- 
2.50.1

