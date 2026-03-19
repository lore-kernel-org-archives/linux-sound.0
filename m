Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410732863D
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 04:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894233; cv=none; b=BZ7+lW5TdU7R34nZkScgnQpu7FzR/ywj7xziWvgU9y2hG5gelfitx4ZSSmPEbokBqKRmdA+NLEu/rZiewrdRj+GCbzFdTca+ZGqkZtmQwF2oJCHYm7E8Sk5DNWz3MLztcX/3JPOsHeMYgtzvRQPEHrXwMLPWn/GwkX7gLVixTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894233; c=relaxed/simple;
	bh=732FWN47KnJJGZ7cjdTpPeleb+eK+860yewRn8CzY1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L/rhUemMaF4FhWdcVjq243+0D3uirw4gy7KQQjhdg8OyNIkKNSfJFAf6mLCWX9U8+PE+IjNkqh80Y9POU+L4PXW2QAlcU4CtCxz5ggXRRantJV/ta+9sEHXuhnOssKDQxMCzxKL/epgliLJ/ZoOrBYqCcfHwY8nHSLuoZi0oxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2ObG7na; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2ObG7na"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128d7db88b9so813380c88.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 21:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773894232; x=1774499032; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIcKzwG6x118AH0uYawVORj0pRHsg/+p7rL0Vqj2QJo=;
        b=T2ObG7na6GEOPi4JIqD1n9HUAm4QigOF/t0ZKIcDRL4fvIbv6YPaKyISXiXVeiio9l
         vXKb4Ps3WbTClV3zusBhk+Sx19B97inUaxDz/nepnGWc4Y92ksfZrpMzGQZO7rEp9+EH
         O+ev1zZi7uuuDZUGyQiB9er4xU6G8rcuJu2C06wC/doy1W1XytmhDsgucSE1RO/R+yYg
         DUhG6ZsjfTtGojeyeydZHDdK4kDksvaYHKDR1yrvUI2FeVeqZL172+xfBRhzRtZuCcz5
         /YVapxnyr+yAC5F45eWOmOozrMN3XkFroED10xkoYVRq4sXj40t4IBKx7r930YhaMTDE
         QA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773894232; x=1774499032;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIcKzwG6x118AH0uYawVORj0pRHsg/+p7rL0Vqj2QJo=;
        b=Alo+OIV+tqRQTZKt5VpkX+BCO5w2mMhVxz3RGTV4A2JOwBzOSjV4eaFvqgj0+49YtG
         0fqxi0n3QrEGtcEMpaLUD3T1TLNs9UdQ0yxEhweJrvqFNU+WaOjEJCIDucKhYmBLZ12L
         1WX/sEd72BRUR7E9Dhfo4kQkmSm1cImkEYnJDOaZwx4PkosjEhYzZdGtgnc+WTW47n2a
         fC8m1L2RbaN++XSeK87VugojLvZUTq85PPSkk6loEk1Ok6EwReAtAxF/aU7o/3p6aSbC
         fYKeMwwEuWD+fDP6Q1gaIRezdWa1CYUbUj9C64pTKDFiCvOSQsiAO62eJ5S6LA4FtZxC
         vcig==
X-Forwarded-Encrypted: i=1; AJvYcCXa4Nh6982T9qzXj4JVsXe967uVTPZGvvWj+vTkQEap5p5Ddd9nuSR23KxVi27Kl3DKe1yDYopQS72BFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqHGNomaEgyEippzJQhgVuloADzydgsuJNH9b9ZJp4j++bqJR
	oknodjmEPeG811QoKUyPurCjZAhsZNWOMsgPD4jnUJTFG1R5EBRGCoc5HpnvLbCI
X-Gm-Gg: ATEYQzwQnRxXqSl2o6RO72H1RoqwvguMEWxN6+N0FGS6NXARo/MZNQInmXYrpsRELmQ
	M9SqYGYODzlRhqtwD6B6Zx2HfJ/HBKpKNNd40fM/k4h1+SEirZFF/W0kehLqEiHDEMaJJJysIZs
	8iNJ8pY3ESBrD4nUduW1zQ6AX0jXrOwiFTxjmZI/RTgXggd0Iwxpd4WoXepPupI0+03dkPVd6Iw
	IRqIvHLVVQChdEEondHj9WshSlLXKo6zXrI9VS4Kp6OhTulh7Alj1fZVZ7KrCBmEPQl+b5Ho9XZ
	TW0fReEFJnN+/AMynm0qxCv8vA27QehJcLBmF3YZ8m7jABfYmXIXPDc981t26ifCnTA3XfmQFvA
	U41eWX8L7fQ0q+OQSCGTajG1N39IuqDvFOHwM82S3k8ngLo66lhyJl/HTc1mkUbYNoRKyDCF4L0
	TKTuAKUOyyEi67MEPnBOwWd58KaaLcMKcrxdFjd506Ul94R/M/wtnLwwv5EzKUQhsUKCZyx8n+R
	i10
X-Received: by 2002:a05:7022:60a2:b0:128:cf86:d1e5 with SMTP id a92af1059eb24-1299ba9f899mr3088225c88.16.1773894231330;
        Wed, 18 Mar 2026 21:23:51 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b4127b7esm8401813c88.9.2026.03.18.21.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:23:50 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 19 Mar 2026 01:23:40 -0300
Subject: [PATCH] ALSA: pcm: reconstruct compat appl_ptr in SYNC_PTR ioctl
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-alsa-pcm-compat-syncptr-boundary-v1-1-ce2b2a61f167@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQrCMAyA4VcZORvoKurwVcRDTDMNuLYkmzjG3
 t3i8bv8/wYupuJw7TYw+ahryQ39oQN+UX4KamqGGOI5HPsB6e2ElSfkMlWa0dfMdTZ8lCUnshV
 DOsUUxyHxRaBlqsmo3//idt/3H5lXMepyAAAA
X-Change-ID: 20260318-alsa-pcm-compat-syncptr-boundary-0d52d2f8dc7e
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3747;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=732FWN47KnJJGZ7cjdTpPeleb+eK+860yewRn8CzY1k=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm7q0JazQ08fFVU5z98amrLuJXX89/tL6/3OLx7fdBq5
 YusAztVOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi7aEMf+VSfns8Srrh+3HK
 0p8zH82x2vlsUvvffxMCTsda9enePbmK4X/YG6FjZZNcjizrPVkgvfjH8sMXkvYEOGtvLn5x9zG
 XwUZ+AA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The compat SYNC_PTR ioctl exposes appl_ptr and hw_ptr in a reduced
32-bit boundary domain. However, when compat user space passes appl_ptr
back to the kernel, the value is currently fed to pcm_lib_apply_appl_ptr()
as if it were already in the native runtime->boundary domain.

This leaves the compat SYNC_PTR path asymmetric: appl_ptr is exported to
compat user space modulo the compat boundary, but the value written back
is not reconstructed in the native boundary domain before being applied.

The mismatch becomes visible after appl_ptr wraps in the compat
boundary. At that point, compat user space sends a small appl_ptr value
again, but the kernel may interpret it as a different native appl_ptr
position instead of the nearest congruent position around the current
control->appl_ptr.

Fix this by reconstructing the compat appl_ptr in the native runtime
boundary before passing it to pcm_lib_apply_appl_ptr().

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/pcm_native.c | 50 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 674b50c7c5f6..f2e2854847ae 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3228,6 +3228,45 @@ static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
 		return boundary / 2;
 }
 
+/*
+ * Reconstruct the nearest native appl_ptr for a compat appl_ptr
+ * value modulo compat_boundary.
+ */
+static snd_pcm_uframes_t
+snd_pcm_compat_reconstruct_appl_ptr(struct snd_pcm_runtime *runtime,
+				    snd_pcm_uframes_t compat_boundary,
+				    u32 appl_ptr)
+{
+	snd_pcm_uframes_t cur = runtime->control->appl_ptr;
+	snd_pcm_sframes_t rel; /* relative offset */
+	snd_pcm_sframes_t new_appl_ptr;
+
+	if (!compat_boundary || compat_boundary >= runtime->boundary)
+		return appl_ptr;
+
+	appl_ptr %= compat_boundary;
+	rel = (snd_pcm_sframes_t)appl_ptr -
+	      (snd_pcm_sframes_t)(cur % compat_boundary);
+
+	/*
+	 * Pick the shortest relative distance in the compat ring so the
+	 * reconstructed native appl_ptr stays nearest to the current
+	 * position.
+	 */
+	if (rel > (snd_pcm_sframes_t)(compat_boundary / 2))
+		rel -= compat_boundary;
+	else if (rel < -(snd_pcm_sframes_t)(compat_boundary / 2))
+		rel += compat_boundary;
+
+	new_appl_ptr = (snd_pcm_sframes_t)cur + rel;
+	if (new_appl_ptr < 0)
+		new_appl_ptr += runtime->boundary;
+	else if ((snd_pcm_uframes_t)new_appl_ptr >= runtime->boundary)
+		new_appl_ptr -= runtime->boundary;
+
+	return (snd_pcm_uframes_t)new_appl_ptr;
+}
+
 static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 					 struct snd_pcm_sync_ptr32 __user *src)
 {
@@ -3253,13 +3292,16 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	status = runtime->status;
 	control = runtime->control;
 	boundary = recalculate_boundary(runtime);
-	if (! boundary)
+	if (!boundary)
 		boundary = 0x7fffffff;
 	scoped_guard(pcm_stream_lock_irq, substream) {
-		/* FIXME: we should consider the boundary for the sync from app */
 		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
-			err = pcm_lib_apply_appl_ptr(substream,
-						     scontrol.appl_ptr);
+			err = pcm_lib_apply_appl_ptr
+				(substream,
+				 snd_pcm_compat_reconstruct_appl_ptr
+					(runtime,
+					 boundary,
+					 scontrol.appl_ptr));
 			if (err < 0)
 				return err;
 		} else

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260318-alsa-pcm-compat-syncptr-boundary-0d52d2f8dc7e

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

