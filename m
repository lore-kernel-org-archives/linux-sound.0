Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0FB15380E
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145143; cv=none; b=Y5hukzUAf9trX2O9NBm8/38LzfZqdnY6GIwSC6SzqSxTBmhp5/ukqtUlXc9nnqB08xTh/4KDmLoq6GIuPOhmBeAnE/x8tn8CaEmj/dRhTwEf0ex+jjCr7en/Prz2yDrY31XBNXNkQkeZOR488CEtbS9zf6T9w0LWoPHu5I6lDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145143; c=relaxed/simple;
	bh=8vZbOcgbSIpqXkZfIbzioi6VWXjubE1vsbynf0yIWAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FHrd8y8xlxdGDSyGQv8XPaIoroBrI6DBPyyoOFTzv/hqRSZJwlZ9dnHlx6O5lgzVqNcgbUfOXFcG2/dL0a4EzQwsBltbZ0iGXy2io6lCV9FOSIWzamgVsvth6TLVljgqjpt/uxn91PH+y8q4giyORgbYa7XM5OI3yFs13+mHzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cho9s388; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cho9s388"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145142; x=1745681142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vZbOcgbSIpqXkZfIbzioi6VWXjubE1vsbynf0yIWAo=;
  b=cho9s388wSXd4Pbn7A1KLRdLfj6pcva2IALazOrC7I/u46DnRQqI8dm6
   NSc4u6822WHg3zfOL2tam0R020f7SyrN/jZgU15uI9LtcW7Hrm195T3GS
   pNFRd5dcBW/44a3qNTycBG/CxaV9m4QOWZwHXK9DvIvv6VHrkBHkh/qbU
   x4rlkk9U2cpFIox2r8zkuobP2miIhVvL6rKeQQ0+WtWWKNl5CF5zxzptD
   cxjRqBQLuQ099Eo5G0xNjf3v+f7ADb58GxZxBO23Keg/j/wpNChmTTFkj
   C7MsBPA+/D0uz+y2hs9gE/Qs1DYxr+609Sn6KMEaJKq0vYpSBoClRQ8U+
   w==;
X-CSE-ConnectionGUID: OtQ3nkhOQims3FV7VS0oKA==
X-CSE-MsgGUID: t7CvX+VfTKiDS5CzHM2Vww==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291284"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:41 -0700
X-CSE-ConnectionGUID: yDAw3X00QDKy4pWyFVkfIQ==
X-CSE-MsgGUID: q57wkM1USdSdWhi9I0A1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259542"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/23] ASoC: Intel: sof_da7219: add cml_da7219_def for cml boards
Date: Fri, 26 Apr 2024 10:25:10 -0500
Message-Id: <20240426152529.38345-5-pierre-louis.bossart@linux.intel.com>
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

Add the board config cml_da7219_def to da7219 machine driver for all
cml boards using default SSP port allocation (headphone codec on SSP0,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index de5b0a8b5b8c..69555eee7c7a 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -19,8 +19,9 @@
 #include "sof_maxim_common.h"
 
 /* Driver-specific board quirks: from bit 0 to 7 */
-#define SOF_DA7219_JSL_BOARD			BIT(0)
-#define SOF_DA7219_MCLK_EN			BIT(1)
+#define SOF_DA7219_CML_BOARD			BIT(0)
+#define SOF_DA7219_JSL_BOARD			BIT(1)
+#define SOF_DA7219_MCLK_EN			BIT(2)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -292,6 +293,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define CML_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_DMIC16K,    \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 #define JSL_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
 					SOF_LINK_CODEC,      \
 					SOF_LINK_DMIC01,     \
@@ -320,7 +329,10 @@ static int audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (board_quirk & SOF_DA7219_JSL_BOARD) {
+	if (board_quirk & SOF_DA7219_CML_BOARD) {
+		/* overwrite the DAI link order for CML boards */
+		ctx->link_order_overwrite = CML_LINK_ORDER;
+	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		ctx->da7219.is_jsl_board = true;
 
 		/* overwrite the DAI link order for JSL boards */
@@ -380,6 +392,12 @@ static int audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
+	{
+		.name = "cml_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_CML_BOARD |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "jsl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
-- 
2.40.1

