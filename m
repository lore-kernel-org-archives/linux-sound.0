Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749573438B5
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674521; cv=none; b=LRD7ghCpzon8SmVcZVuNVBEU2+yKnOn4vOMaLgDdB8L/BJR6wSRvV543KEvCumB3KAupMEv40YMeFh853qDFhib1Y9g9fjY3TV9fE6Qz4jubaSLQLOcXT1IzL18Vz9FYrt8ESmVOC7fvvIa5tyU+EeOwLmatzPBrfPUktwLtkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674521; c=relaxed/simple;
	bh=m2s+OBvrwys0bfxz0vol5FHksOHr/4B6DJxsb8ZbsWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YPyM1ww/iIhe6wJCVayG9Ca/Qi9Xu7Y0RAQ0ZG9HNFG2T5p9MDYnYH7JKvm8sU6/IT2LFNWKX6mnSUdgfbxZM94nL0E0TsQH6fmAWrbRmI3OShDMW7Ytiwk/Qg9DdiRX9Coc0vyP+Tw9hpAwm6tQrqGCVnbmMfl5lGcVNUfv5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnQg26ub; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnQg26ub"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304fb780deaso2183818eec.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780674520; x=1781279320; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iixvJWDaSwROd6naZSMjR9yBIG+xbONAGCav9ZfJrvQ=;
        b=qnQg26ubFWZjPkVTu1LOTSEViggiWnHi1XXbxIRQ+HU4NvLhA40NLcdu2wEWlJtOOa
         mRloXG3cFFunlgmR9mUgJTKR9/3VCvGooyPPGVBv7bFKfRWr4E7KcmaV+oyGu/6Q8BTA
         /FU2jPJBD+BVYbCi1Yb+h+bXHx7GfqCsAQsHKHGTSK4xaGO2yb9iwhOnEtqoF9y1i30C
         z582YTlFPMR+/xWCNMBi+JoEnyDkmdqW513xI7j8lBZ11wlV4NGd92iyg7LdQQkaJUVC
         x3DHQj8ihGlKivsvV+KAHcJlWCYArM6KiuCqiRQV9u2oQTjGdFmh1okcyNXL+u2BJOFM
         o+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674520; x=1781279320;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iixvJWDaSwROd6naZSMjR9yBIG+xbONAGCav9ZfJrvQ=;
        b=WU06Lnbgi+qkiJerDkcUjpAURmp034V6x+lW2F1Hx7nFgrHKBkGBVwG0KlF2rr604Z
         UOd/5kbyOyF1Dh1fdcKuBuBBLvM6mJx0rw/o92vSS8OsIT9cIYu4Z961K49pXxPhxkjv
         nrncYAfrM7FPM5EB7ANb4xmO7gUKiq5p2j1YyxWmTfVCEOXEPOJUYZqjNwA78k5lofFh
         /8jkYugkH2OIdgrJgIUYRmcH4sRQlQ5cPhSBKziPUBVAVxKqHRRwPrbc5LeSAW+ow9Mn
         Be9MqJwShJ3ACXEiW4naZPAtEuPpo5wlZk7kmE19m5/zfBG14vZlecvjQasJZsaiktAS
         Sovw==
X-Gm-Message-State: AOJu0YwrxyiF8sHZDBmH25BZwxdjr8bT593JANMrdPkGnSr0fue0bykn
	YxOT5/dB2C6fdgG2l+hPHzPUPz7vbAEVWa5UEUV+IgU2bYnS/seEKpuX
X-Gm-Gg: Acq92OGMY8YO1gI1f4Zl/2/NtoqJZogPzOsWNVcotDwrOwY/KvLprz9XDROxskucsj5
	0MX9AqO0PUc5FnrHwPmw/33e1wEcKSo6r7ARyXRPYBH/0lZnzAYHiKngBcMDqfD1h97RdCipViq
	SJ90CxXxThCeaEuAdUQuFIXKfzvqFBkkkbeuvXAPzQw48xViK6x1EjJMdYiDFXIjEyL/dPlzYcS
	yYawdZWLT5dhcyGTB1VUhdaDLf7SozDQEjuAj1kdCebxbWX2DlSytPV4hXr09lHeZAPP26IQ99R
	iif8nOFHvyuI4bVCIZ4+55NG+53Jx6YIYf1avYDqR6xYHVPfr/W3/syG/9RxPBeBVgscATOFZ6J
	EKSYOM/NX6OiSzjwHg0zjAjsHs369cSUDmAxuZDiNIyq2pD7g/6QjrZZzC5hGsDDFjfw4LcPbIb
	pj5BLYjm7R6NX2W7K68JJHWHGPVmQeKsJcXYMFopmRxrv5wkORBm1VA1yaQrWARxsE1kxpL2HAX
	wBmkT7cIW/j
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr2412502eec.0.1780674519284;
        Fri, 05 Jun 2026 08:48:39 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db56697sm8162042eec.2.2026.06.05.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:48:38 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 05 Jun 2026 12:48:27 -0300
Subject: [PATCH] ALSA: pcm: Fix unlocked runtime state reads in xfer ioctls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-alsa-pcm-xfer-state-helper-v1-1-eba97cecf820@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAwA0F+RnBeIRSvzV8YOtUtnhnOlqSKI/
 263Hd/l7aCchBX6aofEq6h85oL6UoEf3fxklEcxGDKWLLXoJnUY/Ru3wAk1u8w48hQLms4TXUP
 bWUNQgpg4yPbLb/e/dRle7PN3hOM4AbiGgT1+AAAA
X-Change-ID: 20260605-alsa-pcm-xfer-state-helper-47c009f57620
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Cen Zhang <zzzccc427@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=m2s+OBvrwys0bfxz0vol5FHksOHr/4B6DJxsb8ZbsWM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlK7y/d85+77K3Eet2KjnWbfI1FmUWrlB7Fbwh923uZU
 Xe3OKtpRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzE/zfDfz/hzfqrvHYalT+s
 TWP2fzbt+MZDD3wvxlp+Y1QRnla/eCkjwwXXhoWhr4NVf4esnt2Vbe1yd1/Jiwfd99hqXWpcmvf
 cYAIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The recent runtime state locking cleanup converted several PCM ioctl state
checks to snd_pcm_get_state(), including snd_pcm_pre_prepare(),
snd_pcm_drain() and snd_pcm_kernel_ioctl(). The native and compat xfer
ioctl paths still sample runtime->state directly before dispatching to the
PCM transfer helpers, and snd_pcm_common_ioctl() still samples the
DISCONNECTED state directly in its common precheck.

Use snd_pcm_get_state() for those ioctl-side prechecks as well. This keeps
the externally visible ioctl entry checks consistent with the stream-locked
state access used by the recent PCM state-read cleanup.

Fixes: 032322b44c02 ("ALSA: pcm: oss: use proper stream lock for runtime->state access")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/pcm_compat.c | 4 ++--
 sound/core/pcm_native.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 5313f50f17da..55ecf87586c4 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -293,7 +293,7 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
-	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	if (get_user(buf, &data32->buf) ||
@@ -338,7 +338,7 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
-	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	ch = substream->runtime->channels;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index e72038c7aa38..db4f5cb39088 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3305,10 +3305,9 @@ static int snd_pcm_xferi_frames_ioctl(struct snd_pcm_substream *substream,
 				      struct snd_xferi __user *_xferi)
 {
 	struct snd_xferi xferi;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_sframes_t result;
 
-	if (runtime->state == SNDRV_PCM_STATE_OPEN)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (put_user(0, &_xferi->result))
 		return -EFAULT;
@@ -3331,7 +3330,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	void *bufs __free(kfree) = NULL;
 	snd_pcm_sframes_t result;
 
-	if (runtime->state == SNDRV_PCM_STATE_OPEN)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (runtime->channels > 128)
 		return -EINVAL;
@@ -3394,7 +3393,7 @@ static int snd_pcm_common_ioctl(struct file *file,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 
-	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	res = snd_power_wait(substream->pcm->card);

---
base-commit: acfce4774d974f8fce06527f9c45e4210715e7da
change-id: 20260605-alsa-pcm-xfer-state-helper-47c009f57620

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

