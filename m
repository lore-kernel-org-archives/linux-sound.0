Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBC6FB0
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272473; cv=none; b=HNp/Z0zWYOuCw1eczXKcsqs2twJO7Tf26YoAaFa6N6Iu3e1AuB4bo2GWahCofjdfSMuxa0oAU6Vq69UXH/UFAu48TtIpwfjguHetZMQqNS0FylRrqibN94YEJI1YUM6m9ezsE+TtptvLW+knGCDtl/p5vyN0HuXmAanxw3mMWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272473; c=relaxed/simple;
	bh=pLIxy8IWSqSn67k2V4Oc3GgyAB0vlj0rr4NhmT8Wuxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mroOg+RgfcWfVxQ63mRy4HL9pPjL516grKgzC98rmhln0VYj+OZEwOdD9RtYi6mDp3Ibu9ppGerqYRKSQaVccJWZjuzvdE7uO+1oClMQhpe8y3Fh3gv8+a66W8hhfXNGZN99yVawXx+Jn2cAwZavftfgNINuLE6+9TurpCkVFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SM6mIVcf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM6mIVcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272472; x=1746808472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pLIxy8IWSqSn67k2V4Oc3GgyAB0vlj0rr4NhmT8Wuxg=;
  b=SM6mIVcfjyz3LXoBIyTlqjRPu39zbrMcl4lHOUjngKAfJEDVdGHNyWV3
   9IFBoq0gGx5N1q8YCM3WatZjEs6EaBPJyyaeaK3ho+E9gKLozK4sBkA18
   39d5BBf3BkdRo/XYFLt0ulb7OhjJj5rQSOqqbOf/qOMea3WbyiXfV8j4y
   KOtOrqXwe0f0bfeo2lNME9e3Wr77J701KpbFwJPch8VuJm3Z0yGc+RHxe
   vbend1H3nKAgpvuA5qVI7ukE29xLIrHyRrjLSPMc2EAX1fCumQAoC/v4+
   EUniJoAPFRh+h804GfGIGxY6G2A/mEINxWR5lqnw0oGZAoTGTeq41/0eo
   w==;
X-CSE-ConnectionGUID: BT9H5cGBRRKpIn2Lt7gK5w==
X-CSE-MsgGUID: YOkeIH4RSW6BDzzBLwxy5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017571"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:30 -0700
X-CSE-ConnectionGUID: JiEly/mhS1OcYkPsZBXJFQ==
X-CSE-MsgGUID: Qn0biBK5T+GReGgpoDmtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761024"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/18] ASoC: Intel: sof_nau8825: use max_98373_dai_link function
Date: Thu,  9 May 2024 11:34:09 -0500
Message-Id: <20240509163418.67746-10-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_nau8825.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index dd4dc4ec4255..c08b4eef0bcb 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -213,10 +213,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98360a_dai_link(ctx->amp_link);
 		break;
 	case CODEC_MAX98373:
-		ctx->amp_link->codecs = max_98373_components;
-		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
-		ctx->amp_link->init = max_98373_spk_codec_init;
-		ctx->amp_link->ops = &max_98373_ops;
+		max_98373_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_NAU8318:
 		nau8318_set_dai_link(ctx->amp_link);
-- 
2.40.1

