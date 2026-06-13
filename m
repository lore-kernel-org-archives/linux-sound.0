Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EBA1EEE6
	for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372122; cv=none; b=m5Iw8SpLsIcRcv0Qxxz9Bp5aIvT9VSBOnuIrdRRpSou6nL9X20fitVZPJOef7i9vjdSh2vTW7mDpfsCXPsqu/ZKyqZBrqNnOv83gAbpWkRALQl8RvmnJi26UHce5w8+Irrg2fslDR4TPawW7rn6d5f4wTsCSFIOrCYLHiCK9MCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372122; c=relaxed/simple;
	bh=Sj4Nl538pldC4eksvSoSB07VkWQxEkzIoVuQnRq8JeU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GK1ME5zidGVsiZ1wWIjLUiNNIx9GabiiQG6OkS+I2x9BWnX0879SwIlXhM3bCpZSXV4ctgcBHqjQ2E402tIxRwD7IwhpyUE43hxH59Tedg8B+Y1kFiciryH+kAQM4xSCj2IKn1jJ9Fv4cpOKmcW32Av27SNlCF6OsPAomPjrH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvY2Z3wj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvY2Z3wj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8422871b42dso1245889b3a.3
        for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781372119; x=1781976919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMwch6akc+iC+N4/8qtQabSF3BiEL7PQv3Y1fEf2tBw=;
        b=IvY2Z3wjuH5TTAr6nlPlrAWrsJ+KS8ozgrpPzxDb/9x2LlbJf3j69xrKBOZwfZqpiX
         gVqoFSuG4ZsShItdEvq4GwoCWWfFa77eERE5VOJzLGKDsrvLfh69gaNRTnYrV1x1G8ML
         5meCx42qXj5XTpjgW/6htRsCe2ajbrFZoivih56q9OdA1KGy8rnMuWnCE/t9Uy6455P0
         tTJsWOK3TYd2yHW9QgMOvMLWK8DglnGNPJJzp5UBbdQNXBZb1tsW5Su7WQBVnQjRT3Jj
         DmZfYLPRO+baDFBsgpKrM0grpb/6HwP536Ykd3435Vj5wESzwUpLL4G8gnCRxNlhfMSI
         wipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372119; x=1781976919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMwch6akc+iC+N4/8qtQabSF3BiEL7PQv3Y1fEf2tBw=;
        b=UvTPvNUWDnD3vreRRAtMe5rl/u1pKeT4KxaLeF4Er4ihJ9D4wjz3KpQCBt5yVUFyh4
         +ayOrGGxhL5O6GLiYU11kqDjfn7erz5FkCraws9bloDLVnJhWJ1/mItnrYW+DqqQxpQS
         WOnKnrBPpckM04zDBOP7StNvl3/3C4IcASLUfEI6tG3L5V4yJDRor4sLgq2zuAf/md72
         PD5VVbstdrpONU5dEohgj6YrxwRBIZK/vGnmh01BeP0WoRTjzrupZj8eDLWW1wogGrfZ
         YmNNpw3qxHHWXeMQcx0dlaGs4McjblP9/HVkneHxD4QyH0DjefMO7fB7xC9L73mlfpKC
         3fEw==
X-Gm-Message-State: AOJu0YxjYrAoX06ZOXwZTK/UZu8zHryH3MObAvb0E/Fjfo7xshtdXxx0
	sR1Ic3yZeCR1X/EGMEzTheJs0hUaLjvFbHjfemehCJbJOlN+ig2ixbDc
X-Gm-Gg: Acq92OH8V4/jXyD66qkkHFyoRxTHt9uyQbqWGUQ0wKYjn5UhVBd/yjGd1jXPWJ/ov2K
	MzIwHH6da7wwuRzII6HrNTjj/nXRSSx6p6BGfAobNGc9WU/Df+9KbeZIAU6AYGuoyCPISs31Vfi
	DsdyvAT9g6XRUM5A0fkTYZHFtCuNiqWxwZMBpxoMnmlLv1r2pFAXmFurRgXPF9JbUX9ULMErndn
	K3CuoMp8A/1CvN1N87GOoTr7bc8/9KWGPc3hdM8yEqahK6fZRtaaExGSl+HSLO5IW8lqtZdZVyw
	/bBSH/tfOKSssULwBPA4VwJ1RzzkCK9wQyaNx/4JregkqldxQwuB0/ZgyttED1m58SbfHFk6PoF
	lD9njla8isl+hEjbbPURw5oCFjdWfIRK6e0F46ruwQx8+fK4dCX7HtJ115y/h4oEsGJkY6QUjPA
	K4X+S0mek6bV5/I8iaYA==
X-Received: by 2002:a05:6a00:2308:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-8434cd497dfmr8520715b3a.12.1781372119069;
        Sat, 13 Jun 2026 10:35:19 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b011288sm4945312b3a.44.2026.06.13.10.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:35:18 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 1/2] ALSA: seq: oss: Serialize readq reset state with q->lock
Date: Sun, 14 Jun 2026 01:35:12 +0800
Message-Id: <20260613173513.2370168-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_oss_readq_clear() resets qlen, head, and tail without
q->lock even though the normal reader and producer paths serialize the
same ring state under that spinlock. A reset can therefore race
snd_seq_oss_readq_free() or snd_seq_oss_readq_put_event() and leave
stale records in the queue, drop freshly queued ones, or report the
wrong readiness after wakeup. KCSAN reports a data race between
snd_seq_oss_readq_clear() and snd_seq_oss_readq_free().

Take q->lock while clearing the ring and resetting input_time. Factor
the enqueue logic into a caller-locked helper so
snd_seq_oss_readq_put_timestamp() updates its suppression state under
the same lock instead of racing the reset path.

The buggy scenario involves two paths, with each column showing the
order within that path:

reset path:                      locked readq updater:
1. snd_seq_oss_reset() or        1. A reader or callback producer
   release reaches                  takes q->lock on the same queue.
   snd_seq_oss_readq_clear().
2. snd_seq_oss_readq_clear()     2. The updater tests or modifies
   resets qlen, head, tail,         qlen, head, and tail.
   and input_time.
3. snd_seq_oss_readq_clear()     3. The updater completes its
   wakes sleepers on                read-modify-write sequence.
   q->midi_sleep.
4. Without q->lock, the reset    4. The resulting ring state drives
   can overlap the locked           later reads and readiness.
   update.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/seq/oss/seq_oss_readq.c | 77 ++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_readq.c b/sound/core/seq/oss/seq_oss_readq.c
index c880d4771169..06e12707db21 100644
--- a/sound/core/seq/oss/seq_oss_readq.c
+++ b/sound/core/seq/oss/seq_oss_readq.c
@@ -73,13 +73,17 @@ snd_seq_oss_readq_delete(struct seq_oss_readq *q)
 void
 snd_seq_oss_readq_clear(struct seq_oss_readq *q)
 {
-	if (q->qlen) {
-		q->qlen = 0;
-		q->head = q->tail = 0;
+	scoped_guard(spinlock_irqsave, &q->lock) {
+		if (q->qlen) {
+			q->qlen = 0;
+			q->head = 0;
+			q->tail = 0;
+		}
+		q->input_time = (unsigned long)-1;
 	}
+
 	/* if someone sleeping, wake'em up */
 	wake_up(&q->midi_sleep);
-	q->input_time = (unsigned long)-1;
 }
 
 /*
@@ -136,11 +140,11 @@ int snd_seq_oss_readq_sysex(struct seq_oss_readq *q, int dev,
 /*
  * copy an event to input queue:
  * return zero if enqueued
+ * caller must hold lock
  */
-int
-snd_seq_oss_readq_put_event(struct seq_oss_readq *q, union evrec *ev)
+static int snd_seq_oss_readq_put_event_locked(struct seq_oss_readq *q,
+					      union evrec *ev)
 {
-	guard(spinlock_irqsave)(&q->lock);
 	if (q->qlen >= q->maxlen - 1)
 		return -ENOMEM;
 
@@ -148,12 +152,27 @@ snd_seq_oss_readq_put_event(struct seq_oss_readq *q, union evrec *ev)
 	q->tail = (q->tail + 1) % q->maxlen;
 	q->qlen++;
 
-	/* wake up sleeper */
-	wake_up(&q->midi_sleep);
-
 	return 0;
 }
 
+/*
+ * copy an event to input queue:
+ * return zero if enqueued
+ */
+int
+snd_seq_oss_readq_put_event(struct seq_oss_readq *q, union evrec *ev)
+{
+	int rc;
+
+	scoped_guard(spinlock_irqsave, &q->lock) {
+		rc = snd_seq_oss_readq_put_event_locked(q, ev);
+		if (!rc)
+			wake_up(&q->midi_sleep);
+	}
+
+	return rc;
+}
+
 
 /*
  * pop queue
@@ -209,23 +228,31 @@ snd_seq_oss_readq_poll(struct seq_oss_readq *q, struct file *file, poll_table *w
 int
 snd_seq_oss_readq_put_timestamp(struct seq_oss_readq *q, unsigned long curt, int seq_mode)
 {
-	if (curt != q->input_time) {
-		union evrec rec;
-		memset(&rec, 0, sizeof(rec));
-		switch (seq_mode) {
-		case SNDRV_SEQ_OSS_MODE_SYNTH:
-			rec.echo = (curt << 8) | SEQ_WAIT;
-			snd_seq_oss_readq_put_event(q, &rec);
-			break;
-		case SNDRV_SEQ_OSS_MODE_MUSIC:
-			rec.t.code = EV_TIMING;
-			rec.t.cmd = TMR_WAIT_ABS;
-			rec.t.time = curt;
-			snd_seq_oss_readq_put_event(q, &rec);
-			break;
+	int queued = 0;
+
+	scoped_guard(spinlock_irqsave, &q->lock) {
+		if (curt != q->input_time) {
+			union evrec rec;
+
+			memset(&rec, 0, sizeof(rec));
+			switch (seq_mode) {
+			case SNDRV_SEQ_OSS_MODE_SYNTH:
+				rec.echo = (curt << 8) | SEQ_WAIT;
+				queued = !snd_seq_oss_readq_put_event_locked(q, &rec);
+				break;
+			case SNDRV_SEQ_OSS_MODE_MUSIC:
+				rec.t.code = EV_TIMING;
+				rec.t.cmd = TMR_WAIT_ABS;
+				rec.t.time = curt;
+				queued = !snd_seq_oss_readq_put_event_locked(q, &rec);
+				break;
+			}
+			q->input_time = curt;
 		}
-		q->input_time = curt;
 	}
+	if (queued)
+		wake_up(&q->midi_sleep);
+
 	return 0;
 }
 
-- 
2.43.0


