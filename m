Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953231;
	b=jpRBn4Hy1seHSQHrxEnwtAo+2dLmTeszrOXFWsETr3PAf4kAhQU9P57SK7qoaYZQOFX0
	 e6Cw2buJ6eWmWWvJOHMWFe9q0XmJa49LdU7Xm9UDOqJxhb6NIyRwj2UWMchP0AvPEGUSl
	 6oVDdbTZN9B/W+FNG6d3h0/qx7l8Spk5PoHcmbESJbj2DjhG4U9TF8TWyzDa2sFHlMINC
	 ZX/B7r7UaKAy7EvhnSSd1/en5ZmK0Vc2pDjNU+Kj/wpPSPom+VlYletc5yTeXyalkAW9N
	 DcyDIpxTovpayLPz2ugi7PBEy0CbG07tqpPKYureZ2C3OJ0bDRFrD7X7FUJzgzALmmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
	b=TMJdW9a05qyQPslvyAebJP0ilCkpq4xP7E5vQLKv8y+l9lPbGl4s56Npcl3EVylv5qpt
	 G9YfoDtsbK7tRNtLjdwcsBI6I/EhfNIZvFD+NDQAd1RHt/L5hJ+e82ykOqOtzUuRd56Xq
	 D2TKJIKqRPf/L07bhHogzGq+8/UKWinufkw+6ZI8aXTBDxRCQ5oHNiZuXYQ/DQjldO4G9
	 NGl1ID5dg+OsAdIS7wnaYa01PdtP/ul6r9EyVChPSCLPOcUyzgmFHk31Rut3DWBYV0f0v
	 FWnCR/QiFuMtVHqUJ/ZVnTwapjzPK0PU3+KoQmJD8cQIju9ncQdxhaaGLIysLCmBSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjMcTPAa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB4606A32C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 22:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CB4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjMcTPAa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so3374475e9.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953229; x=1795558029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
        b=YjMcTPAaCNLwh8YsFsR8o8tzBojZaFxao/nIUzjkmHeCAnTlRnk18p8hhIrmyoFrb0
         WY/MtG30d17cQePBcSMFTOf9TW5ckUX8s3qtayr3oPTvHhkOYgayFQeLgs2nU/NWw0hq
         rXgqZRMiPeaA+mhjiJfK9Gs9lqp8vlL/AZanTe8OEw/GQzlFe+IXt/WBGsHQm/aVqHAH
         fuO+GY3GFEDPNs1OiWvgGeQs8Z8MKNNrkZwTXxGj2sigIWdJaAzrdj+8loP05qbF257K
         kC5VCdfiH/15c4x6wJBwoRdbu9dLVd7/yED+i1EnuKg6jeP8ScbCPhPN5rjuuF9q/QEc
         WZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953229; x=1795558029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
        b=05bYIcuk/JWha5xo7s3mV3UyRbpDOqA9p5CBk1VraoeEZgRLyOE4HAzL3RVRedCmiA
         YIQGL/+LfoHxQdtOkNGeiz8I6H7/pTjtKkiI5t/w3k6dxZ3V1zSLZ5vdFZZtwM8kxV65
         URib2x4PbcEAXwBu7OCLF1MPYwfvKXoWZ26mMDbvs4V29zA4mpa2xZXFcAxkW6CYJWKf
         vMgPOZeq858U7LAOTztm1jVUzSGk917JpEQchCzMTIZauzNikveajC76LCvYRIKwYcW9
         gSV/hqz/3U2aBGjOeyGKdoUxmFg77LHtj6FZCuXF1/PVY7jg3+DLptZeGcsOboj20La2
         mK4g==
X-Forwarded-Encrypted: i=1; AL+hErGChWKsSmWudmzQ4m7FlN5KJB/rwWDajRtwEpYvaPM6iRbB/aPGplA3OJftLml7+q5YCJNjwVYidNm9lA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VcuyRe3aunUNw5mLJJ13PeimMt5okZ2oUzIbc0L9mserY7gVH
	IDQpGEV2V+ZO7oFb3RKP2vTTuAit+N92Qw0KMvzL38UCDIb1FLAB8jmq
X-Gm-Gg: AYBFou2l8uMVH//jZmbXXCy+fcy08q2kh0CDcmI2j9Af2OewNztkL4mHKftpvNDZvtJ
	8/4kKCMXNyf78yIC44wsmwmG/7pdqyKjb9TAk4dXJoQXzLFOtWpXbGKLKGlnWQOfj+sBgMyd5/N
	ccT2Y0hzVOVbBhB86M0fSKrXvXqgdWU57jOBdMt6WJbIiy/XDmWuiORCtKc6ZAjViKFSfcad+9+
	ySIwG0ZyJYTCkoqNlQrMmbCdOlelYjAUtrQxcsimc7iv2h4DeDh0J1nI4s8X4+QgXGlX7kdM1lh
	iaUmR3U/RFy1EoJiov2zwe+QbLHCgz7HieRtds9CqcEC+xZLWa9M/sM7+bqMxsnqG4obXejP3qG
	fja4l7tn0ps+kpUuVvSUgcLlA0nVGCErfCM1kRuGbLM4cb7aGRt1XArMthyaaWljuI7HzIEuZ2Q
	lsptFnjuTko0YY+hbjOfVVEkd+GqEi8pCTb01Yq0j3dBEcqRD5sMGwihem5d9P+JkjhIkFWHkJG
	HKACF2zcJaI2w9EtTTiVCRM3QyqpcQcPZqi6gC8hsJHDyHDfOq+EOWRYAEG6sgHc+zd0CzPtarE
	WvnVa6Sjz0o12eFBkWBukpuJbYimhwDftGjyDOVh4Nz/Uw6bP9bcmo8QdrW1BFM4OI/DQjYUKXM
	aE7oPMH/mzKBqJK7Odl8QpjGGJC4lqoeqrh7JFQ==
X-Received: by 2002:a05:600c:3e19:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb7da18500mr9671815e9.12.1794953228777;
        Tue, 17 Nov 2026 14:07:08 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([41.44.127.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm15360655e9.10.2026.11.17.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:07:08 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-sound@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v3] ASoC: Intel: Remove unused intel-sst.h trace header
Date: Wed, 18 Nov 2026 00:05:57 +0200
Message-ID: <20261117220558.2702-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111223102.1310-1-obabitemitope765@gmail.com>
References: <20261111223102.1310-1-obabitemitope765@gmail.com>
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

Fixes: 970d299b0a0a ("ASoC: Intel: Remove unused code")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Notes:
    Changes in v3:
    
    - Rebased on broonie/sound.git for-7.5, which already has the earlier sst_ipc_inbox_rdata patch applied.
    
    - Added Fixes tag.
    
    - Added Acked-by from Cezary.
    
    - Added the people from commit 970d299b0a0a to Cc.
    
    v2: https://lore.kernel.org/all/20261111223102.1310-1-obabitemitope765@gmail.com/

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

