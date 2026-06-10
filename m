Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606EA3AC00
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091102; cv=none; b=CX8OwokXeShb8p3n2O/62l0pV5qSUJMGochemJ1ER1ixZRH31y/Wc7BVhEEnHc5aFnIIuQKOIg5/T6GQ61exvVwKS+pu8m0+Z8vXFbNW8+oNWX4+SX/d5w80hIxmr3p6+7CCs5zLzfB5TxqFDb0JhUBMh6QZjNsVEd0H4zEWJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091102; c=relaxed/simple;
	bh=3IAAvA1ob7pethFiA7dKC6y23wTdIBbctXcRef2X33s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NUvLHeGTW4m+WI6I/j/9wns2zAs45CSvRFF1alh8bsMa/lfvrbsxdxjCUl+KAhYsinJiPDjQHY7wy4N/CXhjvvVMlWSYOFoektlGNcg6lcuDG/bVkg7KHUI/f1nPChdPJ6nY5LiiO05LtzlfCT0BZC0W9vL5t0nTMcTd2lPwOcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paf2Vmdh; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paf2Vmdh"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d7f31215so5886546eec.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091099; x=1781695899; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQo9gzwulktZCqCaEW3KCw8KlpR36HoTf+0oPiH7bkg=;
        b=paf2Vmdh1lh318iyuvDjO8YJRXzcmL6iaT2tbnXd7ELY11EPPK0q2UdbFdtpUn2nvh
         a47I2d58g9C2G7xrxXyGrpWhBFouRnTNSZEGDKGitPxfoaRaRnYn9Cpjv5mT0yUxDA8Q
         +Pp1ohIeG7hdF/6wRAD04eIb2wK/jpvo8R25R/jJXcJzhjREPU703ef3hxwYqMnJu5nm
         cTi5oB0c7GySQXLUixbCn2AlM0oj2WmeLisC+v6u12aPBRh67p4yCETd9aoo1OUiBLIt
         AmqicC/LqkV8KUgX7wswOiFok2g37ZvUvYoZ1TnefaD+0Ny1/TWN5Zg1YvicOR/QRI28
         lzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091099; x=1781695899;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQo9gzwulktZCqCaEW3KCw8KlpR36HoTf+0oPiH7bkg=;
        b=JyJxGHV4aRrd9ufDu4adCKSotASElZshx/mnTKVC8/JijwOqNLYDyQxnonIs7XoYZG
         naDYDeWkVoFyhh928k04sYtER51m+/hU2Yj2BDsTR0oqTBcSsizgtmw4oU8jYkhjZYZV
         BXBpCqh4+6wo8B4IPLubwEsDZgrIDOFV0sNgrsQWzNRD6HktMOTRLBCKO+qg0TvCqwCT
         d83wSz3WVReu/TRYsEHOmpbqfI5gRWN0OM2oYMTDrKlQVEA1y+3UNx2uSvaHVEcBo501
         YqmDz7Ti1ISp/5f4qJ9D1TekA0VKWYdH50m8raJblqshx+xski/QzfWXVQdv0fAA/Kzk
         wJ1g==
X-Gm-Message-State: AOJu0YzKLFwG60y5SjF6RUqof7XjXj8t3j0G7oWu3CuvjpDvTCI0Stc2
	COo5vB3BWXkTf8AVBgnVjrQ7FviZkAFLTnEegya76W9DasSKz4WisTaQ
X-Gm-Gg: Acq92OFITbagjXxi9t+sdbqOpRc4Pp2JzEyGQFBNlVtkhMMeFiTVEXxamTFcxFEgsr9
	DVDR1AMo3wKo331CQRqAg/EuoxA35fahTFMoYm1J8wWtc8FFEWxAL7MJ1BHLWKLJuFytX9RWPdK
	GvZLBP9N8IFg3K9pbyJP0+kQjhx+1KUPjt6KdEXMUS/MOQg04dKq66j4u2zXUc1j8rQ5hPsDZPu
	bH5RTv9Ft0QDjqHieA7nqqIOg6nUNi+UdsWxCndsv9l9A+pnVgHlnt+HBugDJoL5sV2ZnXWQdaY
	xMFY0VpaXMEJwlygucA5fAQy/FotfcC07hv24fn0S7DlwHwQIGxOHimZJXDtvrnRpONjvw5ZhrD
	ymwMkEZRyeCfrLnPGhrxOSkDlVKOoUiEztT0xYtVIMbKmd/BOu1eTbZUsk8csnfRlyfJKCCNHri
	3Q+KpuTN4TzHNn50iILR/3BSfbCCjBB7lZ7OYNmzdTe/+UspadCM2ZFvbzMZzWALBdNhRJEGHK+
	j8tIYbdKiMA
X-Received: by 2002:a05:7301:a84:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-3077b3cf954mr16010726eec.14.1781091099197;
        Wed, 10 Jun 2026 04:31:39 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm24816612eec.7.2026.06.10.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:31:38 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 10 Jun 2026 08:31:30 -0300
Subject: [PATCH] ALSA: pcm: Fix unlocked state reads in read/write file ops
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260610-alsa-pcm-read-write-state-helper-v1-1-93b7b992db09@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQhhLRq4iLSTq1I7WGmVQLp
 Xc36ubBt/nfBsYqbHBuNlB+iclzrmgPDaSR5huj9NXgnQ8uuBZpMsKcHqhMPb5VCqMVqjvylFn
 x5ImG0CUf4xFqJisPsv4uLte/bYl3TuXbhX3/AIE88zyEAAAA
X-Change-ID: 20260601-alsa-pcm-read-write-state-helper-92aaf64c2bb7
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3133;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=3IAAvA1ob7pethFiA7dKC6y23wTdIBbctXcRef2X33s=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFma3hKNq5+dPHb/4P9v/I2tV1XNPjekXUvmjD1exKedN
 oXXSMGpo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACbyUpKRYVVeV8a17vz/6m2R
 04vWxQVcLqspPr/L4Nmqav/Zmc966hn+WVlfmXP0MuvfjSdkNyjcWXay5kLk5M21KTk35tWnRF/
 j5gEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The PCM read/write and readv/writev file operations reject streams in
OPEN or DISCONNECTED state before accessing the configured runtime
parameters. However, each operation reads runtime->state without the
PCM stream lock.

PCM state updates are serialized by the stream lock and may occur
concurrently from IRQ context. Use a local predicate based on
snd_pcm_get_state() to take a locked state snapshot for these VFS entry
checks.

This also consolidates the duplicated OPEN and DISCONNECTED tests. The
conditions and returned errors remain unchanged.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
base-commit: 16b06f4e78f969e046991b2fb861cb6832248319
---
 sound/core/pcm_native.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index db4f5cb39088..7dc0060617f1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -645,6 +645,14 @@ snd_pcm_state_t snd_pcm_get_state(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_get_state);
 
+static bool snd_pcm_state_open_or_disconnected(struct snd_pcm_substream *substream)
+{
+	snd_pcm_state_t state = snd_pcm_get_state(substream);
+
+	return state == SNDRV_PCM_STATE_OPEN ||
+	       state == SNDRV_PCM_STATE_DISCONNECTED;
+}
+
 static inline void snd_pcm_timer_notify(struct snd_pcm_substream *substream,
 					int event)
 {
@@ -3569,8 +3577,7 @@ static ssize_t snd_pcm_read(struct file *file, char __user *buf, size_t count,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3594,8 +3601,7 @@ static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3621,8 +3627,7 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!user_backed_iter(to))
 		return -EINVAL;
@@ -3661,8 +3666,7 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!user_backed_iter(from))
 		return -EINVAL;



