Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B2322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723032; cv=none; b=SMkUWoHTNUHr5EErYScC2phED9NxZNct6shzpCoa1zYG1K5QCzY/m8L12dvsSoHsRbip8kVo2LUpgllBJeEPuj2rV+zcg7CYw/MWrPFZhSQJjCyMSx5HwWyRcCXT4u2R/FU5Y0WiUOXc8qTQTILoFIJzXcU4PmhjDEuul5oqCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723032; c=relaxed/simple;
	bh=rPUyYzQd/NymgQax8wXqS1QKPsiIRfZ2HDEbpdYfIZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjtnJJxNNZ0k0wJaIRjKNjfrAQJErNx+PpMExXw0ef+482DJSMcBXtW2tgISaciG1upru0RbplNnbo0mBeKam5gqj2zyO3ZVGRApi/bgiUg7YIvz9aJBIIUp0FMyLa7VRMd/sKfvSXOt9wAOdk2lkVzKGBz5RWGrCAGTkMR2/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD0+NAnD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD0+NAnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723030; x=1756259030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rPUyYzQd/NymgQax8wXqS1QKPsiIRfZ2HDEbpdYfIZ8=;
  b=fD0+NAnDn5T4YPz6EJeoAikX78KTbpAIgzzPKv1jt5GibC4lHHA6T2XZ
   zl+2BfQETv9i5vEpzPsrwkXZHXL3FzAMzfM3zJB4sT2bRivcqSBeLKQSv
   hpVio7zay3CItt5V0Qg3PlRM6OUoPRh2IAv9J7h9eZBFMAcXp7xK/UJJ/
   Zn3fDiIze8niWZs86o6TJmFZFsK7GBxpoSEWwE27NvUyCn06PcNRS3d83
   mGhaNAiIm6wstgg3QyR9R+BKMiKxln498vyEc5JeY9JhsDeknDFZNxsaj
   33N+000/kPxHjBTv18HHpyvEORQlA/y5jx1Ys8oVtfTN1VGAyQG9SQ9kM
   g==;
X-CSE-ConnectionGUID: 7ZkSU8hPTdqxLgF9VLe5rw==
X-CSE-MsgGUID: E6/JZtIjSpuY2HeSRNECxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984865"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984865"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:50 -0700
X-CSE-ConnectionGUID: 1e9qJ6c1S4WY9Q8vW7owQg==
X-CSE-MsgGUID: KQdAMlOcQGie/HULl+0LZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427761"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 03/16] ASoC: Intel: boards: always check the result of acpi_dev_get_first_match_dev()
Date: Tue, 27 Aug 2024 09:43:15 +0800
Message-ID: <20240827014329.6542-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The code seems mostly copy-pasted, with some machine drivers
forgetting to test if the 'adev' result is NULL.

Add this check when missing, and use -ENOENT consistently as an error
code.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/alsa-devel/918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain/T/#u
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 4 ++++
 sound/soc/intel/boards/bytcht_da7213.c  | 4 ++++
 sound/soc/intel/boards/bytcht_es8316.c  | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c | 4 ++++
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 ++++
 sound/soc/intel/boards/sof_es8336.c     | 2 +-
 sound/soc/intel/boards/sof_wm8804.c     | 4 ++++
 9 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index df3c2a7b64d2..8c2b4ab764bb 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -255,7 +255,11 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name), "i2c-%s",
 			 acpi_dev_name(adev));
 		byt_cht_cx2072x_dais[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* override platform name, if required */
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 08c598b7e1ee..9178bbe8d995 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -258,7 +258,11 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		dailink[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* override platform name, if required */
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 77b91ea4dc32..3539c9ff0fd2 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -562,7 +562,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		byt_cht_es8316_dais[dai_index].codecs->name = codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index db4a33680d94..4479825c08b5 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1693,7 +1693,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 8514b79f389b..1f54da98aacf 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -926,7 +926,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_dais[dai_index].codecs->name = byt_rt5651_codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 1da9ceee4d59..ac23a8b7cafc 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -582,7 +582,11 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	/* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
 	codec_dev = acpi_get_first_physical_node(adev);
 	acpi_dev_put(adev);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index d68e5bc755de..c6c469d51243 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -479,7 +479,11 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snprintf(drv->codec_name, sizeof(drv->codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = drv->codec_name;
+	}  else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* Use SSP0 on Bay Trail CR devices */
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 2a88efaa6d26..b45d0501f109 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -681,7 +681,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 			dai_links[0].codecs->dai_name = "ES8326 HiFi";
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index b2d02cc92a6a..0a5ce34d7f7b 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -270,7 +270,11 @@ static int sof_wm8804_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name),
 			 "%s%s", "i2c-", acpi_dev_name(adev));
 		dailink[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	snd_soc_card_set_drvdata(card, ctx);
-- 
2.43.0

