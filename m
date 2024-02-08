Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94680048
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411362; cv=none; b=qW00dWFasND3okezb42a1c1vnl6P5b9MVPonj14793r7l3o27od3SewrSs7O16cv153MwquBIWKAit3y4lZWoBhRJKp3DGzDt9mPy7g4aanlZV7M+chQNIZgOyW/Y+uL/88gIu/SRh/W5Gcedfyh671oU0lZBR4MwR4aOAb6SsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411362; c=relaxed/simple;
	bh=xdfWejQVbul49etFkgjB6iDos3edVlsKpJlTGBqcd30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aod805Pvsllm6UTLxkPXsGeoAHbDZLWn9ECQYMKP772JIzoSH2W5TnnzFfvUtzwlHuhqjQ8lvr2++EU4G7d48Z5thOAj+P2YUTT0RbegGI87AHgpNbQGBv0EbVVNX5aYTNmu9CdIpjF50c22Ukuxiac66+TpDhCTa/XeHmR7ggw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2QUp8dn; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2QUp8dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411360; x=1738947360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xdfWejQVbul49etFkgjB6iDos3edVlsKpJlTGBqcd30=;
  b=P2QUp8dnxyBM6gpaY5c8hKCtO9En0jwbuyCSffoGM+R/PPXwAv7rNWwl
   a+Z1ULjvTJ3i4dEMluaW36bEOG2kioQ/Fi9H+dLXo0B+ZzID6Lvyu+Om3
   NqZPtBcJKV3gf7N+8KsJw1Be3ue/uGnWZ7ai2rSIIeyzeJzz/biNmrQL1
   W3TsqTN0hQwA0bBhHzWUnMoJPiFq4CeFyx3MMfFtxgwUPy1ZM8bcopEJS
   6s1cOXHAEBqWA90QN/8NgJ5qMesnn2Ng4/sD6LDPkf7rjwXs0ePY2ktTN
   oKEpH6SZGBjTBubMd3TONtoC1rlIG4kWQfLKt7VnMzb0ps2R1cZpbBadi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675336"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675336"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690175"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/24] ASoC: Intel: board_helpers: support DAI link order customization
Date: Thu,  8 Feb 2024 10:55:28 -0600
Message-Id: <20240208165545.93811-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add an new field link_order_overwrite to sof_card_private structure to
support machine drivers which DAI link order is different from the
order used in sof_rt5682 (i.e. GLK boards or no-codec boards).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 207 +++++++++++++--------
 sound/soc/intel/boards/sof_board_helpers.h |  26 +++
 2 files changed, 158 insertions(+), 75 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 4f2cb8e52971..25f9ff12618c 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -73,6 +73,16 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 /*
  * DAI Link Helpers
  */
+
+/* DEFAULT_LINK_ORDER: the order used in sof_rt5682 */
+#define DEFAULT_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_CODEC, \
+					SOF_LINK_DMIC01,       \
+					SOF_LINK_DMIC16K,      \
+					SOF_LINK_IDISP_HDMI,   \
+					SOF_LINK_AMP,          \
+					SOF_LINK_BT_OFFLOAD,   \
+					SOF_LINK_HDMI_IN)
+
 static struct snd_soc_dai_link_component dmic_component[] = {
 	{
 		.name = "dmic-codec",
@@ -416,6 +426,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	int idx = 0;
 	int ret;
 	int ssp_hdmi_in = 0;
+	unsigned long link_order, link;
 
 	num_links = calculate_num_links(ctx);
 
@@ -424,94 +435,140 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	if (!links)
 		return -ENOMEM;
 
-	/* headphone codec */
-	if (ctx->codec_type != CODEC_NONE) {
-		ret = sof_intel_board_set_codec_link(dev, &links[idx], idx,
-						     ctx->codec_type,
-						     ctx->ssp_codec);
-		if (ret) {
-			dev_err(dev, "fail to set codec link, ret %d\n", ret);
-			return ret;
-		}
+	if (ctx->link_order_overwrite)
+		link_order = ctx->link_order_overwrite;
+	else
+		link_order = DEFAULT_LINK_ORDER;
 
-		ctx->codec_link = &links[idx];
-		idx++;
-	}
+	dev_dbg(dev, "create dai links, link_order 0x%lx\n", link_order);
 
-	/* dmic01 and dmic16k */
-	if (ctx->dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
-						    SOF_DMIC_01);
-		if (ret) {
-			dev_err(dev, "fail to set dmic01 link, ret %d\n", ret);
-			return ret;
-		}
+	while (link_order) {
+		link = link_order & SOF_LINK_ORDER_MASK;
+		link_order >>= SOF_LINK_ORDER_SHIFT;
 
-		idx++;
-	}
+		switch (link) {
+		case SOF_LINK_CODEC:
+			/* headphone codec */
+			if (ctx->codec_type == CODEC_NONE)
+				continue;
 
-	if (ctx->dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
-						    SOF_DMIC_16K);
-		if (ret) {
-			dev_err(dev, "fail to set dmic16k link, ret %d\n", ret);
-			return ret;
-		}
+			ret = sof_intel_board_set_codec_link(dev, &links[idx],
+							     idx,
+							     ctx->codec_type,
+							     ctx->ssp_codec);
+			if (ret) {
+				dev_err(dev, "fail to set codec link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
-	}
+			ctx->codec_link = &links[idx];
+			idx++;
+			break;
+		case SOF_LINK_DMIC01:
+			/* dmic01 */
+			if (ctx->dmic_be_num == 0)
+				continue;
 
-	/* idisp HDMI */
-	for (i = 1; i <= ctx->hdmi_num; i++) {
-		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[idx], idx,
-							  i,
-							  ctx->hdmi.idisp_codec);
-		if (ret) {
-			dev_err(dev, "fail to set hdmi link, ret %d\n", ret);
-			return ret;
-		}
+			/* at least we have dmic01 */
+			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
+							    idx, SOF_DMIC_01);
+			if (ret) {
+				dev_err(dev, "fail to set dmic01 link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
-	}
+			idx++;
+			break;
+		case SOF_LINK_DMIC16K:
+			/* dmic16k */
+			if (ctx->dmic_be_num <= 1)
+				continue;
 
-	/* speaker amp */
-	if (ctx->amp_type != CODEC_NONE) {
-		ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx], idx,
-						       ctx->amp_type,
-						       ctx->ssp_amp);
-		if (ret) {
-			dev_err(dev, "fail to set amp link, ret %d\n", ret);
-			return ret;
-		}
+			/* set up 2 BE links at most */
+			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
+							    idx, SOF_DMIC_16K);
+			if (ret) {
+				dev_err(dev, "fail to set dmic16k link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		ctx->amp_link = &links[idx];
-		idx++;
-	}
+			idx++;
+			break;
+		case SOF_LINK_IDISP_HDMI:
+			/* idisp HDMI */
+			for (i = 1; i <= ctx->hdmi_num; i++) {
+				ret = sof_intel_board_set_intel_hdmi_link(dev,
+									  &links[idx],
+									  idx, i,
+									  ctx->hdmi.idisp_codec);
+				if (ret) {
+					dev_err(dev, "fail to set hdmi link, ret %d\n",
+						ret);
+					return ret;
+				}
 
-	/* BT audio offload */
-	if (ctx->bt_offload_present) {
-		ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
-						  ctx->ssp_bt);
-		if (ret) {
-			dev_err(dev, "fail to set bt link, ret %d\n", ret);
-			return ret;
-		}
+				idx++;
+			}
+			break;
+		case SOF_LINK_AMP:
+			/* speaker amp */
+			if (ctx->amp_type == CODEC_NONE)
+				continue;
 
-		idx++;
-	}
+			ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx],
+							       idx,
+							       ctx->amp_type,
+							       ctx->ssp_amp);
+			if (ret) {
+				dev_err(dev, "fail to set amp link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-	/* HDMI-In */
-	for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
-		ret = sof_intel_board_set_hdmi_in_link(dev, &links[idx], idx,
-						       ssp_hdmi_in);
-		if (ret) {
-			dev_err(dev, "fail to set hdmi-in link, ret %d\n", ret);
-			return ret;
-		}
+			ctx->amp_link = &links[idx];
+			idx++;
+			break;
+		case SOF_LINK_BT_OFFLOAD:
+			/* BT audio offload */
+			if (!ctx->bt_offload_present)
+				continue;
+
+			ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
+							  ctx->ssp_bt);
+			if (ret) {
+				dev_err(dev, "fail to set bt link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
+			idx++;
+			break;
+		case SOF_LINK_HDMI_IN:
+			/* HDMI-In */
+			for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
+				ret = sof_intel_board_set_hdmi_in_link(dev,
+								       &links[idx],
+								       idx,
+								       ssp_hdmi_in);
+				if (ret) {
+					dev_err(dev, "fail to set hdmi-in link, ret %d\n",
+						ret);
+					return ret;
+				}
+
+				idx++;
+			}
+			break;
+		case SOF_LINK_NONE:
+			/* caught here if it's not used as terminator in macro */
+			fallthrough;
+		default:
+			dev_err(dev, "invalid link type %ld\n", link);
+			return -EINVAL;
+		}
 	}
 
 	if (idx != num_links) {
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 3b36058118ca..c5d6e7bec5d4 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -10,6 +10,29 @@
 #include "sof_hdmi_common.h"
 #include "sof_ssp_common.h"
 
+enum {
+	SOF_LINK_NONE = 0,
+	SOF_LINK_CODEC,
+	SOF_LINK_DMIC01,
+	SOF_LINK_DMIC16K,
+	SOF_LINK_IDISP_HDMI,
+	SOF_LINK_AMP,
+	SOF_LINK_BT_OFFLOAD,
+	SOF_LINK_HDMI_IN,
+};
+
+#define SOF_LINK_ORDER_MASK	(0xF)
+#define SOF_LINK_ORDER_SHIFT	(4)
+
+#define SOF_LINK_ORDER(k1, k2, k3, k4, k5, k6, k7) \
+	((((k1) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 0)) | \
+	 (((k2) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 1)) | \
+	 (((k3) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 2)) | \
+	 (((k4) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 3)) | \
+	 (((k5) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 4)) | \
+	 (((k6) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 5)) | \
+	 (((k7) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 6)))
+
 /*
  * sof_rt5682_private: private data for rt5682 machine driver
  *
@@ -37,6 +60,7 @@ struct sof_rt5682_private {
  * @bt_offload_present: true to create BT offload BE link
  * @codec_link: pointer to headset codec dai link
  * @amp_link: pointer to speaker amplifier dai link
+ * @link_order_overwrite: custom DAI link order
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -59,6 +83,8 @@ struct sof_card_private {
 	struct snd_soc_dai_link *codec_link;
 	struct snd_soc_dai_link *amp_link;
 
+	unsigned long link_order_overwrite;
+
 	union {
 		struct sof_rt5682_private rt5682;
 	};
-- 
2.40.1

