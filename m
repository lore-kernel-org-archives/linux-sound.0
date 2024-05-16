Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B7282EF
	for <linux-sound@vger.kernel.org>; Thu, 16 May 2024 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715846160; cv=none; b=kJ3l5a5uxNOTYUV9Qe6iz/PR3GXTX/GWLf9BaNxrX7MwAXpX80ZYRQRxlkA4qW5HMTGi5LLcnBqcVAyML1SNvAy9h13aYB0XH6VCzMTsDH1n2c7ZGSnSph/uo6Q0hnVt8XcKcJL3gqVceC8Ur93xjnMfIvhePlvparg6tFMpdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715846160; c=relaxed/simple;
	bh=KpmlUqMSuHFp/IyUGYmf9Vs+v1qHAr6n2TW78ikV75Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MboIXs3Aq4O5VLorY88lSRLMWt+SxPKyBkrC3TqlVb5WjYzP2y8vqo01ncptUtEFmAa6AZUol9FUMYcioKKY7XVgQkySfLJfvNystJ1EzFiSrTpZX6yHTIkaFeiEe+9kCZnHUYge2jpsifpL4PWErMg7/oO7FRm3il20yvAhG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3LlY4sN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3LlY4sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715846159; x=1747382159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KpmlUqMSuHFp/IyUGYmf9Vs+v1qHAr6n2TW78ikV75Q=;
  b=l3LlY4sN20RmdYMS1raTAxJSkw7l7Omffg1KCjPLLzeIHSUmulaSCH5D
   ZBWXGt9AwdaBnuNO377C0bFFyCLydG3qmURHeJobonpTomFyt57jcKAOz
   LybvBudP0shdgJgGe1iRHJk6JKiNpCFiNnooHA7yY7YVgDNdXaan42Y3e
   w2JoyupqPlkz21EIHER5dnVAhf9fU9bv1/oLpIXq33FUNpm9V5gRr3XZb
   mRUj8ahI0TK7At2CO1lavDpniDUJSgy2X0HzQYTk2hWh/Vat9ZjlwG7Nu
   3vrg3AKIxuNctt+FZ9c19yrmP6fHAS9grOotM/shblvMjZ3x5ywrcP8GW
   A==;
X-CSE-ConnectionGUID: vMwjWVDhSNyCkSqmvDFANw==
X-CSE-MsgGUID: G2seUZWBQjqdbmo/Hi/xRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34453487"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="34453487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:55:59 -0700
X-CSE-ConnectionGUID: cskwf4MjRfyMAznPsjOpPQ==
X-CSE-MsgGUID: GYy1gwj+Tr6K72xQ/IPyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="35901334"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.245.245.249])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:55:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
Date: Thu, 16 May 2024 10:56:11 +0300
Message-ID: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI NHLT table always had 32-bit DMIC blob even if 16-bit was also
present and taken as a 'rule' which obviously got broken and there is at
least one device on the market which ships with only 16-bit DMIC
configuration blob.
This corner case has never been supported and it is going to need topology
updates for DMIC copier to support multiple formats.

As for the kernel side: if the copier supports multiple formats and the
preferred 32-bit DMIC blob is not found then we will try to get a 16-bit
DMIC configuration and look for a 16-bit copier config.

Fixes: f9209644ae76 ("ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob request")
Link: https://github.com/thesofproject/linux/issues/4973
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index beff10989324..521b4dcba601 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1483,6 +1483,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 					   dir, dev_type);
 
 	if (!cfg) {
+		bool get_new_blob = false;
+
 		if (format_change) {
 			/*
 			 * The 32-bit blob was not found in NHLT table, try to
@@ -1490,7 +1492,20 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 			 */
 			bit_depth = params_width(params);
 			format_change = false;
+			get_new_blob = true;
+		} else if (linktype == SOF_DAI_INTEL_DMIC && !single_format) {
+			/*
+			 * The requested 32-bit blob (no format change for the
+			 * blob request) was not found in NHLT table, try to
+			 * look for 16-bit blob if the copier supports multiple
+			 * formats
+			 */
+			bit_depth = 16;
+			format_change = true;
+			get_new_blob = true;
+		}
 
+		if (get_new_blob) {
 			cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt,
 							   dai_index, nhlt_type,
 							   bit_depth, bit_depth,
@@ -1513,8 +1528,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 
 	if (format_change) {
 		/*
-		 * Update the params to reflect that we have loaded 32-bit blob
-		 * instead of the 16-bit.
+		 * Update the params to reflect that different blob was loaded
+		 * instead of the requested bit depth (16 -> 32 or 32 -> 16).
 		 * This information is going to be used by the caller to find
 		 * matching copier format on the dai side.
 		 */
@@ -1522,7 +1537,11 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 
 		m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 		snd_mask_none(m);
-		snd_mask_set_format(m, SNDRV_PCM_FORMAT_S32_LE);
+		if (bit_depth == 16)
+			snd_mask_set_format(m, SNDRV_PCM_FORMAT_S16_LE);
+		else
+			snd_mask_set_format(m, SNDRV_PCM_FORMAT_S32_LE);
+
 	}
 
 	return 0;
-- 
2.45.1

