Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378D2C11D6
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751224; cv=none; b=c55b5ox+7rmojDuDAUzPLBVHuFzASjPsuTgniuHsTVrUpahyWAAG2gGLyxKtZrqGOgc6XSFAyb/q1EfAdre9UBJXTLVVdU9nE9pXEHUgpuOWBm8CGpHJ09BGfeovcpLaPQwDtJj+IYXGjNARLAvAxI53MifYqKdy80v/J8a6NTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751224; c=relaxed/simple;
	bh=4tL0XX2v/ImuD3AFNfZ4adVGbiSeuEmx4UDTbFLM42w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmtstkTNTMRRPnI8SlDimG8vUbpl8Ou99E3HFXg24HBLMoNFV8/BIji+B7wfHNrLzwIwFQ/BaxVDIG9FVdJEMNX44nF1OtKMjKr0Q1C7EMFSA6Pbk2iV6Xdjwa5/LtlCtI5W/e6Q+l7xFyZgej9cvF9RezVnd6gc3dAnehOmha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iePUb59a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iePUb59a"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so4022092f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764751220; x=1765356020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4YERDsBGY6ZLvdjA/h59CXe6bvksaKRM4k4+72p5hrE=;
        b=iePUb59a6az4TZ9QGFb2jy68nUCq/BUJBnpqHoharVoNx9iRxbsxnLM2XrAdriH+nq
         K6ekMIvvhdl4ngDvUDt0PREdQIcEy3HNGPmtw3u5dzbQsaBmAi0MjI2NysnKL98i0GSz
         SKEZMtOTR2PB9cv93Ar6bM0v/a5StjCABARdhvisdPHZSNQHf5b/PRLtcyjAZZe41UwR
         kBnpSNseKsEn+SJsgJjZoiGhd0Yo5XXeHxCz8GbNpCSBMEsI7+/7V5NnTyju/Ew9x303
         zygx8cYQ3VCv23kGYm2+u+Z+d1noUcbO/bsz0jAoeYxC9ae1fI9Ow5CgatuM8WrOWym7
         tIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751220; x=1765356020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YERDsBGY6ZLvdjA/h59CXe6bvksaKRM4k4+72p5hrE=;
        b=cN1mGGNYl/L/L62amAv2/t5qwwQdZgXOvLK8fpiXeZXRU33rBY2SczyDJ1Tq8B+urW
         UPgJIMoUyLlQdEHGqv64BhHBXrtSVjxo4Tk5WHCoYHYZo2w+1Q+/i/sF/3ZSZ8TC8CdR
         47C/NwrV7Q2LrtckAgPy4AY/HvVrgre04I09xDibIEeoIifxwiWo8PN2E/BGPPjAdtbD
         9ShJ32jjT/tRC97voGhe74r4W7zLOt8qo1uHRosjMpxTMqu7g932vn1o+T+00snVDNF3
         UHZ9mopJvkigellfJUYEisTCakFNYMX8XwdP8vZKtKhAFLRElfteuZbc7VMnCQk/Wgl5
         xhSw==
X-Forwarded-Encrypted: i=1; AJvYcCUBT982kmi0wNhZ25TLn/56nnXjuhP2iddhTFycKGDrczX92h4IgeV+GKYpu2eQPoYlLe5cc3nDSQikiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/eNkIZiJcuGXhYGo4X3cxVv9Tg7z0l872NVbFha0IKT96ftK
	3nvec7l6JXTnIahN3t/gcWPtNmhU83g4Uf4BXbNFkArlHQiKPbv7Lphz
X-Gm-Gg: ASbGncsgo4mjtVaVi5Wz9ohzcME2CyL0X9sdWyjgYxPbpKYosHhXHsjIaNnbr8rbKnN
	eKlrJjLE6u8nR7oxviscz2gIA/WoRWymtG109Bh4DtC6f0+g0OdFxhFyLBtgfDPKlHNC9eL9xM9
	NO2Ij43MAaRP/NFCm3i4kw7/NdQp4oH1F0Qxfv57zrkkigJtHzgYaQoFqycQjno0PjUQDf2o0Mc
	PoLUZDjkXhFQLOEjIkvA9JBa2g3O6Y1qGJM6+Tr8JVE5TmY7tGLVXsgd0E78tb9leeZP/57ey1V
	LghgHD/TM/HnGIurrMX0kHM40HVDEHW79TajbFHAoTOLcZPVX6dGruTJMGNLpLHPCYjOwCNad1y
	WGaD3WWCwl1N6sDnxI36F6M4FGl5M+SBxax+36Hx8NEvfGRThEOzjOkZXHgo5NmYutV04Ri0nAk
	3SSxlTREc13PXgcQ==
X-Google-Smtp-Source: AGHT+IHVEClXbp6BY9v3fd/AR/zU0b09wXoFomhN0Hpcg3MQgKrJuvMAuL4hyn8XkHo8dIiZVZcvnw==
X-Received: by 2002:a5d:584c:0:b0:427:813:6a52 with SMTP id ffacd0b85a97d-42f731c9b2bmr1334752f8f.41.1764751219713;
        Wed, 03 Dec 2025 00:40:19 -0800 (PST)
Received: from gmail.com ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca9aea3sm37223405f8f.35.2025.12.03.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:40:19 -0800 (PST)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	cryolitia@uniontech.com,
	franta-linux@frantovo.cz
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors
Date: Wed,  3 Dec 2025 14:03:20 +0530
Message-ID: <20251203083319.58555-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Initialize 'status1' with a default value to resolve the static analysis
smatch reported error "uninitialized symbol 'status1'".
The 'status1' variable is used to create a buff using "kmemdup".
So, ensure to initialize the value before it is read.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch fixes the below smatch reported errors.
sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.

The below is the flow of 'status1' it is used before initialization.

snd_rme_rate_get -> status1 is uninitialized and passed
	snd_rme_get_status1 -> passed as is
		snd_rme_read_value -> passed as is
			snd_usb_ctl_msg -> created buf from status1 using kmemdup
				usb_control_msg -> sent buf for reading/writing

Description of "usb_control_msg", states as
" * @data: pointer to the data to send"

Later from Usb control request, dst buf is copied to src buf but usb
control msg request is made before initialization.

Thank you.

 sound/usb/mixer_quirks.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 828af3095b86..06903c5de087 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
 static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	u32 status1;
+	u32 status1 = 0;
 	u32 rate = 0;
 	int idx;
 	int err;
@@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
 static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	u32 status1;
+	u32 status1 = 0;
 	int idx = SND_RME_CLOCK_NOLOCK;
 	int err;
 
@@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
 static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	u32 status1;
+	u32 status1 = 0;
 	int err;
 
 	err = snd_rme_get_status1(kcontrol, &status1);
@@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
 static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	u32 status1;
+	u32 status1 = 0;
 	int err;
 
 	err = snd_rme_get_status1(kcontrol, &status1);
@@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
 static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	u32 status1;
+	u32 status1 = 0;
 	int err;
 
 	err = snd_rme_get_status1(kcontrol, &status1);

base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
-- 
2.43.0

