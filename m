Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3C74E2E
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404686; cv=none; b=Z91qNKO/gMvqlk7tmkJaZIeBhaletT3KdEF2k+f8Bb2Oizogy7QQ3zOxMCozJBukXcUPuiHOBvUVo6OC400C9YGGzpqK8ki39gjeCEOs8tNYHqvYrLySOJpvpF1c9YQ1OJLvDsEU12ViLwiOpy7X0/NP5NiOAZh53YGQ/nJkRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404686; c=relaxed/simple;
	bh=xXYDf5Yx8awx5/zxr4AQ4Z2qqLzUBRKjDHFB9ZaxsUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PJyQpFWbrIXOX17AoBrOywF/SeEdGP6xwwFMFwre36k6xEl3JcnHBqVjdm0lBTBJJBXY80EOROCTmTJaQRGryjlOBrGMscwt8HyxoTXoHf//4ey3v3+M34aBVXT5Asc5Ls3vKsgGqcKSRuwNNwYvHaExKcEUhjXtpAdTJSXFQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEPWCrbl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEPWCrbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404686; x=1742940686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xXYDf5Yx8awx5/zxr4AQ4Z2qqLzUBRKjDHFB9ZaxsUM=;
  b=aEPWCrblEd+QhXmFzzmAHDOdNtsr0kfMoEdXtYFwB5vMxWxrG7vvajUD
   4pH4LGm4buGiOeJCCZr57beqFuygaf8xZJ9YQe5nDTJnMY8za6KBYHwSy
   jUoSfyoONcZXdnxVchUXRlsSJ1Nr3EdS8ZvwI8IgUNVYRVtHPk1rdc3Aa
   dTFNHZF61fiQszz7kT1vytgjxHMNJ12XjFnGr3M4oepjzrPfYVlwN4D97
   1Nh+NPRDhWrnqufI003Uq5s2VAiW6F+YWlTzXSflrhnIuKIPXfaO5WkFd
   jWVoY6aMcmObFkf+acTKsqLIdQPVyd03BJAnbAYaQRH5zdS/sXRjAn4HC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643658"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722145"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/21] ASoC: Intel: sof_da7219: add codec exit function
Date: Mon, 25 Mar 2024 17:10:51 -0500
Message-Id: <20240325221059.206042-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add exit function to headphone codec dai link.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index f0cb1572c6c4..3d9c48107f58 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -167,6 +167,13 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
 static int max98373_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
@@ -245,6 +252,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	ctx->codec_link->codecs = da7219_component;
 	ctx->codec_link->num_codecs = ARRAY_SIZE(da7219_component);
 	ctx->codec_link->init = da7219_codec_init;
+	ctx->codec_link->exit = da7219_codec_exit;
 
 	if (ctx->amp_type == CODEC_NONE)
 		return 0;
-- 
2.40.1

