Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4138F1CCB35
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385766; cv=none; b=nZYegi/bRApQ8zmYbWHTCCaYVA6Jy3XlRqFTYbp1V2acmzCukMvMibUECuD2Uet5x8tTqJzEs2ya73+6SunXu+fI6PmrCOmCRwQy5wGyLAcbfAsukP/UgwwjnTEDxIrm+C0BLMT7YFzFALAdSZq5jQmC2faFi+lssYmenmuBP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385766; c=relaxed/simple;
	bh=B0jXnVZEOWTnEs3l7EgNZ8h7vsEpApfceQGrS/drw30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uooJ936M6QbsoprwingLIjngE/inst4VpCpc94rXgXOKf+ew0Y2QAsJKwPKb1aEyv58kqy99sr2dPYz14BuPVcjy+eGxSbTX/ETe3DJWReGb1D2pn6BVhn5u4dSU1AsGuiVmQ6SPzhp5ybB6hKjlaqfaA7rz1mp0YuvuxgF1+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZA2PsSNW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA2PsSNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385765; x=1759921765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B0jXnVZEOWTnEs3l7EgNZ8h7vsEpApfceQGrS/drw30=;
  b=ZA2PsSNWnHkKu5WcI23R4wOcHyqv+w5fPcUI5/6YL21wQRrSsfnCeGnW
   YRt1JD9HQKUBZ9CiytxcgTCtFQY0+ko3YE2Zzn6wlsERuuZuTCrPAZnEU
   7CWB9zEaKLziImMx7qHAO5wbVR4FbfUnm5kyU5VUVgYnru8G7EAWac9BC
   gE/Z3vBfSo4khLe9vwpR6AK5Yzak5WRKx7OdDlz5n8AeFSXrzdS3I7oxI
   cJdEm4sBFDBK1eX4kUAo4S13UpU2vt2ha1pBst7JmvP/rzI1DicQaf93d
   fM3VjIBm7X2NGccB0Nz5FJpeEWHTictzq9Djz8tsmxKG1iU5xgSNO2k4/
   g==;
X-CSE-ConnectionGUID: gzy5QeCsTf6Rw0MEiwODAw==
X-CSE-MsgGUID: 3TEu0sQdQ1mw+5MrY9yOQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036998"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:25 -0700
X-CSE-ConnectionGUID: YMcWZkEfSgSe15/z1CEWOA==
X-CSE-MsgGUID: rcDCJqMuQn6cYhnXLLKe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586729"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 4/8] ASoC: SOF: ipc4-topology: Simplify match format print in sof_ipc4_init_input_audio_fmt()
Date: Tue,  8 Oct 2024 14:09:32 +0300
Message-ID: <20241008110936.22534-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print out the information line for the found input format once to avoid
duplicated prints in case when multiple formats are available.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1f10926921d5..31cbb7f620fd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1305,11 +1305,8 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 		if (params_rate(params) == rate && params_channels(params) == channels &&
-		    sample_valid_bits == valid_bits) {
-			dev_dbg(sdev->dev, "matched audio format index for %uHz, %ubit, %u channels: %d\n",
-				rate, valid_bits, channels, i);
+		    sample_valid_bits == valid_bits)
 			break;
-		}
 	}
 
 	if (i == pin_fmts_size) {
@@ -1326,7 +1323,14 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 	/* set base_cfg ibs/obs */
 	base_config->ibs = pin_fmts[i].buffer_size;
 
-	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
+	if (single_format)
+		dev_dbg(sdev->dev, "Input audio format for %s:\n",
+			swidget->widget->name);
+	else
+		dev_dbg(sdev->dev,
+			"Input audio format (format index: %d) for %s:\n", i,
+			swidget->widget->name);
+
 	sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
 
 	return i;
-- 
2.47.0

