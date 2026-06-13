Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCC37F8A4
	for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372124; cv=none; b=Ano6aYktIc2/qFt3rEEbWT7ignBQLtfy/lOHgEpOBcWwRvESmsVR9wxBNvH4sWVRyosuqb6/tlytpPDHMPEP2/OQI6CR8Fldyx/+4Iw5t/BecDoZ4XCCIen0kfsZamvLZxUCClFEw7k08Zj8JZ7mnVqqAsLOvm79I9xQggogRQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372124; c=relaxed/simple;
	bh=KQuCUIzLOa1aPWgeJr7el0Xde4LEucKbqFviR1uQLaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qx/arPKTC4II9shbZq9RFSHsqZuEYZGrAC5uhPO4hgLQL0wmoWq3r4Gr21ypmpp7TNERPqiN/iHMetm2QI55IaK0TSfvt/Z3BKGjbqn0D1yHU68nO3YsoXCsi7EClZnXoehT13Y6pSPslX8ECwvMOfExd+Pevn1LsIM/2Pu81tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFKDp4/9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFKDp4/9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f420455so986694b3a.3
        for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781372122; x=1781976922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjU6qgKrfZRDyRuKD/2kaqNNcJ6zJ+VqBB8NVmkuz5c=;
        b=HFKDp4/9xcNIZgW/3R31zZ7IethRV6Z4eBWXFHpP3olcZjZqVugeB9XNvb4NM9LL6/
         8X2/IEusHi6YGlnbUEfIidXwRZc9A+wizdCKR4af3zLqMVaXaPo2LeFJhR1Jn9ghjozj
         OiXgNpKg1no3L22QkwoYaBvMryRdVQ7rkG42iufjVxsItFayGk/mNPFxBrMrpJD/GPV9
         4tauB99ydWH0SS3qb/eDEhV1a/CTXgccPrmGsP7cSUeBgHyS6H5MGqcV+5CMy8qOGQLI
         RT34chiyqA5JK+O70qo2AbHOSq1sCb3n8oGgPl+mL+3bXdkrAGFPHyS9xT5vOp9uMofl
         FZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372122; x=1781976922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjU6qgKrfZRDyRuKD/2kaqNNcJ6zJ+VqBB8NVmkuz5c=;
        b=CjcBP+9LS9ZaznsOLE4MNiMiSVs7a4srXmEjb6gRmkbnApKul2vHxBkEbHEwwV7ZRH
         8nWS4UjGhqm2CK81D8oX9uGulIU6OVa9IJXmPdYn/cODCgG++e0gbGV+Ob2+n3P09t4K
         Dwjvj2yTZ9KZL7FnyBJuFvLDXMLV1IgeGs0zYpdr70bpraPVnytb7rFn9D+HaPrsyC0o
         ncpswWWTjC+oledH2fL+oGmho+qEY/c+pJn2GU9/jcpmE9VE9leiUBbUmha3OTu86ZR3
         ZpErIdnaJgi/GnBvzAsMsQhh9K40zW45mRVe/5aL95Q0TpT2mmWXJlmAvQA2v8Yzn2bn
         DlQQ==
X-Gm-Message-State: AOJu0Yy7S/TVUtOtDU28a9xIJzSqXdUyoEEWQBLBrqPFnLjqYwf6/6r6
	Ed929cC6UpoE4h8gO9yEUMnfIvtJUXACtd5goZKa+Sj0VD74VDOeZ2QA
X-Gm-Gg: Acq92OEPACoUiIZu/U77C5DL5snBCY17B3r1XFgl6pS2Pnn5VarSz0mggrqBJ82S0l5
	1GmQSEWYYNQcxeqqcynUy72eEcDx6bICQvRqR+BXRF0KNeKphzskEbkE+uFz0iebgY5kOtyacJT
	e7hFPA1Qffv0FY7FhzPUQBaOs0+s7zNp4fWiQr13X5XStz65BsOC3dj3LfNZXEPOrIS/pJKaGfl
	dlw74nc7/bGI697URBPyA4suecr0IdRD+wW+g1hE0a4bk3iVlPsojAA2BRa/ZK/CCE3Aau2HPf6
	iGTV2YXbyD+Z49rJbaX3oDuhSfmRUV4+GKzLECPCYcQKLqw7TDCH5OCxZZVQIXbObG4dmwr5uvH
	3VLa6+yZnCyWhTtOOEbuDmWdaa62k1B/925t3vgdzXGrB7L4rrHbi+G0ETQIrf4HTzgC/Bd+Hnb
	ybvr3oHUBOanGxanmK0g==
X-Received: by 2002:a05:6a00:a229:b0:842:4a39:6036 with SMTP id d2e1a72fcca58-844e1a2906emr4662300b3a.27.1781372122050;
        Sat, 13 Jun 2026 10:35:22 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b011288sm4945312b3a.44.2026.06.13.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:35:21 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 2/2] ALSA: seq: avoid stale FIFO cells during resize
Date: Sun, 14 Jun 2026 01:35:13 +0800
Message-Id: <20260613173513.2370168-2-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260613173513.2370168-1-zzzccc427@gmail.com>
References: <20260613173513.2370168-1-zzzccc427@gmail.com>
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

