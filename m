Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD40379989
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957199; cv=none; b=UztVF8/5fwdN4toLY2075JhM9EOhyrREgEreRnvV9RLgGflwtmbeiILwUDt0OK8bfZvDEVpDBBoatCTqCyF1LSsoCVblwKypskH6awYMpOaldxS3U7qt2w7mQDMpJMq1dO78fvu350LNi+pJ0kBldlCrkj13GwL2Ak0MesSSjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957199; c=relaxed/simple;
	bh=dUgA5F7YKT0fSb50nIwqAfUOFaFWQjmaOeO1WffUhvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T2t5gUtrYRC5uGqRtJhRopEwPh9eVbD50JPKAGXo2t11DG1PPwXRcUVztJ7vgDg/PenApyNm4JMryLDY/epZ5c6cjj+tqlmNRCxwd3LddZgf+Ha1u0lcjJXkxdKeBqsGuQg4Q/JxAYL5Fl2kF8EmWXnNcAdRXMB7jrmb863+QiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IK4kAj54; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IK4kAj54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779957197; x=1811493197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUgA5F7YKT0fSb50nIwqAfUOFaFWQjmaOeO1WffUhvQ=;
  b=IK4kAj544zEmvQ1ybqCsSVQZlrL/EpJ01bLZEvpHP1lLoqK0fqbaPkdT
   J9L66u++sV6jco7ku+FpxfnoXugRdD6/fXc5sFMeyip6x3qeAGBjrsa7Y
   UUDJnbMoXvsaySt7sxYhYjV2ZRtTfZZIwkfX3jYd2ZW26rf2iNhb0SAp3
   2N0UODwjkrgqAINGLQ5ZTjRTgYazf219OJNuwA0MQqfsntnjwrnceICyr
   dIv9I4lb0qzWzaODxqknpAfyzX2awTu5RItHfb14trRQ8QYAs2CVvSzGy
   klNLLCnW5faqT3IczB3nUsmbNY4pYuFn4RD/MPcvXVH5PrvqCZ0iKUrJU
   Q==;
X-CSE-ConnectionGUID: obKZbApTRS+hvNbcS+qaFw==
X-CSE-MsgGUID: Lsd3ollrTTaQNnIATILt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79828682"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79828682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 01:33:17 -0700
X-CSE-ConnectionGUID: WQfU6ZVKSJi2yzMPmZBXKQ==
X-CSE-MsgGUID: /t0GcxnRQ2KhsF+fP96MaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266390238"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 01:33:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	krzysztof.hejmowski@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/3] ASoC: Intel: catpt: Add pretty-trace for large IPC payloads
Date: Thu, 28 May 2026 10:34:43 +0200
Message-Id: <20260528083444.1439233-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528083444.1439233-1-cezary.rojewski@intel.com>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mimic mechanism found in the Intel's avs-driver and update the existing
IPC payload tracing to allow for pretty printing even large payloads.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/Makefile |  3 ++-
 sound/soc/intel/catpt/device.c |  3 ---
 sound/soc/intel/catpt/trace.c  | 27 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/trace.h  | 22 +++++++++++++++-------
 4 files changed, 44 insertions(+), 11 deletions(-)
 create mode 100644 sound/soc/intel/catpt/trace.c

diff --git a/sound/soc/intel/catpt/Makefile b/sound/soc/intel/catpt/Makefile
index e8316e33b820..8005fc677f28 100644
--- a/sound/soc/intel/catpt/Makefile
+++ b/sound/soc/intel/catpt/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 snd-soc-catpt-y := device.o dsp.o loader.o ipc.o messages.o pcm.o sysfs.o
 
+snd-soc-catpt-y += trace.o
 # tell define_trace.h where to find the trace header
-CFLAGS_device.o := -I$(src)
+CFLAGS_trace.o := -I$(src)
 
 obj-$(CONFIG_SND_SOC_INTEL_CATPT) += snd-soc-catpt.o
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index ca4fd18b6a6e..6fe212f498c6 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -25,9 +25,6 @@
 #include "core.h"
 #include "registers.h"
 
-#define CREATE_TRACE_POINTS
-#include "trace.h"
-
 static int catpt_do_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
diff --git a/sound/soc/intel/catpt/trace.c b/sound/soc/intel/catpt/trace.c
new file mode 100644
index 000000000000..e97c372cc2af
--- /dev/null
+++ b/sound/soc/intel/catpt/trace.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/types.h>
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
+#define BYTES_PER_LINE 16
+#define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */	\
+			/ (2 * BYTES_PER_LINE + 4) /* chars per line */	\
+			* BYTES_PER_LINE)
+
+void trace_catpt_ipc_payload(const void *data, size_t size)
+{
+	size_t remaining = size;
+	size_t offset = 0;
+
+	while (remaining > 0) {
+		u32 chunk;
+
+		chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
+		trace_catpt_ipc_payload_chunk(data, chunk, offset, size);
+
+		remaining -= chunk;
+		offset += chunk;
+	}
+}
diff --git a/sound/soc/intel/catpt/trace.h b/sound/soc/intel/catpt/trace.h
index 010f57b6a7a8..6b528d933734 100644
--- a/sound/soc/intel/catpt/trace.h
+++ b/sound/soc/intel/catpt/trace.h
@@ -51,29 +51,37 @@ DEFINE_EVENT(catpt_ipc_msg, catpt_ipc_notify,
 	TP_ARGS(header)
 );
 
-TRACE_EVENT_CONDITION(catpt_ipc_payload,
+TRACE_EVENT_CONDITION(catpt_ipc_payload_chunk,
 
-	TP_PROTO(const u8 *data, size_t size),
+	TP_PROTO(const u8 *data, size_t size, size_t offset, size_t total),
 
-	TP_ARGS(data, size),
+	TP_ARGS(data, size, offset, total),
 
 	TP_CONDITION(data && size),
 
 	TP_STRUCT__entry(
-		__dynamic_array(u8, buf, size)
+		__dynamic_array(u8,	buf,	size	)
+		__field(size_t,		offset		)
+		__field(size_t,		pos		)
+		__field(size_t,		total		)
 	),
 
 	TP_fast_assign(
-		memcpy(__get_dynamic_array(buf), data, size);
+		memcpy(__get_dynamic_array(buf), data + offset, size);
+		__entry->offset = offset;
+		__entry->pos = offset + size;
+		__entry->total = total;
 	),
 
-	TP_printk("%u byte(s)%s",
-		  __get_dynamic_array_len(buf),
+	TP_printk("range %zu-%zu out of %zu bytes%s",
+		  __entry->offset, __entry->pos, __entry->total,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 16, 4,
 				   __get_dynamic_array(buf),
 				   __get_dynamic_array_len(buf), false))
 );
 
+void trace_catpt_ipc_payload(const void *data, size_t size);
+
 #endif /* __SND_SOC_INTEL_CATPT_TRACE_H */
 
 /* This part must be outside protection */
-- 
2.34.1

