Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64515A49E
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145155; cv=none; b=Yt5/lZEkaY4fXI+49Y6uTDyVO8Zva/w9P/rc9QiWu7dp13vhHB777vVW9keEDDxJluDUuOUy5QDCKwFQ+R6D6mG0EVsaLiCpC4XgWx6V3FJswQbnLumL06AmwBbaK1Rs8XUWd6j/+A/euLFcJ9fL+Wa88dFX1rnvWdp/o9SQch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145155; c=relaxed/simple;
	bh=zYIR1CwCqTkT5fLAkl+YxT+RCYwjH04aAtHQ3/Vmp4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H2XMSqNRVpsqLWPMms67OVtRLQvYDDH8Khr7L/+pbVS2uljLa6ydUGwbMunkZXLzgxsT0BiZgZl/ZcPaxv+LKcAgzVTDXbe3VFwBpmioJLz8B1ZS/ZJtfLDZwwR1E91HRWk+bHxazjq3EV0IBsKfd6tpYSVd/6BpGKajsdJCOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnV3LSp3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnV3LSp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145154; x=1745681154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zYIR1CwCqTkT5fLAkl+YxT+RCYwjH04aAtHQ3/Vmp4w=;
  b=XnV3LSp3lkNwUXetdQvVA10lCpV5UQ4OZs4CRBsjOvfM8qK2XRX+J9yw
   1TV4oR/l9y0LYlhg5ciSrLjlHy0H2zx9YsX8Ct+/V9zqU6i4gn3Dm/jAc
   hrzRuMQEpemLrNfkh/EVu0vyFWmR4j4kVwVqW/T8tZc3Pp9fcPYttTmzX
   aycJAYPYIYZC+U4NHmVBEF0iOnJ3wtHruCFmsNtnVrwUOLO0wkFYEbxFG
   6FqQ++DYDxTa8VEZaXyIW9AYB3Mow1+CfQSbFwMnJTfc3HtfQjiVz3eEG
   Y4uDWNscPCAWD+O4GBrvT8MmtpqaMflUi4Z3woVqpDSbYGnl4TWegz5S4
   w==;
X-CSE-ConnectionGUID: Rg46kXpeSVapsfix4lsz/A==
X-CSE-MsgGUID: d522k22BToC/YSaDYeAAmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291374"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:54 -0700
X-CSE-ConnectionGUID: 6ofE5vUVS8yURfdDkHnEFg==
X-CSE-MsgGUID: Yan3E4FuRLSGJe3nTRbd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259627"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/23] ASoC: Intel: sof-rt5682: support bclk as PLL source on rt5682s
Date: Fri, 26 Apr 2024 10:25:29 -0500
Message-Id: <20240426152529.38345-24-pierre-louis.bossart@linux.intel.com>
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

For rt5682s codec, we could use bclk as PLL source when the frequency
is 3.072MHz but no 2.4MHz. Update the code to select correct pll_id
and clk_id for 3.072MHz bclk.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index c3b026868653..e3a2ec6b4c7c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -355,18 +355,23 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			clk_id = RT5682_SCLK_S_PLL1;
 			break;
 		case CODEC_RT5682S:
-			/*
-			 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
-			 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
-			 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
-			 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
-			 */
-			if (pll_in == 24576000) {
+			/* check plla_table and pllb_table in rt5682s.c */
+			switch (pll_in) {
+			case 3072000:
+			case 24576000:
+				/*
+				 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
+				 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
+				 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
+				 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
+				 */
 				pll_id = RT5682S_PLL1;
 				clk_id = RT5682S_SCLK_S_PLL1;
-			} else {
+				break;
+			default:
 				pll_id = RT5682S_PLL2;
 				clk_id = RT5682S_SCLK_S_PLL2;
+				break;
 			}
 			break;
 		default:
-- 
2.40.1

