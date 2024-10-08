Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1B18CBFC
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385762; cv=none; b=fyLpPTD1Ypd21Ojzv65WYQf4fKwypHwEhfhRskEPLV2EmaR+SJf9m1B9XUb4w+v0RSM7AVxVIQO6vD+S6OUl6tm9B/WAc63mjqQHCb7Yr6uSQyTn1++fkHeTU3kOG63oiSrwVqSKkCkzeKm6OhAOASrIFSDttqbtQBxCaKKUn+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385762; c=relaxed/simple;
	bh=mkJLt+gFRXNociDqqPmPbIAIl+ULGlzBZRFcARGclX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWpQBpM0yKxCEv0k/5uk861vxL2vEa5cUJ4GZ4e30YlYWSnJ9gOJa+6sD/94W5xm8KlvQWvPA8zhQY3i8wdWxXPPkm0NxlmdWOIord3NjYUR/NIn8Ynvck0QjJx42HHUtVYN77xM4DJ2qGVih14wseu+CVMTEav+rlLWH5kZmGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nismFwrL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nismFwrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385761; x=1759921761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mkJLt+gFRXNociDqqPmPbIAIl+ULGlzBZRFcARGclX8=;
  b=nismFwrLwOoUsRxlRahoGWEAS1BIOMGj8tb27VFFmerRbR+sTweecnWH
   3QPDu52pc2aVw3pleiqXfzC6W6lxwKH01ukfnE7J52RzdX9ITSkzwPCkx
   OskmRjfpIRvNF6hg18SdLFNzCtgYDQi87+wfeOJKwdygC6+P3QiJJ8jde
   E2Xxy0C+dLJlhiGxdPE4vRUBuv1YC8AriyxEx8R2g3sp9nEANsQBYUppI
   yiwyShn/zpNwJwGH5i1Nu7cGRmEKRhwRpoy7fz2BsjrKhvQ/w/A+KtK/X
   Aeqy2tLBDMA89CrVBVgKihBOY0+ZQFJnhnivmEyUKH7hvpjplElBAgi1a
   Q==;
X-CSE-ConnectionGUID: j6xLW2HMQKeVBoBU7w/1Tg==
X-CSE-MsgGUID: lh3hxVacSw28F+vKzuycCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036980"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:21 -0700
X-CSE-ConnectionGUID: MtyF+o6sQs+C2schAYj6dQ==
X-CSE-MsgGUID: MH1eiJrkSv6mCyuhadUJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586673"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/8] ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_input_audio_fmt()
Date: Tue,  8 Oct 2024 14:09:30 +0300
Message-ID: <20241008110936.22534-3-peter.ujfalusi@linux.intel.com>
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

We have local copies of available_fmt->input_pin_fmts and
available_fmt->num_input_formats, use them in the function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7967ec4c406a..af5eea853745 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1278,13 +1278,12 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 	int sample_valid_bits;
 	int i = 0;
 
-	if (!available_fmt->num_input_formats) {
+	if (!pin_fmts_size) {
 		dev_err(sdev->dev, "no input formats for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
 
-	single_format = sof_ipc4_is_single_format(sdev, available_fmt->input_pin_fmts,
-						  available_fmt->num_input_formats);
+	single_format = sof_ipc4_is_single_format(sdev, pin_fmts, pin_fmts_size);
 	if (single_format)
 		goto in_fmt;
 
@@ -1321,15 +1320,15 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 
 in_fmt:
 	/* copy input format */
-	if (available_fmt->num_input_formats && i < available_fmt->num_input_formats) {
-		memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
+	if (pin_fmts_size && i < pin_fmts_size) {
+		memcpy(&base_config->audio_fmt, &pin_fmts[i].audio_fmt,
 		       sizeof(struct sof_ipc4_audio_format));
 
 		/* set base_cfg ibs/obs */
-		base_config->ibs = available_fmt->input_pin_fmts[i].buffer_size;
+		base_config->ibs = pin_fmts[i].buffer_size;
 
 		dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
-		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
+		sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
 	}
 
 	return i;
-- 
2.47.0

