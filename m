Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E8B5CB8;
	Sat, 28 Dec 2024 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735369410; cv=none; b=BlpFoh4O4xXuS3BBSoPe/7+ianFAAGfVSYvKa1OYRpJjPoYNSdtuHhpZ8w6ylQutglUep/8tRFnsS651CyrCQph2/ID/GC61UPjoo455NDPhd82o6FZM6SEwwXlHhy3tRHAQxMMmqjc4H8T20BzKWTQCbM2mU0CaYJi7cv9gXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735369410; c=relaxed/simple;
	bh=4KwWDFrVIiAUCh6RuYrk4TtUGKgA0Pwrse8b0Xdx86k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sCwIoYvi3VELe2ix4GMrkZQxPBV/q9IQIsV8z/PbAS6boXvSFDkLDfhf2bFhpfHEGMxEqCAtAy754QNv0nrGczKBXwlT5vOYmc6NVRJCUQpLgYfexNkGYEuhrpgCKyfaceElerci7rz0JlYrA4QtjxsbtSEGg1bgPREDGYupxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUWFM7VV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUWFM7VV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216634dd574so65610875ad.2;
        Fri, 27 Dec 2024 23:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735369408; x=1735974208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuk+OwsG8wE47Qn7uAGquvLMJ51bkY+IclAv3LqIRvA=;
        b=LUWFM7VVxUd18f+tXb43CqFMYf5pl6q/GHWx123KUcux6cai+jAZf0p5TJDU21v67b
         EEHRWcu926eB4qFVBlk2NeMkPMnq1gOTWwzbIQnYN6nL4hZxK014RhO2ibGKqLvlo7GX
         IyR9hTZc9imwIZsmYypvbB4KpnU217Lt6ly0pezyGJ3sF33BWVanBjTaXe9LBaLVKy4u
         qjo/KdOb0FOvI6oW2dUA8XXgnFZVcVnK6zMW3sO/+38IHUdiz4J/TY7tlpHXQ7ebvC2T
         9y9RoCxbTfcG3eeb7k8dGAUHHwBMUtm6nSO4X4vEhUcDQJajB96skClDfPXUOp444Wu8
         Ac/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735369408; x=1735974208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuk+OwsG8wE47Qn7uAGquvLMJ51bkY+IclAv3LqIRvA=;
        b=aGRmCmmBmLf1ciUyuUlkvu1rKKJQUaWJVruHjpxHBnsNLBPmoxJB+HFAwGlwKYN5Yo
         F9MX0u+hnBfBLRTYsst5FiUHAswjYhIFEzz+4OYs1Nz7Rl8W8jTX4xYkM8HPxSi3smKR
         gSQn5Dqzfo467sQUHyOSUOY4kdQy+ae2wyI/R4NnKozEWtHZyP5t8Q/g/3f/juW6/7ie
         iUGAoFvpPEF1NB9UB5UA4FSosdYsHIIHOM7eRu1HZFwqD/QBy5L84mGWbFzQrJva1zPa
         Nv7wkF1ru/cIR0sJShMVlsl8Rt8JBhMofOelY4iSgQc09Q1FUGRA6aNT9uJ3b7le5K3s
         /Ltg==
X-Forwarded-Encrypted: i=1; AJvYcCXtdgGwrVHR5YJvCw9EBFBzI/ObROhcYxVo3TgudkKBladUqka3Gc8u9j5D90GlTLhGDeukBVzcWXt5KQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGXr9bMjkFaryQrKlTI3aMsiRnfemGPcXS3/C63eSbbAp/Jrk
	76zT3Lh4EAL5Vy6JGJuvpuSv4jByX7NYyEshL0Kl0ZRaCsYqwWc5I8RI/wm+g8A=
X-Gm-Gg: ASbGncubHJuLpHVD+sNLesNTU3qohkSCmkPc/nGQVAupd2dG+c3KuuyqYUK76KNHyUM
	KSAMdGcLdDqtlo8ohXRW++w4Cw426Nn5nyBlanH3/+e7rulPamA6uIKTahRezEMyFW06S1LI0Nt
	pl3WNE1poqPCtBL3ND2P1qmcZD68Xz+QyWpNcPRGAJnmhMlJzeJ/q+aF+/SsJyK5AfqJx28tSST
	TgeqyzPtpTOShp5Txytj0juGGBW7J8n4WMDlq8bT/bPuMJLYy0h
X-Google-Smtp-Source: AGHT+IFgRHLww8VJAIdjvrT8Hpmkb9I7slM9H/a57Q45pvgcav/q7ODLFtCQfz4/z+gTMticTFtAMw==
X-Received: by 2002:a05:6a20:9191:b0:1e1:b60c:5bdb with SMTP id adf61e73a8af0-1e5e049f2d1mr46659062637.26.1735369408198;
        Fri, 27 Dec 2024 23:03:28 -0800 (PST)
Received: from localhost.localdomain ([45.115.0.249])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad816166sm15667826b3a.13.2024.12.27.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 23:03:27 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	tanyaagarwal25699@gmail.com
Subject: [PATCH] ALSA: usb-audio: US16x08: Initialize array before use
Date: Sat, 28 Dec 2024 12:33:17 +0530
Message-Id: <20241228070317.2956-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Initialize array before use in mixer_us16x08.c to prevent the
issues related to uninitialized memory access.

CID 1410197: (#1 of 1): Uninitialized scalar variable (UNINIT)
uninit_use_in_call: Using uninitialized value *meter_urb when
calling get_meter_levels_from_urb

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/52849/11354?selectedIssue=1410197

Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
 sound/usb/mixer_us16x08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 6eb7d93b358d..20ac32635f1f 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -687,7 +687,7 @@ static int snd_us16x08_meter_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *elem = kcontrol->private_data;
 	struct snd_usb_audio *chip = elem->head.mixer->chip;
 	struct snd_us16x08_meter_store *store = elem->private_data;
-	u8 meter_urb[64];
+	u8 meter_urb[64] = {0};
 
 	switch (kcontrol->private_value) {
 	case 0: {
-- 
2.39.5

