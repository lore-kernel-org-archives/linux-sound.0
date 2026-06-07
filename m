Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF417D6
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780792900; cv=none; b=fI031wo3eXudSYwlxjzeuWsOP8kZ2PGOxhUjMu8HKWGMZKu9EEBubBVfbijO+cGTN0M0ABPsi4YVytZ0evdfo7bfLhpdvgK6uQV+Nw/B0j1MEe808iqdYnLhjvlHHrTeKOPWYZe50lZZA2DZTjpQYq8f2Cw6DOO5Q8eqhvvRG5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780792900; c=relaxed/simple;
	bh=kCJMXi0VDVY8+OzRAUuxPfCtAzVVqO+at3Ehy1NtYKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jAOnWqH1SH/EyIL98Vsijn8mBkoc6d6DtYnb0CxoaesUSu/VYf+Xhn+dQJD5XFE6/RpPWPhxyJI1bIQf8xvGeS9L6QpZEOPoXd4H2C7rQmdVxvgIt8+uBP1ZYdiS/KKLGuk6vx3DiYfRD+eermhOsEK1ygBltHdUkdFJpXS44Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=ab9Ccofh; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="ab9Ccofh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3074adb8fcaso4236926eec.0
        for <linux-sound@vger.kernel.org>; Sat, 06 Jun 2026 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1780792899; x=1781397699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As2MSKh7XOLwpJXPorjSCjfJM/HETrkXY5/jxVw4Dpc=;
        b=ab9CcofhlAc2soTae8pJeJtd22h7EKa4QP9ufPTyjtyJM4M5+3WXgrTTq1nthZT294
         7TCzj7tF6HNP7c4bu+IyGgj9MhQ2r6Fjy5rb5bEy/4mTOYiLkbgnaqSwZ2RC7CsvDsMc
         E3Z0I0DsimNIxiCokxDpz3HBkUlW0ZTIiOJiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780792899; x=1781397699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As2MSKh7XOLwpJXPorjSCjfJM/HETrkXY5/jxVw4Dpc=;
        b=tNFMf+HDuWlTdYouPWjdOMGwKsbSYH7bnLiLQamJACQ0COk/YVCLxNNGp1+L+FNGq+
         zOfDZE4OcHePzTQ85GXcBtTDuvb43HQqYjL2L23GeFTzUjbvtRvbfhh3Hvx8xXdjegk0
         7QwH9kpf6qPAULtQSfiUuny46vO3om+VFl7Dj8bJ9RrsDSisbyE9R/7bNUZKXAfLy1HG
         2sKUS+ZM0EZ8RSntGDSqWVp+P24dY5VhIPR4Q1BfygFMSgypv5eisAjb68E/ai2uMLaU
         NSOs9QLB0RZvtz19CZXj6eXzT9g01CXZK07imRAs+qpbUZzwTzceNuMAKPh1urSg6Ub+
         tB6g==
X-Gm-Message-State: AOJu0YzFine6A3BuYNZPX0B4wLNWSx3kloy+9rm8PY5Ldn1m4cqrp84u
	LiA3DNhiuqkswFKSt4+TsC7l9GVlt/TsNYRJL4YkyGsTATjkyvAQJ23ss2oHKL9rhKNkqS8IFPQ
	LYJKu9eQ=
X-Gm-Gg: Acq92OHzyXfGlMcE5Rt096uxeTQyj4XtCtCerpUa32vBKpr58MkrZHfNqigMBegHYMQ
	lKBSLgrDE02unayaMj0dHR6EoD4pYgIrfh8q9IoafZ1UZuPl1xHxfKJDXQQxxDxFCEAQSGfD5rb
	09pWxOjeLI5+1Y+4ycIiAPVoSsBE+XOxvqIp5z6RVAWsymJAUS+1LNbUagcQqNXgiuf3u71PEwG
	1sM/nEjBBUWqE07ZZ1x3R1qeld3BvBZHxXX+mDmcr8xcLXI5sUgyxaHsNHcVhn05wsvGaXrFCD7
	y8TF+z99J0Y/cy870anMiTjHV412yYBGCuFPVbFgwtKrplH/XuPqK7sXy1bACy6kHjX8WItrjSP
	ANf3i8d7ykY8znce/40eFKQNb5KrBdLLGo8X+oFK75iRZIYgvwdmpSZY1sE1MgvyGKCqTuB8hAM
	vlZTHK7pkyt5apptC2YdiFVYP9Pu90p0u/bycbDXxR9w7mvcSmmTn0S4aQRM1saM93Bkq+fnCFE
	7MNdHUK7wY6haRfQojetphTUH8Hijo9/40X/GGVlEWt
X-Received: by 2002:a05:7300:8c88:b0:304:9b48:5369 with SMTP id 5a478bee46e88-3077ae6fccdmr5902870eec.6.1780792898826;
        Sat, 06 Jun 2026 17:41:38 -0700 (PDT)
Received: from com-75606.node.ndb.openai.org ([104.241.0.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f6381fsm3813462eec.0.2026.06.06.17.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 06 Jun 2026 17:41:38 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] ALSA: seq: Clear variable event pointer on read
Date: Sat,  6 Jun 2026 17:41:29 -0700
Message-ID: <20260607004129.61345-1-kylebot@openai.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_read() copies a queued variable-length event header to userspace
before expanding the payload. Queued variable-length events use
SNDRV_SEQ_EXT_CHAINED internally, and data.ext.ptr points at the first
extension cell.

The read side strips SNDRV_SEQ_EXT_* bits from data.ext.len before the
copy, but it leaves data.ext.ptr untouched. A userspace sequencer client
can therefore write a direct variable event to itself and read back the
extension-cell kernel address from the returned header.

Clear the temporary header pointer before copy_to_user(). The original
queued event remains unchanged and is still passed to
snd_seq_expand_var_event(), so payload expansion keeps using the
internal chain.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 sound/core/seq/seq_clientmgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -441,6 +441,7 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 
 			memcpy(&tmpev, &cell->event, aligned_size);
 			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
+			tmpev.data.ext.ptr = NULL;
 			if (copy_to_user(buf, &tmpev, aligned_size)) {
 				err = -EFAULT;
 				break;
-- 
2.50.0

