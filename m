Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691432573C
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602351; cv=none; b=Q0P+DRaJNq7a/0ZZy5DzhO71LdVntMUXkloiaW0fs/xDol/fhFtgakVetudqRgRvtvhyvOLbi7ouf6SFC175Svb2lkmr7/+yo8l/0qHMLpOlLy8Ez87ox3079RRme7tB59kDuuMOUMkK2mP1x4P/k/BgUGDj/5hMZAhvxgaycj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602351; c=relaxed/simple;
	bh=o3qKK5H8b8YBLuG3kLVkhNS2Erh24Zz0eBUtehUSeFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XenIPyKjnmbuLQd+HGjm719m6NKgh0ZrVJHkOxok5wm1eZeiWM79A4Vv5NjwxVd8OXtB7Xt8IM/nTTWcJTOEMCXnXasuewFhW5RpyDpoOh/QxzPosXvNgY808qM8sSqcQ91gNDIkLClQykx7ULoKQFU/CQBpURPmxt+DYjcrfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H21+BZqh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H21+BZqh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34381ec9197so3712140a91.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 07:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764602343; x=1765207143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndozmQvxcz4Vm6OKuRJUZhjxWfNgBQhx4D52gMYF/yk=;
        b=H21+BZqhczsze5NlwfRDUh6n/k1HuHbs6ke9gd21TIvfUmxNGTRM6IYDA1Vy4a/HUC
         Y0/HCBLhQHXGPihJuIr974YlTXc6RMkPSRHvmwNnBntpXnZMK9u+mbre3TKgX0F2aFxh
         0+C+/pHZ/cmv0CZBHOnhuykVuiUQGsCs/oFjzQM1+id4canMMTQ5VGbUnZhWJmwuYcHv
         2N1yx5yiCMBizNilrdgX/e1JYHVQ/aCEIt5fOzi/g6tSLa5kAExi1rHnVgIA7YfMl0pn
         0gLjrMDCHsXrMefBBCl1akvbPh5c7Rq0iCLP4AEu2IGA20QrckC9yRtJ8xlpA1GTdd5P
         GP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602343; x=1765207143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndozmQvxcz4Vm6OKuRJUZhjxWfNgBQhx4D52gMYF/yk=;
        b=OTO15KI8HNGVKsevzC7EsSQiWs05gTOtpC8wm8C1J/naIoS+M1lybYPob0dIMWpLxT
         enAoxUE+b1b5F47vtDrhjK9tLGXigTA1Vg/9lbMIHouVOGtPh2JGTCZpWHZOOd1L2+NA
         FpYie61GOC++0FRJ+riyowG/9DNearGS7h35ybsPZV5IGr/8Rgj8Tu8FAVydj7sonv8u
         hAPATE0cjIEN3M3VKrKqIgICY6icHrvfThjlshiLfA07QdRt02JALb2Y1NqVIMr0pG6E
         MvU0kA4L9krIZstY9Ewn1JMzYb93euQE9YagyoikH1iK/StdF1xTzHBmAilBTipeJIEA
         MsAg==
X-Forwarded-Encrypted: i=1; AJvYcCX/kKFlhdW+ZO4rHQw3arxq36rYBJtOenElmbQi5ui8yXge+2CQePflGDFec1UYqarauBParATYINeiLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FZdPbJ3LbxY4kOBToKNlgcpIVVPJF572grGnQ/YQ40Pt2iBG
	WB3aNyGxVGTZ1UCZ44+wU4mIYxS1b9JHmKHXFE8VdIL5RGPChoW7Qoqj
X-Gm-Gg: ASbGncsDHdM1rcS+McLop52xAaHKuO/EFDJMkDZcUJ+S8lpvaN5gs281PuIrWbiLCzj
	6WTTqZtFxODh6xEpUF+6x0OlRUUVPAtWzNd94wfw++2/eqQd7C9wmoeANI5kLH6p7IJhvYNNXu9
	qC0ZPC/6P+nVbaC8mOLWfV+ph7yxG+oVxR+lBuk3bPdCrC9jD6KUReorq2FkwInLd0lQOGXvWS5
	A6RtWq0OWQDq0tVQDzn7M9uOvhLmlMzHM4EY7BV3pgNDM44E3Ulb+mzb2ULCnmka00gCu0h/64n
	ZefLMVh8ZHJo0LYlWpwflODAAgw5/RndP6UYyoQ/ai6ta80L4+7q3CqKDV0fgsngDoFYg0Y0vCR
	olIlUo0imop8p5q5QlN1yIOwu/+eIk4EuGiSIipETmbGNnoh/sXYBJyhp0QqR753NVWT+L0F5P7
	BUECSihNVTPA77kdM=
X-Google-Smtp-Source: AGHT+IEvGS9GbnRG7tXEIn+FDJgXkVbuyoajk2uTD8+h+PPZzy10Vd43FBbU/Y+/gfOiXCRZl84axQ==
X-Received: by 2002:a17:90b:4ec7:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-34733f4ac35mr37886089a91.29.1764602342669;
        Mon, 01 Dec 2025 07:19:02 -0800 (PST)
Received: from gmail.com ([152.57.36.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b20c00asm13393469a91.8.2025.12.01.07.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 07:19:02 -0800 (PST)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH v2] ALSA: rawmidi: Fix inconsistent indenting warning reported by smatch
Date: Mon,  1 Dec 2025 20:41:40 +0530
Message-ID: <20251201151137.29536-4-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Fix smatch reported inconsistent indenting warning in rawmidi.
sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
indenting.
No functional changes were introduced.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch fixes the below smatch reported warning
sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
indenting.
Re-ran the smatch to confirm warning is cleared and no functional
changes were introduced.

Thank you Takashi Iwai for quick feedback.
v2:
corrected review comments from Takashi Iwai.
v1:
https://lore.kernel.org/all/20251201144620.18942-2-hariconscious@gmail.com/

Thank you.

 sound/core/rawmidi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 20d36a346cca..8969ee2757f1 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -2106,13 +2106,11 @@ EXPORT_SYMBOL(snd_rawmidi_set_ops);
 
 static int __init alsa_rawmidi_init(void)
 {
-
 	snd_ctl_register_ioctl(snd_rawmidi_control_ioctl);
 	snd_ctl_register_ioctl_compat(snd_rawmidi_control_ioctl);
 #ifdef CONFIG_SND_OSSEMUL
-	{ int i;
 	/* check device map table */
-	for (i = 0; i < SNDRV_CARDS; i++) {
+	for (int i = 0; i < SNDRV_CARDS; i++) {
 		if (midi_map[i] < 0 || midi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
 			pr_err("ALSA: rawmidi: invalid midi_map[%d] = %d\n",
 			       i, midi_map[i]);
@@ -2124,7 +2122,6 @@ static int __init alsa_rawmidi_init(void)
 			amidi_map[i] = 1;
 		}
 	}
-	}
 #endif /* CONFIG_SND_OSSEMUL */
 	return 0;
 }

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.43.0

