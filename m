Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F524EF8E
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029657; cv=none; b=l49RR7wcTWQNwDWHNu4fQdgy6W/zXukULKpyIf9o32YYa/DiR2hlGndv+W+NwCdfLA3T9qbrAM3NR6kPrdpMoceRF+VNtjjgaTIiy1tPVd7jG4HhQ2Z1X6E+QS71/A17OU8bmVx1tU3tMWNKq7KLViOrL53Vt8r5GB0KF0PYjYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029657; c=relaxed/simple;
	bh=6LIwP+fxd6Gf1mJnkhk5fDt5d6mmIPHuBXrlt2o2nts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeYEVmnoTkcpHl/IfSXRmGOF7Geb394k/8ljNFlTSPWRzCmpj2TPoKcIlrsQyDcmXlD1MIuYgsNPN8TbODreq5djO3PcJDjso7f790VsN7rNuRPu9fv4CILUy/oa676cuSRF7PoPC/cqe00E5O08JohAJeU8ZH7Ef8jK2FSSEeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsbWqCUo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsbWqCUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029656; x=1775565656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6LIwP+fxd6Gf1mJnkhk5fDt5d6mmIPHuBXrlt2o2nts=;
  b=HsbWqCUo2NobFxghm/WMTYDD2NAUNvv1vZ1HetOpFxsfkcgPFz0pEZKk
   DJkUQLr4+ajrrb+zkTWRS+73nm6YxmWx4BLloLf9DrUIlMeuz1yiEfANk
   4aMHsnrPZ8p99mSArgWHcmEdxg1yEjE+m79m1SfHuddCQPuy49MbSXc/N
   AV53lxMlRJGSbOyJLiGFqGobzz5Cj68jxTcQy/vNbR9HnEYuZfRXbX3N1
   Mz5cX7mgFDpNBa96MkR1Bc5HgJ3wh/bkxaSkiW64fpc+4apgQjsGTYJ5j
   EsQZPT711Gz61DhUTap4E/PFOCqcgqZ3tUXMScdeKUvUjy9yZ/DyXs9UH
   g==;
X-CSE-ConnectionGUID: FABlPoWtQO2eVJjLRAp6+w==
X-CSE-MsgGUID: kwjN7n7QTKGvLA35QfUvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779007"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:55 -0700
X-CSE-ConnectionGUID: S6ftx6KgQ32VDzAUyyb9xg==
X-CSE-MsgGUID: PxgxnkVWTimhzH2rzHIkLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134102"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:53 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/20] ASoC: Intel: avs: boards: Change sspX-loopback card name
Date: Mon,  7 Apr 2025 14:41:41 +0200
Message-Id: <20250407124154.1713039-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "sspX-loopback" to "AVS I2S TEST-X".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 4556f105c793e..8b6168ba87f41 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -56,6 +56,7 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -63,6 +64,7 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	if (!avs_mach_singular_ssp(mach)) {
 		dev_err(dev, "Invalid SSP configuration\n");
@@ -80,8 +82,15 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "-loopback", ssp_port, tdm_slot));
+	if (pdata->obsolete_card_names) {
+		card->name = devm_kasprintf(dev, GFP_KERNEL,
+					    AVS_STRING_FMT("ssp", "-loopback", ssp_port, tdm_slot));
+	} else {
+		card->driver_name = "avs_i2s_test";
+		card->long_name = card->name = devm_kasprintf(dev, GFP_KERNEL,
+							      AVS_STRING_FMT("AVS I2S TEST-", "",
+									     ssp_port, tdm_slot));
+	}
 	if (!card->name)
 		return -ENOMEM;
 
-- 
2.34.1

