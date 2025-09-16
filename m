Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E9275865
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019584; cv=none; b=gxmHXwiLM82043DbfVfRFRuaf++JIpC477BdYUijq+6D05PQLD+ViYIzQnfn1jeYr4T+fU9erkGHBtR3zezlsXp90YGwcEvTWOFh1+mpfe9iBVoMxsjsaXj5WNhyqjK0Rf0+6ymh/lCuhfMX4YfUJBclY0y0HElI/8h28Q5fsCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019584; c=relaxed/simple;
	bh=6mcsjg4mpO7vTJmNBL+xKZEXfWJ+PXy1vWl3m3v7CM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=strPZll90SST+iPUkG3QKiTaO+wL/HBp9YBu2c1zE/Hk3Rd8LyaCMmRHREciK62H/Vz07TWoywATMX9/mZZX5rokaBgrmATbBSXzlQhSQuPw43sfdflhhGbpS9LYZpU2teBouOpTZzIllEW4YJP74qyXFygf7DNjcXvrCoxvDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCAMiWD5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCAMiWD5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so36192905e9.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758019580; x=1758624380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EdigPIMX6NPHC4cwORQzphly7TiWe8t44OOW+EEUbE=;
        b=gCAMiWD5ze16gMImlXrdxpm0tgQ/svAv7yoE/gJaJ0JpqSSviYIvcKJDME7FuYXIAa
         qR64S4+f9w/FVSEzcnTiDYxMKGEhr68KgsG0xdsDPCbVt3TZS5YjGVcCUeFiAwEY2o2H
         dOOafJsftPGu9y7DRBNRsyg330HBkHrSW6M00B9H/YsOe/y3RIbzxY+/bZcCOcZuTfHd
         6yb0zzSJ+OpJDf1hN2aDN0B71B3lsxtfLQDQ7oBeH3PUGfoXD8tZNAK9Iz9woW/WPzh7
         yjTfZxHuC9c0imCS5WX7apRZ1sKaD0KBpceFTlf7y5eEGk6jqFQvHbjZBuwxuRCxfmJk
         Y9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019580; x=1758624380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EdigPIMX6NPHC4cwORQzphly7TiWe8t44OOW+EEUbE=;
        b=NDKwCpJPsn2912Vyhan8fO0S/gUQqhV4ZltX7nU/YNjST3roL6Tg+naPf6Xcdx223s
         MOql2GZsed9jM4Xvtfjrz2kvhM6OHY6Lkoo435NaXI76bSePo4Jw86z5EPOU8+cBHBUK
         g7O9EXQ6fMt5ygIKTJtwkZm9V3G3+gSbRsVtJ4/+8TXJOYFrs7XHyc7Lce9PjPKi2aZw
         jzZwbTzMpbKsjJgn1KVojQUnyT2vkrUeaCRsW0/PsU9prDXsqmNyZX7tdlJzaEGQT9nF
         BtZ0qQwMnupR45oX1UYzIV+H8dZ7wcGZBZgxbAKFlwqG2KxTMoBjTF0lsEebn4I8ALg9
         VN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBk6EPROSc9LgZAn5Zg+0dxJoXJXyILVsmZGxIrh2ElPLUo4YX4dCiYq8G2NBftzdxCvt5vx7mUeNbJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HkuscswaSReHRB9rmQwMP+5DVgdRWG4hzkTMPAdCLX1ZhIm5
	hJw4eKPDqKC/iM1JMv+/48TY8q8GKZaQepgUzSy/vkbGnShK37Bn4aK6
X-Gm-Gg: ASbGnctjorcCitmHEhTAb82iN0ntJZ8DFD8/dTGU0VbnIEobs5UdnkBHLqAoNC5mXrV
	1jK1tGvBK87JwzzbPdUo1P+1iXNAZ+bp/AKmjkC7BwSM2KILgtIwqjnOLxfp5dCuGy+bxI/tdcd
	oRHsJ9VKedfCriJwd3TpsBjtjE2rZjnitnBwaJpSuaKk634Lik2euCtlWadPevaU8ZQBhdKlaF8
	mTb+ornb7sleTJw5UNmMCx3FbZzmuoonidEh/e6wm47LCmutsuzgQOsxyBO7D1/TCC4RJYhWZbE
	uPp4SUhP9SzuwdjFBS3PDR1nDHm8b5KfRh/3hesjh1JosaqMRAF3mUchb18FABcwFOqb+JXX1OO
	ODXAQCDLLMvKfuRLROuejzwMn
X-Google-Smtp-Source: AGHT+IEwploMqHYB5eM2vvE3PR4MXORlVYqWpE9ZMhJ/ZDhY5aGxDy1NW3Rem0cCgzWHPEtu12e+OA==
X-Received: by 2002:a05:600c:4fcb:b0:45d:d099:873 with SMTP id 5b1f17b1804b1-45f2926264fmr106100155e9.6.1758019579471;
        Tue, 16 Sep 2025 03:46:19 -0700 (PDT)
Received: from gmail.com ([136.226.167.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45edd9f75d1sm195147265e9.17.2025.09.16.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:46:19 -0700 (PDT)
From: hariconscious@gmail.com
To: shuah@kernel.org,
	syzbot+c3dbc239259940ededba@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] sound/core/seq : fix data-race in snd_seq_fifo_cell_out/snd_seq_fifo_poll_wait
Date: Tue, 16 Sep 2025 16:15:48 +0530
Message-ID: <20250916104547.27599-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

data race in both the functions, snd_seq_fifo_cell_out &
snd_seq_fifo_poll_wait is protected with guards

Reported-by: syzbot+c3dbc239259940ededba@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=c3dbc239259940ededba
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
 sound/core/seq/seq_fifo.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index f23c6b7ae240..65e28ebb0eb1 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -138,16 +138,18 @@ static struct snd_seq_event_cell *fifo_cell_out(struct snd_seq_fifo *f)
 {
 	struct snd_seq_event_cell *cell;
 
-	cell = f->head;
-	if (cell) {
-		f->head = cell->next;
+	scoped_guard(spinlock_irqsave, &f->lock) {
+		cell = f->head;
+		if (cell) {
+			f->head = cell->next;
 
-		/* reset tail if this was the last element */
-		if (f->tail == cell)
-			f->tail = NULL;
+			/* reset tail if this was the last element */
+			if (f->tail == cell)
+				f->tail = NULL;
 
-		cell->next = NULL;
-		f->cells--;
+			cell->next = NULL;
+			f->cells--;
+		}
 	}
 
 	return cell;
@@ -210,7 +212,9 @@ int snd_seq_fifo_poll_wait(struct snd_seq_fifo *f, struct file *file,
 			   poll_table *wait)
 {
 	poll_wait(file, &f->input_sleep, wait);
-	return (f->cells > 0);
+	guard(spinlock_irqsave)(&f->lock);
+	int isNonzero = (f->cells > 0);
+	return isNonzero;
 }
 
 /* change the size of pool; all old events are removed */
-- 
2.43.0

