Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B51DD0D4
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 00:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781398092; cv=none; b=T4k519mB87O59rqMtUzS9WLJdyjEVwuX5myVYAo+oVrqNRRGyr8VKD+vfzlUgDZemzvH4H7zCn2lL6JzeesvzGYX1m5+/rJi21QKIBAbhgyyQlYcaJOUde2tUa+sBiFdhgRoK2i9mPBMRIL2Y14E+nYASl/Cg9LdP81qxh2slDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781398092; c=relaxed/simple;
	bh=M5sbCuJQy6J9jGZrFArpLPycBoBV8ieVux6l/SZzvFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8EJwm4VgAgl0ommiOKatfq/4vz7MMCK39HJ7Ul1jvZW7ZgmXgA28J80WpvhZ+JKt1PMragxQn356QQWuZ/dERLyB7V54rYSoRsgUsMTu8GIlKmNSVfdh83ots5EZ915/XYHAO71Hq+xQIYr/SbEHrTUz68FJcQ0GJieqOXnoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSiwHUcf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSiwHUcf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b900f350fso1901246a91.0
        for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 17:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781398091; x=1782002891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZYpgjn425e2hSJaR8q1oBAJgTovabh++2NXl4Y3D58=;
        b=LSiwHUcfU4vqHo0rpJp2jOYtqhytWLxi/k01Iu6blz3u3Un3eJ9cABtFs8bXFeF+sx
         VCSDDAVKaK0a/UJ05BpSYDHdJm8h0ntV+fuZx+QjrLVH6+harbgbIYdP3eC89DeRj01m
         JmSqrv2v2HuvAYx9KRF7Ri1wDJKxBqgMqDKZIxWfO1qa5x1P5cwpG4ia3BspXzoPwC+U
         b5fqv/eGsWqmppcm3YOxdbAFgShWwQb95COEq36tt0K6EvKZVkKtiasX+1N2TGFUppmU
         F3x1PY4Px4o9vqgezmjNdICLJc2UOKp1/itkeiGPJPcqim45IToD3TiB9kzKENbjMaq0
         ggcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781398091; x=1782002891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZYpgjn425e2hSJaR8q1oBAJgTovabh++2NXl4Y3D58=;
        b=d0fgiJUVOdBM6CfFP6vAkjVpVC5rWOUiotjr/fas2cX5ec+qjtlfHTxgCKsyi7IxgT
         fy5zIn4+f4K1b41vW582/ECke+POReTEj6ieQh4uMDtcQoSiaQoSPfRNV4OrcVnog3z3
         ALAwvfoAs0y8XDfcq0EjkdxvPBoDTu24togDoq4eTC3TNAhCfc3D63gUufUALxJqvRCd
         LepxcVj0wsKnyCxqL/M8mEQrgqIKGoQhSbBteRTbVg+SCdvtBdV8O8fGwo9prY0ND2S5
         NN7pDnTQ/6xtAxgvrQuqLtB9mVB9XCTXO3APuwg7zrzdTYwG35NgypiPMZE84INYNoZc
         ZGgg==
X-Gm-Message-State: AOJu0Yyd7hcBcANTxmQps771q4VMssTpnJt+2r0twoJDXApvAEq40YgO
	gIHqGWdfWbhKBjt40udSwlX3WJMP2RJvFEmJ/5tvrmV/heWBxztmUQwY
X-Gm-Gg: Acq92OEjCtgZBg5cdQUht2WElTv+4BZO71HN1CWtqaBy7R7hUdcm22bclJHHrQmKwbw
	RugVGCi7tzRfLjqF3Y8TBwhscUSrWbbI8TQq4HU475wmZVL/5Jiz6fYuDu4WC5SVKx0WEFyeBfo
	dg84wMmudxRmnjunPx99/gvT36jbmJtVfztG1TxfIatJbiASw7B5B9jjhkaoEoIL6hYulz40Oyx
	PNMZnyhlw8ULDm46/17Mz+qJWAllCH4vBgAux9L6ISotj5mW+xX3r4FvGZA/gOirMFy1g3XhFw2
	ziq/99F1sR9+XaJt6OuCaUDZn53XD08rcNIThIBsGMitD2QopUU8OIYdUi4dViB3YWuA/bu/G3Q
	nA4gU1rOQ70YGjTJZb/UGr2+QphhLDKGgnz39jGrf9dlSHXDXfoefTEfRKG2ZqPLB/18k2kg87c
	nsZWhm0L4IwVluSMluKg==
X-Received: by 2002:a17:90b:3a48:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-37c2bd758d3mr5722425a91.23.1781398090895;
        Sat, 13 Jun 2026 17:48:10 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e754e02dsm2962808a91.1.2026.06.13.17.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 17:48:10 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH v2 2/2] ALSA: seq: avoid stale FIFO cells during resize
Date: Sun, 14 Jun 2026 08:48:01 +0800
Message-Id: <20260614004801.3507773-2-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614004801.3507773-1-zzzccc427@gmail.com>
References: <20260614004801.3507773-1-zzzccc427@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_fifo_resize() still needs to publish the replacement pool
before it waits for FIFO users. A blocking snd_seq_read() holds
f->use_lock while it sleeps, so concurrent senders must be able to
queue to the new pool and wake that reader instead of failing against a
closing old pool.

However, snd_seq_fifo_event_in() duplicates an event before it takes
f->lock, and snd_seq_read() can dequeue a cell and later call
snd_seq_fifo_cell_putback() if copy_to_user() or
snd_seq_expand_var_event() fails. If resize swaps f->pool and detaches
oldhead in between, either path can relink an old-pool cell after the
snapshot. That stale cell sits outside the drained oldhead list, keeps
oldpool->counter elevated, and can leave snd_seq_pool_delete() waiting
for the retired pool to drain.

Keep the existing swap-before-wait ordering in snd_seq_fifo_resize(),
but reject stale cells before any FIFO relink. Revalidate event-in cells
under f->lock and retry them against the published replacement pool, and
free stale putback cells instead of linking them back into the FIFO.

The buggy scenario involves two paths, with each column showing the
order within that path:

resize path:                    relink path:
1. Allocate newpool.             1. Take f->use_lock.
2. Swap f->pool to newpool and   2. Duplicate or dequeue an old-pool
   detach oldhead.                  cell before oldpool closes.
3. Mark oldpool closing and      3. Reach a later relink point after
   wait for FIFO users.             resize published newpool.
4. Free oldhead and delete       4. Relink the old-pool cell after
   oldpool.                         resize detached oldhead.
                                 5. Drop f->use_lock.

The reproducer reports a resize ioctl blocked in the expected pool
teardown path:

signal: resize iteration=98 target_pool=4 exceeded 250ms
        (elapsed=251ms)
diagnostic: resize_tid=651 wchan=snd_seq_pool_done
diagnostic: resize_tid=651 stack=
  snd_seq_pool_done+0x5b/0x140
  snd_seq_pool_delete+0x7a/0x90
  snd_seq_fifo_resize+0x193/0x1e0
  snd_seq_ioctl_set_client_pool+0x214/0x260
  snd_seq_ioctl+0x119/0x540
  __x64_sys_ioctl+0xd1/0x120
  do_syscall_64+0xbb/0x2f0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

A second run with larger pools hit the same target path:

signal: resize iteration=32 target_pool=64 exceeded 250ms
        (elapsed=251ms)
diagnostic: resize_tid=663 wchan=snd_seq_pool_done
diagnostic: resize_tid=663 stack=
  snd_seq_pool_done+0x5b/0x140
  snd_seq_pool_delete+0x7a/0x90
  snd_seq_fifo_resize+0x193/0x1e0
  snd_seq_ioctl_set_client_pool+0x214/0x260
  snd_seq_ioctl+0x119/0x540
  __x64_sys_ioctl+0xd1/0x120
  do_syscall_64+0xbb/0x2f0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 2d7d54002e39 ("ALSA: seq: Fix race during FIFO resize")

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/seq/seq_fifo.c | 52 ++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index ebe1394c18a9..cffa8d430374 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -101,13 +101,17 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 			  struct snd_seq_event *event)
 {
 	struct snd_seq_event_cell *cell;
+	struct snd_seq_pool *pool;
+	bool linked;
 	int err;
 
 	if (snd_BUG_ON(!f))
 		return -EINVAL;
 
 	guard(snd_seq_fifo)(f);
-	err = snd_seq_event_dup(f->pool, event, &cell, 1, NULL, NULL); /* always non-blocking */
+retry:
+	pool = READ_ONCE(f->pool);
+	err = snd_seq_event_dup(pool, event, &cell, 1, NULL, NULL); /* always non-blocking */
 	if (err < 0) {
 		if ((err == -ENOMEM) || (err == -EAGAIN))
 			atomic_inc(&f->overflow);
@@ -115,14 +119,24 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 	}
 		
 	/* append new cells to fifo */
+	linked = false;
 	scoped_guard(spinlock_irqsave, &f->lock) {
-		if (f->tail != NULL)
-			f->tail->next = cell;
-		f->tail = cell;
-		if (f->head == NULL)
-			f->head = cell;
-		cell->next = NULL;
-		f->cells++;
+		if (cell->pool == f->pool) {
+			if (f->tail)
+				f->tail->next = cell;
+			f->tail = cell;
+			if (!f->head)
+				f->head = cell;
+			cell->next = NULL;
+			f->cells++;
+			linked = true;
+		}
+	}
+
+	if (!linked) {
+		/* Retry against the replacement pool after resize publishes it. */
+		snd_seq_cell_free(cell);
+		goto retry;
 	}
 
 	/* wakeup client */
@@ -194,13 +208,21 @@ int snd_seq_fifo_cell_out(struct snd_seq_fifo *f,
 void snd_seq_fifo_cell_putback(struct snd_seq_fifo *f,
 			       struct snd_seq_event_cell *cell)
 {
+	bool linked = false;
+
 	if (cell) {
-		guard(spinlock_irqsave)(&f->lock);
-		cell->next = f->head;
-		f->head = cell;
-		if (!f->tail)
-			f->tail = cell;
-		f->cells++;
+		scoped_guard(spinlock_irqsave, &f->lock) {
+			if (cell->pool == f->pool) {
+				cell->next = f->head;
+				f->head = cell;
+				if (!f->tail)
+					f->tail = cell;
+				f->cells++;
+				linked = true;
+			}
+		}
+		if (!linked)
+			snd_seq_cell_free(cell);
 	}
 }
 
@@ -237,7 +259,7 @@ int snd_seq_fifo_resize(struct snd_seq_fifo *f, int poolsize)
 		oldpool = f->pool;
 		oldhead = f->head;
 		/* exchange pools */
-		f->pool = newpool;
+		WRITE_ONCE(f->pool, newpool);
 		f->head = NULL;
 		f->tail = NULL;
 		f->cells = 0;
-- 
2.43.0

