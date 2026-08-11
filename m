Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C625B0A4
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454324; cv=none; b=KhsMUlzxDQXSpVlvT81d4iWMM4o847qj3czh4peA+nG8UcYUFGSd+jYY+yinNe6VsNUWbhqEf4HgfMqwTLQgzKBKbMBhAbDak6j62d/DZJFuy/Qr2asy8xl7hd4iBncm2Idqpmpy2uynFkVHjd/jp8GSoLuE9qTfP9XBYfuZZ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454324; c=relaxed/simple;
	bh=7ht3xVmLNQeIiUPPcl8A0XYm48ey0/xSzNiwDYwET7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIgZ7jg9rqj5AjxavZlwt1eXt0vjI2j2/kgKZkspFhCqMhv3bSaGSv4p5Z3RaWmQxfW59lXerr08YHTwpi5bQTQ9lvRTlsT8uXtO5RtzQ8aDI46EeAnx31OPYJlV99lhPTl0Wkaaexjudlh9MamwUt38zcMtQQYaCX73iyQB1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEtQGbaw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEtQGbaw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d02b4c3601so33862655ad.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454322; x=1787059122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=771dtknE+FCD4MPix/3pSsrzDifz5xD86J8RNkB81os=;
        b=MEtQGbawGIkWWFWInmuyghSaAv0Qf2EtvyC8u5riQmUDQ4tcXrVWiAIvTSdo/LeIRT
         mLyjPCJpnZEh1lZbgqL5XptAh66MCuXeDL3osIdkceAWrsJif0zRXbQMOf09oZC22j/Z
         2iGHBi3cbXrRMoxHrhRxZE1iWZoyiuqK8Jq5KHxVAvSD0E4Vb+TvNtpcakyIT6z44dDp
         sJuqLqtwgbGsz2mKVy+nyyA1MCpH/Ldhl0yx8DhktqPbtO4JvWLYzG4A5T/SvLMLMqKq
         bTDwnHCc/fRpcfiFbx6sG/vG0sWGF5WkhL5cyCkeajqD865th+ueCyibcxD85D+fnjGY
         0Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454322; x=1787059122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=771dtknE+FCD4MPix/3pSsrzDifz5xD86J8RNkB81os=;
        b=UOy9zyygc8tA1iCeIX7LKJFWxdQazBGQqgotIumGdsZOneUfcu8r5QVdqpITy9FIg4
         LUVzNtDEFvp3L1Co/blRC48QQiXQ9CYf/PZPzbMye932ZwYAlR+3q8E6/SNKucF7DmIv
         aqUTae90mkofcucDBV4vq3A+VTrktmbJyqWXfYcnyooL2xcryeY4uGfSA5dpClsdnztu
         qFc+4FN72Q4i52V3r0V67MQDu1PxEn0PnyvugjlD0enGLkEpRGk+6BSGpm++zmh7i812
         +6wUzCr0L+WtfDauC4fzokntN4eGWh28b97Ds25S2wrplCHFS98MquI1fcD52mAS1kFo
         VOIA==
X-Gm-Message-State: AOJu0Yz1DD/FYFvT2e3wFkEkOThbyUOJ3Sd290KfoT3xZuM0sdoE/3ZO
	dim6Xe0DtAL5sUbbHp/H/XuGk+wONJo2PdNP58QYMJRlhXFDqxodzQBpJcMkUuGU
X-Gm-Gg: AR+sD12gRTLq8xTdpZmCoNx5NR2MJltUFSa9X+vwoZUa8X3dnd/tDTDVY6WBzbsKPdE
	ZnUHyz+JpPj+XBq1PImljMn/YrmvRvntwLR46/P4GyKnOVnjrKPEHt7c+F4XrK4apLX9vn7eXAZ
	4HSLRqTiBioEUCZX4kSKaRPMMJAFpwPupiTZKzqfVAfnYSp1WvyqpMm2OGKA4orwVODoNrnP9+1
	X8II0qQSuULbvs+6H0twlr6Oh+b9BXxMqrFfSg+iC3QuM6PTbj6wVwTSa9bxdfzPKdjzknHTCWV
	+r86p8Bm866M71W1xRJPy9+U6PSJK3Lcs6Q+Qoc1TI/dFUaeC7PSHn8II75ZBsejs0wkBAXnDJN
	fOFTq4z14zax93ZSJ28g6qhdfFajXktr/Azcyf8wn7DuRcnqYRKWnYJ1uNJn/8nfvtPdCfoR4H/
	6MeF/C3yzHKBQg5H5So+CFFGMG44UknWJtbSaihkvfd8zBUlrr2COey4BTqq0tGcGb6J3HD/5JU
	RqDQZJtqCc6WEGGAIKkytV6b6lOmS7C/P8ZrYuebaFNXMtASF5TUg==
X-Received: by 2002:a17:903:9cc:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2d32c0c42c0mr4352165ad.19.1786454321798;
        Tue, 11 Aug 2026 06:18:41 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31622ea02sm8115715ad.73.2026.08.11.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:18:41 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: seq: Don't leak the extension cell pointer in the bounce payload
Date: Tue, 11 Aug 2026 22:18:35 +0900
Message-ID: <20260811131835.3837024-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bounce_error_event() embeds the failed event in the bounce payload
by pointing data.ext.ptr at it.  When that event is a queued
variable-length event, its own data.ext.ptr holds the address of its
first extension cell, put there by snd_seq_event_dup().  The payload
goes out verbatim through snd_seq_expand_var_event(), so the address
reaches userspace.

That is the same address commit 705dd6dcbc0e ("ALSA: seq: Clear
variable event pointer on read") removed from the event header.  The
read path still clears it there, just above the call that expands the
payload.

Embed a sanitised copy instead, treated exactly as snd_seq_read()
treats the header.  A stack copy is enough because delivery is
synchronous and snd_seq_event_dup() copies before returning.

An unprivileged client reaches this by setting SNDRV_SEQ_FILTER_BOUNCE,
queueing a variable-length event to a port that does not exist and
reading the bounce back.  Eight bytes on 64-bit, from its own pool.

Fixes: efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in bounce_error_event()")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Unrelated, and not part of the change: the payload does not match struct
snd_seq_event_bounce in include/uapi/sound/asequencer.h - the err field is
not sent.  Nothing regressed, since the kernel never produced the event
before efc86691e4d8.  I can fix that separately if you want it.

 sound/core/seq/seq_clientmgr.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 28782e1776fa..9ec6c1c0cabc 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -528,7 +528,7 @@ static int bounce_error_event(struct snd_seq_client *client,
 			      struct snd_seq_event *event,
 			      int err, int atomic, int hop)
 {
-	struct snd_seq_event bounce_ev;
+	struct snd_seq_event bounce_ev, quoted;
 	int result;
 
 	if (client == NULL ||
@@ -548,15 +548,19 @@ static int bounce_error_event(struct snd_seq_client *client,
 		 * For user clients, send SNDRV_SEQ_EVENT_BOUNCE with the
 		 * original event embedded as variable-length data.  This
 		 * avoids exposing data.quote.event (a kernel pointer) to
-		 * userspace.  The variable-length path in snd_seq_event_dup()
-		 * copies the event data from data.ext.ptr into chained cells,
-		 * and snd_seq_expand_var_event() copies only the data content
-		 * -- never the pointer -- to userspace.
+		 * userspace.  Sanitise the embedded copy too - a queued
+		 * variable-length event carries the address of its own
+		 * extension cell, and the payload goes out verbatim.
 		 */
+		quoted = *event;
+		if (snd_seq_ev_is_variable(&quoted)) {
+			quoted.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
+			quoted.data.ext.ptr = NULL;
+		}
 		bounce_ev.type = SNDRV_SEQ_EVENT_BOUNCE;
 		bounce_ev.flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
 		bounce_ev.data.ext.len = sizeof(struct snd_seq_event);
-		bounce_ev.data.ext.ptr = (char *)event;
+		bounce_ev.data.ext.ptr = (char *)&quoted;
 	} else {
 		/*
 		 * For kernel clients, quote the event pointer directly.
-- 
2.43.0

