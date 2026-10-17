Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742B39CD03
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216118; cv=none; b=s3YHtFRLiMItR7F594luLcsIYpq4R/tOF2AfMY0TM2Ni0EBVzrtMh6l+WUOyhIpULHOuyEuXD9qj5U3FWMguQGVZHVQqOBtRLdCkL/LfXid6u89J18qFYcQFUV36xSqvMLcDSl9ZtqHGbZuxuzlf8G75Z5AzPQ3vnsB1Vo9nUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216118; c=relaxed/simple;
	bh=m+qK95YsXLjQ74wCYltLIhf7b7QUBE/Owh0lXAqBWcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nF2KqlTJ0EgvPQy3QZkm/Q7gt4PDBQSiwUTPd9Y0L4nedPIcbHG0JZuQL4UIZqW27sXa4MdTpn0sEDfoqkx9Lw4UOjrdslvcPYHfylHj6zIqKOZuNdBzU9dODuKmOiqD5tlnIp90Muxuz2DfaR9bTLevCHbyTBD+097A7EfsIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxdWjuNb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxdWjuNb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso486366a91.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216116; x=1792820916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7EatRdxc9GCmX3PE7WN6BAzYijlsRrXgxUIuAQGbmU=;
        b=YxdWjuNbLwoocpmn+pYWYlKhIPbMwaYXewp42ScY0tyDulTU6qWSW1Z8ZKYczAIA6s
         Hg0dKQ4U4Q0TnLV/obb3bISetKeGWbqdhsl7dP4TxXQ5Oe4wG/rXkqu9AXotg3wUJGJr
         jhjD7KT0AK9xyYwGvDaRCjOL/5Ofx8+dyNCdUK6ig8SnYHBjYy2TCNW0RWcHZkdEJvX/
         Bxdk86GV3/ie4Jh/oE4rxAzEEqMR6CHTwY7CvMIR/lkrLk3k+eGUHBMDD6Ib78BJdviJ
         v/setc6anDOVIwb5geTthxKaQ6nH4FEH1qZchStGqNyUIdmoEnWzgDM6Ls1BPNHBVIUG
         Sd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216116; x=1792820916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7EatRdxc9GCmX3PE7WN6BAzYijlsRrXgxUIuAQGbmU=;
        b=sXq2THYx5Z6E01nYOtfc3GeMcLuFXG15dcfPTrLOcS7CDyfw5ULANmB2rFBjtonrmg
         M3h8lxQEteZtdYEkq9bPzIP4QeyRvGXzgq4pZzusUdUeWJLeqGAajFXGL8Bkq+mU4U2f
         MQ97ATVxxS/HEkWPgu0iWmyKH6LNhz4jmUEXaoiiZcGTjO5LVrkYpGOwJcw7v9gK2dfA
         8tpW0QHA2Zwpu5e4X4iNGvgIhDO7iIlHP8ayyzbnHpflJLX1m00cz5pR2IasSgHqZyKl
         vA/RdR0cxFjbNgDwhZ39pRmZIF+Y+xoKkaC8m3Mb0telwNM3HBEDjTVSEFlu7bGYYBRt
         VSPA==
X-Forwarded-Encrypted: i=1; AKwUvBxLHyDWb6PoWXzJGFQAGwuCdR5M4PovkN9c9OaFUqohuUnhaYX27SC4ReaB/+7xDSP8VcPWwvKiVUGf/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMT1VligPBH2mS8aa+uv11+FK32qv/XMZTyXlWZlx8ZXwjRI7y
	+DWpxq4CVH8bVeovepoPrSnbneIPQDpml55ufWHDTL4A+OgKxnx98GC3
X-Gm-Gg: AYBFou1aLGma89n46CJjL3KoCSOrBVbRYaEII/z7WAcwaaD+UFr2hGe8Xk47qKYivqx
	vIUBKth/0ucjgi8T2pRRPHx5GVnMkHTJBf8EdwvrYjBNDmavmcqVGtXqYfgrhOKV0uSNpTdQNe8
	ceoGuXxZSc1fU1YAXw1hz3I2feeM1Th8kkxxA++aUjM+LvpJvQypAodCs370IFMeNjzUbEmoOfo
	peeH4i/GlfGHFyJwZdHce6faSqDHFWsDYVQzi3ee3AyNJE1hPzhYTrSW6/uf+Fy2xicuL3lKyaF
	qy7QTVZCf0vVBit153KEEAuYYYxmUxyLuIj7SkoCT+6ffSDzo33IXpnmYqGBq38+gvlAADGrl/p
	EQjTzCMNfwDaFxz4WWp2fkQXsyRBZtR1OcLC217hPEJfFnB+wqU7WKiEod8M4MGh5KNs2yDEOWq
	EqzFIRz/MM+hj1ZPe+ht9ZMJODxcsPNUL0DSJ7pd/RaR4sTRG+I7ccaku04Ms6in7F2UEeVT/59
	pA2uSuyw8oCVFYYT5SsfCzBs4+9qaS/V7IxXC9x1QWll0OvV91o+uEmw+zkK86OoUnkUjEDw5gw
	W/O7X2thEhBZAQ==
X-Received: by 2002:a17:90b:562b:b0:3ac:9d26:551d with SMTP id 98e67ed59e1d1-3aceefc0841mr1636007a91.50.1792216116049;
        Fri, 16 Oct 2026 22:48:36 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm13570028a91.9.2026.10.16.22.48.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 22:48:35 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/1] ALSA: virtio: trace control message lifecycles
Date: Sat, 17 Oct 2026 14:48:31 +0900
Message-ID: <rfc-v2-virtio-snd-control-trace-0.60ead383067a41ae@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds a control-message lifecycle trace event to virtio-snd. A per-send
ID connects enqueue, response, cancellation and sender wait outcomes,
including a response arriving after a timeout.

Changes in v2:
- Group internal helper event arguments in struct virtsnd_ctl_event.
- Use designated initializers and named validity flags instead of positional
  booleans. Keep TRACE_EVENT and its record format unchanged.

The event definition, error handling and request lifetime are unchanged
from v1. The patch applies directly to the base below and has no dependency
on the experimental VZ capture changes.

Validation of v2:
- ARM64 W=1 builds, including KASAN/lockdep, BPF events and tracing-disabled
  configurations, passed without warnings or errors.
- Eight QEMU boots passed malformed-response, enqueue failure, asynchronous
  completion, interrupted wait, timeout and reset/recovery checks. Trace-on
  fixture runs recorded 280 events each without loss or KASAN/lockdep reports.
- A non-debug QEMU/HVF comparison completed 90,000 lifecycle cycles and three
  10-second synthetic captures at 4,096 frames. All functional checks passed;
  captures each read 480,000 frames with no XRUNs or read errors.

On GCC 14.2.0 ARM64, the event arguments are scalarized. The control object
text shrinks by 56 bytes and the send stack frame drops from 192 to 176 bytes.
With event tracing compiled out, the old and new object text is identical.
The existing 24-byte per-request metadata cost remains unchanged.

Host-load stability checks failed during the timing comparison, so those
measurements do not establish an isolated runtime overhead percentage.
These regressions use synthetic QEMU devices; native VZ steady-capture
performance and physical microphone acceptance remain unverified.

The malformed-length fixture writes a full response and changes only the
reported used length. The sender retains its existing behavior; this patch
records diagnostic fields without changing protocol validation.

Previous version:
https://lore.kernel.org/linux-sound/rfc-virtio-snd-control-trace-0.208f05ae8ea44e77@gmail.com/T/

Thanks,
Joonho

Joonho Lee (1):
  ALSA: virtio: trace control message lifecycles

 sound/virtio/Makefile               |   2 +
 sound/virtio/virtio_ctl_msg.c       | 178 +++++++++++++++++++++++++++++++++++-
 sound/virtio/virtio_ctl_msg_trace.h | 107 ++++++++++++++++++++++
 3 files changed, 286 insertions(+), 1 deletion(-)

base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
