Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392B757F4
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404685; cv=none; b=HfyvEYvQtWpsSFTjPpUTYTc/m3mq2EspfLn2YMl9rme5CvJQEcRPph+JpJXw/1V0iutxVQ/h7Viun2DxOS125y655fnaSxvI3Esu/tPdt9LPOvYhn75HvVRFYIfH22mKktHzIERy8hQyySgnJPeMB5XyIqggHtnao7eMzyIc4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404685; c=relaxed/simple;
	bh=/AbZr3luctDlVjBzrahchdMNCBFkU+915f9nJbC0iBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fbqHeaECoQ4GvJ0X1mY1sIbcp9sYcnNoQSHl5PpjsAcP/8dvTLMrgrSossaOJ2NcIDYYHHcCPFOGk0mUiegk5ZNrubmODt7wP6Ljop1VRFs5dMKyvpcDgpggP9zBLRx3KzfheL+30B7+LNgB//3qFLHliasV5Be2fWyirILbSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfxeLIgV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfxeLIgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404684; x=1742940684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/AbZr3luctDlVjBzrahchdMNCBFkU+915f9nJbC0iBQ=;
  b=MfxeLIgVZc8RrxooLHudBHPBBq/y7EgWHFBaj4+yqxfsAv6cSY9iECZd
   oNVKwEzTj38SxbM2akn061vPlKb1YzHPjyf49HiH82u3L3fSne+fWd8PV
   iYIytQbcRm5igY28FK3ssK2rvpkM+CZpHeoTv/FqfOW1fVhCuxM3ETFx1
   JpndsU3yTr0nBkoHHwrMIM7WCiDkjLqx/79RRBgpUSHf9+jWJgpQC8kb0
   T7JM0tqYx7COo4AMzGiXG6jb3PPmzN0ciuV/B7sjT0dnvrworT/O8g0QX
   sO/G7xIPPbPXngF69+4F+fdUfP5N46B2CPEcxNh0lgOZU2LZVhknfacez
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643649"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722135"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/21] ASoC: Intel: sof_ssp_amp: use common module for sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:49 -0500
Message-Id: <20240325221059.206042-12-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 91 ++++++++--------------------
 1 file changed, 25 insertions(+), 66 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 0b8adab76755..b99af8bc4ccc 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -20,34 +20,12 @@
 #include "sof_board_helpers.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
-#include "sof_ssp_common.h"
 
-/* SSP port ID for speaker amplifier */
-#define SOF_AMPLIFIER_SSP(quirk)		((quirk) & GENMASK(3, 0))
-#define SOF_AMPLIFIER_SSP_MASK			(GENMASK(3, 0))
-
-/* HDMI capture*/
-#define SOF_HDMI_CAPTURE_SSP_MASK_SHIFT		4
-#define SOF_HDMI_CAPTURE_SSP_MASK_MASK		(GENMASK(9, 4))
-#define SOF_HDMI_CAPTURE_SSP_MASK(quirk)	\
-	(((quirk) << SOF_HDMI_CAPTURE_SSP_MASK_SHIFT) & SOF_HDMI_CAPTURE_SSP_MASK_MASK)
-
-/* HDMI playback */
-#define SOF_HDMI_PLAYBACK_PRESENT		BIT(13)
-#define SOF_NO_OF_HDMI_PLAYBACK_SHIFT		14
-#define SOF_NO_OF_HDMI_PLAYBACK_MASK		(GENMASK(16, 14))
-#define SOF_NO_OF_HDMI_PLAYBACK(quirk)	\
-	(((quirk) << SOF_NO_OF_HDMI_PLAYBACK_SHIFT) & SOF_NO_OF_HDMI_PLAYBACK_MASK)
-
-/* BT audio offload */
-#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(17)
-#define SOF_BT_OFFLOAD_SSP_SHIFT		18
-#define SOF_BT_OFFLOAD_SSP_MASK			(GENMASK(20, 18))
-#define SOF_BT_OFFLOAD_SSP(quirk)	\
-	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
+/* Driver-specific board quirks: from bit 0 to 7 */
+#define SOF_HDMI_PLAYBACK_PRESENT		BIT(0)
 
 /* Default: SSP2  */
-static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
+static unsigned long sof_ssp_amp_quirk = SOF_SSP_PORT_AMP(2);
 
 static const struct dmi_system_id chromebook_platforms[] = {
 	{
@@ -136,45 +114,27 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct sof_card_private *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_ssp_amp_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+	dev_dbg(&pdev->dev, "sof_ssp_amp_quirk = %lx\n", sof_ssp_amp_quirk);
 
-	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
-		ctx->dmic_be_num = 2;
-	else
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_ssp_amp_quirk);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (!dmi_check_system(chromebook_platforms) &&
+	    (mach->mach_params.dmic_num == 0))
 		ctx->dmic_be_num = 0;
 
-	/* port number/mask of peripherals attached to ssp interface */
-	ctx->ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
-			SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
-
-	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-			SOF_BT_OFFLOAD_SSP_SHIFT;
-
-	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
-
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
-		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
-				SOF_NO_OF_HDMI_PLAYBACK_SHIFT;
-		/* default number of HDMI DAI's */
-		if (!ctx->hdmi_num)
-			ctx->hdmi_num = 3;
-
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
 	} else {
 		ctx->hdmi_num = 0;
 	}
 
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	ctx->link_order_overwrite = SSP_AMP_LINK_ORDER;
 
 	if (ctx->ssp_mask_hdmi_in) {
@@ -220,38 +180,38 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "tgl_rt1308_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_AMPLIFIER_SSP(2) |
-					SOF_HDMI_CAPTURE_SSP_MASK(0x22)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_AMP(2) |
+					SOF_SSP_MASK_HDMI_CAPTURE(0x22)),
 					/* SSP 1 and SSP 5 are used for HDMI IN */
 	},
 	{
 		.name = "adl_cs35l41",
-		.driver_data = (kernel_ulong_t)(SOF_AMPLIFIER_SSP(1) |
-					SOF_NO_OF_HDMI_PLAYBACK(4) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
 					SOF_HDMI_PLAYBACK_PRESENT |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NO_OF_HDMI_PLAYBACK(3) |
+					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "rpl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NO_OF_HDMI_PLAYBACK(3) |
+					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "mtl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
-				/* SSP 0 and SSP 2 are used for HDMI IN */
-				SOF_NO_OF_HDMI_PLAYBACK(3) |
-				SOF_HDMI_PLAYBACK_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_NUM_IDISP_HDMI(3) |
+					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{ }
 };
@@ -274,4 +234,3 @@ MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_CIRRUS_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

