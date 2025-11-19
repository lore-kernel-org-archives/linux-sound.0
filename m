Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18D361DD0
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560364; cv=none; b=bT6u2eI7TiKWJWDdArTQ9WviBC2CJZdJLrdkkMHjcUKX6c+dawkMJfEoLvTtijgFz0hSY/vgjtmOekl68js8NWmIxDmtpKwE3guwe2ntuzcWrmwWoYV+HhES5xGp6HG/mgO4txdx83KGb6Zd56AGDcefoUMvjAkQEBUqfU2hXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560364; c=relaxed/simple;
	bh=kDePZLt3wkOo/ZDhDkDcY9NG7+mM8b5gHla/KQxdtG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfaDv4EY+0DsKs5QwGjLexMWRj5n6wvlmH0GDxM5YiDrKe2MGil/ejuFtNBApoTu0W5qPOCySxvaZiI2a5apOotwlJFv6X0nv5zNfTCLFwRnhHgJRLd3qN/E3Ot5L0uoQXCvmxWuQ9XA2O8x4hBV0MzLGRMxWZZzpAV+TK2EP/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uGNN00Hs; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uGNN00Hs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763560348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bTRoYmoKB7ijP/qT5lbD+lvcIFLOri5IPSaIToyulKI=;
	b=uGNN00Hs+EVmW2tY6uhR5vNN/jTLP95dNxDotno4+7wOZ4fGfA6GWMR2F8tDKDYrOLd1vP
	vxfB7XG4oVPhtcH8uSnV5VGfsSOVCp+rqVjwQPH7H2EIaeI4pLFN/U2tY4Akiy6V1Eczcd
	zU72UZG4xpjkzum1c3oX/r3ON2d9K18=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: Replace deprecated strcpy with strscpy_pad in setup_patt_bufs
Date: Wed, 19 Nov 2025 14:52:17 +0100
Message-ID: <20251119135217.233084-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy_pad(), and use kmalloc() instead of kzalloc()
because strscpy_pad() zero-pads the destination buffer and therefore
avoids writing to it twice.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/drivers/pcmtest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 19b3f306c564..b8474631f0b5 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -696,10 +696,10 @@ static int setup_patt_bufs(void)
 	size_t i;
 
 	for (i = 0; i < ARRAY_SIZE(patt_bufs); i++) {
-		patt_bufs[i].buf = kzalloc(MAX_PATTERN_LEN, GFP_KERNEL);
+		patt_bufs[i].buf = kmalloc(MAX_PATTERN_LEN, GFP_KERNEL);
 		if (!patt_bufs[i].buf)
 			break;
-		strcpy(patt_bufs[i].buf, DEFAULT_PATTERN);
+		strscpy_pad(patt_bufs[i].buf, DEFAULT_PATTERN, MAX_PATTERN_LEN);
 		patt_bufs[i].len = DEFAULT_PATTERN_LEN;
 	}
 
-- 
2.51.1

