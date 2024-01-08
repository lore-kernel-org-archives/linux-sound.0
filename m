Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BE125D3
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leOmFsyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704707271; x=1736243271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v+lU7y/GHxDy7u5aGdfAwSXsxfk0Wa4YgFtQFvWE19o=;
  b=leOmFsyB+KU3zpn6ZjRKCXBDtyKVBtX/KOZ4G9yI+hTruG5cY/z01XKK
   PDzMFuVRF0CP57Q8YqYBGfM6S6p3u664/f3VgSjV96KKno1Ahkh/6HSJn
   KPRGo2V/DZdFkfaH3IoyFjWIfQ+PqiROIpQ20Fu8CVMZ9q9L4r6QJ+m9O
   FnIqzMglESl7b+P8L6QhH0AjNDi6dRwKzjZxhOBfujFu38TSmF33bWTGF
   zCrv3Sz6Iw9hEho5u6NrDb7Df2dnXxFg4NVGsdjzMKx8jCUzucXNuhOVH
   oDbvIPOI+nIRHtujMtbRHapPOY7771uM7GKK+mxneSa1rWesLb4d7O3CY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5208158"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="5208158"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="23113010"
Received: from scivlik-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.36.203])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: Intel: bxt_da7219_max98357a: Fix kernel ops due to COMP_DUMMY change
Date: Mon,  8 Jan 2024 11:48:41 +0200
Message-ID: <20240108094842.28782-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
References: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change to avoid dummy components will leave the component name and
dai_name NULL which will cause NULL dereference when trying to access to
it in the machine driver when applying fixups.

Link: https://github.com/thesofproject/linux/pull/4759#issuecomment-1878641868
Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 816fad8c1ff0..540f7a29310a 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -797,6 +797,9 @@ static int broxton_audio_probe(struct platform_device *pdev)
 		broxton_audio_card.name = "glkda7219max";
 		/* Fixup the SSP entries for geminilake */
 		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
+			if (!broxton_dais[i].codecs->dai_name)
+				continue;
+
 			/* MAXIM_CODEC is connected to SSP1. */
 			if (!strcmp(broxton_dais[i].codecs->dai_name,
 				    BXT_MAXIM_CODEC_DAI)) {
@@ -822,6 +825,9 @@ static int broxton_audio_probe(struct platform_device *pdev)
 			broxton_audio_card.name = "cmlda7219max";
 
 		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
+			if (!broxton_dais[i].codecs->dai_name)
+				continue;
+
 			/* MAXIM_CODEC is connected to SSP1. */
 			if (!strcmp(broxton_dais[i].codecs->dai_name,
 					BXT_MAXIM_CODEC_DAI)) {
-- 
2.43.0

