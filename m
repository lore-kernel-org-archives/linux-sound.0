Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0652FE42
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874935; cv=none; b=ck9KhseNIAUokCrBobBTk2GaGItHmL2YPUQkjjAAAJDDQNGGiGeFa5s16265GdJXilnHsDyMJqWlaRHJNGpY/7KQpfabhz/JqL/fb0vB4ST23nKrB3mkIZE/kTs3xFWaK9QfPCj2aacstBEXhFrVAIwi8qN95GSE/NPMu3MGQZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874935; c=relaxed/simple;
	bh=f6LkZ3SNkqp06uwoTOsGUcuHj4poyCBbPzQWOMP/g1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giHfTqs5o56A2NFToT/8pSFhwDe6tcm6rn1m+N8bbnLCP/ntlx/1kvDfhte3ddugWYWRd5grT3taqdHWZUxlyjVi+EAQl5d63R9SQS2XbpPagbQpyTctthQgzSlEWvckugx4woVp/nptzkFfaJlwtgZX/E+Nu+Y58aOQcmCXXIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsZzJ2qI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsZzJ2qI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39682983a0fso4966286a91.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874922; x=1789479722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXurqb983IfQUcK3m3FW1ovqxbHBMIrBCPQs3JxfBQU=;
        b=DsZzJ2qIiaGKH0+Fuxvf1U09FlG4qS1UrDkGhq16xuC6rGDMouztNEMZ0fhMpPmma0
         Y3ojaHUcAszdHlDh0tLLOdYEs+mW8HeBG4ekjQZ7sLNkDjKNy+/fulw24qZCzrhP2bKv
         t9RgLjPuMe7b9HWVV/hGe0srI/tK0PS47FKSJwZr1Zx2pkvQFzPNAPnwfcVoGBibqKgP
         AFHpOwfY6EW5DFnmJQskCjz2eIWaSxCsS32KyiCEFEomHxscXpgCNDxc3GqrY/k1mtMD
         FG/fcNAoDd6IT8qhvcDLqKnMGCl3PtWkV2oRjRcWPF+nmM7TWdxbXwn7xbOATHQEgbey
         dVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874922; x=1789479722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXurqb983IfQUcK3m3FW1ovqxbHBMIrBCPQs3JxfBQU=;
        b=Do6j+RInVD1cHtQo8MK179wAh5nCucNXt1Ml7FJYQ7An2drOjHELYDZRedGWoyjOqK
         X2JfPaHIi5sh1tQ8p/7F8xWeucmMd641HnbWJt6s4wPn5LKuzjZZlgslpJq717LfU/ai
         Cob5hcnCnZ/RbU2ZEBuLuGLf0qclobSp2wy8ZQ4QBRi/5p/GqTUbzGUEhSy6cWpHWx5n
         n4hjv2tUc9L4fsFCz0+rMcET26lk6Sm+eoMe+msq8VLArL+CNJwTfo671niaEH+fdlI0
         BMvSAChTmWFRRuENz+ZAMKocRjplWk5Gj1t3SLr0ZTqXzCImsHmJw7nVxTQj9nxyD5IK
         gdMA==
X-Forwarded-Encrypted: i=1; AKwUvBzaHIAHKUyL13vY6+8yMajhw6icwOk5YbPgxE/G2SVKZYFcplbutofwrkRw0+hdkx9fxjwlXgs4S3veIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kHMcLVuoRYwYTutDQLoTmWEhzEuFCq0KUsDRPJgLOlCIhK3Zxe
	jfZqo4YjfFXQbH8OdImoNRjbLwJakYOOOLw77sEAke8cLM4WxjAF0bbV
X-Gm-Gg: AYBFou2Z7gZiyvbpEt5/bYaunw4Jk2JgfvNXibj/Iz6fEXdabgPdzjP1uYXVwZtjpm6
	USuLGej81bPboTJbO7gie0jqCRWPlOUXE7IsX3JP12QfzHq7iUtqVAwdmA0gxzi0ZiVWtYj1UWx
	qLg7l+C4ciDyRIsElMUDMoopMUuQsC5gf1nqwX2EZMevk51xxIPI/e4nrK3aSrwia5/vuOn23d+
	fJcvizl7Vd1Kq7bw8Ox5Ia+wOuEBbgMySljTQIFcTQcZKeae6E/xOCg5zAEUV9McU5vnB2fnFkA
	EwNzs7Adw8GcEy0LLbxv/br61KiSsYDDJri3ogFkBgPVfVnKFj2OuuGnTQ763is6zGw5q1b3lfI
	ELqXobe+E6x1atQinNOJPZjB6xBdVOWOWcdntT1/bA9l7NEjrwzzJ8sG1WYk3dhnmrJH7GM/87B
	z2VXxvqe+u/a+G5d+MT5CrzcE2PgyDt0Xq7mFaw3WbleBeOM8aP5yOToxENjJpfdkUbIfF9nTKJ
	n3AQQA4CFXZdllc+j+6YNMr7kvyChdQQUyLQ7AlrJdRWCJj510qmhRLLS+jOhym
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr43309544a91.21.1788874922309;
        Tue, 08 Sep 2026 06:42:02 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aeb16fsm58990835ad.83.2026.09.08.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:42:01 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: =?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: hda: Report a change when only the channel status bytes move
Date: Tue,  8 Sep 2026 22:41:53 +0900
Message-ID: <20260908134153.1614273-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() callback of "IEC958 Playback Default" returns whether the
converted register value moved. The convert_from_spdif_status() helper
reads part of the first two channel status bytes and none of the last
two, while the get() callback returns all four. So a write that lands
only in the bits it does not read changes what userspace reads back and
reports no change. Of the 31 bits above the mode bit, 20 are such bits
in consumer mode and 29 in professional mode. The core notifies only on
a positive return.

Toggling status[2] bit 0 on an HDA HDMI codec moves the read-back from
04 00 00 00 to 04 00 01 00 with no event. Toggling the non-audio bit
in status[0] gives one.

Compare the stored status as well, the way the ac97 code does. The
write to the codec stays gated on the converted value.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 sound/hda/common/codec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 7d17d773cfbf..5d9b53bd64ea 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2277,6 +2277,7 @@ static int snd_hda_spdif_default_put(struct snd_kcontrol *kcontrol,
 	int idx = kcontrol->private_value;
 	struct hda_spdif_out *spdif;
 	hda_nid_t nid;
+	unsigned int old_status;
 	unsigned short val;
 	int change;
 
@@ -2285,6 +2286,7 @@ static int snd_hda_spdif_default_put(struct snd_kcontrol *kcontrol,
 	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	nid = spdif->nid;
+	old_status = spdif->status;
 	spdif->status = ucontrol->value.iec958.status[0] |
 		((unsigned int)ucontrol->value.iec958.status[1] << 8) |
 		((unsigned int)ucontrol->value.iec958.status[2] << 16) |
@@ -2295,7 +2297,7 @@ static int snd_hda_spdif_default_put(struct snd_kcontrol *kcontrol,
 	spdif->ctls = val;
 	if (change && nid != (u16)-1)
 		set_dig_out_convert(codec, nid, val & 0xff, (val >> 8) & 0xff);
-	return change;
+	return change || spdif->status != old_status;
 }
 
 #define snd_hda_spdif_out_switch_info	snd_ctl_boolean_mono_info
-- 
2.43.0

