Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B7715575F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145147; cv=none; b=SEU+zvKjsOHreoRKHrnbc/+pTE3pO/1THk8yDAztMc83OZIJ4Y6OhdIL/5S3oG8OGN0j7B/VPsh8Os1Awo9zDoG/YDUh77fUzc0F2QP/xh9JWg8Ysq26uwTlypKw5dMOZkCVzo116R5yoRH0WzXQn2pmAQRwp+7NWDnwN7mbKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145147; c=relaxed/simple;
	bh=CUJ4gpeghgaNO6EMTLDMvbsqTzdQHrL2AHabosbSSp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gj9B7bew93K/u1nAZJIbn7ssDZK4FfnK+I4VAzbkk0NW67b1kCIunBACi1Hzunpy5DVNf4a2uX38oRA3I3pBko4k/IwGGeuCdFdjxZf3Q9BZk9JiJ1aIFmlHmhCN6ZE6yu0UFvP38BFMRXNSC5gAyjrpHCtG6H7eSHy+9xLN7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBVrd+Wl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBVrd+Wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145146; x=1745681146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CUJ4gpeghgaNO6EMTLDMvbsqTzdQHrL2AHabosbSSp0=;
  b=oBVrd+WlJ7L66ywl0avsWm4ruM12s0QfWktLvkFOyWZCHHaTRCL0PPdn
   IXdKTu3Vs9l1bo2zRdsHDoTC2EqZES4WPgUQZH2qP54fcnGC32/FYstP3
   lFNnYAyuhxM0sC0erNKcgzevOxV+JElrmufIOYcpJgXtIfP2aLwVRFvm5
   UqYq36emifCuG7A+BUeEdg44iCNqlVzfsfDoP+PYobqacJfpwDptv3CAZ
   r3HlnPTbPoEdF9jxbm0ElENJHFdSKjoA6ICgFad/k9jjsC+yN+XzdgDfF
   83121D8iQUAa9vlQsYJFzeEnvTclj0QPsxb+yYBXnbLAYuCtYwCloJtMu
   Q==;
X-CSE-ConnectionGUID: aaNokkf3TmKDDDf+hLfeww==
X-CSE-MsgGUID: /uyPGmdIT2W5d68oD/r/Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291320"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:46 -0700
X-CSE-ConnectionGUID: gZJC2Xo6QsW5UicGAROPRw==
X-CSE-MsgGUID: f9JYsEwKQ8Gz/tj+xf4Jsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259575"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/23] ASoC: Intel: sof_da7219: add glk_da7219_def for glk boards
Date: Fri, 26 Apr 2024 10:25:17 -0500
Message-Id: <20240426152529.38345-12-pierre-louis.bossart@linux.intel.com>
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

Add the board config glk_da7219_def to da7219 machine driver for all
glk boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index ecb1d4b25ea6..cc5e99b21456 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -19,9 +19,10 @@
 #include "sof_maxim_common.h"
 
 /* Driver-specific board quirks: from bit 0 to 7 */
-#define SOF_DA7219_CML_BOARD			BIT(0)
-#define SOF_DA7219_JSL_BOARD			BIT(1)
-#define SOF_DA7219_MCLK_EN			BIT(2)
+#define SOF_DA7219_GLK_BOARD			BIT(0)
+#define SOF_DA7219_CML_BOARD			BIT(1)
+#define SOF_DA7219_JSL_BOARD			BIT(2)
+#define SOF_DA7219_MCLK_EN			BIT(3)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -296,6 +297,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define GLK_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 #define CML_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
 					SOF_LINK_CODEC,      \
 					SOF_LINK_DMIC01,     \
@@ -333,7 +342,13 @@ static int audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (board_quirk & SOF_DA7219_CML_BOARD) {
+	if (board_quirk & SOF_DA7219_GLK_BOARD) {
+		/* dmic16k not support */
+		ctx->dmic_be_num = 1;
+
+		/* overwrite the DAI link order for GLK boards */
+		ctx->link_order_overwrite = GLK_LINK_ORDER;
+	} else if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
 
@@ -427,6 +442,12 @@ static int audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
+	{
+		.name = "glk_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_GLK_BOARD |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "cml_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_CML_BOARD |
-- 
2.40.1

