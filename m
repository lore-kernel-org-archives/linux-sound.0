Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956E2032D;
	Thu, 29 Jan 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693630; cv=none; b=L3Tn/Nk9FJOZti5+ICeNwLgnXCbZ45qt0wMD9DVr9GhjNEDDXUW+87GKbAIMIU+fcKIEL/h6tORW2GQ2QAd8DebuV88O/mtl6+9p7AXJzciMIzPvBemUjqUZNBh8i4TDZW/XPTfYublmx6kU51QriCsLNeGAeebqt9iEAPWA8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693630; c=relaxed/simple;
	bh=yxfhhn0nRCfHcjiprrgl6wNRy+BkMZll3z6YEBC1fuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHUk7x7cTziun9RUmPSMnvZ5jdAv73U1IP56BmrbGgmCdKdK+d1Wd1M8MF7z5dSbp6CBH8a+6C5syw7aXB2MBuD3baNvmbawMoMfkbq5VzAs2YaQiW1O9vhS8eHPd9XC/RBPYt2iHodhGBHUWzyS9nNouKavVlq+ps7UODYd9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIkEHTDD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIkEHTDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769693628; x=1801229628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yxfhhn0nRCfHcjiprrgl6wNRy+BkMZll3z6YEBC1fuk=;
  b=MIkEHTDDUOTs4UOdYPO7MkqInb3VMhOKnQRfTLEscwd008ueVOZZ8aei
   O6BsSTNKN92i2YiXcUyXbsSF2qCLU6KwEqsWyAAZV/TWnBKyMVYprhVOP
   +LCelKMsBkjj3xyXrSxWIYIvu0OH1YsZ/gwgbmjUnIqImSOxuSmQrwpDU
   OJ/yHymgmoy7QJMLb6EY3vzfmtdvfjSJSelEMIRbu50RnFGJ5jYloPHSg
   YtkKU4MWYwQDNw0i4LwHh+I54nqyB2vrNPbRwr0PDOxpbwYgnGc+8JC+M
   uQ7cNIR3b56tiPmAcUMci0SG6IYU5UcvzvyF2xixriBIgCsMAA9Ua38iL
   A==;
X-CSE-ConnectionGUID: dy2puhJORaiKJ0JmQki2Rg==
X-CSE-MsgGUID: yK/bNEjISUOGQhgLinDmIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81662856"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81662856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:33:47 -0800
X-CSE-ConnectionGUID: xb/TTuU1QXS25X17zPl7eg==
X-CSE-MsgGUID: IcmP50VARzuOurnhpLzJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208183835"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 05:33:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 23B659B; Thu, 29 Jan 2026 14:33:41 +0100 (CET)
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
Subject: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Thu, 29 Jan 2026 14:33:40 +0100
Message-ID: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

