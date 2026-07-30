Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB73B6C14
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408072; cv=none; b=ndAcSJwbvJSjN/psjkPq7Aqe8ZQbxS2N+j01XrsGvqBbf1pEIKiQMtR0PfriKxvOdTnDXzYnqqu3L0vep8Kju7YizwuQsrwcvHauRGr0LFdpipg8S7aWfe8G/JUsDM+wMyVXSnABtcsq3xLqdvaJFQ7rcqrVG8lDQetbmKONs2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408072; c=relaxed/simple;
	bh=epnvQ6cxRDmFT5kEZIJf4dAXYLjLRyJ3Rz+Zvmv/Ks8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4yN5XbDzS37gg3rNvivkB2VbdoL1tsK8HzKyl+u7KNFXVIae46/9hk9QdiExWTG9O3o82KNbU+sT0HRUMP0oCBQVKbFlxhS6sllXUtvs2MNvMLNuMmZrgrg4mnjFalT4nDAgV2h6l7uLdjsi9fVp9mJPFB7MWWguwUuCOFBSzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcZqTdS+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcZqTdS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408070; x=1816944070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=epnvQ6cxRDmFT5kEZIJf4dAXYLjLRyJ3Rz+Zvmv/Ks8=;
  b=XcZqTdS+ErpCWXa90IRtK1Wp9p1h3FMqmeDoBUfaXClmiLeYHZk1j+PY
   NAt5RCvzd6hiH4H3V7kKnrNuGOvyk/5XDqkCGaghp/d1UeNTx410he8Tw
   FtrdRFlxBaPKF+29+t59tYowFkeSYJqwBG4qXeRhv5a80Vwq2xkkJSrAB
   H0ijzvTdxKAladUPrfRXZ8P/bpQ+5Ixk/lqcGpkPvdRQgBB12YHPkAfqA
   l+21DxyB0uwUCejvcAjZ11ziUdOD3aIQwiffJOWDi7CyDkhSsTDhivgII
   OZJg0QUKCmjVX9gd1I+md09Y1MSBXqUEs8BEjU4z0l3dtc+Jkx8Vl7rl3
   g==;
X-CSE-ConnectionGUID: 6P/PHzgbQsSBzsj158Q0iA==
X-CSE-MsgGUID: +8a847P6RaC3b4kDTKxGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817758"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:10 -0700
X-CSE-ConnectionGUID: A260xpmxTTeDgFfhMITz9Q==
X-CSE-MsgGUID: 0pYrwFFASVe0ko0tJcKQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221307"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 1/6] ASoC: SOF: ipc4-topology: Remove dp_ from all module memory attributes
Date: Thu, 30 Jul 2026 13:41:36 +0300
Message-ID: <20260730104141.14817-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Remove dp-prefix from all module instance's memory attributes and
related data structures. The attributes are not anymore exclusively
for Data Processing module instances, but generic for all module
instances. However, the module init payload is still only for DP
module instances.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 14 +++++++-------
 sound/soc/sof/sof-audio.h     |  8 ++++----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 8ac7dde32f77..7808a679e25d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -163,11 +163,11 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 	{SOF_TKN_COMP_SCHED_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_domain,
 		offsetof(struct snd_sof_widget, comp_domain)},
 	{SOF_TKN_COMP_DOMAIN_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct snd_sof_widget, dp_domain_id)},
+		offsetof(struct snd_sof_widget, domain_id)},
 	{SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct snd_sof_widget, dp_heap_bytes)},
+		offsetof(struct snd_sof_widget, heap_bytes)},
 	{SOF_TKN_COMP_STACK_BYTES_REQUIREMENT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct snd_sof_widget, dp_stack_bytes)},
+		offsetof(struct snd_sof_widget, stack_bytes)},
 };
 
 static const struct sof_topology_token gain_tokens[] = {
@@ -3118,7 +3118,7 @@ static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
 
 	/* Add object array objects after ext_init */
 
-	/* Add dp_memory_data if comp_domain indicates DP */
+	/* Add memory_data if comp_domain indicates DP */
 	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
 		hdr = (struct sof_ipc4_module_init_ext_object *)&payload[ext_pos];
 		hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
@@ -3127,9 +3127,9 @@ static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
 								     sizeof(u32)));
 		ext_pos += DIV_ROUND_UP(sizeof(*hdr), sizeof(u32));
 		dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[ext_pos];
-		dp_mem_data->domain_id = swidget->dp_domain_id;
-		dp_mem_data->stack_bytes = swidget->dp_stack_bytes;
-		dp_mem_data->heap_bytes = swidget->dp_heap_bytes;
+		dp_mem_data->domain_id = swidget->domain_id;
+		dp_mem_data->stack_bytes = swidget->stack_bytes;
+		dp_mem_data->heap_bytes = swidget->heap_bytes;
 		ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
 	}
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 138e5fcc2dd0..ae95efc9be1c 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -459,10 +459,10 @@ struct snd_sof_widget {
 	/* Scheduling domain (enum sof_comp_domain), unset, Low Latency, or Data Processing */
 	u32 comp_domain;
 
-	/* The values below are added to mod_init pay load if comp_domain indicates DP component */
-	u32 dp_domain_id;	/* DP process userspace domain ID */
-	u32 dp_stack_bytes;	/* DP process stack size requirement in bytes */
-	u32 dp_heap_bytes;	/* DP process heap size requirement in bytes */
+	/* Module instance's memory configuration. */
+	u32 domain_id;		/* Module instance's userspace domain ID */
+	u32 stack_bytes;	/* Module instance's stack size requirement */
+	u32 heap_bytes;		/* Module instance's heap size requirement */
 
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
-- 
2.55.0

