Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD7E3B9D83
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507145; cv=none; b=ZrSD3lc/+d2ufHzTq/jKP/7YEAmPtadMCdp2rLnnAWvmB2NjqPSHsU/A7SGSsXYHT22WGqgxJjpHTNbma6afaf1IKHIl9ro5vdzl5mIhyBK94k2y7l+r5Nepv29fz1+XmVx1VXQTQOq7mZQwhMs8bEy+UOPHzsbiGb94coWePL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507145; c=relaxed/simple;
	bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGyfodYy9sLSjFubB1DtIsXNCbTMD1DasM4n7xTiZeztuFldnZd3LKfG2h3IwRTWpSVg81HTsCcKg5y923F4a1VTjudLrhIPk/hiP4XTB7ndltOc9y1qtIxQBtWgR93W3zz75yq1E8c6mPljqDlbftskkQ8D5GHI7gzmeyKHoOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amQfMQBG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amQfMQBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507144; x=1820043144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
  b=amQfMQBGfXlvVvdJbWtsQPsThZg/60Hb3kLXtfeqC+v9MtY6AoJ6G69G
   n5QK9cJCQ2MEElcShtSMTKPb+YEPYCp2ru7LrmxoTCTO1q6/03V+ZEe4n
   JnhUb/i5yTUgcecIMI9GbvFa4viORexwLQ2F9+kTcQQMynrfsYz5dHfzG
   GS/i0laLknE6BDyAKhUMMfvIqwYRfKplRZzsYRto/ITRq3ffPDpIrvJbm
   /cCLO6Krtj8jk29y6CzYBMOoAC7Z5nCOBoFzYEd6iMTq13SZ/yQSDxECg
   +5oIbuoAHp7jVkSIVZJ79mnCBo96547pqU8GJGhDgkhdZ1uO/Ubj2eHVv
   Q==;
X-CSE-ConnectionGUID: fhGcxhENRGG8UqnQ2xpMQQ==
X-CSE-MsgGUID: NWugpkD/QbGp/EppPBLFsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778030"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:24 -0700
X-CSE-ConnectionGUID: bXVaxDHYT/u/Wf0BYCe7FQ==
X-CSE-MsgGUID: RHpNqMqOQOS9ajM58D2TVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480692"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:20 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 18/23] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
Date: Fri,  4 Sep 2026 10:31:29 +0300
Message-ID: <20260904073134.29648-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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

