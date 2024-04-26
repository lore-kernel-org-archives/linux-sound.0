Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6B149C41
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144902; cv=none; b=tjVMltFI+NKPk6+KmlRb1IJn03jo9zd2Q7avjbKUXskQ1sM1G3ySZsmtc/4ZhF2L7Pf74dZe5wunJMZiwVUdNueWrsERds4eKjF3ggmcR0PXUge6pRSDglVry01B3BrPShTWkjjf+r0KdsBB+FIcSy9eOm8svTHEGBa8AhgjcJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144902; c=relaxed/simple;
	bh=mkPPo4cmXEwCG5YJSWVnWIbjUUOV62VUhBtNpvDcliE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ueqV3pPyhvhhZFuCZFJSkXsB3bhi0uhuAWGECbD0Iz81ryvywr/sDHmsblWb3y6v5ZQBNdVFKhDNxhyjS66LNR8k2uEWurCgQP4pWcWXEuPCAHuLHE65j/qEq7qa/hhsnmD6967Mdo1zkyNFHnqC6jrd8lePG+gs6ts2E+IrVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9xSOaEJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9xSOaEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144901; x=1745680901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mkPPo4cmXEwCG5YJSWVnWIbjUUOV62VUhBtNpvDcliE=;
  b=K9xSOaEJ4mrgUPLhZW2ZJN1kxXC9U5TIlh6783XA02LLscGw3JbQsH58
   qaQEGx+AjsbjdZ88yaShSBKH4sKMSfOt1oMJlUPnMMH382tz2Aehbn6c6
   UzEtS7HrQOmKNfeeFhOJEHe/cEtEOz+9ZsyWNrbufetW5v4N0h/7FSuCX
   5vp7QcWfQrY4AdlWFbViFFL0pBGrVDHNra/g+qozuLfmbuPvTO6OLip3a
   tT6v8fAzP7Hu1MqjZeUeaEIT4T0yRT5IV97eSG3P2NPNkoXmHmho7bAkj
   hMmfDurxq1CjHaC3am/Csgx3H+NvrKIGnBAgmi5DhoxquryBf/kidIA4t
   Q==;
X-CSE-ConnectionGUID: pYE4kqxSQ+SlwI00En9w5Q==
X-CSE-MsgGUID: tMHtfxG2RkKVCtYx0cV52g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290593"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:40 -0700
X-CSE-ConnectionGUID: mI/xbSpZSAivebQ/hXRUEg==
X-CSE-MsgGUID: lM7woBPGTi6TglTya21fBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259024"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/12] ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf for the components string
Date: Fri, 26 Apr 2024 10:21:13 -0500
Message-Id: <20240426152123.36284-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Instead of using a global char array, allocate the string with
devm_kasprintf if needed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 208395872d8b..88d91c0280bb 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -92,8 +92,6 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	return ret;
 }
 
-static char hda_soc_components[30];
-
 #define IDISP_DAI_COUNT		3
 #define HDAC_DAI_COUNT		2
 #define DMIC_DAI_COUNT		2
@@ -231,9 +229,11 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 		card->disable_route_checks = true;
 
 	if (mach->mach_params.dmic_num > 0) {
-		snprintf(hda_soc_components, sizeof(hda_soc_components),
-				"cfg-dmics:%d", mach->mach_params.dmic_num);
-		card->components = hda_soc_components;
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "cfg-dmics:%d",
+						  mach->mach_params.dmic_num);
+		if (!card->components)
+			return -ENOMEM;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.40.1

