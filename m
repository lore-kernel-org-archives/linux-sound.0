Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4BA39A061
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851963; cv=none; b=b+mUprDuG648Qyg5VKtf9RaRoHAcG+NAS5Y1tZMCSvUkAnnjJejV2FNnsthwmaX5JcHJODCd1Eyy9aK2xBKY+Vp6taZY6L8c6AnfVVNRjg/foVXwxQdelm7aVhiUQFYvY6tKw/rlhUAUsg4CYKmtSHl+ySyRYa777OmK2AYTYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851963; c=relaxed/simple;
	bh=ou1StnidYf6G/yTiPb1Jyr10n23l4lsfoChEA55hU/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LRokpEIAOUmtMkE3dO8fBuDNgb1KnNIhR5/bq+WUrcJA/wqIzaSp1ac7dDwiluayNImfPSbJ/a0qdgIXk58DIuquPRYJsVaRMqUBat7FWJQUdwCLjhQM3YaUK5KKyJi+ViizZTMROQkqDnOKb33aGTZ7YKZtO9fmlz3pPBlCX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKYXsXr8; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKYXsXr8"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c156c4a9efso12728164eec.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778851961; x=1779456761; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8duf5TvyhmY/rcIc+GeiPIXbLWq3N+o607ETTSlKvE=;
        b=dKYXsXr8ONhvtSB5m1MRU4zqzaLNRlPYwxl5ZpKPZPtfkOhbX7ki+vFrqxb+0arIl0
         zG9OZN7EA88SuiHkilwq7e0M6FH+14e2Xvy3FBesU/JPl5cRmjFbfvADc9mMkL91jAuf
         zQHXjqA5iS4z3rRB6LZ0cLXPp6yrw/55xuarkgs/sKED16D+d5GM9unRDi9Uv4KrTZUL
         NKCrG2hEIJCJwtYwq6NZtaeksZ2MItLOLucY8BM/GNlehgFefqxjHJVVlTn0i9hbAliR
         /XC0tvJreCQYxd0OdUx4lQXDtRDH2TvfTFLJkZBzbqd4stkQZh04c7CBlEEDZlCY4rV9
         nWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851961; x=1779456761;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8duf5TvyhmY/rcIc+GeiPIXbLWq3N+o607ETTSlKvE=;
        b=EK8Ufzxt5arLSRTT3VWJUR+Z4vILu9/l17VLXLiaFRaQ7UDvZoghOalN/2ZP1GSVi5
         c0iR6Ed85sJ0K12H4hVTrR2wMkHbgOwtUvrBuDRKp9G0dW/Or3Y/j+vl/BSBx6xP18DN
         XTojXyAAFhW+dL8I1ZGiQ7RxXWbskNXNFeXi45Yk5Ab/qi+dRjanMphOSTYL+7jAVN3y
         0/n1WJ2b1ayzFsDFerFdfEvTzm4XawUggFH2MHKhJt0w6p2HZdGGzOWYLsfuceXqAxPC
         soQf08jSY33fgiHBWVrWwbdakTIGY0JMJQqXfpo6xECyOzRvK7iAKYcGpB/WaH6D4a8u
         EVCA==
X-Forwarded-Encrypted: i=1; AFNElJ/pqO8+6muCwXJ9vBfZQZTHMoErFAwAfLq3ThTneF79KrbxITxnZQ4rmgJB07VDwpXphYnLnyHIHCUOog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2Et1GshRSkvAOUpZt8ccvwttusYKQjNCksDsxpFVR9qyp83s
	rT/AlyiA8o+GIo0Sxlp5ThRO0LY1ROYKhFs6hoMEoQUsrilbAFkwfZ2T
X-Gm-Gg: Acq92OFj4bCEYa1hdAdtUlrpl8UQTu+HvgzhB+e/NnMIwDbvUKWhskd/+g4bFIxBpqg
	04olMi364i9jE5HV05609i43EBMT+5Q/TWRFcqkTrsOndlsHKEmQfwy8wDBkIYRM4cGsXrbOMby
	2TRzTQ752eKEX0ukq1410RT5hVP/n1jPpPNg5zHR9i/4eRPos6SoQQggoqgSefUkEQ0D7hd/oX4
	8/F0qQZ1BLZQnf6QsFclpvAJ6iadKfn//k3q5fbKfL/iAE3439u6WJ5RoVs9moS+HHz3WO2OoQn
	X2QmalEAXz2EXBeJOJe+mykxTdlcSBjTcx4Etv0X6eZaq8oIV7pW0B+AVSBrB+EcP3sdDZsXGFv
	o/lIacOk1PQU80v+hXgZiL4D1nGV1vocrhIaw1+dLX7wQ/vsVaPMHWHU8OrvA+PNfT43+LT9ZxU
	uwchfDI4qy9dhc+ViTkbM0EBen4qYOmtWc3XVj9xNJocrgtoV0KNilQRl2jkhRDGT84WuNfmIrB
	zSag0yrGSxOHOP3TC8St+U=
X-Received: by 2002:a05:7300:641b:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-30398652478mr1931599eec.26.1778851960947;
        Fri, 15 May 2026 06:32:40 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm7114643eec.24.2026.05.15.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:32:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 15 May 2026 10:32:25 -0300
Subject: [PATCH RESEND] ALSA: virtio: Add missing 384 kHz PCM rate mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-alsa-virtio-384k-rate-v1-1-35ecb5df835c@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jaroslav Kysela <perex@perex.cz>
Cc: virtualization@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ou1StnidYf6G/yTiPb1Jyr10n23l4lsfoChEA55hU/0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnsCqWHmmc4HlFaGTmvdaXOz8pl2o75E6fGT7wy++jn/
 1OjcpP7OkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiDzYy/E+0yGg8uf9H4MPr
 4td580LOLazidggyb0zJYXboqzi4r4iR4dSBSPd5N084vVKzFFDNeHwmQZ3/w/L524xf5c5lX+H
 /mQsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The VirtIO sound UAPI defines VIRTIO_SND_PCM_RATE_384000, and ALSA
has SNDRV_PCM_RATE_384000. However, virtio-snd's rate conversion
tables stop at 192 kHz.

A device advertising only 384 kHz is rejected as having no supported
PCM frame rates. A device advertising 384 kHz together with lower rates
does not expose 384 kHz through the ALSA hardware constraints. The
selected ALSA rate also needs a reverse mapping for SET_PARAMS.

Add the missing 384 kHz entries to both conversion tables.

Fixes: 29b96bf50ba9 ("ALSA: virtio: build PCM devices and substream hardware descriptors")
Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/virtio/virtio_pcm.c     | 3 ++-
 sound/virtio/virtio_pcm_ops.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index eb9cc8131905..be3893de40a5 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -77,7 +77,8 @@ static const struct virtsnd_v2a_rate g_v2a_rate_map[] = {
 	[VIRTIO_SND_PCM_RATE_88200] = { SNDRV_PCM_RATE_88200, 88200 },
 	[VIRTIO_SND_PCM_RATE_96000] = { SNDRV_PCM_RATE_96000, 96000 },
 	[VIRTIO_SND_PCM_RATE_176400] = { SNDRV_PCM_RATE_176400, 176400 },
-	[VIRTIO_SND_PCM_RATE_192000] = { SNDRV_PCM_RATE_192000, 192000 }
+	[VIRTIO_SND_PCM_RATE_192000] = { SNDRV_PCM_RATE_192000, 192000 },
+	[VIRTIO_SND_PCM_RATE_384000] = { SNDRV_PCM_RATE_384000, 384000 }
 };
 
 /**
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 6297a9c61e70..1105e7ff3523 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -90,7 +90,8 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 	{ 88200, VIRTIO_SND_PCM_RATE_88200 },
 	{ 96000, VIRTIO_SND_PCM_RATE_96000 },
 	{ 176400, VIRTIO_SND_PCM_RATE_176400 },
-	{ 192000, VIRTIO_SND_PCM_RATE_192000 }
+	{ 192000, VIRTIO_SND_PCM_RATE_192000 },
+	{ 384000, VIRTIO_SND_PCM_RATE_384000 }
 };
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);

---
base-commit: fac9a31701803e4e41fdb7b5c71582c65cf47176
change-id: 20260422-alsa-virtio-384k-rate-723fe9772fa6

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

