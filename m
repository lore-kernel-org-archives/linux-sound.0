Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86B23A9A0
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335093; cv=none; b=udjF++NrORZZwTP+Tr5Dccy3KgRt1+Vye0or4KFnCpwkdAe04jtSRGBwjA6RPCKyimz3H7S04Yz1lA6+DZlrdHD9Pw4tSkGDPVto8EBbxQQQ3jvERAVicn7RFkdxANkF9/baZrTqg2YMdMEXtDgTDFu5V8kdsZZ43Lnzkev0bVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335093; c=relaxed/simple;
	bh=aoECyn81Js9hrgCzRMD+E9eIlNgPe2S/vmzBKArMZAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPt9OQ0bMNa1JEFF0G0Mus7dz/GjdzvjMjYsF3zgr+ckBL8MtyYfcUOeeUn6bWFg4gxVctsoPbaDafRI3TjhmJIRWbMadvGdkd7TEGPxNxLDEk9pd97qnPfz5cjWZMz/j2pLypxIMXfYU5rNz8K6+vXsMjxP4/BUJZDxNeRHssU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WC2cnzpJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WC2cnzpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335092; x=1781871092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aoECyn81Js9hrgCzRMD+E9eIlNgPe2S/vmzBKArMZAc=;
  b=WC2cnzpJ1YSy96S0QiLG2lBmSYqViouH9RBtPxwy1/ldM1kZKiYxOY96
   bDk5socKMuYtiOYux1yzqoyLzSRd6Sa7JB8rlWq9aB+As77iGoALJQ2a0
   HatNod/gFSkEfRRLpg9SETNnD1jXLAh8VsppJVe9sr5I0c7lWmJvu90ug
   EKaexG+bavLmB+Y9dsmYhhuhqV6RJaeDHa1NUqTi+8nnOAv2A+z68aJUj
   HD12BsvD5hi0fdwSY3WY2C8JCDiQ3gDLSoTXOYWBAawoq9rF6GpsVb0C+
   JOjvSmPlv2iERzhUcc9ADj00xRvNdbx9PPn4lGLJx/shsTOP1Z9wZtnRs
   A==;
X-CSE-ConnectionGUID: 1r0d4On6ScWlfC04R6qLlQ==
X-CSE-MsgGUID: /6rCUAUhSsigfOPGqS3FCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52555707"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52555707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:29 -0700
X-CSE-ConnectionGUID: YLoWWL8PSjGgIYv2uU01dA==
X-CSE-MsgGUID: Yu7mxdrITz+UFhqPkt39Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155013366"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: ipc4-pcm: Pipe instances to dev_dbg in multi_pipeline_state()
Date: Thu, 19 Jun 2025 15:11:20 +0300
Message-ID: <20250619121121.25241-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
References: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add a dev_dbg to sof_ipc4_set_multi_pipeline_state(). The debug print
lists the pipeline instance numbers that are included in the
SOF_IPC4_GLB_SET_PIPELINE_STATE message. Without this log its very
hard to tell what pipelines are affected. This print is very helpful
when analyzing SOF logs automatically.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 8eee3e1aadf9..be4518d8970b 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -56,17 +56,41 @@ sof_ipc4_sps_to_time_info(struct snd_sof_pcm_stream *sps)
 	return stream_priv->time_info;
 }
 
+static
+char *sof_ipc4_set_multi_pipeline_state_debug(struct snd_sof_dev *sdev, char *buf, size_t size,
+					      struct ipc4_pipeline_set_state_data *trigger_list)
+{
+	int i, offset = 0;
+
+	for (i = 0; i < trigger_list->count; i++) {
+		offset += snprintf(buf + offset, size - offset, " %d",
+				   trigger_list->pipeline_instance_ids[i]);
+
+		if (offset >= size - 1) {
+			buf[size - 1] = '\0';
+			break;
+		}
+	}
+	return buf;
+}
+
 static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state,
 					     struct ipc4_pipeline_set_state_data *trigger_list)
 {
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 primary, ipc_size;
+	char debug_buf[32];
 
 	/* trigger a single pipeline */
 	if (trigger_list->count == 1)
 		return sof_ipc4_set_pipeline_state(sdev, trigger_list->pipeline_instance_ids[0],
 						   state);
 
+	dev_dbg(sdev->dev, "Set pipelines %s to state %d%s",
+		sof_ipc4_set_multi_pipeline_state_debug(sdev, debug_buf, sizeof(debug_buf),
+							trigger_list),
+		state, sof_ipc4_pipeline_state_str(state));
+
 	primary = state;
 	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
 	primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
-- 
2.49.0

