Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2966443747C
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534367; cv=none; b=jwLwViJBbXhjSajGbU3V2PjS52dsRVvDny2bpe3CX5TSGmKiwO9KLujfOI023iX8k6njj45g3AT1bLY5kV6hxZVbm4FZ3hx03XJ4XDnzn5U8jBxLwyfLbYI3Ln1Ttlcn4Ju9RrKe/3Nt0yD3Wxw0GyvHnI4PXeldhLLkZb9l2vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534367; c=relaxed/simple;
	bh=vKHGtjMHgyqB1+vSyKomwJLSzFHbToePjolE4qP3+QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUi63/M656mvX/OOx8QCzwVnMG0n0cN8ldMIDzEUxxGdlyF2kRh0zfJnLtBa3uWy35MRfGNoGa6sZqC/sddMOBWnTDOj4KfCZOPV5g2gQcJSU7+BA2F2wjbIWZBsZRYbHKSmb96eP51PCct/rcfGyYAFerJTWImwJNKa+X4NnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHqOh4Wx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHqOh4Wx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1026652a91.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534365; x=1787139165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTa2maH+C+1uwPCaL1BG7q+MNRY6RdcBHt+XiQzKuEw=;
        b=WHqOh4WxZyBzNJBPu+/18u6bjX6+epP7U4qTDckxvOhN2/NdB6FlseSiE0UL42IXRr
         umqCQ6bbfweqhtQJMiLut6k+3KY9dklyy9upVAXIU27cYOmyqIBTAzMuXnvoLAMN7Ekw
         DlGyD4xqtyUWFXawDNnt+wLslHGxHOjx/XYkvzxG6QZS2mDp3X44UBLAeVIsDbUcf/Zq
         0XxJGLIE8UuozvsULIRPQ+bdwdjA6i4CL9SPtU1DZ/fmS1+64ATf830Vwq+Nrkfhj6V2
         evbuCCB9zg4Zm9JQQnSCHgX+6ClP3Nyl82Am9xc+NNn/sHC3136tW1axQBRAA60MANW6
         Gotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534365; x=1787139165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTa2maH+C+1uwPCaL1BG7q+MNRY6RdcBHt+XiQzKuEw=;
        b=RbGK0XXjQFclsMia2BrHSs3rrekpE7a1v4+iAK1JBWcQBm5kCANja1TQCHRE+3/zsS
         K3Og4Zy/ThIcdq2Qeyl/g68SxLYYcyswbCOcxd0dgPv2sXBIl4nOPXBIy0GwKN0SmKlC
         oKeEuJiAfmskpFriZXCezJW5pQOi11IXMUJJuhMByQETOcNjZ3U6gfMfcOvPscSmYcMd
         u/Z6zZ9eW1BqSrXnRktXjs46t+sHAeWsMpG25+8MSMseoyMMUyCEzhyX0mcSYYMNkFdl
         FDffTzXRgB1n+JE//Oj88coY5pNgpLB6lmcCez6x68o4MSBSKLT+eBPHZdYxa8Tv+3wV
         taXQ==
X-Gm-Message-State: AOJu0YwXI3MYUFIxD1qvqFm/TQJiU0k2F4FciW/bPf9waofZvtetqzb6
	sf1TZwWmJzqhlZK6uP/hbwsfWtsJnET111aHEF2y8Yev+khrC+UjL8aw
X-Gm-Gg: AR+sD11E3IeivUh7CZ8Vg1s7DnJpxr/WqdXgnkk/XfsuI4ljejSz9JppCGknJO7mQse
	iOy6B/wnXpWkDyg0EgDrUdJi1jN2Msw1lTAPivmGtVeN7FRZyfVDsJF/bXwJODNSGjcFtEBduM2
	BnpX7wypxJJbjWOdO4Xe8hi+JETxyluv/5g7FjKMljGWrIpS4n9rn9R98qXhbQRDYxW+6TpPA+k
	TPx5wva5pMBUJwOq2BdN1yMacDLVeKVO0pvoOOF4JGNmVsCadncborqc5ewqvXQJVDqTRPP+gcJ
	bQp71UfnmyzmaQRajIJ4ZO9+LSpB8P6mZ18hIi7e349XpFXHFW+w/OXSJSOfe3OFCRDMeOUVHmQ
	/QHB4r2v/MtmtIe5ROUAtXVk0sH5IWjXYorZOlkn8kHs2TDERpmlsafwGoruWIqbDlMz8IYGueW
	FiBuKOA5O0Z1Djek7pC2a5NaEPwEpluvplqPOm9iMgzzOi2o6DrPVg1DLKyBDoI9LB+wqkTMk4m
	xwpIUIbu8Eoss+T9EdfAiMW63dNcYn9TambPdWM2dRFQ6+gs4HnxfVvi3Dlh99B
X-Received: by 2002:a17:90b:520a:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-393017b1e79mr5178137a91.19.1786534365280;
        Wed, 12 Aug 2026 04:32:45 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm3504029a91.14.2026.08.12.04.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:32:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: seq: Restore the delivery error code in the bounce event
Date: Wed, 12 Aug 2026 20:32:36 +0900
Message-ID: <20260812113236.3941391-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in
bounce_error_event()") moved the data.quote.value assignment into the
kernel client branch.  A user client that sets SNDRV_SEQ_FILTER_BOUNCE
used to get the delivery error code there.  Now it gets none, and
nothing else reports it, because a queued event's write() has already
returned success by the time delivery fails.

Send struct snd_seq_event_bounce instead, the error code followed by the
original event record, which is what the UAPI header has described all
along.  Store the negative errno.  The kernel client branch negates it
only because data.quote.value is an unsigned short.

The payload grows from 28 to 32 bytes.  The snd_seq_read() rounds a
variable-length payload up to a multiple of the event size, so a legacy
client now needs an 84 byte buffer instead of 56.  That is what any
event carrying 29 payload bytes has always needed.  A UMP client reads
64 bytes either way.

Drop the stale promise to copy the external data after the event record
as well.  That was never implemented, and bounce_error_event() runs with
atomic set from the timer interrupt.

Fixes: efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in bounce_error_event()")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Notes for the reviewer, not part of the change.

A UMP event does not fit the payload.  A struct snd_seq_ump_event is 32
bytes while quoted.event is 28, so ump[3] is dropped while
SNDRV_SEQ_EVENT_UMP stays set in the copy.  That is already true today,
but this locks it into the UAPI.  Clear the flag, skip bouncing UMP
events, or a different layout?  I did not want to guess.

The err field carries the negative errno.  Nothing has ever produced or
consumed this struct, so the sign is being chosen here for the first
time.  Say if you want the positive value instead.

I could not check whether any user space sets SNDRV_SEQ_FILTER_BOUNCE,
or what buffer size it reads with.

 sound/core/seq/seq_clientmgr.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 11fa7e825819..c334f88de542 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -530,9 +530,10 @@ static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event)
  * Return the error event.
  *
  * If the receiver client is a user client, the original event is
- * encapsulated in SNDRV_SEQ_EVENT_BOUNCE as variable length event.  If
- * the original event is also variable length, the external data is
- * copied after the event record. 
+ * encapsulated in SNDRV_SEQ_EVENT_BOUNCE as variable length event.  The
+ * payload is struct snd_seq_event_bounce, the error code followed by the
+ * original event record.  The external data of a variable length event
+ * is not copied along.
  * If the receiver client is a kernel client, the original event is
  * quoted in SNDRV_SEQ_EVENT_KERNEL_ERROR, since this requires no extra
  * kmalloc.
@@ -541,7 +542,8 @@ static int bounce_error_event(struct snd_seq_client *client,
 			      struct snd_seq_event *event,
 			      int err, int atomic, int hop)
 {
-	struct snd_seq_event bounce_ev, quoted;
+	struct snd_seq_event_bounce quoted;
+	struct snd_seq_event bounce_ev;
 	int result;
 
 	if (client == NULL ||
@@ -565,14 +567,16 @@ static int bounce_error_event(struct snd_seq_client *client,
 		 * variable-length event carries the address of its own
 		 * extension cell, and the payload goes out verbatim.
 		 */
-		quoted = *event;
-		if (snd_seq_ev_is_variable(&quoted)) {
-			quoted.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
-			quoted.data.ext.ptr = NULL;
+		memset(&quoted, 0, sizeof(quoted));
+		quoted.err = err;
+		quoted.event = *event;
+		if (snd_seq_ev_is_variable(&quoted.event)) {
+			quoted.event.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
+			quoted.event.data.ext.ptr = NULL;
 		}
 		bounce_ev.type = SNDRV_SEQ_EVENT_BOUNCE;
 		bounce_ev.flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
-		bounce_ev.data.ext.len = sizeof(struct snd_seq_event);
+		bounce_ev.data.ext.len = sizeof(quoted);
 		bounce_ev.data.ext.ptr = (char *)&quoted;
 	} else {
 		/*
-- 
2.43.0

