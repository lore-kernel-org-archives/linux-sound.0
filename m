Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACFB3B4E9A
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718580; cv=none; b=df7TkUo+RoBei/RaoJ9wj215+hKCdGLKHzV7h1eMyJgnJCqUgpCS62YmlkpLhJHzS/6CAAfIxBXkze+PrM4U1PTLThtAX3p+GJYT430zcgvceHiq/RIYWr2hzRTIjMxSRtNVL4oBRld/cO7Jxj2A8tfWujtg39jQfw1amD9ZbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718580; c=relaxed/simple;
	bh=MFdFeKm/G+G5nLzwp77/0tJ1+gU1siWkcfoiFBsseYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DpUjsirIY5JxaEd77LW0jIezNuXq189vi2tauyCWetOPRr2zkvIkKIaZfAQiWgCRxcTsh2brOIbz7NxIXZCpO7pWQrYAsrWIV6a+b4n6joPFT2iEfwaRAfpYq+0Jy5ultaHVDlrSjhglST+pFR6+u7Ubi6mfDlAnL9Mfulc8vC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLRHQwWV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLRHQwWV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso9950742eec.0
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779718577; x=1780323377; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Jre4CbO6KyJQQsc94Q4J1OErqD+LNWqXxRPcx+UzN0=;
        b=fLRHQwWVJaJ1pJlyg+U5/YKIStUM8L1WI3PoExPec8ipYDRVKk5bCHflPXHx/HFj9U
         Uoj9lKauC+YoFq3RemHMn4Ny3vDskIq/pUoX3drz1vd6ibqGXplZNJECTM/5dHgDwgiF
         jEUMnfyb6+17TNb2lDRO1V8YcwOouSVKhv90FZ2VQf5yJ8hhiWWCc668tmQhbeeJ5XKh
         Eu4iJx1yKVV/DnS2I6CcNNPrvU6HzFGahpK9qnVIFHr6SksprWpEf5Fodpk1rMaJ/nkb
         YOmPbTdMudT1cMpdy2ixgGqSgLGtRjEJ8P1/xxdvco0ql5xtdvSoU543vo7fkuTHDSK3
         pMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779718577; x=1780323377;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Jre4CbO6KyJQQsc94Q4J1OErqD+LNWqXxRPcx+UzN0=;
        b=COMC00lL0+AkIv2Upgfb2wtpvk2H5ay11uD07+KYI/Ipi5Hnhc/1wb4F3jOmT3X2s1
         rmQU8CarCWe6cFedkr+zL1VyheI9Esgn0WaW5bWHT9jLEYt2gtWYA3G0GMdGUFJVm6w1
         33ACw8XNJXMjxDQ00wOiYuA3HPhd8gQhDSvz50xj2DC9okPdf383f7BAM666guKvftom
         BQhF52yCrPUz0j7iDLo2BkpQ8sPNhkMB/z6dOv1r4JL6ixpPpDoejwHxhNE8WJTGrtxK
         N7wUKZwvxCmF+lvzV2Bj8yIF3K6WKNMtChYUQOHyvtUoaXzqMR1pijYOIWdzyQQm1WZA
         5jLA==
X-Gm-Message-State: AOJu0YxcINwy66SaAuXzdqIL/uUfyO9VBTarJK9BgnsIHb54KTqi+0J8
	GHt2pxDHFV19QBMNU/X7NrpKIYEquDZrzp7WU9607Jll04J4L7fPtT7I40g+jw==
X-Gm-Gg: Acq92OGIxGgUiT4p0eEmPL08oAPfQ1Ls8r6rMjViojb9zICGqWbyxIZ8QtHRLeVW+CF
	csYLJeSgxDFF8D67gnp+hARSKLDIR+QlbBJ0rULyFBI/qaRyibqD57C5f0GBm0CxQX7qVC2mGeB
	bUAwKG1yM8NDWRxB89I2Li+Uuih9ni07YMgHJ6oxRQquxJFZnuUv/p+LEY3CzpplEYR3qrYqiTJ
	Hiys/6r6EiEZwxlgFo6WqRfmAiXRT5+esr8vCD4HJ3jIO8g1vn0NEF4Yvii3SPU0thEzZ3kbysD
	Plxp4vsoss7sGLkThtY0a/2HcSIyeylV935ZKlkGXo5pykrrQwyl5ThXMIz2G293MZZrtg2o2Et
	jwHYLGqcx5bwYNkP8Nigu1/1yx2jPtINcnAKY0NNVgpdP36aMCSbJOswxeZahDVSwdetqjpVHuQ
	a543QQnCz2gvoxamvzk3EU61a0STPzCq83rU2TRkgPiDoaLm2+A9mBpYpqjyMkjx9XMcmzrAzzu
	Py6EtMohGm5
X-Received: by 2002:a05:7301:9bc8:b0:304:2eb0:2737 with SMTP id 5a478bee46e88-30449183b1cmr6971558eec.21.1779718576707;
        Mon, 25 May 2026 07:16:16 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm7994721eec.4.2026.05.25.07.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:16:16 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 25 May 2026 11:16:09 -0300
Subject: [PATCH] ALSA: seq: Remove arbitrary prioq insertion limit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260525-alsa-seq-prioq-limit-v1-1-16c348df5ff7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqEQAxA0atI1h0o58arNC6iRk3jWFERxLtb6
 vIt/j9A2QorZN4BljdRGQcH/+NB2dLQMErlDIEJEhP7X6ROCZVnnKyMM3bSy4IUpmHEcW0oKsC
 lk+Va9mf7y1/rWvy5XO4XnOcFWsvc/HgAAAA=
X-Change-ID: 20260518-alsa-seq-prioq-limit-a3734e5f0a4b
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=MFdFeKm/G+G5nLzwp77/0tJ1+gU1siWkcfoiFBsseYo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkikesOufIr1WjzXonvF/tYrbzDYqf61MPnzuUckNr5Y
 U8YwzedjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZiIWCwjwzS3lw9iD+9nlvC/
 vvujW+7PF2z9Mzcxt+r9ZT/Ltft0ZifD/7K0OkfWcofaostiDKeDpJcnZ8+SPXJu5suNJ28G7XB
 25QcA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The sequencer priority queue insertion path uses a hardcoded traversal
limit of 10000 entries.  The value is intended to catch a corrupted list,
but it also becomes a real limit for valid queues.

The event pool limit is per client, while a sequencer queue can be shared
by multiple clients.  A queue can therefore legitimately contain more than
10000 events.  In that case, inserting an event that has to be placed past
the arbitrary limit fails with -EINVAL.

Use the queue's own cell count as the traversal bound instead.  This keeps
the protection against inconsistent list accounting or cyclic lists without
rejecting valid large queues.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/seq_prioq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_prioq.c b/sound/core/seq/seq_prioq.c
index 25c0ed8f9f0f..d5bad1c585f6 100644
--- a/sound/core/seq/seq_prioq.c
+++ b/sound/core/seq/seq_prioq.c
@@ -132,7 +132,7 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 			  struct snd_seq_event_cell * cell)
 {
 	struct snd_seq_event_cell *cur, *prev;
-	int count;
+	int remaining;
 	int prior;
 
 	if (snd_BUG_ON(!f || !cell))
@@ -162,10 +162,16 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 	prev = NULL;		/* previous cell */
 	cur = f->head;		/* cursor */
 
-	count = 10000; /* FIXME: enough big, isn't it? */
+	remaining = f->cells;
 	while (cur != NULL) {
 		/* compare timestamps */
 		int rel = compare_timestamp_rel(&cell->event, &cur->event);
+
+		if (remaining-- <= 0) {
+			pr_err("ALSA: seq: inconsistent prioq cell count\n");
+			return -EINVAL;
+		}
+
 		if (rel < 0)
 			/* new cell has earlier schedule time, */
 			break;
@@ -176,10 +182,6 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 		/* move cursor to next cell */
 		prev = cur;
 		cur = cur->next;
-		if (! --count) {
-			pr_err("ALSA: seq: cannot find a pointer.. infinite loop?\n");
-			return -EINVAL;
-		}
 	}
 
 	/* insert it before cursor */

---
base-commit: fa16304d1c5086bb8b537dd05d36ea68032228c7
change-id: 20260518-alsa-seq-prioq-limit-a3734e5f0a4b

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

