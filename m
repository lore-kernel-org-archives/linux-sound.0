Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178973D6673
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301430; cv=none; b=Ts9QB8uNnPraqM6YTh/3ZoZVEuye4h8mfEu7Oubv9HU2gAa00bCRHnbkYcolLTupLFNJ9ToIX1GGkKd3FycCollnVNEiKb/NURKNz50RWMb2ojAPU+JzytVFRYHC9MKuuMVZvspbZFGo2VH8x0lfFD6voXUnLSe5zwokWnvYLn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301430; c=relaxed/simple;
	bh=hx6CDD6lckc6noGNCHtnF/bVe/IQOKztf4+JjKP4HJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NHZ/JDOzwF/5Z2dtIKcA5Ir6ufexxKTGMBVdw8ywUikn1qrJZV3LxoWTL0V4XbEhuDwaRKayGa+Gl77kmhd7fWqOJ87nxiSPFOTvZVirFDjQlWw0VHpSutN0ijr3LISYgGAZhNWvDH8X2gPn+QKNAei1dEgQyJWZfRlJpgHjl/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfJ0H0UA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfJ0H0UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777301425; x=1808837425;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hx6CDD6lckc6noGNCHtnF/bVe/IQOKztf4+JjKP4HJk=;
  b=KfJ0H0UAZgfiBNbByWmqrYHbVJcupYguaA1R5h+Tmaq7EiyxqhE3KN5c
   vPS62m74WU0z0NVt4UHU1GXPVtaXolQGs+L+W581cXo57QqAKhuK5VwmL
   dZrSUZNyJaZTYXLb/cqpWU8O9IpwBw7vUJYu14dQ61cAYhqWF2xOvQAkP
   mpaOaO4cOKryyzA8N7wx1UH74sc6bGX3hvRomQ+k3JSZQeVCSuHGYUGvt
   BUWtDshTbV6kFHuXFV4BJ6Y5SWbN8pt4TB2WL0iRFpF7g3osU73QY8mT/
   /UU7wRjxoLXMyTntFNZj8aY+n0e/WvZxGZehbGsywm5ZWHEbk2WA1tvBg
   g==;
X-CSE-ConnectionGUID: h1p+kvzbSjKGSEF7nTmyKg==
X-CSE-MsgGUID: Dp19yjRuT2O/yVBN3/uykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78109151"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78109151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:50:21 -0700
X-CSE-ConnectionGUID: U8vRv1PETqaJWktuKpvECg==
X-CSE-MsgGUID: eU5bMmzfRWmVGD33J+I11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="271794364"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 07:50:20 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	cezary.rojewski@intel.com,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] ASoC: Intel: cht_bsw_rt5672: Simplify probe() with local 'dev' pointer
Date: Mon, 27 Apr 2026 10:46:19 -0400
Message-Id: <20260427144619.1739971-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In snd_cht_mc_probe(), &pdev->dev is dereferenced repeatedly throughout
the function. Introduce a local dev pointer
early in the function and use it consistently in place of all open-coded
&pdev->dev references.

It reduces repetition, improves readability, and aligns with the common
kernel driver pattern of caching the device pointer at function entry.

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..0c6a3b6829a7 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -450,12 +450,13 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	struct cht_mc_private *drv;
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	const char *platform_name;
+	struct device *dev = &pdev->dev;
 	struct acpi_device *adev;
 	bool sof_parent;
 	int dai_index = 0;
 	int i;
 
-	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
 		return -ENOMEM;
 
@@ -477,7 +478,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = drv->codec_name;
 	}  else {
-		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
 		return -ENOENT;
 	}
 
@@ -490,7 +491,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	}
 
 	/* override platform name, if required */
-	snd_soc_card_cht.dev = &pdev->dev;
+	snd_soc_card_cht.dev = dev;
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht,
@@ -500,16 +501,16 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 
 	snd_soc_card_cht.components = rt5670_components();
 
-	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+	drv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
 	if (IS_ERR(drv->mclk)) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
 			PTR_ERR(drv->mclk));
 		return PTR_ERR(drv->mclk);
 	}
 	snd_soc_card_set_drvdata(&snd_soc_card_cht, drv);
 
-	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+	sof_parent = snd_soc_acpi_sof_parent(dev);
 
 	/* set card and driver name */
 	if (sof_parent) {
@@ -525,9 +526,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		pdev->dev.driver->pm = &snd_soc_pm_ops;
 
 	/* register the soc card */
-	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
+	ret_val = devm_snd_soc_register_card(dev, &snd_soc_card_cht);
 	if (ret_val) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"snd_soc_register_card failed %d\n", ret_val);
 		return ret_val;
 	}
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Dornacher Strasse 1, 85622 Feldkirchen, Germany
Tel: +49 89 991 430, www.intel.de
Managing Directors: Harry Demas, Jeffrey Schneiderman, Yin Chong Sorrell
Chairperson of the Supervisory Board: Nicole Lau
Registered Seat: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

