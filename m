Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6E156885
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145153; cv=none; b=BiYmdVepECXb7CuShQ/gXyfkj/y7Qb4l0TBjcOaqwMz+WjZiED/0Lc17YxwoZ9OEKCeyXLQmZxNJk1/dDdRC4a1s8ZGTnqGUbv72BVpAlymtcBXrL5BGIrIA9K2egO0rZ7X2U0LYVbxCwSfvN3NH5YqV/f8pxqYr/sRVhLGYX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145153; c=relaxed/simple;
	bh=W9iY+W8Ir/bYUCAzgNoBK3HNcIWzj09vrJHQqaOdzIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CjzFe0iWn9Cn/jyGGqf6YqgynxS6wW6K+nDlvaX0VZPiK0m1qEwELgicdeZBZ3sLmt/8Rt5qubr/ptOznl8uIzojo30pHYDV0kf6zDUl3ZSsATX7+21tybBI145DkFZzZE+zGIIgr+77v9gscJbziI5o6gw1jYSqfu/5sY/E1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYMQalfP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYMQalfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145153; x=1745681153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9iY+W8Ir/bYUCAzgNoBK3HNcIWzj09vrJHQqaOdzIQ=;
  b=ZYMQalfPNWqH4hAah8YPgaZlqxUXfUYqrT0/qYyMQUJc1qReYTJeLTZ6
   AC/3IJuBv4nGBcmAO1SSii3i+43leXrNvZE9TBHUKjDd/9n4Nghln2RzK
   kDtk5DF0+w8oQcdw8AlcWGSMm9kNp1qE5jxfJDeBJcwWZPa/AWMqqh4BU
   eSiFFK7qVGhl2vUTiwSO3imyjRwJ4e+jpqwzoVaUIl+bNYIOyjRM3Oc2g
   3xKLu04i1sSwFSpihWWmG9xRIWn3+5Edqf8lTxU1WXYoDoxL4RC91H3U8
   bMnOSaPRLCLFpVEdDxyMrqjweExL9g1wsn3x8uoi39E7zGl8JLJUGMmvm
   Q==;
X-CSE-ConnectionGUID: WLKSdqhBTvm6G2DbZ9aVeA==
X-CSE-MsgGUID: Lg7BVnAsTZ228HXbCALUJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291363"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:52 -0700
X-CSE-ConnectionGUID: obhoe3E6TOyfxx7y42g2zw==
X-CSE-MsgGUID: Ip9g5DBrTquF2CcsSodhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259613"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/23] ASoC: Intel: sof-rt5682: setup pll_id only when needed
Date: Fri, 26 Apr 2024 10:25:27 -0500
Message-Id: <20240426152529.38345-22-pierre-louis.bossart@linux.intel.com>
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

The variable 'pll_id' is needed only when we use snd_soc_dai_set_pll()
to setup PLL. Move the code segment to improve some readability.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 58 ++++++++++++++---------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 668b1672f570..6a79dd5271cc 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -320,35 +320,6 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		pll_in = params_rate(params) * 50;
 	}
 
-	switch (ctx->codec_type) {
-	case CODEC_RT5650:
-		pll_id = 0; /* not used in codec driver */
-		clk_id = RT5645_SCLK_S_PLL1;
-		break;
-	case CODEC_RT5682:
-		pll_id = RT5682_PLL1;
-		clk_id = RT5682_SCLK_S_PLL1;
-		break;
-	case CODEC_RT5682S:
-		/*
-		 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
-		 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
-		 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
-		 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
-		 */
-		if (pll_in == 24576000) {
-			pll_id = RT5682S_PLL1;
-			clk_id = RT5682S_SCLK_S_PLL1;
-		} else {
-			pll_id = RT5682S_PLL2;
-			clk_id = RT5682S_SCLK_S_PLL2;
-		}
-		break;
-	default:
-		dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
-		return -EINVAL;
-	}
-
 	pll_out = params_rate(params) * 512;
 
 	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
@@ -369,6 +340,35 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	} else {
+		switch (ctx->codec_type) {
+		case CODEC_RT5650:
+			pll_id = 0; /* not used in codec driver */
+			clk_id = RT5645_SCLK_S_PLL1;
+			break;
+		case CODEC_RT5682:
+			pll_id = RT5682_PLL1;
+			clk_id = RT5682_SCLK_S_PLL1;
+			break;
+		case CODEC_RT5682S:
+			/*
+			 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
+			 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
+			 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
+			 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
+			 */
+			if (pll_in == 24576000) {
+				pll_id = RT5682S_PLL1;
+				clk_id = RT5682S_SCLK_S_PLL1;
+			} else {
+				pll_id = RT5682S_PLL2;
+				clk_id = RT5682S_SCLK_S_PLL2;
+			}
+			break;
+		default:
+			dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
+			return -EINVAL;
+		}
+
 		/* Configure pll for codec */
 		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
 					  pll_out);
-- 
2.40.1

