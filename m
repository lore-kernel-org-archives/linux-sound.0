Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921E2F6900
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718961; cv=none; b=Afyv840KN/YaapqoqSIDgdKFcBbDypv3p6NbizudylcSb2g5UHn63MSr+q+98iVemnsrJcy3hCYkI8bUpRpDE1hIJ+PDjP+MiSDnp+wAAFCWOcpeQ1FoDEaJeyeqUAI0eE6TveMDbS0U6s+Zbi+pqbmfL/KUUKd4rcMqyTrjM04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718961; c=relaxed/simple;
	bh=DMg733VlwSWJY1Ldjkhq7ozVbVRULvI3inFeZ56lOCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msD0aW4S6oIYDw7DvjoiWQXS91qwVeEjtUg/ivCvAsmVNPzg6M0VwUuSeqQahpI0Ayr22duRv9asMydC0V0Bj2F4WJfGp0fuAusol3nOqzrcXmZYlJvX95KeNuC0NRsOOT7ULqzsKwjEq1lTpTG44Z5ZueyVExJ36JhvEzI/wDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+LZIwIm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+LZIwIm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3315c5dso27528145ad.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 21:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718959; x=1781323759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FsbdGlRpt8inQhJg6VQV5r05iQNTiYYvCDbh44wz9w=;
        b=s+LZIwImUvsI6PwsltQTIRgjxsiQGnlaJ2piTXHSDObgH5TJHcNS6TDBDGO1xRhYls
         0zbtVtKHar669Jz4DCtmjslfDX/ganUex5EqGGsr591AvrRU18eSNDlr9wjm5FSKLKCu
         hjHJpFQqLEoTdUe7p2hT3oxIjnnCY9e3gDbSOWAKKluX4LS5Ey4z7XHCNwpHDNZOe/Rn
         9BJTAqOwyVU2R/jmheeK2ZRG3/vZHM0oFWC82Se4fMd7msgXlOCVo1iTmNRafTWGeVQ4
         gqjH836dX7T5nTi3sEGxYXMg3zCab2gxNqL/f0AqxZIrvg0Dxl1zjpf/fFoavlUXW782
         FU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718959; x=1781323759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FsbdGlRpt8inQhJg6VQV5r05iQNTiYYvCDbh44wz9w=;
        b=pvCT1mFeejD4hqRPKJJ2TYYqO63EBESwMhvYnWOxUSN7ULiwXSFQKQ1EXdizMcEmTi
         eEhLBRhGOmaCECbzJFqiFgOh8dLucSFSXEu2+1yMWDkXiLp1PMxAs9Ptpasu2wjczqkk
         C/D56KvCr/mTEnjihgfi9prWOyuiS48PZaOykM59y0V5AlnR6LdYZmrhuAbGgOA5VHKO
         dvaECX7NR9FCx0RQ87ZFID7Fh8okkvidhl2UcmoPklTPuq9Wk83MgBsKQscce9KVbgvf
         72ybUP1C6wdRckWuxJDFQ4oiRX6e10xJLpn5joLJGSFsTIT5C+XIqmBMXKieDECPpHH8
         kECw==
X-Gm-Message-State: AOJu0YwgEBtRzaFOQWV53x+HcRy6qT6L51max/ulsP0K56vzCKriHG1U
	GLzP0Ilr1lsK4Ha4dGGZAYMVeUeL9HZzLWV3u04NNlnGOnyYR+I8YsN4
X-Gm-Gg: Acq92OEzuhVga7mw8UI72afBuucvvvwH6Z81+JmERKkXyDu+wSruO74A+zH0Zx3T32t
	nEZe1QbZbESlHKSPYbuItjF6tDS1s63JUXmzPYoNleyGc0tZAZj6B0+cE9TxepcUg+cfoKGHDhM
	K6c4GcbXwLXf9jXTnzxuG5ampZ+PUiJngpN+1cP+4vhpWe88IvRrT1FzrxcdaQNE6+AfhO8PUax
	UROEFK64byAF1P40Tfzycsw6qrBSH0EVjfcgCpYD3zoMWtZUU9qtiikp2UExHsIZwqiOyTTCPiJ
	Fq5mVmNytgAq2jU2MytAC9ERlcAA5jcpRwnt4BewmRXN3+fB7shv2dAUS6vyNl+75m5aELk1g8r
	17FRI+9lqjdMnY3n7waGQUhKCVsFrbYjYT++JYZjO6kNJ8x5SqrXO9cdVOx0eQOmiIHQ9NmuILg
	pm4KU1DQTU/USmMzhiXdcwLZz+kY5vQE1+a6oH3mmc5Fzf/bDIkuLAAgYURXZwDQYou2KGQ7ZQU
	V5TNeI0/O9iGXy28MUBQrp2mCQ=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr72569215ad.16.1780718959509;
        Fri, 05 Jun 2026 21:09:19 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166396fa9sm107511895ad.66.2026.06.05.21.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:09:18 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: seq: Fix partial userptr event expansion
Date: Sat,  6 Jun 2026 13:09:13 +0900
Message-ID: <20260606040913.230213-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_expand_var_event_at() clamps the number of bytes to copy to the
remaining variable-event length, but passes the original buffer size to
expand_var_event().

For SNDRV_SEQ_EXT_USRPTR events, expand_var_event() copies exactly the
size argument from userspace.  On the final chunk, when the remaining
event data is shorter than the caller's buffer, this can read past the
declared event data and can spuriously fail with -EFAULT if the extra
bytes cross an unmapped page.

Pass the clamped length instead.  The chained and kernel-backed paths
already reclamp in dump_var_event(), but the user-pointer path handles
the size directly.

Fixes: ea46f79709b6 ("ALSA: seq: Add snd_seq_expand_var_event_at() helper")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index aaf808316c30..ca9f6db0022c 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -211,7 +211,7 @@ int snd_seq_expand_var_event_at(const struct snd_seq_event *event, int count,
 	len -= offset;
 	if (len > count)
 		len = count;
-	err = expand_var_event(event, offset, count, buf, true);
+	err = expand_var_event(event, offset, len, buf, true);
 	if (err < 0)
 		return err;
 	return len;
-- 
2.43.0

