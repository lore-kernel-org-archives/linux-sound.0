Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0A13CA91
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469139; cv=none; b=bzpjp1iBgtGyhSW1dubhQQhkO6HWqtAV0CML/xYJQeuaP8nF5PXBr3qvZP+j91RFMCLSlXL8z2L1oBk6W+nXSpcEUafe0yVZCO4AqVRcFG7JbYbKU5fa1paWryZDrCx1hwimXFM5lvs/fTIimqoNQ9VLnaa8kCRLy5ElOuxJSSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469139; c=relaxed/simple;
	bh=9iA0Nx5xyOd4qdcwtHqLz0ah1YLccJBqhCPLpQnQrT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o8InASDa8/OSjOsQWndFD1X6NsiOIh13yIyWCEQJb19MFCYvmb63iri4lqXOL63L4Kv5t2nqvpPF0WPtWSRk/p6QsYVLei1oCUjT97Kn3QKouwnXZ6ooPKl+VDyc7eX5n7I+BYl5AyL5/qY67kypRpCtZjPpf5vYROfcZEYByFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROADq/yQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROADq/yQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469137; x=1743005137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9iA0Nx5xyOd4qdcwtHqLz0ah1YLccJBqhCPLpQnQrT4=;
  b=ROADq/yQC1kp/yeFvE8NbSacRkxY3t9hQfqUXr9WA9Je7m9XiQj+FT7G
   TlhYrc5pLkCNHIsmzrQDxows+l6dCoalPF3GsfNehHtCE2Jy6ritrZW66
   T2b3druguAqmtmOnJyA/KrFYpkv/vNbBntgZvgfo0IkfroxydGb1CXHuv
   Hn4ud0ccOsRkGjdc3NV2xC98FFA8k10ofAKZDb4fr/UaTtSf5y49hcRHE
   PQG808dg7e+60EX8pI3Ozvtt2f3r1brzv1z7TmUx1Uy8ca4HKYuzkMqeR
   ukef75ZUM0xTcD7WYZXEuCuUk3MWo4l/GiHfN/dR+Y0NYRMsjiqusJL74
   A==;
X-CSE-ConnectionGUID: MftEZKaLRqaCikZ+iOEAdg==
X-CSE-MsgGUID: hqaydPFKTHCmuiyDljlfmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260486"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482369"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/34] ASoC: intel: sof_sdw: Factor out SoundWire DAI creation
Date: Tue, 26 Mar 2024 11:04:18 -0500
Message-Id: <20240326160429.13560-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the SoundWire DAI links into a helper
function. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 50 ++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9f1c49df9cd2..3e6a758c98ab 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1559,6 +1559,34 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_sdw_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct sof_sdw_dailink *sof_dais)
+{
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret, i;
+
+	for (i = 0; i < SDW_MAX_LINKS; i++)
+		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
+
+	/* generate DAI links by each sdw link */
+	while (sof_dais->initialised) {
+		int current_be_id;
+
+		ret = create_sdw_dailink(card, sof_dais, dai_links, &current_be_id);
+		if (ret)
+			return ret;
+
+		/* Update the be_id to match the highest ID used for SDW link */
+		if (*be_id < current_be_id)
+			*be_id = current_be_id;
+
+		sof_dais++;
+	}
+
+	return 0;
+}
+
 static int create_ssp_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
 			       struct sof_sdw_codec_info *ssp_info,
@@ -1692,7 +1720,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int num_ends = 0;
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
-	int i, be_id = 0;
+	int be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
 	int ret;
@@ -1774,28 +1802,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->num_links = num_links;
 
 	/* SDW */
-	if (!sdw_be_num)
-		goto SSP;
-
-	for (i = 0; i < SDW_MAX_LINKS; i++)
-		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
-
-	/* generate DAI links by each sdw link */
-	while (sof_dais->initialised) {
-		int current_be_id;
-
-		ret = create_sdw_dailink(card, sof_dais, &dai_links, &current_be_id);
+	if (sdw_be_num) {
+		ret = create_sdw_dailinks(card, &dai_links, &be_id, sof_dais);
 		if (ret)
 			goto err_end;
-
-		/* Update the be_id to match the highest ID used for SDW link */
-		if (be_id < current_be_id)
-			be_id = current_be_id;
-
-		sof_dais++;
 	}
 
-SSP:
 	/* SSP */
 	if (ssp_num) {
 		ret = create_ssp_dailinks(card, &dai_links, &be_id,
-- 
2.40.1

