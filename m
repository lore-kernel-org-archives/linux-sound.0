Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154473B9610
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777956032; cv=none; b=HMXfyALD5zGUzDm3gIGcauge7TxmP2HeH+2lppEPalnuyZchoLkOr1tmbCQaeIBoqIhNPzY/kDk1dK0EIszfhU+0qKrKKOuTU1vuA9ETYalAijEgiD8q7K6cLEJeQBP4QLkTseSvis2tFX+ua9Z8omnSj50st6YcSFDBMRLQsLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777956032; c=relaxed/simple;
	bh=xg+AzQSH02m2ChqkHlHOL0nslwkp1ELZhv5oYpTQd1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FY3xZA33hSckT8HhwztwlyGSWMJ5RFNHQxJAt1z632uf1/RWml8MLSsVyQ/v8MJGlaokYW5epw1hLUFnsjmGy3wgd2tM2N/TrWMvHXP8ALmp+lqgufVfTSRBvUQjbDjHJ+UY1uY7AUgE+PfYmLIHAqOL0J9QB3XUh9ULrCrgCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J88MGhRS; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J88MGhRS"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1305908ae11so928789c88.1
        for <linux-sound@vger.kernel.org>; Mon, 04 May 2026 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777956030; x=1778560830; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wD6lG8b++LnD58VJ+TTawp1hDBka3Nn4267cv0Dov5Q=;
        b=J88MGhRSVu7EfWsDysKSWe7mlteHUGl+db2GB7cMG1wd/mYAVJ3uvx57Tkwmg/r3Mi
         AG4i1l3VLP224iJ0Tj8XbKEHYTei7WQvp7/lnIrpVATe6xLJePFTOniUUJu4Lqfjym3o
         erHZy7ohu24hiOLL2iGK8Zkt1nKyUO2Xwxmh8O1ZhlDaAwfihJGVZZjJHECTNqYZs+87
         eQ4bpMZPGbH94Va3M+g1w5cDVxDwo1DVzY8gk9WC1LZ2FlYr4UM8D27Q5oBViSkayHkp
         hLnN4wKRxY+s7ddlbXDjc3Yr54/GSDhCCZCGzB+CNTRRFz8NTv/nD0MX/cwQbYC9F2X/
         BSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777956030; x=1778560830;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD6lG8b++LnD58VJ+TTawp1hDBka3Nn4267cv0Dov5Q=;
        b=tKlQEOeDxawNuRe/VnhPe/ENWl92i4X+okg3n9EjTwl8o88EK6MLZNJBC8m4uKZ2YN
         prweRjUJNHSRWbV3WXYsyfQrv4t58wPw49RZWE7J8azGoezVpnvd43dgSVmdeAfLRbfD
         5aGzwSavtRgqhsRXWOiNndXeogpprEO1lV9IAEAdUHUFSo60s+MsswtoeXQQ2Vh6qfcI
         1VPgZ+R4o1heVpwjoApXjzzTv0j59P+KZC0KNmlcU0p4h3WU2s0FPt+JLlNXiB1fxxeL
         3WXukE5oG/TmyUO/xOgqpifBqeU3Ud9rU/BnLCkWVQvqb+UHCJC7DastuF9j28Od8UcM
         jNcw==
X-Forwarded-Encrypted: i=1; AFNElJ/t2meaV/Qmkaqwc+UnhfTEJs9kGX1cl6HKHV+lX8AoEcFhrLohtBWLrzJJdKzX3uAYo+qeFXLZPTvxnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwupwPd8qLtqVUpzORey33vvelIboYndqQykSKsVTL1rOB4Tqj6
	B7YB5yQSwGo6glB5uRhSmuotCM7EhgyT4CSxO+/2i/P46RR0L6Id88s1
X-Gm-Gg: AeBDiesTpmMBhQs2ma8f0dXj02b1JOj7tk8hpyMxUjSB4iRyG8PjSiEGcygGCfvItJx
	+pVEeeW6gWmC6q9/jVp+pni4iRI9zV0NDsIM26BPfCRAgrFzvlhOVAe/fwBo3ukjU3i6Rdrze8o
	/74Qj20RhOk9ClTYtdo8BRgbqroMkZAASi+C/gdOM/A6px6jUgXucidWr3Nn2DDIeXHq7S+lrDw
	xOCLsrtyyDiJYiBk1RKgDuQchaR6JYIyLG2JVCGTCs7Cjz22KR2hmgzNlb8eC0SVmkHc7Hc3t+y
	sjyencwRSHet42584ogjhuzCA4Uy1eeXjFy7iVWWQewt0z9OA1sqUrkIp5/ET4307fzNyILZQLs
	RxSXlxvwM01Zh/AVkwzeVPsN4nKXoRl5pl46aD/S/PFfHRfF2AYjar7WXoTqbVE8aOgWVfNfUlQ
	9sFV3unX0P5QOG6milC9v7H2Ai3RzYv4UzSF9snoWPGXgCZ2cA14+WWQ130NyiWiKxDIFI/cXHq
	s/kegz1b2Vy
X-Received: by 2002:a05:7022:4392:b0:11b:f056:a19b with SMTP id a92af1059eb24-130b1752467mr1065462c88.18.1777956029887;
        Mon, 04 May 2026 21:40:29 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm18920019eec.14.2026.05.04.21.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 21:40:29 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 05 May 2026 01:40:21 -0300
Subject: [PATCH] ALSA: virtio: Add missing 384 kHz PCM rate mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-alsa-virtio-384k-rate-v1-1-ca092185bb03@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm2ChTDoVQyLih2oGjDtSEwId
 3eU5Vv8v4KLqTicixVMFnWdp4zjoYB+5GkQ1Fs2UElNWRMhP51xUUs6Y9XWDzROgoGqKKcQKHI
 DuX2ZRP38v5dut7+vd+nTbwbb9gWphXDBeQAAAA==
X-Change-ID: 20260422-alsa-virtio-384k-rate-723fe9772fa6
To: Takashi Iwai <tiwai@suse.com>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jaroslav Kysela <perex@perex.cz>
Cc: virtualization@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=xg+AzQSH02m2ChqkHlHOL0nslwkp1ELZhv5oYpTQd1Y=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk/S3aFnYviPKy76r+C6bLPDEvun9saHRe3+O5Dt1K7P
 MbT7xu3d5SyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEFFwZGS5E8Yk32zOpbn3G
 +2Ujh8qBGSlftlWk3KkUXpelIPmvMI2R4defJeFKDCLdGtuZPu+qEvm5deurfXqcrccFJHzfPL3
 /hQEA
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

