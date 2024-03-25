Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F974439
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404683; cv=none; b=YF9+JtPt2WO96ZBeAlkwtQWNcFo4MfUkLO702zOsvqwd6K3x19T/8HF9FBSlN+dVB3dia3NieMKG56jXqXkyMNt+E0wQeZgVH/6jPnPWWNMvw+nzAzSEICHS+PZDTPhtFLiNhuU/nWsmZ0cubTW/NVdz1wPMFrMcK7AJqlEqBDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404683; c=relaxed/simple;
	bh=PR58LAYdPKGaBBwD+A0mxfsLF6XzjBUfB6Tu8mTI46s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sxTLV06Xd5Rt2a0zrQv2EyMJXVMtdrqWTL5RtS5UKmYlYXK/sjsKX20tBUtVKFlu06EujTTluECa/O518WlF7VAW7xCu3djOQubUT2sEVRqm7Y1ftO+/k4Jnx99t2jIvgUirpxtqgQOrc62Yr3cI1Yvi9+eYSsPfBZFWxyeGjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fH0qgdTz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fH0qgdTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404682; x=1742940682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PR58LAYdPKGaBBwD+A0mxfsLF6XzjBUfB6Tu8mTI46s=;
  b=fH0qgdTzAoXFhVInuk3FYCQ3TlDMdxG5Xzhp/QeZQIJsSn4jXeY6B+eZ
   L1CCp1Eze0oacIqRe1jH2eUGepgQYEw73wEvRtEo3d5AiC644T/pSmLVX
   lyUZ/ysQPb+Unfay3mDxl6g3IAX/jqNOS7IHjx5Ayf+bFk03NH6pbaFUB
   hWxOs/D7jB0JlP7eywj2tNLXBZ1p58G8PmWPYzw3t6E0XkdWlLJWy7RHc
   /mAHDUa75Ngnv6TmRrsOAb58y/IVHDT/RIrK1StzXXj6CzcnV2/7gfnlr
   N7jNhQZ4N15iNwOYG6OR92RwtBlIyebTYZFXDLUgUROHiOiIDOchleh/w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643635"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722121"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/21] ASoC: Intel: sof_cs42l42: use common module for sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:46 -0500
Message-Id: <20240325221059.206042-9-pierre-louis.bossart@linux.intel.com>
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

Use intel_board module to initialize sof_card_private structure.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 72 +++++++---------------------
 1 file changed, 16 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 330d596b2eb6..40ecfeaa1d26 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -22,23 +22,6 @@
 #include "../common/soc-intel-quirks.h"
 #include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
-#include "sof_ssp_common.h"
-
-#define SOF_CS42L42_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
-#define SOF_CS42L42_SSP_CODEC_MASK		(GENMASK(2, 0))
-#define SOF_CS42L42_SSP_AMP_SHIFT		4
-#define SOF_CS42L42_SSP_AMP_MASK		(GENMASK(6, 4))
-#define SOF_CS42L42_SSP_AMP(quirk)	\
-	(((quirk) << SOF_CS42L42_SSP_AMP_SHIFT) & SOF_CS42L42_SSP_AMP_MASK)
-#define SOF_CS42L42_NUM_HDMIDEV_SHIFT		7
-#define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
-#define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
-	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_CS42L42_BT_OFFLOAD_PRESENT		BIT(25)
-#define SOF_CS42L42_SSP_BT_SHIFT		26
-#define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
-#define SOF_CS42L42_SSP_BT(quirk)	\
-	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
 
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
@@ -52,7 +35,7 @@ static struct snd_soc_jack_pin jack_pins[] = {
 };
 
 /* Default: SSP2 */
-static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
+static unsigned long sof_cs42l42_quirk = SOF_SSP_PORT_CODEC(2);
 
 static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -229,48 +212,26 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct sof_card_private *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_cs42l42_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
+
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_cs42l42_quirk);
+	if (!ctx)
+		return -ENOMEM;
 
 	if (soc_intel_is_glk()) {
 		ctx->dmic_be_num = 1;
-		ctx->hdmi_num = 3;
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
-	} else {
-		ctx->dmic_be_num = 2;
-		ctx->hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
-			 SOF_CS42L42_NUM_HDMIDEV_SHIFT;
-		/* default number of HDMI DAI's */
-		if (!ctx->hdmi_num)
-			ctx->hdmi_num = 3;
 	}
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
-
-	/* port number of peripherals attached to ssp interface */
-	ctx->ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
-			SOF_CS42L42_SSP_BT_SHIFT;
-
-	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
-			SOF_CS42L42_SSP_AMP_SHIFT;
-
-	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
-
-	if (sof_cs42l42_quirk & SOF_CS42L42_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_cs42l42, ctx);
 	if (ret)
@@ -293,21 +254,21 @@ static int sof_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "glk_cs4242_mx98357a",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
-					SOF_CS42L42_SSP_AMP(1)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "jsl_cs4242_mx98360a",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-					SOF_CS42L42_SSP_AMP(1)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "adl_mx98360a_cs4242",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-				SOF_CS42L42_SSP_AMP(1) |
-				SOF_CS42L42_NUM_HDMIDEV(4) |
-				SOF_CS42L42_BT_OFFLOAD_PRESENT |
-				SOF_CS42L42_SSP_BT(2)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
 	{ }
 };
@@ -329,4 +290,3 @@ MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

