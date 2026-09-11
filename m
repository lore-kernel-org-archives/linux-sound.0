Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEF459AD3
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125807; cv=none; b=qtsftMb81q+2VN2rIwa1r+C0v6rtEHmMuNhE1QwfABvAiDHkfDsVQiBTMOFa+4tgG8ALvehM1Lv6dkekjcYT5JbY+OaAbvrVW0e54zlWLjzRBGRQYS3oLd8nlR+c/rsBgpi9HvRWIrBGnxj4mXRDFzM7aOB+INhEAx2l0WVnh1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125807; c=relaxed/simple;
	bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBMElK1yE2eKOdQStVib6pysXLQ26kBaSNsNAVrmi8ee6fu8PpZfRso3GG6/T7F31Ukh3RMUeWd5u/0iEd3FqfojBbWHu4Ci6mUxCS9x7dGkvlf/Y2hHFoIeopz8cqV9p49KSdAnoM9QZnAMy9RAI0NmOvVUb+98bkOlTqpKYDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3C+MOE5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3C+MOE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125804; x=1820661804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
  b=M3C+MOE5ICUn5k2NQdmcSIz5wucm9L4eM/Z2KP50NVcwOcS2ktKjfbIs
   3Lz3C/UOgR9XNiywOOqhSBGo5QL1GKok+XL8IKLiG6Sr1j11p1oP9hPgp
   0f0Fu2C3kesyz+wpVUfETuJVoCvS5dfCEMkjeY6wyVmT1ghskcQYBzzo5
   onrQKl5BHM94Y0JDSmhBQRDt4phUQBwuCbj2MMMYv0Ef/S7WCdBiQ3TCw
   lnCozRfCSRYkpaAGcqcNTB/KZoOCufCV/pjkW64pA+QYVLH3YTHBKPcQy
   t1NJ5miqFlxn5FFcTTmPg270WDcQ9ZPwEnzPazW1zNa3YQByAiHN+R+kA
   Q==;
X-CSE-ConnectionGUID: 8QvZq1e8SkiKPeqfZhvPjQ==
X-CSE-MsgGUID: tGA8ppTOQa6n1EhLmgmLMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750047"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:42 -0700
X-CSE-ConnectionGUID: cVFykjBSS7e9EeIMowxUPA==
X-CSE-MsgGUID: qRp0SzEHRseVIK7MFDyqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213491"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v3 20/26] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
Date: Fri, 11 Sep 2026 14:21:46 +0300
Message-ID: <20260911112152.28528-21-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FAST_MODE allows the host DMA to work in opportunistic, free running mode,
which matches with the bitstream nature of compressed devices.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 +++
 sound/soc/sof/ipc4-topology.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 42cf444e847e..566913025cc7 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -744,6 +744,9 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 			sps->dsp_max_burst_size_in_ms = 1;
 	}
 
+	if (spcm->pcm.compress)
+		ipc4_copier->data.copier_feature_mask |= BIT(SOF_IPC4_COPIER_FAST_MODE);
+
 skip_gtw_cfg:
 	ipc4_copier->gtw_attr = kzalloc_obj(*ipc4_copier->gtw_attr);
 	if (!ipc4_copier->gtw_attr) {
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 5e78f3de092e..c2949ff979a5 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -222,6 +222,11 @@ struct sof_copier_gateway_cfg {
 	uint32_t config_data[];
 };
 
+/* bit definition in copier_feature_mask */
+enum sof_ipc4_copier_feature {
+	SOF_IPC4_COPIER_FAST_MODE = 0, /* free running mode of host copier */
+};
+
 /**
  * struct sof_ipc4_copier_data - IPC data for copier
  * @base_config: Base configuration including input audio format
-- 
2.55.0

