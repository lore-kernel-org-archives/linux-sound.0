Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458178;
	b=VD2vFjB/mmVrc9jtNYVWP0C2i1vkAsk3yy9QdPvyHlStB3HeYdzZ1fkNdpVcxrE+EdDg
	 JYV+24uW37LkjJMnFMOM5EGblVl8kiPKA87t2+VvXicgjeX1baSUHxeYSD/KmQZHWc7xf
	 aR7n7Q5z3nd2BwV9XRq9bNsQ5Zt2oltjU9mMoB0BrkdyirObhfa3HYb+TNSh6b2ZGhHtL
	 h/Gl7suoalT2/pw5DuUG5xb6F1tP9WBBVv21p/b8N1OmszmU8w5dOd4kHQjm+PeyG8X9z
	 pFmoVlh7c6DSDdT4S9G1UN99jFSkX7N0zDxtlkPM8LTkSD/UYN+SYWfgOmLNyjrLTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=GihGjsTU/aQ4uP8Ia3bwTpnq3s8zCOLmHgQ+jFkKY3BlKHigCBYvaPCbj5hXJ6yi/3R/
	 8EsdN9lcXupesq3fZL5Lt2Ck7m9OGjHVAUJk15rChXuockTtIXypsBj6YKI1MvE2nhQmn
	 64OsoQC0UO+kzLQSLhPBrS3GzXtz/lGEX2npRk4O4By68WyrYsuJy85ZBU7c/zSYqhQa6
	 1A2q2VjMAvk3bPf31GOfkyhoilfNk2ydn8H/8ZzV+bZunRfHHMzRfOha9gtWktN3lavix
	 ML0X4TyXc6Sfq2svXa9dfsM25Lo7cWPmlYsiQOkbNHIEQ2LzuhwC0GueaPvLXCoEZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1B60A2611
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E1B60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1949811a91.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458178; x=1795062978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=crZtx5ZTQgcPeDXZ+R8/o2W277g/LUCjuNTzoT5mRh3cLStZo1r5VA/Ba/69acTfxP
         gnEu7oIEDGLZUqVFHHXQu+ZRh/GFKFmy4B5qAP9eCDbmhbiPnOcF9rSTH9H0qx5s7oOb
         ObeXGweaHsD2oc29782z6CRxsnOR/7ltZwb5+ErkP5yHpCMxj9+YGNwWmJ3A/iwwXP/v
         0+CaJiXT1GTHK+VGq3Zz2iFugdGfVjm0od2Hvnd6vIDNcMn4p7/e9YVbHQJrsvzU5UVc
         dTnPqH+15U6uTn4zY2qdr8jdNB0VX5F94XTS+HQOCfi6sJnwoRZc+6Ljgsi8MDIJeiWJ
         tFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458178; x=1795062978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=2EH6c4MhaucNEUtFQtmUjl/xqDrZDTV7k1YMPNyBTUpnVzvaQ1ImINkwlEgBVa69QQ
         L6qG3qPUBhQvkCS/O9kt3pPia8nZaOM0O4CKVYlRDsPdj9fojNDJ7PZ9wfDT7ScoFBo5
         wHFFOzSAIbKZz6YU9o+HdisNvF0an+15WtkDnxO6eghL0lobE2Ng/UZ2lUgQ3j/FkVfB
         bE+NvWM23NTAXAMiLpFgw5dkQAXBCyxqsa1eY+j0HJveMm1ZYF/XxCQEuU9rjAWi8Fr5
         r6tr3oJVcBVKFK8L04udelBXliUd4ij2y+z6FuMqrjhAhzKtzVOEke7oNbMB0+Wg2eCY
         ATnw==
X-Gm-Message-State: APuU4Z/R/WKpMxVupi4cPH6k0Ry8hYP+Gap1cZ+IxL7G6m+ieQgewGyS
	n5WvZvaSpmAz+uQqU31bMRNJ8gGe0POQihPm0B1cuTeas1cI+flF3dnx8Vs/FQ==
X-Gm-Gg: AYBFou0l6gmn2hK4m5Av8KMGJzYsWNCyZ4/1TKP2sGxpIuLPbkHdQ+QbnzsbCHAbgnk
	LfYz7xphfHeLcOjQIxRuLiJQHSeADC5/GSfjsD0XCTS58uPS/vd4oXN8qWYtne8xrNz6E/CAhuw
	fH7xZnVZbTSDxXiRjhW/NevxMKk7oQhCWlwxLu4yEBJPhdBXp07j46/Dm1vf8hwjXUD7zy4sl0X
	QChiAM2kMWqJPZZJB9ph3eQpA4OGgV52HieUlFuOwhuA+zIVUr1ZVF8HwgxaBmOPW3VUgtWdrQB
	Fg2KCsr/hHKVdK7SjBOY/tRZOuXHDMy7gMNGQACyj4hdgfn5ceAyK6D5/SqkWlQLgY0r14SRS05
	/pUaAcZIGoaUQT49S59nlWJPU3kIVhlS6RlnIuYrKMXoHThcdFJevW2/YdWrnxo02IJnHGF4N/u
	Ut7dBCFYpEG66PehwqTXOyqfT+wbpprLD4EWeAFmu+R7Dp/otuy/lIxLcS3n3YZoOMsrLnyQdDG
	qRlgfQR1eUB1zKFpysA8xj6ViHMXxBGtE92erGG3kIP3DGKPUdoTMN52vKQgu3J7gg5do+OG+Wc
	qm4P895n4zHNtSA2KVUtnE2N8l0TyQiZt738J+u5Zpj7YHM6M9weO7O4SKLvgTo/8sbBuJiSrVL
	tXkfUxw5xJFh5aX4sP9md95RD21+S/+1chaPxLs17cjQqFQo=
X-Received: by 2002:a17:90b:4f81:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b182df3369mr4529123a91.2.1794458177488;
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v28 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 13:35:15 +0900
Message-ID: <20261112043516.37010-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
