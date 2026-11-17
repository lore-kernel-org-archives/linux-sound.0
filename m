Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923174;
	b=DiyvmWEmDaqkzhp5cCbNxHHWpJOAmUFgwDqP7M1odzdakkAgdtMdWsB0TG0tQaEESque
	 S/1a5l7WhLgyrlwz93LYYHoDyuIPp9etPqDCohywBUSxlfX0mIfZ6DBZl9TKywBdIkHkr
	 qS6djiwvWKCUyNWATk3p8wPSzhawD+Tahl1mEm/1Mf7IpX3cuRnM2mbCACP8Df/gXRh/g
	 NCwIx0PHNKiYbpVCYDkAJTOucZnWhWRkH3AAFS1IEk8z9ZtNjdFLQydLK8VULsUwwx6sp
	 YG0ySHO1tzu1IlnKbChVxroTc4qbHSALGBNE9yXpUk+ufH0ukBxNLzZZrZd/AILYfMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
	b=cJaqSrDntOp8Ug9nCJgToEcrdkGqKhW28qdKj21PxpKUH9HbEDR19WuALp2uHBjz6QAJ
	 648O6QLC9cD8XwEpcBPNJHfmYPXt0MglR6o/r5m/ni2QHQW8crsf3spmRl+AZm1gvKIMf
	 SElZ5Lt6QOdpNdZXqlTamtGOQSLeJSf7wN3AoS+5SZfPeD4mJCPs5YVzzjpOcuZFRJKPs
	 nGQjSTCJ4C5E5ft0Vf6Kb0XK9BH0Vm08qEK6cazcH+KSFrzOksgaVIniiO8ui/gUiRH9P
	 YU6H2I7SmifyaI5yrr7Nv0MARD2W5ana3bQSkC1OrFi8xwhz7RmngI6VsBSVUKhgBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqwR8CQT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8430606A32A
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 13:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8430606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqwR8CQT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so220837f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 05:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923172; x=1795527972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
        b=TqwR8CQTdLUXOb25oFu3C4dDWkXJrCfASgUeJ8SYiGfF4qzgU9jorovVEAXvr68pj4
         2UfImRI9WA+qYM0zYTgWutMfzQRATFOY55TJYa7kRM4FslsYdU1QeJYUGMxngjv4+PpA
         IoRlqJ3A7658+EgPzAtOz1qIbqCoiyDEQvFUc76Hoi7cA4RO+aPvnmf93vLT02SfzViM
         xtx0zinDEUHEVkBhY+59EBMWxZCqL/HrLytWFk4DtonWZitnlOPh06RhZUxCUDiqNGAg
         hQIgkyy8E10Y71whp8DdURZ3raXbYvxuG4j6ZAMWjE0IP39O/P6Whz1DEYqD2k4s6VeA
         SyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923172; x=1795527972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
        b=cpXzHr77KKTHN9bGoA2aopfZo0IefYMZQEFCrD3xhisqxWcUxKY3qsUFpLLBJSh2CE
         RAMTMmmuC3X8u4CHl+hfCilRaRw7CQhsbx5E2vOUPxRSvi0addsoC1YjCENfxL5eZWWC
         AHrYm+A8dZCHAZWbhqlZxlTqQqpv4KKVuL6ecldqdU88ozc4SjXmRFOWmYVyBU91wakW
         8ZcxGIALDpn5vKlBPXGnq4l7lOu8mnycZzauItabz8nI1NNmIfOvOTd6jiyDLrGnYlgg
         GYRCx86jV0cBW/0oNl7SHyDHyqrMxwSNbRQyRZcJcDMWrbjcBQ81F6obIg6Img1vEwQr
         kG7Q==
X-Forwarded-Encrypted: i=1; AL+hErHJK/yH4LDAo0OT1ZbpWE8JObWOWMoYpPgMxxu8CsxtJDcgAgFTq+hYgXFxdDv67jG8qa12kNtYu5irZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+X/7sp661hu0u1hJiB4J/XozBAZErMoV6rKWJgfNTRxcfsILwR
	A/7RbYOhirD7nUTOfDYUiDMMBFTXHLleLwg/S8m9HSNNsmOcssoSGPuG
X-Gm-Gg: AZFdTZeANMcZq+vwZlEFCH4bp7r2vT0my96jS0NOesG8E2stJtcKXHptISr/s2UeB0K
	hXWP7eDF5dboMoAmz+MIgXtV1U6HHaluYCiOTL2YvQuQwum1qeA0nlyLNAhBUo/LC1ElvfDhSKv
	IXArNBuCuFCKhsSBDwniVD+JZCNMIreReVukNFHGO3AiFpmv+F67PfWfJMqoqsimoz4NzyhLhEI
	9kAJWWgLcxcd7jcooSK7TAz5zZ5sZMnN9COJ5j6WXaEs2ZBQWUxG4KMZhfLYsLEug43NVTSztJt
	bKiHp5+DhPe4Sky+tFNv8Q0y8HIFh2wd2pCixUZKqv7s5rnE1cPICeBkuqb0zFkahwJnF79RAoH
	085khcTIxPsNKuPUcMpj3Cd/orOkfMHWOmU9cNqNV/e9s4IaGxPJ/WQa9BhzMttyUvDjfffFzZz
	6kJ6j5r3OtlYuq9xJYEGdNGSWdvneu22YijW0lFxt7seIwebJZl58/JgL6dpZW+PfPo/8u/Kjfg
	AqCf2BowevBv+HpjMJ6S0yuOq4uh5S0gwu38mu6xG9RCGAsM3GYe3+6K7P/yRpmalm3YhTdM87H
	Cf6FqhJtHOpEXWH/0X2IL2pBzMTC52ICKwqdT4Ln1/QS86n+7761s0K4IVHiM2GFMkNDkXzBPLZ
	f/35bFXq+hIior+RHVW1vHyDYn12MhtjgZt8xtFA=
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-49c70b051bbmr31562779f8f.13.1794923171789;
        Tue, 17 Nov 2026 05:46:11 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([41.44.127.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm28285028f8f.9.2026.11.17.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:46:11 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-sound@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] ASoC: Intel: Remove unused intel-sst.h trace header
Date: Tue, 17 Nov 2026 15:45:38 +0200
Message-ID: <20261117134538.1251-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 970d299b0a0a ("ASoC: Intel: Remove unused code") removed
sound/soc/intel/common/sst-dsp.c, the only file that defined
CREATE_TRACE_POINTS and included trace/events/intel-sst.h.

Nothing includes this header anymore, so none of its tracepoints are
built. Remove the unused header.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/intel-sst.h | 148 -------------------------------
 1 file changed, 148 deletions(-)
 delete mode 100644 include/trace/events/intel-sst.h

diff --git a/include/trace/events/intel-sst.h b/include/trace/events/intel-sst.h
deleted file mode 100644
index ae7c269b0824..000000000000
--- a/include/trace/events/intel-sst.h
+++ /dev/null
@@ -1,148 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM intel-sst
-
-/*
- * The TRACE_SYSTEM_VAR defaults to TRACE_SYSTEM, but must be a
- * legitimate C variable. It is not exported to user space.
- */
-#undef TRACE_SYSTEM_VAR
-#define TRACE_SYSTEM_VAR intel_sst
-
-#if !defined(_TRACE_INTEL_SST_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_INTEL_SST_H
-
-#include <linux/types.h>
-#include <linux/ktime.h>
-#include <linux/tracepoint.h>
-
-DECLARE_EVENT_CLASS(sst_ipc_msg,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->val = val;
-	),
-
-	TP_printk("0x%8.8x", (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_tx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_rx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	offset		)
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->offset = offset;
-		__entry->val = val;
-	),
-
-	TP_printk(" 0x%4.4x = 0x%8.8x",
-		(unsigned int)__entry->offset, (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_rdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox_info,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	size		)
-	),
-
-	TP_fast_assign(
-		__entry->size = size;
-	),
-
-	TP_printk("Mailbox bytes 0x%8.8x", (unsigned int)__entry->size)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-#endif /* _TRACE_SST_H */
-
-/* This part must be outside protection */
-#include <trace/define_trace.h>
-- 
2.53.0

