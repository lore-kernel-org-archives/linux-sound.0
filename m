Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B913A888
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699809; cv=none; b=bbOKWqVczv+MyCK2wb5PaiTHwjjZwoW2aQkBeQ5jbyp1KDFFQNIgvESsmr6INJZmMdQcknr9svslUBVlMyoSpWU5FoUggJXpWDnN8bxzXifFal9eOSwSahLQe1Mj8/L3zHXfpwCNAM0hstbaVqBQ2plVDB9K1+cVnJuxF+iK6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699809; c=relaxed/simple;
	bh=qODyqaFXsO6ESSl9ce+sfry4WZpwUyoayYikp6lXlIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RidHnRy2ZMDWnF4MMFyFbm7042orjkIcDGr1OaQoHbTvazx48XC3ImJPXnjc5p/gJPe0ab2ButP1km1s+69bBtcWBPjAcYanMWvTrpPoIr98sbJhu7qYiMulHmLwJKAQxzJTBrbBPILi4rvEswdYhQxdK9EVFpsUxnE9EPbs5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtLaRIqo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtLaRIqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732699807; x=1764235807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qODyqaFXsO6ESSl9ce+sfry4WZpwUyoayYikp6lXlIA=;
  b=CtLaRIqo1cRcBtqB9RI9AYpaGSerySO5VoRDzKQDNtuY/MIOqv6ISPOk
   7E0MK/lM9e72/5sPsyAU/6bu+pbtkht6XiPXRZ7pdt76KbrYsF3XWcZm6
   ErlqigVrwcbBadaeZLN6bGODqeogzfKy+LRTe6XlJ3RjwG5nGaeNju3F1
   Nz0ND8XM7mgYQ/PSZ+8kF2ZX8JVKDaRkX71PaUNKnXtKDQf2oFKaLcbtG
   C5RAXSD8fM+3tqGX2kkJrGUax5qBRWHVNpQcAPZnAhp44naQ1qW42ktGW
   uKYWhN1wZ5Kon23hMxkeiJoaCNRg1aR0qxx3bQs4HCq3hYnqDzsdrh+PL
   w==;
X-CSE-ConnectionGUID: T1tCukQ+QYepwHuGXKacjA==
X-CSE-MsgGUID: 1gBPUXviQi6UT9jufcpExw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36817140"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36817140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:30:06 -0800
X-CSE-ConnectionGUID: Ik0V8nlKT2qUD8d9GRYi9g==
X-CSE-MsgGUID: 2ifKDSK0Tyq/pYmLRhBe7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96947760"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.229])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:30:05 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	deep.harsora@dell.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index
Date: Wed, 27 Nov 2024 17:29:54 +0800
Message-ID: <20241127092955.20026-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel SoundWire machine driver always uses Pin number 2 and above.
Currently, the pin number is used as the FW DAI index directly. As a
result, FW DAI 0 and 1 are never used. That worked fine because we use
up to 2 DAIs in a SDW link. Convert the topology pin index to ALH dai
index, the mapping is using 2-off indexing, iow, pin #2 is ALH dai #0.

The issue exists since beginning. And the Fixes tag is the first commit
that this commit can be applied.

Fixes: b66bfc3a9810 ("ASoC: SOF: sof-audio: Fix broken early bclk feature for SSP")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index be61e377e59e..c2fce554a674 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -20,6 +20,9 @@
 /* size of tplg ABI in bytes */
 #define SOF_IPC3_TPLG_ABI_SIZE 3
 
+/* Base of SOF_DAI_INTEL_ALH, this should be aligned with SOC_SDW_INTEL_BIDIR_PDI_BASE */
+#define INTEL_ALH_DAI_INDEX_BASE 2
+
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
@@ -1594,6 +1597,17 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	if (ret < 0)
 		goto free;
 
+	/* Subtract the base to match the FW dai index. */
+	if (comp_dai->type == SOF_DAI_INTEL_ALH) {
+		if (comp_dai->dai_index < INTEL_ALH_DAI_INDEX_BASE) {
+			dev_err(sdev->dev,
+				"Invalid ALH dai index %d, only Pin numbers >= %d can be used\n",
+				comp_dai->dai_index, INTEL_ALH_DAI_INDEX_BASE);
+			return -EINVAL;
+		}
+		comp_dai->dai_index -= INTEL_ALH_DAI_INDEX_BASE;
+	}
+
 	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
 		swidget->widget->name, comp_dai->type, comp_dai->dai_index);
 	sof_dbg_comp_config(scomp, &comp_dai->config);
@@ -2167,8 +2181,16 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	case SOF_DAI_INTEL_ALH:
 		if (data) {
 			/* save the dai_index during hw_params and reuse it for hw_free */
-			if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS)
-				config->dai_index = data->dai_index;
+			if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+				/* Subtract the base to match the FW dai index. */
+				if (data->dai_index < INTEL_ALH_DAI_INDEX_BASE) {
+					dev_err(sdev->dev,
+						"Invalid ALH dai index %d, only Pin numbers >= %d can be used\n",
+						config->dai_index, INTEL_ALH_DAI_INDEX_BASE);
+					return -EINVAL;
+				}
+				config->dai_index = data->dai_index - INTEL_ALH_DAI_INDEX_BASE;
+			}
 			config->alh.stream_id = data->dai_data;
 		}
 		break;
-- 
2.43.0

