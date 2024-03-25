Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67FE7316E
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404679; cv=none; b=CIReX0OV6QhAgyd4s336gCtKi6GVF/eblu0aUjHwvVFWUCXMGyJOdKPhIYgIUwJwWtCmSy6KFx4p5OXKfZ7RGRkR8rmcppj+1Hv27NcOGrF61tvrE51gmLJDeNPfUJDlWXXUFfTZxzbakbn1DTLLKuaM1+XXbn/2fCN5CWGHQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404679; c=relaxed/simple;
	bh=JhJlq0hTJM8sHxXoAiEk2EiNfc5u8V9ZaK06FNN/WZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pE1cTkd93090b11fkDdkQ+HLf8DKITnkeNaQj6t4dgr4yMOXFeSA9i/AOID4AW+u3ytaAsqeKdQW9giw9P+5vXx4XJ7rItQUQw7Qmlbioq5f0j+wzysEyNtevcnTgDiOlpG+Rj0CTdXKtJW9bmgMWkS2isZxsgUkD9Oj6JbubPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHLa13lp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHLa13lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404678; x=1742940678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JhJlq0hTJM8sHxXoAiEk2EiNfc5u8V9ZaK06FNN/WZ4=;
  b=PHLa13lpqklNkVcrnDislYMH+Y1DXSAhP4PJB9EwuyUyS92z/6ZTuL73
   xNz9u+oa1og6VvbSSlTK9DD6T0aH36h33eUhNCwaF7w0nUV4G+wyQH6VF
   o53a9Y0su19h/FaAsphREq9crtiOjS0hg/wTXU9C36oilDe594OAf9hk0
   uHSaHCdOGD2J712/1ptxo02nMM8adSNdcM4zBOJ/OoksfLV5ZC2WzfNY6
   9oSArzXIEZhvbizgC+WIi1CipDjRVO6qPzBH2cVgifYyC4z8r+LKOccBv
   LLM/WzqMVBqC+zG5gYGDPJN/kBD2JDBt3DlGZLAxp+ARf1c2gUavPdLVS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643603"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722084"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/21] ASoC: Intel: board_helpers: support DAI link ID customization
Date: Mon, 25 Mar 2024 17:10:39 -0500
Message-Id: <20240325221059.206042-2-pierre-louis.bossart@linux.intel.com>
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

Add an new field link_id_overwrite to sof_card_private structure to
support machine drivers which DAI link ID is fixed number or
discontinue (i.e. no-codec boards). If this field is zero, DAI array
index will be used as link ID. Otherwise the value extracted from
link_id_overwrite will be used.

The field link_id_overwrite is supposed to be initialized by
SOF_LINK_IDS macro like following example.

ctx->link_id_overwrite = SOF_LINK_IDS(HEADPHONE_BE_ID,  \
				      DMIC01_BE_ID,     \
				      DMIC16K_BE_ID,    \
				      IDISP_HDMI_BE_ID, \
				      SPK_BE_ID,        \
				      BT_OFFLOAD_BE_ID, \
				      HDMI_IN_BE_ID)

An exception is that, if you use link_order_overwrite to overwrite
DAI link order, then you need to use the same order to build
link_id_overwrite variable as well.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 36 ++++++++++++++++------
 sound/soc/intel/boards/sof_board_helpers.h | 18 +++++++++++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 088894ff4165..e853dc851c42 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -427,6 +427,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	int ret;
 	int ssp_hdmi_in = 0;
 	unsigned long link_order, link;
+	unsigned long link_ids, be_id;
 
 	num_links = calculate_num_links(ctx);
 
@@ -440,12 +441,26 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	else
 		link_order = DEFAULT_LINK_ORDER;
 
-	dev_dbg(dev, "create dai links, link_order 0x%lx\n", link_order);
+	if (ctx->link_id_overwrite)
+		link_ids = ctx->link_id_overwrite;
+	else
+		link_ids = 0;
+
+	dev_dbg(dev, "create dai links, link_order 0x%lx, id_overwrite 0x%lx\n",
+		link_order, link_ids);
 
 	while (link_order) {
 		link = link_order & SOF_LINK_ORDER_MASK;
 		link_order >>= SOF_LINK_ORDER_SHIFT;
 
+		if (ctx->link_id_overwrite) {
+			be_id = link_ids & SOF_LINK_IDS_MASK;
+			link_ids >>= SOF_LINK_IDS_SHIFT;
+		} else {
+			/* use array index as link id */
+			be_id = idx;
+		}
+
 		switch (link) {
 		case SOF_LINK_CODEC:
 			/* headphone codec */
@@ -453,7 +468,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			ret = sof_intel_board_set_codec_link(dev, &links[idx],
-							     idx,
+							     be_id,
 							     ctx->codec_type,
 							     ctx->ssp_codec);
 			if (ret) {
@@ -472,7 +487,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 
 			/* at least we have dmic01 */
 			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    idx, SOF_DMIC_01);
+							    be_id, SOF_DMIC_01);
 			if (ret) {
 				dev_err(dev, "fail to set dmic01 link, ret %d\n",
 					ret);
@@ -488,7 +503,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 
 			/* set up 2 BE links at most */
 			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    idx, SOF_DMIC_16K);
+							    be_id, SOF_DMIC_16K);
 			if (ret) {
 				dev_err(dev, "fail to set dmic16k link, ret %d\n",
 					ret);
@@ -502,7 +517,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			for (i = 1; i <= ctx->hdmi_num; i++) {
 				ret = sof_intel_board_set_intel_hdmi_link(dev,
 									  &links[idx],
-									  idx, i,
+									  be_id,
+									  i,
 									  ctx->hdmi.idisp_codec);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi link, ret %d\n",
@@ -511,6 +527,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				}
 
 				idx++;
+				be_id++;
 			}
 			break;
 		case SOF_LINK_AMP:
@@ -519,7 +536,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx],
-							       idx,
+							       be_id,
 							       ctx->amp_type,
 							       ctx->ssp_amp);
 			if (ret) {
@@ -536,8 +553,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			if (!ctx->bt_offload_present)
 				continue;
 
-			ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
-							  ctx->ssp_bt);
+			ret = sof_intel_board_set_bt_link(dev, &links[idx],
+							  be_id, ctx->ssp_bt);
 			if (ret) {
 				dev_err(dev, "fail to set bt link, ret %d\n",
 					ret);
@@ -551,7 +568,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
 				ret = sof_intel_board_set_hdmi_in_link(dev,
 								       &links[idx],
-								       idx,
+								       be_id,
 								       ssp_hdmi_in);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi-in link, ret %d\n",
@@ -560,6 +577,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				}
 
 				idx++;
+				be_id++;
 			}
 			break;
 		case SOF_LINK_NONE:
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index f42d5d640321..162a5f4841da 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -33,6 +33,18 @@ enum {
 	 (((k6) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 5)) | \
 	 (((k7) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 6)))
 
+#define SOF_LINK_IDS_MASK	(0xF)
+#define SOF_LINK_IDS_SHIFT	(4)
+
+#define SOF_LINK_IDS(k1, k2, k3, k4, k5, k6, k7) \
+	((((k1) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 0)) | \
+	 (((k2) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 1)) | \
+	 (((k3) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 2)) | \
+	 (((k4) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 3)) | \
+	 (((k5) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 4)) | \
+	 (((k6) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 5)) | \
+	 (((k7) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 6)))
+
 /*
  * sof_rt5682_private: private data for rt5682 machine driver
  *
@@ -61,6 +73,7 @@ struct sof_rt5682_private {
  * @codec_link: pointer to headset codec dai link
  * @amp_link: pointer to speaker amplifier dai link
  * @link_order_overwrite: custom DAI link order
+ * @link_id_overwrite: custom DAI link ID
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -84,6 +97,11 @@ struct sof_card_private {
 	struct snd_soc_dai_link *amp_link;
 
 	unsigned long link_order_overwrite;
+	/*
+	 * A variable stores id for all BE DAI links, use SOF_LINK_IDS macro to
+	 * build the value; use DAI link array index as id if zero.
+	 */
+	unsigned long link_id_overwrite;
 
 	union {
 		struct sof_rt5682_private rt5682;
-- 
2.40.1

