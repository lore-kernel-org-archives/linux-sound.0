Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A34915B7
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945038; cv=none; b=N1kIWrM4Q71hX7zfVrLpj/dbZBc6Lp5sngsWYnq/3Qg/mvjIgomfEvUC8ZSqJvFqf2x65CuNQPgBBV7dGhjCzsBEXh6pYwc8yYuPyHAkOkcE+IUCL3EmR/L82p3X0Vampr5Ay5fPReNkwHncF0xp1GA3EYk2BBMlaou6LKqLo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945038; c=relaxed/simple;
	bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIXgeCqmze1uUeQAyLxWsm5xG8G6i6yEqtC913N3LnVVrU7RgvPnFrbCX6umuP2HlChBuHCJ4c/pAm9dhzy7XcpBbaPJpPSBc7Qs6yZhiTfNcsHsthAtRVskpO2lCrX8jCQZLlbaOZeuei8G1Q9+w7uIdDjdLkUyNuQHVDSQ8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0aQnQsA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0aQnQsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945037; x=1820481037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
  b=H0aQnQsA9t3IvxyTZxUzEoTrFOjeAn39iziUmqcyIb5htn9sTw632Zqh
   CzzkOD1LStABx2wxWUWjPwD7sOza+ZLwBYtVlULLAL6Ttayt0Nvg7GJ8u
   YePQWpEwxZHVdqQgsJ5OCdscucuyqFfBOcpo168ktWhcyMuxQBt0U9UPv
   PfVyKI94Sy9fsECm/ZoAgnuAtMN4MCAeD0FGdQb0uCpDeoNJKutypATVt
   Dy2rHNEyXRpOTp+wkGHQNXMsA60sgJS6eIZ9mezWIvDBqYXN413JlxzF4
   U1TlC50c1Q4rw8Wj8tRxq1E34Eg5DXea/QewRzkPagM+1/z8dq5UYEili
   g==;
X-CSE-ConnectionGUID: F6xw/NmbQ6q1SZspwjWo7A==
X-CSE-MsgGUID: Im9xQf6ORXCa0SJ4agbIPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200836"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:36 -0700
X-CSE-ConnectionGUID: PI4wSbNoQfaH5NjfscdZtQ==
X-CSE-MsgGUID: HGiOGgnySEWQ2Ei1KyggDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973260"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:33 -0700
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
Subject: [PATCH v2 19/24] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
Date: Wed,  9 Sep 2026 12:09:44 +0300
Message-ID: <20260909090949.7503-20-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

