Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F216F85C
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067940; cv=none; b=MX1DG97qwuMn04sY0K56ulI1bMfwYo/FWymwZ9QOcFQ6YmGUnEuDfZnZqlx6z37SP1sUiKbcV/4prLv1yhKqu0sm/O9KjodDwLlTklGxlSZGaE6YvDLSA+yqp6wSBYY1vs76uFUBd9E2JpQiIVrn5AFCxnYgMt8V+9ZukXKJm/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067940; c=relaxed/simple;
	bh=/RjhT8TKNLUywtPLT/cr9AxU/UVJ8EWSu8NMWjQ5heQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XF25UBCKQAwmGptSi9OoOjDudZPaht4S8ar2ufIw5t0vTQN5Zltpux32nKsjxn2TVApOp7Hmi+bucaM0NAV8xbjy4MZz6R1zIb42BUzzcxp7WlKPWimci1CZhw8zzezaSnZvQlbU/fNmNkcopvChWtOlZFXznx7PYOxex+ihyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmXN4fZy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmXN4fZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067939; x=1748603939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/RjhT8TKNLUywtPLT/cr9AxU/UVJ8EWSu8NMWjQ5heQ=;
  b=QmXN4fZy351J5OqwiRsDBgHobdN/lCdEMM7lm2B++ZswPb7mMibZ4NCo
   zla/bzWvwNnNtRc2OAPH8CSpr1thwU7D7E2Q/am56uWmxXIvpeBfWHS30
   2D7wlCiD7eU4E7AZqifFkzkPixIQpu2fHZSwDlCgVkCBDRwtcwfsZDKft
   4ZfgJz/KNqzqCDjATyrXDZeOe5B2naAyw+9TY6DrH4BYByCF284DSi/6I
   yrUZKmEJ8dX4wJoNauW6vIPzGfd0cxVyARtIIflEbYrMqx0Kg7wUZ0uBx
   FyIZFrbsQT0qj45MQPyn4mzc3pYGZH4HPrpso4y+0DTz1TbCg/mONROXo
   Q==;
X-CSE-ConnectionGUID: DYkuElirRBWjD+xUQsFERQ==
X-CSE-MsgGUID: UOWG13wwSJuDF+6RA4W8kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065145"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065145"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:18:59 -0700
X-CSE-ConnectionGUID: Ot4qHFCdQUqvcM4LQ0RkGw==
X-CSE-MsgGUID: Eaew6mVhTGWpuqDbOL/AeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258659"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:18:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 1/5] ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
Date: Thu, 30 May 2024 14:19:14 +0300
Message-ID: <20240530111918.21974-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
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
index 33e8c5f7d9ca..d653e39ee3ac 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1491,6 +1491,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 					   dir, dev_type);
 
 	if (!cfg) {
+		bool get_new_blob = false;
+
 		if (format_change) {
 			/*
 			 * The 32-bit blob was not found in NHLT table, try to
@@ -1498,7 +1500,20 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
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
@@ -1521,8 +1536,8 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 
 	if (format_change) {
 		/*
-		 * Update the params to reflect that we have loaded 32-bit blob
-		 * instead of the 16-bit.
+		 * Update the params to reflect that different blob was loaded
+		 * instead of the requested bit depth (16 -> 32 or 32 -> 16).
 		 * This information is going to be used by the caller to find
 		 * matching copier format on the dai side.
 		 */
@@ -1530,7 +1545,11 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 
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

