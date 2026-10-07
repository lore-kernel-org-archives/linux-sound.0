Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291C450917
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363041; cv=none; b=oM/cVSV3lFNXrg+rC+HkBWPliGau5wHVXogoV9qflykTN02l+MtzoPQnqp3Lqo/zeO/A+uYEwYH3zlqcdScxNeyT5wbpVvxHwoup5Fvy2JcSTpls5G0xU5Yla+g8RCXgWNVvdSU2RiRbOfJd7XpwWcssU0eYuN3ea+UQ4eUPZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363041; c=relaxed/simple;
	bh=hzIofKcm+CVbOsOJC+YrO20Be/IHVyYmOpFftnx8noI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/FrToMkpEuV8owfPTECwe+8qFYuHcUAABR9+NvGBtYp3hpcSht5YrD8o6j0DGeKKKLe9L06kk5BUfQNwL+ONp7E/EbYLDMrZToPzwt0nQtNgsTw4iq9spcFY3qcZOFnJ04CXqnD79dJmEiLJCNP0a1XFLzDovaXS3SzUDta+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huBLwHDI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huBLwHDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363041; x=1822899041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzIofKcm+CVbOsOJC+YrO20Be/IHVyYmOpFftnx8noI=;
  b=huBLwHDIK5LYQcWbqj7wjTYHguhrYONCZI70BDTg82rjT+EvPeNudm3p
   iLXCvBUaqIjoM6HgfOGL6IAIwXMzfQBk6i9dtt1trLDuQkDskarl28MwY
   82jMlWESI1miTnilhSUxDx0XRcMY43lbUSwWkrbYgTNGnpax6JtBDe8B5
   7R1HzMeamo7i3k6CVeGbyMXsqTTJqb/V+/kVYB9Tii/vV19w5UYaG+kEK
   SCQ9PAgUBojX6HSz37aQh15lmiV5Pa9c5vVqZq+Kcv6qy8ddZurXLvpnE
   IZm15onLDFSkKLAaZqZOBR4gnMNFJFo5+yEr/CnvtZhbXUssaS5kBvrdd
   Q==;
X-CSE-ConnectionGUID: /XtiBRFEQr22p1NX4FPIQw==
X-CSE-MsgGUID: RJ2XdGd4RqaQgkXq7/iTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114035"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:41 -0700
X-CSE-ConnectionGUID: vcmPKIrPThiaIS//CA9ngg==
X-CSE-MsgGUID: X1jtiHS0R0uE7/Rj1TDZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670791"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:38 -0700
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
Subject: [PATCH v5 21/28] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
Date: Wed,  7 Oct 2026 11:49:48 +0300
Message-ID: <20261007084955.1256-22-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
index 4d3621fd134a..ebe58d9d9442 100644
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
2.56.0

