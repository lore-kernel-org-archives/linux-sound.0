Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2B21CC5B
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619999; cv=none; b=t75WHAV9E9TV7q1lxMWnuBrnaDrq5azTQIYFk7XoyMA4+xiUP9kOMw29dT6+pDm3TQEb6kbvzb+dpvJlVW/S9xVi0CZGWua5EMWEdSuHa4mN8PGqTGDHQxwaGlG98Yw7FnFkJoDhizmzpv2MgGBHmqI63wccctQ47XK8o31pzPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619999; c=relaxed/simple;
	bh=oLKkjjZ1nqQFLkAEsbz6neakiemipl+hBLmCDvZLcyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fMzmH0zUy5FyHB8SeifxsFTzOpSZsI4s5LhIy1OH+8VoeGQfrVUVp1wHW99WSgJcOkvkVTkobyuS9Twxk1MyNKgIjUwit9Pihiqj90x+21sYDRS8nWq4HQGEshEbbXlHEzne794uLH0V6Hu9eBdv6p6BdE/8kk1A/BdGVy5X6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncB0lb84; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncB0lb84"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127380532eeso376852c88.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774619997; x=1775224797; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKMK2cupJvp7jnODQlJRyZ2ANvVhTyq0jP2lowgASsw=;
        b=ncB0lb84SGwkytAYb0vbhV06b4+rK+n+xGmzSKZy55g/h3UNl1kVn75kp+N6zIsIKT
         G6qJnn/yLdAwXMJ4lhfASRXZpXEVoM4/tyskLIOXjHL3ZsTFU4KE+qy9MUNAMse3kKt+
         QhBpHNbC8Ko6CFdiZC4rGxWOylBGVxTR8lXThbYsEWiMQLLn2sD2XtlcWmLac3wTCt9w
         sJhm46VvR8SNQDHZm24MwWr+solYho3/rYOd0EKXz8aiixdl3r6Hyuz3byKhU8NMuofj
         Vtbe2qOHpg1CL0wjnza8t5zwXyQPoyhpMPCSsJKu8met+v0lO+E+uc28LV3VndiGx6wT
         T3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619997; x=1775224797;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKMK2cupJvp7jnODQlJRyZ2ANvVhTyq0jP2lowgASsw=;
        b=CzoEgR8IBDXO7Eo4m4sgeWwTf198v/94NPWYDVr+lkabNM25Zb3UgHpeOO0oEnQmvQ
         evkLMHN0paTrvdW3sR86n0kni/HIHXIXgjqJ0wcewzMHv5mIXbZoKJ70iYtnNkcotHnw
         Hgfj+pRIhd6RMVXOhMnVfNo6tZwwVFU+J5xu8zJfQx5TIxINbkiACEybqw8hx9c99+AH
         vDaT2R/8Q62OpgJAPXDlm5xcpmfr+iWx88B/13kTE96h0nubenWQRrcUy40bIrSByNsW
         1oibf1XX0FirQeppwJssea7a3q4qUalxyuA04B6dKhIQuY4LLhnwPeaeiEetb3+LeAL/
         jQQA==
X-Forwarded-Encrypted: i=1; AJvYcCU/QzRBVI+KoQaF8Zjve98mgj/160o/7mF16WUMpb3d1h/KIwN9Yh8eQMO53hk7tbEVOTewJGjHAaDGOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJRyj2UplV5gRMxqzVeigAJImQBGZsDU57NPC1rj2YahU3dIR
	zyp2UDFE65w6lTH45oQRgLaj5fUEmH5bV6FBEdQdz76MCpdnVJ0sMmIVeo1P2k2f
X-Gm-Gg: ATEYQzxr09LI8lS4BmuLI/ME/gKxCXeqAknRUd8oopqoqwPQxE94nmgpdqB//h+vPSJ
	xRp+aCdDLVaNkEAV9nd5tMoujaKbqpvfKFb5HYhj5JISPc/+9LGx4GDiKv33isxzyCJjtlo96eF
	A1rXPUjumpEimivxp5s1zwAwbkSe2gzV1ypwZdDCkROUzJXg/YRUMoeDTWs+T0JwP2UP0djPWyF
	P/S+ePeTKjEEZ6FTk57KF3ruD1UH20mHEkFyDVkMLbVgTlpTQ8fEjkXQeJidwbZKXW7jZondMG0
	9XROCUfeDztvCUdmqSqr76uyB5DLyiw6w/YvoRhkHHHfD0CJuac0M0wpR0vUmbQO2SKgyEESOUO
	/uOyY7SDlFJ1qPZZsxK7zJdWZZzVrODpNpjARCsMJET3OrcIO8wCMdCf1ZASQeQjJwKQFp0FAyV
	UpgEp+oSbJG7aM3q8DPGHDlp1dkEcIiMyLYxFw6eJbsSNkLHN93sCt58sSzqFjTiTLxtDbskr2
X-Received: by 2002:a05:7022:2608:b0:12a:796b:7cf1 with SMTP id a92af1059eb24-12ab28d8cb9mr1640448c88.23.1774619996955;
        Fri, 27 Mar 2026 06:59:56 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm7910366c88.10.2026.03.27.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:59:56 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 27 Mar 2026 10:59:45 -0300
Subject: [PATCH v2] ALSA: pcm: Serialize snd_pcm_suspend_all() with
 open_mutex
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-alsa-pcm-suspend-open-close-lock-v2-1-cc4baca4dcd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNTQ6CMBBGr2Jm7Zi2/BhceQ/DorYDTCyUdJRoC
 He3cgM3X/K+xXsrCCUmgcthhUQLC8cpgzkewA126gnZZwajTK0Ko9AGsTi7EeUlM00eY150IQp
 hiO6BVd2osy+V78oSsmZO1PF7T9zazAPLM6bPXlz07/1DvmjUeK+axlhtVFFU1360HE4ujtBu2
 /YF725JxtAAAAA=
X-Change-ID: 20260320-alsa-pcm-suspend-open-close-lock-56907d40df44
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=oLKkjjZ1nqQFLkAEsbz6neakiemipl+hBLmCDvZLcyQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnHeqM6vskuy+ZiiOzo7XC+fPneqdczTwpkt+tF8iwJ6
 e75u9ano5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACZi3cbIcPKJoNrET8x9K5xk
 0rKloj/95/pZEisgLCS267px987G1Qz/lJbbbSrOZQs708XUZ25rW/PL1MjjluINlm4vDqUn6iZ
 MAA==
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

Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Update funtion description (updates kerneldoc).
- Link to v1: https://lore.kernel.org/r/20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com
---
 sound/core/pcm_native.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 674b50c7c5f6..a541bb235cfa 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1780,6 +1780,9 @@ static int snd_pcm_suspend(struct snd_pcm_substream *substream)
  * snd_pcm_suspend_all - trigger SUSPEND to all substreams in the given pcm
  * @pcm: the PCM instance
  *
+ * Takes and releases pcm->open_mutex to serialize against
+ * concurrent open/close while walking the substreams.
+ *
  * After this call, all streams are changed to SUSPENDED state.
  *
  * Return: Zero if successful (or @pcm is %NULL), or a negative error code.
@@ -1792,8 +1795,9 @@ int snd_pcm_suspend_all(struct snd_pcm *pcm)
 	if (! pcm)
 		return 0;
 
+	guard(mutex)(&pcm->open_mutex);
+
 	for_each_pcm_substream(pcm, stream, substream) {
-		/* FIXME: the open/close code should lock this as well */
 		if (!substream->runtime)
 			continue;
 

---
base-commit: 2b04091afcbd212e2e0c994d3262b0c61b1778f0
change-id: 20260320-alsa-pcm-suspend-open-close-lock-56907d40df44

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

