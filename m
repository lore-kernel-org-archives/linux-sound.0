Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC982DA755
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217520; cv=none; b=HvKt7QgG705hGLURqS4D1cSsnWUrIg3/IqkWx7bLs9iV6eOm1NTKnCfgE05X5rPNgBOqZIPaP/f1xOdR9uV389/EGw6NtKc4filEOk6mdVcwfWZferuRpHYhbzvC/S66GFghXE6UXafwY25LNl42rCDGQ1O/HpyDXOf2k8vs+6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217520; c=relaxed/simple;
	bh=NySCeFE4m1yZ8Iwd8nQr2HV9sYr8f9jHIXsBk6SyHOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WC1wr7Kz0Ju2QsoX7dC2dUoE7K6oAlWXmV/J2VvMUIqzXtJ9zaSjQokMPSPzgFH8BFDMwWbm8YFTroCNu3Z8wfcdm/HKpTNhmGySHc4ueZQrrPnPEtlI+pX0LH3Un3hppgWKYpoSpyJ+4JZaYbmROscyT9OaQZ7LZmQD6y8sTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWZiWPDd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWZiWPDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217519; x=1799753519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NySCeFE4m1yZ8Iwd8nQr2HV9sYr8f9jHIXsBk6SyHOw=;
  b=EWZiWPDd2R9SWBZ12zBD0vFheWACYV0cDW+5jQJwo21UHCmuKGcH7Hfy
   s6+lLAevpMRV0h+WL0Jto+fxzc2epPGl+j1L6R25ipZOKuGzB1sZom+Fk
   5ub/ivUE5QOBY3HD7mjzqQTRg/ZMv5bKlsw+QaKwJPnlkoCVyKU3elV6B
   cdFypnHHGLNZL/h2fRq1NQtD5Y/zqUrb01T1zTZgjDhBVKOutA8LO7xwc
   Oh3Y95QMn7aqzWMCIJV8FxZTP7+Y0L7OaHz0i09MczYnBd3FFPcdhbwr6
   L7RFxqhuf8naAuvnIfSNbzuBSSCVNXlbYyedMJ9gM+JTbVkZhEktJNnA+
   w==;
X-CSE-ConnectionGUID: xzgSOeB1Tfe4xy/8to+RmA==
X-CSE-MsgGUID: 5PeUNb8kTo2s3maHPNbb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69539757"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69539757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:58 -0800
X-CSE-ConnectionGUID: c3K0WyRsStqviASoWPetfw==
X-CSE-MsgGUID: LSfOEl4ZSAGDCzKTXkPySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203224328"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 4/4] ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it
Date: Mon, 12 Jan 2026 13:32:21 +0200
Message-ID: <20260112113221.4442-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
References: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add of_ipc4_widget_setup_msg_payload() for adding struct
sof_ipc4_module_init_ext_init payload with associated objects. The
function allocates memory for the additional payload, sets up the
payload according to data collected from topology, and copies
pre-encoded module specific payload after the ext_init payload. The
function is called in sof_ipc4_widget_setup().

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 85 +++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a14023c4c3e7..f997b95d9cec 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2974,6 +2974,77 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 	return 0;
 }
 
+static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
+					     struct snd_sof_widget *swidget,
+					     struct sof_ipc4_msg *msg,
+					     void *ipc_data, u32 ipc_size,
+					     void **new_data)
+{
+	struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
+	struct sof_ipc4_module_init_ext_init *ext_init;
+	struct sof_ipc4_module_init_ext_object *hdr;
+	int new_size;
+	u32 *payload;
+	u32 ext_pos;
+
+	/* For the moment the only reason for adding init_ext_init payload is DP
+	 * memory data. If both stack and heap size are 0 (= use default), then
+	 * there is no need for init_ext_init payload.
+	 */
+	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP) {
+		msg->extension &= ~SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK;
+		return 0;
+	}
+
+	payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	/* Add ext_init first and set objects array flag to 1 */
+	ext_init = (struct sof_ipc4_module_init_ext_init *)payload;
+	ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
+	ext_pos = DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
+
+	/* Add object array objects after ext_init */
+
+	/* Add dp_memory_data if comp_domain indicates DP */
+	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
+		hdr = (struct sof_ipc4_module_init_ext_object *)&payload[ext_pos];
+		hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
+			SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
+			SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
+								     sizeof(u32)));
+		ext_pos += DIV_ROUND_UP(sizeof(*hdr), sizeof(u32));
+		dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[ext_pos];
+		dp_mem_data->domain_id = swidget->dp_domain_id;
+		dp_mem_data->stack_bytes = swidget->dp_stack_bytes;
+		dp_mem_data->heap_bytes = swidget->dp_heap_bytes;
+		ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
+	}
+
+	/* If another array object is added, remember clear previous OBJ_LAST bit */
+
+	/* Calculate final size and check that it fits to max payload size */
+	new_size = ext_pos * sizeof(u32) + ipc_size;
+	if (new_size > sdev->ipc->max_payload_size) {
+		dev_err(sdev->dev, "Max ipc payload size %zu exceeded: %u",
+			sdev->ipc->max_payload_size, new_size);
+		kfree(payload);
+		return -EINVAL;
+	}
+	*new_data = payload;
+
+	/* Copy module specific ipc_payload to end */
+	memcpy(&payload[ext_pos], ipc_data, ipc_size);
+
+	/* Update msg extension bits according to the payload changes */
+	msg->extension |= SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK;
+	msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
+	msg->extension |= SOF_IPC4_MOD_EXT_PARAM_SIZE(DIV_ROUND_UP(new_size, sizeof(u32)));
+
+	return new_size;
+}
+
 static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
@@ -2981,6 +3052,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	struct sof_ipc4_pipeline *pipeline;
 	struct sof_ipc4_msg *msg;
 	void *ipc_data = NULL;
+	void *ext_data = NULL;
 	u32 ipc_size = 0;
 	int ret;
 
@@ -3125,6 +3197,16 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		dev_dbg(sdev->dev, "Create widget %s (pipe %d) - ID %d, instance %d, core %d\n",
 			swidget->widget->name, swidget->pipeline_id, module_id,
 			swidget->instance_id, swidget->core);
+
+		ret = sof_ipc4_widget_setup_msg_payload(sdev, swidget, msg, ipc_data, ipc_size,
+							&ext_data);
+		if (ret < 0)
+			goto fail;
+
+		if (ret > 0) {
+			ipc_size = ret;
+			ipc_data = ext_data;
+		}
 	} else {
 		dev_dbg(sdev->dev, "Create pipeline %s (pipe %d) - instance %d, core %d\n",
 			swidget->widget->name, swidget->pipeline_id,
@@ -3135,6 +3217,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	msg->data_ptr = ipc_data;
 
 	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, ipc_size);
+
+fail:
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to create module %s\n", swidget->widget->name);
 
@@ -3147,6 +3231,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		}
 	}
 
+	kfree(ext_data);
 	return ret;
 }
 
-- 
2.52.0

