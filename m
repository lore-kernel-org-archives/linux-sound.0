Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54E2261A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819164; cv=none; b=T75BO7Fa4eMeJOizZ5vtx7+xRJLS3tKZygesWnc17lp6wuvSuVY0UbAencoJo41kPLi1sNd0ycHCAVlVxYBeGV4FgfqLtHG4glhQFXrS7oGfwpLdx9xnrrFv+o0oAIHiW3mdD/wdH6wbDt5AjTF/W+AQrAdF1n9o3w5zNg8LUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819164; c=relaxed/simple;
	bh=oF0eiQITn/in1apsKqVonvwyIcx8vKjMJvBwWZ+X4NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stkO28c75m0FcoeAurungayZpY9og4dN/HWbaTAdelTq7bqkpG2I0Hr2Ub3x57A8CsuZv/+Lpv4xmx4GBHhhUXKAOS9ZOw674WP7+qCdPR3u2VurlGct4aOEyRn+UEQKRK4yfho6QVi2pVJrMqlql+V5y+8lup3rtTXoAYqyoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWexzr+9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWexzr+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819162; x=1739355162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oF0eiQITn/in1apsKqVonvwyIcx8vKjMJvBwWZ+X4NM=;
  b=eWexzr+91qoqQ+lwzm/PROkUXrmGWNkoDqE3LvrcIe3ILtdWfddGlMv+
   3+P3kHFkpOT65CAfJkNgopTvAI8w0lVV5nREgFelMiXvw2zia4L65naIX
   whoArShJNPWQHjk10RG+4s7Ba4s+fA0snv1LB2TdSAUzGEVjZG1MiFLq5
   vACgggRWuj5lzu3t2it911lnCPsE8KEqzdiKhuavM6bmiHaqkjkXenvN2
   501QV/c+5b6cYDJNFHUVthpCvipWhZe2YXLr+fyv6N1srDpIoRl8OdflO
   SE5Ru4f0P15iwF7e8xMF7MiLFzW8TinQDEbN5SwDt0CQrTo5e895GQZUA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260149"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260149"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498007"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 01/15] ASoC: SOF: ipc4-topology: change chain_dma handling in dai_config
Date: Tue, 13 Feb 2024 12:12:33 +0200
Message-ID: <20240213101247.28887-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The chain_dma mode is currently only handled for HDaudio, but can be
used for orther DAIs starting with LunarLake. Move the chain_dma
handling earlier.

Error detection for the chain_dma case for older platforms is handled
at a different level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f779156fe0e6..8ac35e6df75f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2796,13 +2796,14 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	if (!data)
 		return 0;
 
+	if (pipeline->use_chain_dma) {
+		pipeline->msg.primary &= ~SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_MASK;
+		pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(data->dai_data);
+		return 0;
+	}
+
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_HDA:
-		if (pipeline->use_chain_dma) {
-			pipeline->msg.primary &= ~SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_MASK;
-			pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(data->dai_data);
-			break;
-		}
 		gtw_attr = ipc4_copier->gtw_attr;
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
 		fallthrough;
-- 
2.43.0

