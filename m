Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF3E148FE2
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145149; cv=none; b=jYz5oru6lhybSlZZc+2awQyA9HAHIbq62KHntc0aXBM2u78hhhCtPMWxYKalLzrql72NnUaycNv0uBLe437niM/+9UyCoODbHTMt5RL9AzqegQGJRvxXEMS0F83zozSbkoPdLWcnY9E+DLlaE/IEZfYtTakBJfKBDL2p6iMhAwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145149; c=relaxed/simple;
	bh=0lJ6K+KsQ4YP7eBhNs9PYkoJzLuliipAbc+xTk5UWBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GrWcrSAEWtqX2s5oH7Nrog821TChEbtUmNz/Ypkz54kWYywLVc9r9c35b4HU9eGsxeAmLgjwn4twWHnbx/uRDHcL6ruJK6oDH2j45R1w1AC1/hcEKN8JfeHIRDDafplQ2WaX8beBBxye5WtJjBLO7u0uRdeYfIW8uSlP4//H+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhgayB08; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhgayB08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145149; x=1745681149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0lJ6K+KsQ4YP7eBhNs9PYkoJzLuliipAbc+xTk5UWBQ=;
  b=GhgayB08VC+l46u3EmLsLpO4YTel+aGCcVnbIFSlEH5v/0KsfptSOgOP
   MOpwYWlyy0ax1Ohturyq1zdwcwQzDDekjgTQUCR2WFnYi5uawa1GOWGiW
   ej0EWZqJCyqCrHs7b9pJQn302G70Tr9jOSowk2cSyu/fJjKX9tdvcDA9l
   uooIBgOrl3qBubo46/gj/gMDWl5Fgh4vuG1aqmBVgPRzLM6ghodbP3FTw
   8a2J568X0jaiFU/uLxjX82b9EZvlDEUKJtTwn8MfId2/Gmn1/9s6LBT5w
   2q7R3HJ4oCJGT+GjQP6DpZ7BxHvOHU3/4Apk3h3zLojeXLdi+91EOliuc
   Q==;
X-CSE-ConnectionGUID: gPraPwXHR0S3Cwoqoc0+/w==
X-CSE-MsgGUID: z/+I6mKzSu6zSR27fePuvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291338"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:48 -0700
X-CSE-ConnectionGUID: nvC1Jzk0TsWGrkheGdkyfQ==
X-CSE-MsgGUID: TiKvQZ5CSwOS/oROQRgHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259590"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/23] ASoC: Intel: sof_rt5682: support MAX98357A on glk boards
Date: Fri, 26 Apr 2024 10:25:21 -0500
Message-Id: <20240426152529.38345-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

For glk boards, MAX98357A speaker amplifier is supported by machine
driver glk_rt5682_mx98357a with sound card name glkrt5682max. Use same
name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 80ecf31c936a..efca7604040e 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -698,6 +698,20 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "glkrt5682max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			sof_audio_card_rt5682.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (soc_intel_is_cml()) {
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
-- 
2.40.1

