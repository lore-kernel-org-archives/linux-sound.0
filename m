Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2113A86A
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231100; cv=none; b=gTDWCmhiJjiXDo6enDkfGpD62Z7tqdc+qDUb5MLDr4zjRpZhhAPt4I1Dbei8JaAZgnUIvqsgx3aIlFErSw2rfIeMcKvBBxEcSE2BK+1C9/XUqmmv0APXVOIPuHhEn8Aku4RTGiJ/9VpyU1VnkPBiv1uIZb65txNjBOH8IDD7Gxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231100; c=relaxed/simple;
	bh=UFzKGxzmCvgpTCM7GovIF2X1aBmxmsmexFJMbXdSkmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQZPf5n4rM5swYdBXsZfbUbfmKmh0lAU8cFNWLB/WAcx+vckIcza0Pcs3mUNWiAmJbr197NnLlIME0h6dTYyXZfviqThdZAuTOYFLdI5+dwjJM5V0VNQs7lxIc3oba4FRFchC8fjGvA9YJRPIlH2Qk1FZdlUGgKSARaqle76rcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPwdNp5G; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPwdNp5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231099; x=1750767099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UFzKGxzmCvgpTCM7GovIF2X1aBmxmsmexFJMbXdSkmI=;
  b=VPwdNp5GqYxuudOtiC0yndtxSbB7QWS1R1SGE5tnASzZm/M/KBq0jmnI
   z9R0wWNCKg9k9jTOsnKR9qzSsS3uXzDUNEXnCA13NlvtP7mtx16E7s6/g
   uX6Io/nb2wlNeu8Yr41l8lyCZf3Ext+91j1pwuqT9QOy5bwPS2FfUX8T7
   +fQwhYuPZFqg6tQvY5sp9VUHuADv6XrId+Nx78hDfeQweEDZWKHKy7vYB
   kJV6wNhAxnRExd1ZHrt0/q+e0G23FXa72dmGj+XuKqZJqkWXC3RrDx74y
   JUUhC6A9aOG4eIfraoFzx83sRaAV/zZ2pTvBnQlMBKuqyC0yFLGFhc5Jd
   g==;
X-CSE-ConnectionGUID: IfhfigwoR0mav//WCOMsqw==
X-CSE-MsgGUID: An4TviHzRlW+J9C6D09zwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887543"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15887543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:38 -0700
X-CSE-ConnectionGUID: 7+mxtzNZRcKY16+NFKweew==
X-CSE-MsgGUID: wq6mPcfyQme65JB5WAhfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43091217"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask function
Date: Mon, 24 Jun 2024 14:11:17 +0200
Message-ID: <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function max_98373_get_tx_mask() to get tx mask from
max98373 ACPI device properties at runtime.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 56 +++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index f965b172fa36..fcc3b95e57a4 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -77,19 +77,36 @@ static struct snd_soc_dai_link_component max_98373_components[] = {
  * According to the definition of 'DAI Sel Mux' mixer in max98373.c, rx mask
  * should choose two channels from TDM slots, the LSB of rx mask is left channel
  * and the other one is right channel.
- *
- * For tx mask, each codec requires two channels: one for V-sense and the other
- * one for I-sense. Must match the device property "maxim,vmon-slot-no" and
- * "maxim,imon-slot-no" in ACPI table.
  */
 static const struct {
-	unsigned int tx;
 	unsigned int rx;
 } max_98373_tdm_mask[] = {
-	{.tx = 0x03, .rx = 0x3},
-	{.tx = 0x0c, .rx = 0x3},
+	{.rx = 0x3},
+	{.rx = 0x3},
 };
 
+/*
+ * The tx mask indicates which channel(s) contains output IV-sense data and
+ * others should set to Hi-Z. Here we get the channel number from codec's ACPI
+ * device property "maxim,vmon-slot-no" and "maxim,imon-slot-no" to generate the
+ * mask. Refer to the max98373_slot_config() function in max98373.c codec driver.
+ */
+static unsigned int max_98373_get_tx_mask(struct device *dev)
+{
+	int vmon_slot;
+	int imon_slot;
+
+	if (device_property_read_u32(dev, "maxim,vmon-slot-no", &vmon_slot))
+		vmon_slot = 0;
+
+	if (device_property_read_u32(dev, "maxim,imon-slot-no", &imon_slot))
+		imon_slot = 1;
+
+	dev_dbg(dev, "vmon_slot %d imon_slot %d\n", vmon_slot, imon_slot);
+
+	return (0x1 << vmon_slot) | (0x1 << imon_slot);
+}
+
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
@@ -98,6 +115,8 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i;
 	int tdm_slots;
+	unsigned int tx_mask;
+	unsigned int tx_mask_used = 0x0;
 	int ret = 0;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -117,13 +136,26 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 				return -EINVAL;
 			}
 
+			/* get the tx mask from ACPI device properties */
+			tx_mask = max_98373_get_tx_mask(codec_dai->dev);
+			if (!tx_mask)
+				return -EINVAL;
+
+			if (tx_mask & tx_mask_used) {
+				dev_err(codec_dai->dev, "invalid tx mask 0x%x, used 0x%x\n",
+					tx_mask, tx_mask_used);
+				return -EINVAL;
+			}
+
+			tx_mask_used |= tx_mask;
+
 			/*
 			 * check if tdm slot number is too small for channel
 			 * allocation
 			 */
-			if (fls(max_98373_tdm_mask[i].tx) > tdm_slots) {
+			if (fls(tx_mask) > tdm_slots) {
 				dev_err(codec_dai->dev, "slot mismatch, tx %d slots %d\n",
-					fls(max_98373_tdm_mask[i].tx), tdm_slots);
+					fls(tx_mask), tdm_slots);
 				return -EINVAL;
 			}
 
@@ -134,12 +166,10 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			}
 
 			dev_dbg(codec_dai->dev, "set tdm slot: tx 0x%x rx 0x%x slots %d width %d\n",
-				max_98373_tdm_mask[i].tx,
-				max_98373_tdm_mask[i].rx,
+				tx_mask, max_98373_tdm_mask[i].rx,
 				tdm_slots, params_width(params));
 
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       max_98373_tdm_mask[i].tx,
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, tx_mask,
 						       max_98373_tdm_mask[i].rx,
 						       tdm_slots,
 						       params_width(params));
-- 
2.43.0

