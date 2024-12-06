Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6C11DE3C5
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471960; cv=none; b=Qo0Egh738Q6vfew+g89wwh2rg24J3om3jHijbhIxlBWF9ZQuMLXl0YovR+pCnm62cWsbztUvXgCKPQTgcWBlgGLI7CDJqybTrL2Pskm+PNpnaZDNWcfgj/wP535zEAq7S5Zyt6HIj8iseTWA+Mhk87t3RfQLvl5bjBeLdUJNJjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471960; c=relaxed/simple;
	bh=m9NHyVEOFo9N/rKLpd0mFTn6tzVKqK4cZrmmf+LBGwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8R0mcm+rtfsn1f0YDqj6u/PuVuH4NWZAW0HTCrGZL9QV59N7nPEWfc6oXZemjTgO2uMnnOeTdD5ARcX2pANuotUhvybpO3RUF7on/phX1NV9edB8G+Q8OPLYjucxH6VeB0H9wXBOEq/Tz8X+qVIMZOFWotScrUvMo3nooPt46s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsxcjUhj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsxcjUhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471959; x=1765007959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m9NHyVEOFo9N/rKLpd0mFTn6tzVKqK4cZrmmf+LBGwk=;
  b=IsxcjUhjcdk4MJjNpHSfJu+teY1nrOfgMPRLQLoDQYj28JZsqmqlF217
   cEhBRktM0Y/sCCFWJj3Gx5fyEl5l+1seMdSefs+Ih5zrrNlKdy1Rpld7X
   CnEwrkMNQw0mlzMzGR5DJVJ1srKO/Hq++ssWhoWZjKZD+G887+rmXmiYE
   GQOPk5/A/UICcWVz3rTG8IZulWaOsDxvby2UKH49OnzVaXwheTkrLtpXr
   986seOi99sZ3wU2QQ/I1WRL3mURfMorx1wpGCLl4k7lEFBiukwLH+LHdg
   eLrqrJzTDybaA/3Pw30a+I4CLn/3VRTdxk6sX6xpa/uqnK9D8h95FEO1v
   g==;
X-CSE-ConnectionGUID: 9keOlNpaRDu35go046LKZw==
X-CSE-MsgGUID: /wJWc62NTXSh5tVVDUF8hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192780"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192780"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:18 -0800
X-CSE-ConnectionGUID: yatpaaO6S92+hIATdeL4rg==
X-CSE-MsgGUID: oqEazSQqTy6Bbm1/uOJ0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144391"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:17 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 03/10] ASoC: Intel: sof_sdw: improve the log of DAI link numbers
Date: Fri,  6 Dec 2024 15:58:56 +0800
Message-ID: <20241206075903.195730-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The log shows the number for different type of DAIs. Add "DAI link
numbers:" to make the log be more explicit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d9fdd17a9650..8b220df8ebc1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1125,7 +1125,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
 
-	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
+	dev_dbg(dev, "DAI link numbers: sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
 		sdw_be_num, ssp_num, dmic_num,
 		intel_ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
-- 
2.43.0

