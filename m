Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A52174424
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404683; cv=none; b=H7yi0OT8DbulvCOp8wE6K8/SgwpgmySK/IvRCDDRgz8sABP8hD/FceWSs8tjH7aveDCCpiNJ5tnzxkFDYPTmzzIg/PeQcG2oFX49kdGdlVft6I85/6ZvXL6b5hpqzCYuGpk1HgK1AytwzSyRflgx1CtqXyrTML2ipS+9XUq+VOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404683; c=relaxed/simple;
	bh=ib5TuHlM6NnjBR9KEjhulILeTIHNUj0n85x/toUXsU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCvqd3iNSyqBlY0DkpS6usbPdTYAWy5gP7lbk02vSHNyLPZdYEqI+jqolDba36azZ1XI9olESVRVlemqA+cknrpa0BPjepY8r9DAsjYO+lVa+ZdcYxcmtbtixuhtpp2ANlPFaeZEVfVpWgpALiJCbkit6kzi1MHXRvgjDp633lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOES8Wdo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOES8Wdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404682; x=1742940682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ib5TuHlM6NnjBR9KEjhulILeTIHNUj0n85x/toUXsU0=;
  b=bOES8WdoqOp8qwMR2y2xpTnUPoKe2LL9Hb662zivctWA8O9Lto0jvXbf
   BshG/056fEO4BTFILeE0+2oX+gCdVSd/jecAJt8Xc/3CNNIUb/Y9F3zeb
   x8+0denYajro6ZUsQLen1/ON6NTuevt9yTneHN/ZrFpJ7/+IJfxLqMg3H
   a1ykndBomqSmJnqEJquIg35la4Ye9rzhiXaqxcHYoHfjn34BmIKbyibA7
   yof/V2VJEq1vyoOIkBK7S688CPeLgvjIDURY83VSzaCJ9tXMO6tBYoucn
   KlWWX2pWVqkH0IL8vWDKhk2v0KIcEzQ/IgDFkkaTjqnPnJ8z9zEfLgbUS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643630"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722115"
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
Subject: [PATCH 07/21] ASoC: Intel: board_helpers: support sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:45 -0500
Message-Id: <20240325221059.206042-8-pierre-louis.bossart@linux.intel.com>
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

Add a helper function for machine drivers to initialize common part of
sof_card_private structure. Also unify the macros of board quirks for
the initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 43 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h | 40 ++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index feba1a522527..a5135be94f32 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -587,6 +587,49 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+struct sof_card_private *
+sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
+{
+	struct sof_card_private *ctx;
+
+	dev_dbg(dev, "create ctx, board_quirk 0x%lx\n", board_quirk);
+
+	ctx = devm_kzalloc(dev, sizeof(struct sof_card_private), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->codec_type = sof_ssp_detect_codec_type(dev);
+	ctx->amp_type = sof_ssp_detect_amp_type(dev);
+
+	ctx->dmic_be_num = 2;
+	ctx->hdmi_num = (board_quirk & SOF_NUM_IDISP_HDMI_MASK) >>
+			SOF_NUM_IDISP_HDMI_SHIFT;
+	/* default number of HDMI DAI's */
+	if (!ctx->hdmi_num)
+		ctx->hdmi_num = 3;
+
+	/* port number/mask of peripherals attached to ssp interface */
+	if (ctx->codec_type != CODEC_NONE)
+		ctx->ssp_codec = (board_quirk & SOF_SSP_PORT_CODEC_MASK) >>
+				SOF_SSP_PORT_CODEC_SHIFT;
+
+	if (ctx->amp_type != CODEC_NONE)
+		ctx->ssp_amp = (board_quirk & SOF_SSP_PORT_AMP_MASK) >>
+				SOF_SSP_PORT_AMP_SHIFT;
+
+	if (board_quirk & SOF_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
+		ctx->ssp_bt = (board_quirk & SOF_SSP_PORT_BT_OFFLOAD_MASK) >>
+				SOF_SSP_PORT_BT_OFFLOAD_SHIFT;
+	}
+
+	ctx->ssp_mask_hdmi_in = (board_quirk & SOF_SSP_MASK_HDMI_CAPTURE_MASK) >>
+				SOF_SSP_MASK_HDMI_CAPTURE_SHIFT;
+
+	return ctx;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_get_ctx, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[], int num_dais)
 {
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 38e459e6af9b..0d0a8d97843b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -10,6 +10,44 @@
 #include "sof_hdmi_common.h"
 #include "sof_ssp_common.h"
 
+/*
+ * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
+ *                      drivers
+ */
+
+/* SSP port number for headphone codec: 3 bits */
+#define SOF_SSP_PORT_CODEC_SHIFT		8
+#define SOF_SSP_PORT_CODEC_MASK			(GENMASK(10, 8))
+#define SOF_SSP_PORT_CODEC(quirk)		\
+	(((quirk) << SOF_SSP_PORT_CODEC_SHIFT) & SOF_SSP_PORT_CODEC_MASK)
+
+/* SSP port number for speaker amplifier: 3 bits */
+#define SOF_SSP_PORT_AMP_SHIFT			11
+#define SOF_SSP_PORT_AMP_MASK			(GENMASK(13, 11))
+#define SOF_SSP_PORT_AMP(quirk)			\
+	(((quirk) << SOF_SSP_PORT_AMP_SHIFT) & SOF_SSP_PORT_AMP_MASK)
+
+/* SSP port number for BT audio offload: 3 bits */
+#define SOF_SSP_PORT_BT_OFFLOAD_SHIFT		14
+#define SOF_SSP_PORT_BT_OFFLOAD_MASK		(GENMASK(16, 14))
+#define SOF_SSP_PORT_BT_OFFLOAD(quirk)		\
+	(((quirk) << SOF_SSP_PORT_BT_OFFLOAD_SHIFT) & SOF_SSP_PORT_BT_OFFLOAD_MASK)
+
+/* SSP port mask for HDMI capture: 6 bits */
+#define SOF_SSP_MASK_HDMI_CAPTURE_SHIFT		17
+#define SOF_SSP_MASK_HDMI_CAPTURE_MASK		(GENMASK(22, 17))
+#define SOF_SSP_MASK_HDMI_CAPTURE(quirk)	\
+	(((quirk) << SOF_SSP_MASK_HDMI_CAPTURE_SHIFT) & SOF_SSP_MASK_HDMI_CAPTURE_MASK)
+
+/* Number of idisp HDMI BE link: 3 bits */
+#define SOF_NUM_IDISP_HDMI_SHIFT		23
+#define SOF_NUM_IDISP_HDMI_MASK			(GENMASK(25, 23))
+#define SOF_NUM_IDISP_HDMI(quirk)		\
+	(((quirk) << SOF_NUM_IDISP_HDMI_SHIFT) & SOF_NUM_IDISP_HDMI_MASK)
+
+/* Board uses BT audio offload */
+#define SOF_BT_OFFLOAD_PRESENT			BIT(26)
+
 enum {
 	SOF_LINK_NONE = 0,
 	SOF_LINK_CODEC,
@@ -111,6 +149,8 @@ struct sof_card_private {
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				 struct sof_card_private *ctx);
+struct sof_card_private *
+sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[], int num_dais);
-- 
2.40.1

