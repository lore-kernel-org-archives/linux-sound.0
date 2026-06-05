Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882162EEE94
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780636617; cv=none; b=GldfgjAfj0Z/LE1K7WlVX69FbLpMwFURmWv94YKwj7HWG5rTBwvHHNNABPTy1lbA+t5b7GBEkDUhE/dIEkiRUIe1zE3fVQd5enN3Sqg+2N/tWmsTN0X5MaDitOss/9WL129/RckoN5sSUm1U1KRf/kqxAaWh4VXrbL0t8DHrnpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780636617; c=relaxed/simple;
	bh=9f+jaBTiw0YCCwjO8rY5tpPp9Jp2rSXjEWVZ3tmfie0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HazsERbKYkGkWcRdV3IbVDWKkfsn9kTv6S7x55Ct0aqeEE2QdM9l9o6K9q9S9NRz1M9IEIsERDPFWgrhF9eTGamt3gPG6Za8QhRxGY3NaBNeoryFjZijNJF/tndXoSdHc8O1JN1VMqNM1IyKBMKOEiDnetf7NZaaemEJMePb2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0O0CcGR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0O0CcGR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b8d414666so946188a91.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 22:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780636616; x=1781241416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pD9CqhmzX6JNf1uZuVqTL+AJSUpqeYSBphcg8pxVa58=;
        b=C0O0CcGRtv96nSEFL62BzsFNPyq8VrkNYVe8XjR6Au97Bl3NuC5NjWwDbia8ojapoW
         S6u8AAgnd5HiZFWPW4zt9eI4/GIBoQBcMH4doQNTsI5/s5F4AccwoMdzXbdMpJJfejNT
         Ms/Hr08REFrXzFvDszbppIvrVsbyAAx83Bm6cVXMkR5sPlWdWDgG/Gj2k1MmEQOz/nwe
         B4jW+ImpyYZrGPK2iKfCHNcL0mt/ioNI4Ul1r0vdqGJKAhL/uEqxyNVIb8M+cFrxLx1p
         +aMLMf4FVYLkPUulcVYnmB15uWX/wonKjno7UB6BuNnVaT/xWIqmneGNjLsNk42BKtbc
         FTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780636616; x=1781241416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD9CqhmzX6JNf1uZuVqTL+AJSUpqeYSBphcg8pxVa58=;
        b=Ms5hP9AX+DYzIGTPpfWAKhq4Rx3UdOkOQkcBs7uktPam3HJ7HKVopC/pj2JxyZyeVw
         t828FrFWZ28LTUypGiB7dLPcDR5ixRv57yqlWy/f/mbn9mkaCnW0hj1WxVI+swbw6boq
         Jlcv+2Asz3IVoFomKSSndtRiZ1oCLo/kvoDgur0fDxkYN5qAH8zGiz5tokFW3ua8Pz2V
         cg+BWozrOaheh9oWy3UppMxRTFOoLmLwpJIlQ1bNP7KSF0gKHE+0IqQL8Dcmi/0D0ue6
         /AGikWRTVOrYJ4fRH0PSNkCwF2HfvWld1EK19Ntgp6C4EwisrJvWUG2yn9FnPOnBm7iD
         oF8A==
X-Forwarded-Encrypted: i=1; AFNElJ9L01sdB6UTF7K/QfnCzQOJXjx8ZOWmW1XTSLC1WYcpXKxANTXgtUQb2NS0lW+e+bf4RK/o43F/qvy1Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWJufbVkFjUQyEsVvVypR8ffFItublvjys+77eSHiDEDLg6TO
	bxGdmu/VTFHYOwlRg0vjo4AXU7wkqkn7qaClqMNSQDK+E5fBxUhJRzQd
X-Gm-Gg: Acq92OG9tyVXyZ1EkC4ZkOxkEPE13ckrpkmsM+t7yeq7zxmTM5Hzw1Za1QbRiNgVjgX
	MjyPLQzvnMvsj6mz5c/Z2ivJl1xk6ZxBYJGet7LN51S353VZjX3RHKIRoxouFaFdQ2dxLjYtXk2
	02PZFNxe90xXhXHFO/5w+nH1odM9YwBkh4WVpNOiK4pvAv1P502ioCjJ4gjgfdtko8SELf7kTF3
	+Wh7MpNkacign0HZETV5/mIyt4vZox/aRCQGkFAeTB2K5hBeQi7pVQafk2UkVAObADaBX61po0p
	VxXbKT/yUFbHOhocrUo2V/XkVEiuA0eWyB5m3gfzcIQPuporv97hmQchjQQnbPPXoMk12rXTQp3
	dGtxssPij9HEY5bKf8g2K+xPNpNA4+6/X6rmIAlGSzTLU1sMoy/DgNu/46MtpwerVqbFWuRvzbq
	zh90kAnLIS1UA7WnCoC6S/SWlX
X-Received: by 2002:a17:90b:53c6:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-370f162420amr2107012a91.23.1780636615786;
        Thu, 04 Jun 2026 22:16:55 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm6514164a12.24.2026.06.04.22.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:16:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mehul Rao <mehulrao@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: keep linked runtime alive while draining
Date: Fri,  5 Jun 2026 13:16:37 +0800
Message-ID: <20260605051637.1442529-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_drain() may select a runtime from a linked playback stream and
queue a stack wait entry on its embedded sleep waitqueue. The function
then drops the stream lock and sleeps before removing the wait entry.

commit 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream
runtime in snd_pcm_drain()") cached scalar fields from the linked
runtime before dropping the stream lock, because a concurrent close can
unlink the stream and free its runtime. The same lifetime issue remains
for runtime->sleep. If the linked runtime is detached while the wait
entry is queued, remove_wait_queue() can later operate on a freed or
reused waitqueue, or the stack wait entry can remain linked to freed
memory.

Take snd_pcm_link_rwsem for read while the wait entry is queued on the
linked runtime. Acquire it before re-taking the stream lock, matching the
link/unlink lock order, and drop it only after the wait entry has been
removed.

Fixes: 21cb2a2ec581 ("[ALSA] Fix races between PCM drain and other ops")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/core/pcm_native.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a541bb235cfa..1f7aba988e45 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2175,6 +2175,22 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			result = -ERESTARTSYS;
 			break;
 		}
+
+		/*
+		 * The wait below is queued on to_check->sleep, which is embedded
+		 * in a runtime that may belong to a linked substream.  Link/unlink
+		 * paths take snd_pcm_link_rwsem for write before moving streams
+		 * between groups and detaching runtimes, so take it for read while
+		 * the wait entry is queued.
+		 *
+		 * Drop and re-take the stream lock so the lock order matches
+		 * snd_pcm_link() and snd_pcm_unlink(): link_rwsem first, then the
+		 * stream/group lock.
+		 */
+		snd_pcm_stream_unlock_irq(substream);
+		down_read(&snd_pcm_link_rwsem);
+		snd_pcm_stream_lock_irq(substream);
+
 		/* find a substream to drain */
 		to_check = NULL;
 		group = snd_pcm_stream_group_ref(substream);
@@ -2188,8 +2204,14 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			}
 		}
 		snd_pcm_group_unref(group, substream);
-		if (!to_check)
+
+		if (!to_check) {
+			snd_pcm_stream_unlock_irq(substream);
+			up_read(&snd_pcm_link_rwsem);
+			snd_pcm_stream_lock_irq(substream);
 			break; /* all drained */
+		}
+
 		/*
 		 * Cache the runtime fields needed after unlock.
 		 * A concurrent close() on the linked stream may free
@@ -2216,14 +2238,10 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		tout = schedule_timeout(tout);
 
 		snd_pcm_stream_lock_irq(substream);
-		group = snd_pcm_stream_group_ref(substream);
-		snd_pcm_group_for_each_entry(s, substream) {
-			if (s->runtime == to_check) {
-				remove_wait_queue(&to_check->sleep, &wait);
-				break;
-			}
-		}
-		snd_pcm_group_unref(group, substream);
+		remove_wait_queue(&to_check->sleep, &wait);
+		snd_pcm_stream_unlock_irq(substream);
+		up_read(&snd_pcm_link_rwsem);
+		snd_pcm_stream_lock_irq(substream);
 
 		if (card->shutdown) {
 			result = -ENODEV;
-- 
2.43.0

