Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8E270557
	for <linux-sound@vger.kernel.org>; Thu,  2 Oct 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759427002; cv=none; b=ezt1CVwuHyYBSKyGWsmojYIAzXQ02h3mWDKRx2SfEg2GTV6mWd7ijpAK2QGilW1Co7sOSJIV1smNtqG3FSUJQ0wFb6NlnAqJ/YLupwG7JVJlz5hpc9nv570lvfH8Je0rUwCo0LIsdpETkdp9yc1D22+BQkEBBygov5zxBcEuthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759427002; c=relaxed/simple;
	bh=3g5RnIt5W4eNBXa5w8Ni3T1iTz9L0NQHfkbzpVupV4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FNii6pK/nT/zKqWoFYBVqijP2SnetQopxcHb8R5xDh3STiAJB9pbVtkoRmbbaIgFMO6OTLggRaVNtjOzi8yhtYWoRbf3pGcQ5PVE7cMmFOyugnlPZ5AYr02mCHuzGYuifVc2uZY0b15/XMHpptD2ARLfS1w3kIL4qhdqC1AjA/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7/QUlD5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7/QUlD5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-336b9473529so2047294a91.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Oct 2025 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759427000; x=1760031800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzzDJ2yDPtgGQPfiYSBYD855yiSdjlPSb0GWkIT9A14=;
        b=G7/QUlD51c2qDpHkB/NBUBR9IgMlfwkiE0NjJlGTUqYqfQR28Yw3TK8ZefZ5dk1IkL
         0xmbrHBKRDDBHTE9TWvMz2MskRHPKpXoXrhlJjm+ETBDnSWiXuQvFQBjshCFDlYsBDw2
         H5+YBztqEP1GNGNflScGrOQBbXbTBD4PSYNxiO6kR+KwKB5sE8C2zKPRo/Q16DcaiQmO
         nfUlQV5dHMqSoQi1BhNQ4u5YiGZveDSJSNXsNvYDPWYenqhg3KnUedZwzmqBCWhmOvZ/
         rUlA4oRHPjRg/efAXCsZeZhpCgv3jVUic/Fm8kqjhT0WKDJfrxyLRyfyEy+jNf51ovKj
         ACGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759427000; x=1760031800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzzDJ2yDPtgGQPfiYSBYD855yiSdjlPSb0GWkIT9A14=;
        b=ajsAuQ2/BamcTmVwX0xBOryiyI86ERi5wEwKqw9JxkwEg55YSjWmsrHnkts2/TCaWs
         C1UXFJwFInhFP/727zkpb144fiXJ0bj9Ys79YvA7pPxWS3BfOLEiaBDh04sDcLlgiM4f
         OLneptyiJPGGOeItRdgcV8nmdbflBnEUvPSEGaWIpLC+T8jcWLoHOJEwQCsa3FPj9ACa
         rrajYz8oDhbbTHHs5E5KXeHDtDOHdT6hMfUY2qdAgFGGycPsQVGdnJAPxloZJKTqckp3
         S8upXFUGpXKlzN6k3dbmxZ1OsJpVOPl8SX+2VhrrFbX5Q0d0jWqTmY0Zq1Z1Y/7+Dlnm
         sIdA==
X-Forwarded-Encrypted: i=1; AJvYcCVsyd8t7nCtckddk0L1IyM2stINcO2sAXHirazLN7NZ+BR6laf6MyAG32hbWXPY9POhfkCsgoUwddQyng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiXrb/6mVh3S+TkAuykpzx9x49qw4IAzFG2WRv0ptgvVQcVXb
	0majR3mGH7iW2yHntGZ/jS/4ReWZk9cP8e7NV1TWY9Launu+IN/e3MRz
X-Gm-Gg: ASbGncvzHjQD84/P8QlNJ0eKDhdb2+EHbnepUPOqoHZdbytFvAt/hgWRFv8pcTI9QVg
	76WVyhsCkWExbyk+Lqgpr1HCO5L/UE5dgvzdSsSVe5Ua6hVVKttySsi27f/jur49MgZTr2XL/dr
	xrrMyBmnG6g65gocQOcOaVjs5rUq1pAaDrNj2+ezm5aiNuMBD0SHm9MBpV+6BXF2YShcvWKfECF
	MuApYM6/QMVpMdpclEL1RK847e33WSpM/f/5upqJHhVKwYEgifLRbFf6oKLoKkQjQi0/t5AB1AQ
	mArlZagehBzXUXfwjj46Vy7vX3YGvt4b3fGO1wU0hLwTX3FVuG9f+ZQ9TnMH4s19wjKxlLcnIWL
	+/7sLcoZQsOtIJd/Vawj5NWSbMk5oreL5qOQPWYELb5eyLIHrjSuUetXfQzGdgz0=
X-Google-Smtp-Source: AGHT+IFIt4g5ozSJK8ZpqGGH00OsotOlIKbLyZg8UjetvQsF9VjKEqMlw2viq8FiAeogaNuA2C3SeQ==
X-Received: by 2002:a17:90b:3149:b0:32d:e309:8d76 with SMTP id 98e67ed59e1d1-339c22147a0mr311510a91.10.1759426999797;
        Thu, 02 Oct 2025 10:43:19 -0700 (PDT)
Received: from gmail.com ([157.45.255.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm5487828a91.23.2025.10.02.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:43:19 -0700 (PDT)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] sound/core/seq: Initialize structure pointer to NULL to prevent undefined behavior
Date: Thu,  2 Oct 2025 23:13:00 +0530
Message-ID: <20251002174301.15512-1-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

This change ensures the structure pointer is explicitly initialized to
NULL,preventing potential access to uninitialized memory. It improves
code safety and avoids undefined behavior during pointer dereferencing.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---

Note:
Turned on the settings needed for sequencer MIDI and built a kernel
image with those settings. The system booted up fine with no errors.
However, couldn’t get the sequencer emulation to start.

 sound/core/seq/seq_midi_emul.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index 81d2ef5e5811..f24c5a475c41 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -647,7 +647,7 @@ static void snd_midi_channel_init(struct snd_midi_channel *p, int n)
  */
 static struct snd_midi_channel *snd_midi_channel_init_set(int n)
 {
-	struct snd_midi_channel *chan;
+	struct snd_midi_channel *chan = NULL;
 	int  i;
 
 	chan = kmalloc_array(n, sizeof(struct snd_midi_channel), GFP_KERNEL);
@@ -686,7 +686,7 @@ reset_all_channels(struct snd_midi_channel_set *chset)
  */
 struct snd_midi_channel_set *snd_midi_channel_alloc_set(int n)
 {
-	struct snd_midi_channel_set *chset;
+	struct snd_midi_channel_set *chset = NULL;
 
 	chset = kmalloc(sizeof(*chset), GFP_KERNEL);
 	if (chset) {

base-commit: 50c19e20ed2ef359cf155a39c8462b0a6351b9fa
-- 
2.43.0

