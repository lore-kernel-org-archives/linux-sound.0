Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA43FFFA5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408084; cv=none; b=P4NCQP0WKk2EbpJZxGliLMl3Pq218+6VEdxIhuntf5Ykm9XT1S6iMneJZpz0hUwmJslPjeXeK/iHodWq+uTmt5vw0Wmr4JSzi8JBFSrqrmS6Gd0sQEoZN7oopsbu6O5exMc8MD16i1/51r0KkMd9VkSqHvX3aqijIMYmyAs81Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408084; c=relaxed/simple;
	bh=ctgtZ+lwMn//aas532wPOdWVrIk+aVoQ8iPuY2KX8/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/pulcFYg9whyPa2DmtlLYj/x8DPp5pgLqSxljV+RUgaMrci2XFTAuEBUSj6fr+9K7ChclSecPhBLwetLqRDc5PtfHFg5gru9xWOxlC/pEwIbeGB1ti0RCaK0ePe+kWzGktYpHOzIJvKMqL0xgM2YUdZ+8sym3+p0DsIJ64vfws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGGb45fe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGGb45fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408082; x=1816944082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ctgtZ+lwMn//aas532wPOdWVrIk+aVoQ8iPuY2KX8/Q=;
  b=lGGb45fe5SGVNGOuZ1cTrqFQQzQ2FiAEGts7EOswufoZ9wyzGFVpLL+A
   aSTJUxRKy7T7VzpEvxaSAzAhZA9LXA7Sc3hxKa7uPvyYvNJxocazgi0+7
   bb4rF8WTSebIhoaMYenPdRWZucluQAdsofGRzLA2xq7YHDfDONq9jBSGQ
   HfqAbuUwp9O7irlMv8UUJ8nDa6JPy6aCgpuLNGBsDQ/lmeAnNGx5d6FtK
   W/I7dpQVi2SfC6DMfvJR8bWu/0gCNbcIS8yMp6W2XV25pChftxJfKR6fN
   elXyQrFVjdIcqnET3Nb35ZbPkkZETU1RP15kina1TiLRUEbvCFSFQg0tU
   w==;
X-CSE-ConnectionGUID: PjhsIe24Qru03cgVjzmwdA==
X-CSE-MsgGUID: 08nZVwh+SGS9FtxwMX5DPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817803"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:22 -0700
X-CSE-ConnectionGUID: qKem75t0TzSxO3xvMCCCYQ==
X-CSE-MsgGUID: JH0FyojWQK2aLfvjtEDSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221322"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 6/6] ASoC: SOF: ipc4-topology: Refactor sof_ipc4_widget_mod_init_msg_payload()
Date: Thu, 30 Jul 2026 13:41:41 +0300
Message-ID: <20260730104141.14817-7-peter.ujfalusi@linux.intel.com>
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

Refactor sof_ipc4_widget_mod_init_msg_payload() to be easier to extend.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 65 ++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 02948b2a809b..45f434c86cf9 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3103,27 +3103,47 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 	return 0;
 }
 
+static void sof_ipc4_add_init_ext_dp_memory_data(struct snd_sof_dev *sdev,
+						 struct snd_sof_widget *swidget,
+						 u32 *payload, u32 *ext_pos,
+						 struct sof_ipc4_module_init_ext_object **hdr)
+{
+	/* Add memory_data if comp_domain indicates DP */
+	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
+		struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
+
+		*hdr = (struct sof_ipc4_module_init_ext_object *)&payload[*ext_pos];
+		(*hdr)->header =
+			SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
+			SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
+								     sizeof(u32)));
+		*ext_pos += DIV_ROUND_UP(sizeof(**hdr), sizeof(u32));
+		dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[*ext_pos];
+		dp_mem_data->domain_id = swidget->domain_id;
+		dp_mem_data->stack_bytes = swidget->stack_bytes;
+		dp_mem_data->heap_bytes = swidget->heap_bytes;
+		*ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
+	}
+}
+
 static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
 						struct snd_sof_widget *swidget,
 						struct sof_ipc4_msg *msg,
 						void *ipc_data, u32 ipc_size,
 						void **new_data)
 {
-	struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
 	struct sof_ipc4_module_init_ext_init *ext_init;
-	struct sof_ipc4_module_init_ext_object *hdr;
+	struct sof_ipc4_module_init_ext_object *hdr = NULL;
 	int new_size;
 	u32 *payload;
 	u32 ext_pos;
 
-	/* For the moment the only reason for adding init_ext_init payload is DP
-	 * memory data. If both stack and heap size are 0 (= use default), then
-	 * there is no need for init_ext_init payload.
+	/*
+	 * Only DP widgets currently add init-ext objects here. Avoid allocating
+	 * a max-sized payload buffer for widgets that will immediately return 0.
 	 */
-	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP) {
-		msg->extension &= ~SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK;
+	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP)
 		return 0;
-	}
 
 	payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
 	if (!payload)
@@ -3135,23 +3155,22 @@ static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
 
 	/* Add object array objects after ext_init */
 
-	/* Add memory_data if comp_domain indicates DP */
-	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
-		ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
+	sof_ipc4_add_init_ext_dp_memory_data(sdev, swidget, payload, &ext_pos, &hdr);
 
-		hdr = (struct sof_ipc4_module_init_ext_object *)&payload[ext_pos];
-		hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
-			SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
-			SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
-								     sizeof(u32)));
-		ext_pos += DIV_ROUND_UP(sizeof(*hdr), sizeof(u32));
-		dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[ext_pos];
-		dp_mem_data->domain_id = swidget->domain_id;
-		dp_mem_data->stack_bytes = swidget->stack_bytes;
-		dp_mem_data->heap_bytes = swidget->heap_bytes;
-		ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
+	/* Add following object array items here */
+
+	if (!hdr) {
+		/*
+		 * NOTE: Remove this early bail out, when struct
+		 *       sof_ipc4_module_init_ext_init alone has some
+		 *       function.
+		 */
+		kfree(payload);
+		return 0;
 	}
-	/* If another array object is added, remember clear previous OBJ_LAST bit */
+
+	ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
+	hdr->header |= SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK;
 
 	/* Calculate final size and check that it fits to max payload size */
 	new_size = ext_pos * sizeof(u32) + ipc_size;
-- 
2.55.0

