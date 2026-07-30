Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182383B6C14
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408076; cv=none; b=B/AcWqCxxJMWBO53BKw2mp/UZyigFXXdKI8V3xCGNuXbwPkQcEQp7CzzSW98hY8FrQ1DKiUj3SJMhXxSnwrKX36pg3HSarsH3mnHOAc/+zkwrquLr8tvDWy94TDONJyAWzhYsgMJiE65vp87tkMpJCHIqeI7pOe1jUPyZV0TFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408076; c=relaxed/simple;
	bh=o2sfBqCEnqLf0x6zWU1vmZUMfCwnrMNips11ZF2l1QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zezrl6Mj0dTBKDulW7rE524L7okR0p9K7FOl0k9xBIMGRJedXH2pzhK4snuoo9c/RzTHXrwYB/IEdtnDPkHS+So2OXPEAZBAy+UNaD73q23p5C3Zo3uZ8e6h3wNIe0sajAY0TsCvPDHHG43Sj48u5zl5xNrKoSOOroVwIiIblpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxXFq2No; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxXFq2No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408075; x=1816944075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o2sfBqCEnqLf0x6zWU1vmZUMfCwnrMNips11ZF2l1QA=;
  b=UxXFq2NoDKkRveCkFTle3zhE+PK0Ijy8qjONynQJFA1VRanQAdfh1Fww
   wksjsUB6/wk+950tsa4Bp+L7TjOAN2RxrSZ+fMJXTeD1w76Tk4P+b74CC
   Hk5K6G63VEcchefpsMk3Ymr7a8+xdNLiFhWtaol6rxYELPQUfkWMTD9JO
   Q3530+p7dlRDIdbKsFxNEBEGQr6dVnjKkm4zFmefuUlyBi3HWjAh2DClc
   N/O6A8ICD6IoC8xNrZc8v5NjhtpcM3raOS90jisOc/6e23JW61WcCECBq
   MYhKMkr3rU0yEzReZ4ME8z7enkROQPwG0orH0Z8AFxkrGDmQc3nQTCTTh
   A==;
X-CSE-ConnectionGUID: K0eME80vReOCEhrDjfx4OQ==
X-CSE-MsgGUID: GexGyR6JRb6czuvx5fiQlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817777"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817777"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:15 -0700
X-CSE-ConnectionGUID: ZmSdTvz7QC2h7lTbgwEz4g==
X-CSE-MsgGUID: h5IK4BJ0Tl+jxlYpIYtDzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221317"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 3/6] ASoC: SOF: ipc4: Add SOF_IPC4_GLB_CREATE_PIPELINE payload macros and structs
Date: Thu, 30 Jul 2026 13:41:38 +0300
Message-ID: <20260730104141.14817-4-peter.ujfalusi@linux.intel.com>
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

Adds SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY macros to set extension bit in
SOF_IPC4_GLB_CREATE_PIPELINE indicating presence of the payload, and
all necessary macros and structs to create the payload.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 76 ++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 4554e5e8cab5..6fbf62c4075c 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -187,6 +187,10 @@ enum sof_ipc4_pipeline_state {
 #define SOF_IPC4_GLB_PIPE_EXT_CORE_ID_MASK	GENMASK(23, 20)
 #define SOF_IPC4_GLB_PIPE_EXT_CORE_ID(x)	((x) << SOF_IPC4_GLB_PIPE_EXT_CORE_ID_SHIFT)
 
+#define SOF_IPC4_GLB_PIPE_PAYLOAD_SHIFT		29
+#define SOF_IPC4_GLB_PIPE_PAYLOAD_MASK		BIT(29)
+#define SOF_IPC4_GLB_PIPE_PAYLOAD(x)		((x) << SOF_IPC4_GLB_PIPE_PAYLOAD_SHIFT)
+
 /* pipeline set state ipc msg */
 #define SOF_IPC4_GLB_PIPE_STATE_ID_SHIFT		16
 #define SOF_IPC4_GLB_PIPE_STATE_ID_MASK		GENMASK(23, 16)
@@ -654,13 +658,83 @@ enum sof_ipc4_mod_init_ext_obj_id {
 	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
 };
 
-/* DP module memory configuration data object for ext_init object array */
+/* DP module memory configuration data object for object array */
 struct sof_ipc4_mod_init_ext_dp_memory_data {
 	u32 domain_id;		/* userspace domain ID */
 	u32 stack_bytes;	/* stack size in bytes, 0 means default size */
 	u32 heap_bytes;		/* stack size in bytes, 0 means default size */
 } __packed __aligned(4);
 
+/*
+ * This set of macros are very similar to the set above, but these are
+ * for building payload to SOF_IPC4_GLB_CREATE_PIPELINE message.
+ *
+ * Macros for creating struct sof_ipc4_glb_pipe_payload payload with
+ * its associated data. struct sof_ipc4_glb_pipe_payload should be the
+ * first piece of payload following SOF_IPC4_GLB_CREATE_PIPELINE msg,
+ * and its existence is indicated with SOF_IPC4_GLB_PIPE_PAYLOAD bit.
+ *
+ * The macros below apply to sof_ipc4_glb_pipe_payload.word0
+ */
+#define SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS_SHIFT	0
+#define SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS_MASK	GENMASK(23, 0)
+#define SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS(x)	((x) << SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS_SHIFT)
+
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY_SHIFT	24
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY_MASK	BIT(24)
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY(x)	((x) << SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY_SHIFT)
+
+struct sof_ipc4_glb_pipe_payload {
+	u32 word0;
+	u32 rsvd1;
+	u32 rsvd2;
+} __packed __aligned(4);
+
+/*
+ * SOF_IPC4_GLB_CREATE_PIPELINE payload may be followed by arbitrary
+ * number of object array objects. SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY-bit
+ * indicates that an array object follows struct
+ * sof_ipc4_glb_pipe_payload.
+ *
+ * The object header's SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST-bit in struct
+ * sof_ipc4_glb_pipe_ext_object indicates if the array is continued
+ * with another object. The header has also fields to identify the
+ * object, SOF_IPC4_GLB_PIPE_EXT_OBJ_ID, and to indicate the object's
+ * size in 32-bit words, SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS, not
+ * including the header itself.
+ *
+ * The macros below apply to sof_ipc4_glb_pipe_ext_object.header
+ */
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST_SHIFT	0
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST_MASK	BIT(0)
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST(x)	((x) << SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST_SHIFT)
+
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ID_SHIFT	1
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ID_MASK	GENMASK(15, 1)
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_ID(x)		((x) << SOF_IPC4_GLB_PIPE_EXT_OBJ_ID_SHIFT)
+
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS_SHIFT	16
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS_MASK	GENMASK(31, 16)
+#define SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS(x)	((x) << SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS_SHIFT)
+
+struct sof_ipc4_glb_pipe_ext_object {
+	u32 header;
+	u32 data[];
+} __packed __aligned(4);
+
+enum sof_ipc4_glb_pipe_ext_obj_id {
+	SOF_IPC4_GLB_PIPE_DATA_ID_INVALID = 0,
+	SOF_IPC4_GLB_PIPE_DATA_ID_MEM_DATA,
+	SOF_IPC4_GLB_PIPE_DATA_ID_MAX = SOF_IPC4_GLB_PIPE_DATA_ID_MEM_DATA,
+};
+
+/* Pipeline memory configuration data object for ext_init object array */
+struct sof_ipc4_glb_pipe_ext_obj_memory_data {
+	u32 domain_id;		/* userspace domain ID */
+	u32 stack_bytes;	/* stack size in bytes */
+	u32 heap_bytes;	/* heap size in bytes */
+} __packed __aligned(4);
+
 /** @}*/
 
 #endif
-- 
2.55.0

