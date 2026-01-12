Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14129BDA5
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217516; cv=none; b=JTJTdthFuKLcoH1Oj69Nslro5RET1rvadVN1zcGSnUWYCmIJdIFXVoQKz/n4Jyo4NBbDdNwYJKn74TQhGhM+j/Kw9golQ7VykgG05dnNhuTsBiCPg3tx3KWc9mJ9erfFZAkSdK7e8tQWydpky+m2QWQHP/VkoAeSoLhM0DSa7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217516; c=relaxed/simple;
	bh=EmQgBQpSUCIUbtL7Fa8t+A69nkEjhqJg6nkfTDKprJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZEYUvO23IXh4OP+qkPGXVHlBlul7sXh+GhlJoGEqK7aAS9+wp7OjZBAiBegS0ZFFJI62Pdm6MS8VKVtH2eVYGifd8XBHzGrhiIFElI4uE3JtGMYpjULM4+RRYmAQMRj3+fnVqPjNRf7MJQhlCwOya//2tK3T6dy1tKzh4FY1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF1e6JaI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF1e6JaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217515; x=1799753515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EmQgBQpSUCIUbtL7Fa8t+A69nkEjhqJg6nkfTDKprJ0=;
  b=CF1e6JaI/hbup5bC28gyJQtKY5jPycbaKtRbQMptKXm9YWrQ6+mE4sOt
   od8L6u+YFfuoS0U04l8sCduHiOadoOsa2dpsx8eOD+gFcwP/tpDxcNlwv
   9QK1O7Azfnov6zK3k+Spgp5IEavYOOAb7C6FLUFbSpP3vWJPggokEgBJ5
   yu84d+jMVQF0foDQwJ43LcUjkgzEbBT/XvfMFQGebfN0nJGrUJZyy4pnS
   XqBg4WCuR6At7mjEC6vaZpe6XdhQeNi/PhVmQeTO3HpuKo4tvnpHQ09z/
   +V9kfsVxQNvNfjOAPboH6DThDwR2MfUgyK9E7NrYFDNEcEoLtOOPKBt3r
   Q==;
X-CSE-ConnectionGUID: w1vKM/zYTIqcTJ6jNW9U3Q==
X-CSE-MsgGUID: 5Ygd3PfkQAW+5PffnxUdBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69539752"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69539752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:55 -0800
X-CSE-ConnectionGUID: yOZTkmiDSqyaZC9b9HHV+w==
X-CSE-MsgGUID: OYZpd0QpT8O/N8h0V1UrsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203224327"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:52 -0800
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
Subject: [PATCH 3/4] ASoC: SOF: ipc4: sof_ipc4_module_init_ext_init structs and macros
Date: Mon, 12 Jan 2026 13:32:20 +0200
Message-ID: <20260112113221.4442-4-peter.ujfalusi@linux.intel.com>
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

Add structs and macros for struct sof_ipc4_module_init_ext_init,
following struct sof_ipc4_module_init_ext_object array, and
struct sof_ipc4_mod_init_ext_dp_memory_data as object payload.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 75 +++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 15fac532688e..4554e5e8cab5 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -352,6 +352,10 @@ struct sof_ipc4_base_module_cfg {
 #define SOF_IPC4_MOD_EXT_DOMAIN_MASK		BIT(28)
 #define SOF_IPC4_MOD_EXT_DOMAIN(x)		((x) << SOF_IPC4_MOD_EXT_DOMAIN_SHIFT)
 
+#define SOF_IPC4_MOD_EXT_EXTENDED_INIT_SHIFT	29
+#define SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK	BIT(29)
+#define SOF_IPC4_MOD_EXT_EXTENDED_INIT(x)	((x) << SOF_IPC4_MOD_EXT_EXTENDED_SHIFT)
+
 /*  bind/unbind module ipc msg */
 #define SOF_IPC4_MOD_EXT_DST_MOD_ID_SHIFT	0
 #define SOF_IPC4_MOD_EXT_DST_MOD_ID_MASK	GENMASK(15, 0)
@@ -586,6 +590,77 @@ struct sof_ipc4_notify_module_data {
 #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
 #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)
 
+/*
+ * Macros for creating struct sof_ipc4_module_init_ext_init payload
+ * with its associated data. ext_init payload should be the first
+ * piece of payload following SOF_IPC4_MOD_INIT_INSTANCE msg, and its
+ * existence is indicated with SOF_IPC4_MOD_EXT_EXTENDED-bit.
+ *
+ * The macros below apply to sof_ipc4_module_init_ext_init.word0
+ */
+#define SOF_IPC4_MOD_INIT_EXT_RTOS_DOMAIN_SHIFT	0
+#define SOF_IPC4_MOD_INIT_EXT_RTOS_DOMAIN_MASK	BIT(0)
+#define SOF_IPC4_MOD_INIT_EXT_RTOS_DOMAIN(x)	((x) << SOF_IPC4_MOD_INIT_EXT_RTOS_DOMAIN_SHIFT)
+
+#define SOF_IPC4_MOD_INIT_EXT_GNA_USED_SHIFT	1
+#define SOF_IPC4_MOD_INIT_EXT_GNA_USED_MASK	BIT(1)
+#define SOF_IPC4_MOD_INIT_EXT_GNA_USED(x)	((x) << SOF_IPC4_MOD_INIT_EXT_GNA_USED_SHIFT)
+
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_SHIFT	2
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK	BIT(2)
+#define SOF_IPC4_MOD_INIT_EXT_DATA_ARRAY(x)	((x) << SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_SHIFT)
+
+struct sof_ipc4_module_init_ext_init {
+	u32 word0;
+	u32 rsvd1;
+	u32 rsvd2;
+} __packed __aligned(4);
+
+/*
+ * SOF_IPC4_MOD_EXT_EXTENDED payload may be followed by arbitrary
+ * number of object array objects. SOF_IPC4_MOD_INIT_EXT_DATA_ARRAY
+ * -bit indicates that an array object follows struct
+ * sof_ipc4_module_init_ext_init.
+ *
+ * The object header's SOF_IPC4_MOD_INIT_EXT_OBJ_LAST-bit in struct
+ * sof_ipc4_module_init_ext_object indicates if the array is continued
+ * with another object. The header has also fields to identify the
+ * object, SOF_IPC4_MOD_INIT_EXT_OBJ_ID, and to indicate the object's
+ * size in 32-bit words, SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS, not
+ * including the header itself.
+ *
+ * The macros below apply to sof_ipc4_module_init_ext_object.header
+ */
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_SHIFT	0
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK	BIT(0)
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_LAST(x)	((x) << SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_SHIFT)
+
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_ID_SHIFT	1
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_ID_MASK	GENMASK(15, 1)
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_ID(x)		((x) << SOF_IPC4_MOD_INIT_EXT_OBJ_ID_SHIFT)
+
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS_SHIFT	16
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS_MASK	GENMASK(31, 16)
+#define SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(x)	((x) << SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS_SHIFT)
+
+struct sof_ipc4_module_init_ext_object {
+	u32 header;
+	u32 data[];
+} __packed __aligned(4);
+
+enum sof_ipc4_mod_init_ext_obj_id {
+	SOF_IPC4_MOD_INIT_DATA_ID_INVALID = 0,
+	SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
+};
+
+/* DP module memory configuration data object for ext_init object array */
+struct sof_ipc4_mod_init_ext_dp_memory_data {
+	u32 domain_id;		/* userspace domain ID */
+	u32 stack_bytes;	/* stack size in bytes, 0 means default size */
+	u32 heap_bytes;		/* stack size in bytes, 0 means default size */
+} __packed __aligned(4);
+
 /** @}*/
 
 #endif
-- 
2.52.0

