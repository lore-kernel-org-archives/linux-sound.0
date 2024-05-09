Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A11A2C0A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272474; cv=none; b=eFmKAVLBSmzAjfgLldBLNZVSmD0dthLxdS5rxLKcEcS+E7r27zbpHqR7fff7LEmFyqdG2es5fenmiXIwOJOT2X8Qwy2Z83Rezrso4xNdB0jQNq9yR1WMKmF0IB9Wk1YPLw3RUvkpAf7Pu/WP9PDQZOfIgYAzTNRx47Xh6bJakRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272474; c=relaxed/simple;
	bh=9BGjR6mSCozIHEiQeWRFjvpsgcKmMfBOW4mFQ/mtoe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XKGCTqRWExHyW8SKb0DRM82RgvUS5bvn8MNMGiD9/HZ9Z7pD3qjWAM5SR87Wo81gOQ2k1wtCT/4x9honU3Q4vDZwawFErH3aUMgQQWf2mBh6hcowdPXdXz2NyZG1wgBLhMJxfSNS6sL9tgCRJM4Vua2gyfGldktusRrVxQ2jaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBjcBZsI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBjcBZsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272473; x=1746808473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9BGjR6mSCozIHEiQeWRFjvpsgcKmMfBOW4mFQ/mtoe4=;
  b=iBjcBZsI5W18rEX1llC0NKkk9hiSUYR5NL1Axb0rRUe+SxKpaIAF4arg
   ygcfBC3yHVl4v9N3BHF8jro9PrPWGGRsSuT7kMmFuwrvLAAMok7GyyHwB
   pKjEkGM4vDWpV+dZUVOJwmi4Sgm53TsNCipTRlhM/LXmkaMJb+sZdrPDd
   mtCwNceIg4iPM4xTWjZ5YcKq4LYJgIIbivi7lA3DcbbGhkOhgMnQF5Zd+
   6Ism1JeqT7UTMJE+6691IemWYVpwi9zKyiHXspFIlmQutxWgN5jFenYNI
   oJwpWvQH4Qnk55MpiI4Qh1DLVHoSiVCZOI5xVd/VjEtl08h4AjBrm8t7w
   w==;
X-CSE-ConnectionGUID: jF28/BzES7Ki3XD8D+1sUw==
X-CSE-MsgGUID: R20UHwwxRoatgA+AJ0sQ5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017577"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017577"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:31 -0700
X-CSE-ConnectionGUID: /uBmyZ/zRC+gq+0QVJrJyQ==
X-CSE-MsgGUID: E+vMIiFFRyyi0iHKXxb4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761027"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/18] ASoC: Intel: sof_rt5682: use max_98373_dai_link function
Date: Thu,  9 May 2024 11:34:10 -0500
Message-Id: <20240509163418.67746-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Use max_98373_dai_link() function to initialize dai link of maxim
max98373 speaker amplifier. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 3dc373855a58..6fc6eb0c5172 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -591,10 +591,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98360a_dai_link(ctx->amp_link);
 		break;
 	case CODEC_MAX98373:
-		ctx->amp_link->codecs = max_98373_components;
-		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
-		ctx->amp_link->init = max_98373_spk_codec_init;
-		ctx->amp_link->ops = &max_98373_ops;
+		max_98373_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_MAX98390:
 		max_98390_dai_link(dev, ctx->amp_link);
-- 
2.40.1

