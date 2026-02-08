Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D030E826
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770546131; cv=none; b=RYW5lz7FOEL+enCr1CVllg6TVgIiiHDitc9tKGaE37OohvhaQNMKjKCr7kE2NlRJX9K4qDuxG3S+lXnU2d49SxIvUA6DEhfsc6YJL2RIeMrycO87i9YLAZWFOdtiMwmeAnYv0Lnf9AhSs0p2HtebviQKu/xGVpiVcXFmFaIkmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770546131; c=relaxed/simple;
	bh=Cz7ehfn80ppvyadi41DqxbXL/1+dC5KJYoDecVOu8dk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dnAkAdiTStxHVA9I2bHS/M6s7CyKHwWzLdqhGu6imWJvDjV9NNcg7KaAygxBNFHDeaeDAftGGVFYhs7Y1W3Tu9nuLDjGHmo2WaKsPSpwdwTW6hZNBbGI++hyFTdimS4DlknqfdRKKrwMgtEJJCGNzlEMGNvA2kZ0RZjKD9l0zRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdjCC+lT; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdjCC+lT"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2aae985a839so23285ad.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Feb 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770546130; x=1771150930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o84JYzpW0aJdlM9C8zoxk8gq6pZWxToMJv5PSwDwwGk=;
        b=cdjCC+lTIMqUB942TREkNdHe/Zv2k1z7FQwWtSk3C7Wf2F1pjNOtemtF45itFr6FU3
         +s85QwBszG8tXOC9JVJrk5PV20n/OKGYIfMDcKd36qXEhXIOdwtWEgY69JdgYx9XejB4
         eUdrKbriU4kvI1wv3bChjGPJZl6z1lF5eKEkq3NalnSuo8iFwCPEkXvnkXhHP8FeXFwG
         23UgTJVzzaj5256HgpUxSstWrOpLcNv1Mf2ocqhtRdYuSRgUd0f3v9dtmdBTWzX2Om6S
         rvbp3ZKeOlPHotISAVVdaATlvSDwI24B3RZta7josGkrVyy1u7zl5DD+20Aep3N9+sEp
         RGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770546130; x=1771150930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o84JYzpW0aJdlM9C8zoxk8gq6pZWxToMJv5PSwDwwGk=;
        b=MPDZI55Buvymnzh5Ss2vi7HO3Q8A/qIKv4R7B+AD/fVnhFR+xsqc8C4WM+g16WYhBX
         S3lEnoG/8kn60muaO4HwRqnfAtBoE1lohQDbJX6eGmehL9bX/AHgghSr0+IqS7r+9/rM
         j13ShjeQmI1sjywZ/TGquX/56RXDSQm+3jp/rNQNqibAOyJ0Pv52NVVN8KleSSS3TLi9
         EYK/jAXlqxUTDvoX0umyDODhLgdvRizhNuGxYIa4NPUBtXdHAg+YByQTOcv59tfZ8agd
         VN3eGMK4d1YEjr9yPkGlznLH8R8k4gGv0VNawMuNqWgX0yzhd2sNy20F6dPgFwF54bGX
         hs0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg7UkqOBxyLUtFa8xmtquSLlsj1rWrbCls8+FObRyXujSP+yonGK/e/mfM2KZq63Iu0fWEsuQQKCrqYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIy6QG63z5l6Xd7FSyzhJQJStYiA12RixCFzVa7zYL8if09bAZ
	9X/vf2Hy4P56P5AdIN3n/2cYSTnieb8b4cKyGgBGJfLDP/8dbVH5AiMU
X-Gm-Gg: AZuq6aICMBL2XAoenxjO7gbIjFaNbzthVsTTd+7XmQ+xOazKCn6uBzB1zgdO80Zv0xZ
	QE5T7nNEtR2yJpe+ohwDA9mjvGRZgfus3NoP6gpMYv7Hrva+7dPf3l4pRZMaG7Mq9FSo3SvlaSK
	wB9zwzNbXH7cuzxciEhYN4ULxM2SBlwh6ikyAWImhULke8aKxgtMuqNBXq5klsTDq6P02YkF5qq
	baiNt0911IRlOxpqx7tRxMtUmDx3tN3mPMEJ1E4vQ/6KNhr+bi2ElVW/PJBfPashe7b0K24h14H
	s5Io+YxAYEaIYRBDQeVvUPKKcX7qTr04FMM7Axrih4QwKQSbIYNMJKEqE7sMCyzaKcP3be3OPxK
	g5bKu0J+K2xaUlm2ED6HcNZ1E0TalWXB9ix2481C4WILkdjI8/YMBMNF+Bia6PHBtlCvXulnQHG
	kJOhs6aqx31rxKYNe4yrGYFuacTiW1LBrLr5mOmS6SngqzYZAbDWqDdqJLruh5NCY9Hd0lQT8QL
	a4=
X-Received: by 2002:a17:902:da8e:b0:2a9:4555:99d8 with SMTP id d9443c01a7336-2a9519c3c6emr66999515ad.7.1770546130537;
        Sun, 08 Feb 2026 02:22:10 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:5dd4:d722:2dec:7570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9999sm89592565ad.64.2026.02.08.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 02:22:10 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>,
	syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm: fix use-after-free in snd_pcm_post_stop
Date: Sun,  8 Feb 2026 15:50:58 +0530
Message-Id: <20260208102058.9794-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab-use-after-free in snd_pcm_post_stop() when the
PCM runtime may already be freed during teardown.

snd_pcm_post_stop() can be called after snd_pcm_detach_substream()
releases the runtime, leading to a use-after-free when accessing
runtime state and wait queues.

Add a defensive check to avoid dereferencing a freed runtime pointer.

Reported-by: syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 sound/core/pcm_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 932a9bf98..7b9e2aea5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1542,6 +1542,10 @@ static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (!runtime)
+		return;
+		
 	if (runtime->state != state) {
 		snd_pcm_trigger_tstamp(substream);
 		__snd_pcm_set_state(runtime, state);
-- 
2.34.1

