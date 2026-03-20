Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBFA3B6356
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027733; cv=none; b=n2nYoA7FVQz59ADFNuz4dxll49CKPtE5JpBI2EvDBl7cDv8cyzq/qu2hLcpCSF46FuceBhIENYBV74AZNLf+QONl2acbVXbFpNw2sPAFOWO3xFilxIKz12vJJyJR7Pzu84Eh99JPVbVh6BBAJ2HlZL/ZHLHmSVr6cw7ukNnJFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027733; c=relaxed/simple;
	bh=cSimdG/PGvt0GcTfYG/NzuBfXHyQT99Ea8EILEC18qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sZ2SjMDI/AfzDlu9GhtWew1YJ3EVp3EApdWv8c+//q4L7ph3u/SJX/TiOVXvpVSPh+MLQ6qdpnE9f1Heyq29HR4YcefJIelKQ8hI87VAIlUPfKgqbisX7IackRZvedWIKNxmW/n5q/T/1bkNL2bjliR4UPl5IS6LzDMrnIWhZ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjsyvJWy; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjsyvJWy"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0d36f3888so971717eec.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774027732; x=1774632532; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orno1CLSgFOCdJGCV/7kWNLdfd6UN0ZR1L986IDqy/A=;
        b=gjsyvJWyqTaY0Mo2N67KBCDk3FC9crIfM96pd6OTf1DnCTvRroCJ82hdbDemDmp1Vi
         5dFQd+d9hklyOzske62KdfmKQefTXD+GeXsQKDfKEWcrxlDL8Ps/f2g6OtAGnIwHIcen
         pY/D4f6Zkk6/vIfp9QD85Ko1rtP6QW79TQtFquZGMYGk+MynhQ5MrJADLdTBOxJK1/CK
         qmd5B0S+KM6iY+uRj/qCr5h+I8bFcrr+7v2nTvxLO+pTr18Gzti/W+vAkMUQBbI3oV1c
         xz+plzOzLjJGp4fE7QvZmXjtJeTb7y+6L1v+UBSKExI5CLFBVUWERsbxuBaRCUREVC3N
         T06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027732; x=1774632532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orno1CLSgFOCdJGCV/7kWNLdfd6UN0ZR1L986IDqy/A=;
        b=mfDlzyTit4wO/LH2zASsYXfklC1IxoRL4g47ZRyggUpxCPSRTyzc7UkNdAmQ2kTDZh
         E6JxslxdLFGwOwleCmiEWvUP8vB9A5Kx3J2pMogskEGQbX4O95K8NcjyLTucm3HNJZVd
         7Ojz9TUm7QRhw/9Ti44BSa8NUNEhO2DmR/metKDycynEc0dVb9ufUfd2ZbZPCZVHRb4h
         D9wfZERWX6em/3wEYIyGjf0Bs8s54UUCYt9JXU9mPeQsrNboXGgcGv8K19ZsSGQe+LeE
         YpO5NfWlbdIuWYCayLspKvbKMvHGjs9e2dhELPgT7t+SYw2QiMagXefAPzN18q/XKzd3
         FGeA==
X-Forwarded-Encrypted: i=1; AJvYcCVje/i7p+WJgH4X/hlWZ6rNXDp9If3Ly8FpiyVDrkwdoTRB9YUyHe14HqNatCbOXLEefxTwmTjjix/H4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbYo28+QBV+gMpmjMcPx1oF87EsfZ8XdOvDxNV07ZTJE4FZ+0
	y2abG4soJT5D3n9j1BpMtIUMTHFawez1Okj4/3kObk8NNiaIVDwLbMbf
X-Gm-Gg: ATEYQzz84lDAlKlhj6aUAPR//ukW6UI3f4z4AWT1mBJQ0m4Uq8EtLRhcBdGeCf1NLbE
	BSe1EduQTjYUW26MEpg0sNYoU9Fn6/j7W7zQ6/LL8qhnNLPZHk1DOpLmoikt9ZpLdXHH+4A22Xd
	PqDvCLBZVBdOBwvYNKkJ8p8si0RQ6f3vZcR1GAVnWOeaDcY3N7n89BHug/HtBoXwkoraElPsA2O
	wzAWEq5ZOFxQWJxIjovgUHtW9yv2pozGGrcxlZOaM8s+pE63q3B51PWo50vZtJG+ZxK8xHnEkP+
	/KoOcr0zo1JNafMCgWuVpQ8YBtC56XwT12EqM//L859N0gOVUyKiSXv8YrLSWwVNohJVlO3a49c
	m0GAQ/k+q4zNG6FSH0QHAh8SqI+iMJeex0N6LPw3iVJswPH1gqaiWU/uKV+ox6KlPm6TYmifJrC
	e4MtAiCvXGqX7WiwECT6x+fJ7UpvVoKj++RUO4QvtTW9Uhan9AZ93KdIStNEyNhpoUzLidfnFv3
	Fs=
X-Received: by 2002:a05:7300:3723:b0:2be:fe8:8b0d with SMTP id 5a478bee46e88-2c109752b22mr1833534eec.22.1774027731476;
        Fri, 20 Mar 2026 10:28:51 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10aefd778sm5351611eec.0.2026.03.20.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:28:50 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 20 Mar 2026 14:28:35 -0300
Subject: [PATCH] ALSA: pcm: Serialize snd_pcm_suspend_all() with open_mutex
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQrDIBAAvxL23IWNtSnNV0oOoptkqVVxSSlI/
 l7pZWAuMw2Uq7DCPDSo/BGVnLqMlwH87tLGKKE7GDITXQ2hi+qw+DfqoYVTwNyJPmZljNm/8DY
 96B4shdVa6JlSeZXvf/FczvMHryAhTXIAAAA=
X-Change-ID: 20260320-alsa-pcm-suspend-open-close-lock-56907d40df44
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=cSimdG/PGvt0GcTfYG/NzuBfXHyQT99Ea8EILEC18qI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl7m8+uVb5swx6js6m/4/37AKvH4p3rbv9a9VDVwNhku
 3T71S++HaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRJRMZGXYus7bZfuaKxkyd
 48K6eVl+7MLL2wW2bdrEvK/60uP991IY/mfOdmucVpdsJGDpmO4Y5/E0OuXRr5Wds+929PPzf95
 TwwIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_pcm_suspend_all() walks all PCM substreams and uses a lockless
runtime check to skip closed streams. It then calls snd_pcm_suspend()
for each remaining substream and finally runs snd_pcm_sync_stop() in a
second pass.

The runtime lifetime is still controlled by pcm->open_mutex in the
open/release path. That means a concurrent close can clear or free
substream->runtime after the initial check in snd_pcm_suspend_all(),
leaving the later suspend or sync-stop path to dereference a stale or
NULL runtime pointer.

Serialize snd_pcm_suspend_all() with pcm->open_mutex so the runtime
pointer stays stable across both loops. This matches the existing PCM
runtime lifetime rule already used by other core paths that access
substream->runtime outside the stream lock.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 674b50c7c5f6..ebcb62603d49 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1792,8 +1792,9 @@ int snd_pcm_suspend_all(struct snd_pcm *pcm)
 	if (! pcm)
 		return 0;
 
+	guard(mutex)(&pcm->open_mutex);
+
 	for_each_pcm_substream(pcm, stream, substream) {
-		/* FIXME: the open/close code should lock this as well */
 		if (!substream->runtime)
 			continue;
 

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260320-alsa-pcm-suspend-open-close-lock-56907d40df44

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

