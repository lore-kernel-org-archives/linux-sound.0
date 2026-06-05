Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D648B37B
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646533; cv=none; b=enVSFwFMhECb3sSWyjCq3yinR5KqGejD+ZtWgUN5OKJhDSXhu0OeeqM4IvnxXX+gu7gdKP+3D3f4K2oGIqVlb4EEW5TFY39P8PrfKJhjD2cOClXyFPBA/pjNJBRII8RUHOIF+81uqMMRFX/Hqmbn/ywWt+n3rOOc2Iu/App5WYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646533; c=relaxed/simple;
	bh=J4QF6HyY7WdXcJOvzqQeMovZTMJew1FwpOJ4L0slqpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8Esd8HwSukoV9Rie0CDwLxJo00qlx+aIsDSOB3Yl6XJuZ/Mq+2oDx1zRywCcylemNyfpSudqD2/GJTkSTzic2M3WMWla/NQTo7nNRVFFb+KSk878mZz227NP0GHI55cqPaxJJ+3fK87AlT4Y/If1EBfbuX6rSTtXUSY8Ov0bvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=YEfC46h9; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="YEfC46h9"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1370417c01cso2205918c88.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1780646532; x=1781251332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0MKd2BjGRjcfijiROsnShPJb9QdO7zP5n1xrf5kWKBE=;
        b=YEfC46h939uVcmn7zDIvpvH1RRTD5dvm7/lBJg5adrP7+NdPNI21qe4S5SPDKxjcop
         jJf5ftk2axIB82CS7CGApd5t0fJuNW8hge0Q8YlA2XUmedJQo6rTyEDewm1NV8WlzaFS
         N8V8qmXbcC8h8C+8OvX6sOJTNqd53iJWi8Bhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646532; x=1781251332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MKd2BjGRjcfijiROsnShPJb9QdO7zP5n1xrf5kWKBE=;
        b=hIpX2/W4Kgokf7o+Xr8i6POhwAXFExHX4DqYPjbfwnPxdux21IaVGCptidPyYRvPph
         +PmCLu5IIjfKEboPHUy0mXy5uB86CeKhNPKhZA3Wl/9XABTkU2Dm/5Mn2LeJy1UM3sJj
         fXU68MxaTISUQx0XbzOalelQPbJuNmXc5J47XzRl8R75IleQdi/vX44/QR0brM8Yqwri
         M4W4SC6lRhE17czFINAvwOqkfVZLa0BbGtostaNJr8FXiGJMxz589GZ9BHOr7ahugoO8
         ncgN02GipT6EObqUxXxsTq7odfB6m63ZUU58KJshSPONqJOO9/loeNfIrA3Kt/KipY4X
         EZJg==
X-Gm-Message-State: AOJu0YzVrMuFmiL9qm8dbZyqEOyTTeYPMnKXXPt7fA8KMaAQ5r/rxbmC
	wf1nUZVp1KyeefRqcTxB+jtzVaQrbmgqwZHDput+PkPnF01B2/I1qB1QQgXyQMX85OvOnoUptS2
	zTvLofhI=
X-Gm-Gg: Acq92OGQniEL+jgNLrVYWqqSbmdLNzvQgL8SgYYUxLjUQb+vYuYXgEsGbL5SJlYQ4q4
	w5zJciKa41/NLoUH4xKfST/xUAmmE5xnObyTRNZ1yVDgnEaF113BeX6ny1nijoAk0F8c3QkLtyd
	G9ykGJdsG52/TXKriiphRyes3l653/yktlXfiRgfILwdlcrLR/H2Yx3n3SrCssnfRaPHTs3vr9D
	iZ3dliGP9z+QGZL4luPFSbqro946J1Z9acfS6/b08f65JIKPrg/CJgfZHWMKuyPRUcwuZ9oWZjg
	V+iPFe/7VH6DhM0tJbspWrV599pLwPS5Dhd+RzGjbzrO+E7U8ozBX8N36kzV2xMvCv9d5yLvyK7
	H9621LJXX9fylObyfZHnEg4q4iU2vFL/Jt0GYa8nOeHldoa60UeYBrLtpWQzuOiy7ZQGh4l4zCO
	MY3K0i4dMTJ9hIfYJL+/VrZTPz8VkmC7d4wGVmkQa4wqURQwSv2U5ZZ60+v9Rg+Pg9SYKaUvYbZ
	ewJujnt40lTY1pq6RUg4moBJYpr7F+6uLCw2yGLoMXv
X-Received: by 2002:a05:7301:292e:b0:2ed:e14:7f54 with SMTP id 5a478bee46e88-3077b79be38mr918628eec.30.1780646531534;
        Fri, 05 Jun 2026 01:02:11 -0700 (PDT)
Received: from com-75606.node.ndb.openai.org ([104.241.0.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dfa3a2asm9869493eec.31.2026.06.05.01.02.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 05 Jun 2026 01:02:11 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] ALSA: seq: dummy: fix UMP event stack overread
Date: Fri,  5 Jun 2026 01:02:04 -0700
Message-ID: <20260605080204.32045-1-kylebot@openai.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dummy sequencer port forwards events by copying an incoming
struct snd_seq_event into a stack temporary, rewriting source and
destination, and dispatching the temporary to subscribers. That legacy
event storage is smaller than struct snd_seq_ump_event.

When a UMP event reaches the dummy client, the copy leaves the UMP flag
set but only provides legacy-sized stack storage. The subscriber
delivery path then uses snd_seq_event_packet_size() and copies a
UMP-sized packet from that stack object, reading past the end of the
temporary.

Use the existing union __snd_seq_event storage and copy the packet size
reported for the incoming event before rewriting the common routing
fields. This preserves the full UMP packet for UMP events while keeping
legacy event handling unchanged.

Fixes: 32cb23a0f911 ("ALSA: seq: dummy: Allow UMP conversion")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 sound/core/seq/seq_dummy.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index af45f328ae99..8abe80985dad 100644
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <sound/core.h>
 #include "seq_clientmgr.h"
+#include "seq_memory.h"
 #include <sound/initval.h>
 #include <sound/asoundef.h>
 
@@ -81,19 +82,21 @@ dummy_input(struct snd_seq_event *ev, int direct, void *private_data,
 	    int atomic, int hop)
 {
 	struct snd_seq_dummy_port *p;
-	struct snd_seq_event tmpev;
+	union __snd_seq_event tmpev;
+	size_t size;
 
 	p = private_data;
 	if (ev->source.client == SNDRV_SEQ_CLIENT_SYSTEM ||
 	    ev->type == SNDRV_SEQ_EVENT_KERNEL_ERROR)
 		return 0; /* ignore system messages */
-	tmpev = *ev;
+	size = snd_seq_event_packet_size(ev);
+	memcpy(&tmpev, ev, size);
 	if (p->duplex)
-		tmpev.source.port = p->connect;
+		tmpev.legacy.source.port = p->connect;
 	else
-		tmpev.source.port = p->port;
-	tmpev.dest.client = SNDRV_SEQ_ADDRESS_SUBSCRIBERS;
-	return snd_seq_kernel_client_dispatch(p->client, &tmpev, atomic, hop);
+		tmpev.legacy.source.port = p->port;
+	tmpev.legacy.dest.client = SNDRV_SEQ_ADDRESS_SUBSCRIBERS;
+	return snd_seq_kernel_client_dispatch(p->client, &tmpev.legacy, atomic, hop);
 }
 
 /*
-- 
2.51.0

