Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E92594AB;
	Sun, 29 Dec 2024 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735452646; cv=none; b=mOaurj4dIUwy9Wpa2l8l4lf2REdsuIGM/nJRWX3a/5ABf8E+6GLabQWFI6ugdeC6Osi2ccrtbBddF3Uuae1801zSKLI/C5U+t90Co7aBnWt9iAjnGLnyal2QFX2fLytMQBbI9Oz9sROH1ITY3sZVvn6OjoNAoFBmlTOKCqNOuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735452646; c=relaxed/simple;
	bh=uR80Zkj/44HNX0I/YMOMS+li8YY4ZqQveTdmABIp8uM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sPtcYq9pAFInrHUnnQGkG4xYsFWDx8wTRi1g+Y5fjF+tn+Of+8F2KKm0PMgqUfBOC6vGoSLjaB1Jp3T2CR0YpR9P8EX6dNOf3RYxTpk0V6rj0KYNwqi5XEoCm8vbL5dV3nnn1z3wKaQyqXxMWfMFyc3n0sFsbZ1+YFA76HTk0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrxhui6B; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrxhui6B"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216728b1836so92098175ad.0;
        Sat, 28 Dec 2024 22:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735452644; x=1736057444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R8ifzuecrmdC/9ekPvMEJvtUHykHFq+/kPjZlHUGw1E=;
        b=Xrxhui6BoVDZYpPhvc/DZUr48YtAHfV9IBqBoIArmeG6uoEmTF/I8t0zaidB9MDoF8
         E2gmzDU6nDf70edRGHRvf8Du81KLDHeEJeJDfA9qA+FtkSdqVEd64JRKLFM6xRSzv1o3
         ga/XZQ5jkxaLWkGQbhHyu4QdFMwp1micNsnqSvPc5wu//PJCoSBxrS1tV6wDwIJbZ9B8
         H+GzZIc4zfA+E98OKcnzjiUcxsXgUFFz8HuSLO8AnguJnD/0/5GuJxgXEFj2sN3zqRHX
         IFjQYpbHu9e03ggmU6x9D3HtJr0YWiI/Uv/qh0Bw9BMmJfyEaztqWRYw1bpEQacTNb9N
         x+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735452644; x=1736057444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8ifzuecrmdC/9ekPvMEJvtUHykHFq+/kPjZlHUGw1E=;
        b=jFuCeXMjd47yhqUn87tXbHaAXdEJo5ivZqVyepQA/U36R+OtFGMiLd3dGBc5Q5zEax
         CRalfTwOz/h3/ikRhdQr8cKQzZMjiV0HOjlGKjQ2R+hQVb2K/nN1K6CkvcoXQ7lCoWb1
         P3YbAifSpFg6Ur0RIIvs29lE0sO0CbQo2mIqB1MyV+XKn9a3wG090fmqkaUg2oTDkV8j
         LTxEzIrXOjXvNpDpFFhODyuSqo3OJwPEDDs/W294+owCLNn8gcJuZveXhkiBH3qyLtiT
         pYH4vJ2Z8p5DrN1UKZBeKBsZ3R19361ar60uXgpmB8HU8kJpb5pA1F0XA1cLN3kidFvH
         ikRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0nEdgGVhs/GEPoSMuvcyX5y4gBMxxVichrT8IopM9GjuwDU7SZfDgHdY1W+tM9DlmocR04eGjVPSQslA=@vger.kernel.org, AJvYcCXgJRetvkt8BOWqiVL/81RH10MQZHts3QwcGdamRu3pGnFdrZ7MnOQZNPckyheog2rv9v9QD2/DnuGV9WE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ctOwL+KuorE6enickij2H+m2aWi9E7dVyC4nqFyaJiSKnq6W
	6LNrfJPvKTbf+BOvIUUIKKF24o0nvVRcS/LbWIMPdfrmuKsEuxN7
X-Gm-Gg: ASbGnct79A50sKgaca1sHBcPDtQtFE6yDG6B9JXf7aPOC0EhYYK38J4ApjD2Z5rL9fM
	6ydKUzg6xN0uWPKP6xrqGnXEh0v3Yn3A3Qbs5ZW7H50peBL/j0ASQvl8HXGZjgvEweHNmY3v43f
	23DRuLw9IWuI/IRkgata3J+RJw5IBfvUS2jd7DjwTywDwLaZOn8evbXhDCHIwDZ0+giZ3d4sxPF
	d94dKxEaNQi+3bcEjxVCtJp1o6o2y2NlMbE+M/wx18YPsQKltwY
X-Google-Smtp-Source: AGHT+IFf7ox0+fVRGqW69CnMc6lx6iMnrjP7GqjMN3CwRYopd4BmDoFRoyKSU7nCiD7PGz9V7vpdAw==
X-Received: by 2002:a17:902:ef4e:b0:216:4b66:1f1f with SMTP id d9443c01a7336-219e6f52240mr472339765ad.54.1735452643861;
        Sat, 28 Dec 2024 22:10:43 -0800 (PST)
Received: from localhost.localdomain ([45.115.0.249])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-842aba73267sm15727946a12.13.2024.12.28.22.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 22:10:42 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: onkel@paraair.de,
	Markus.Elfring@web.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	tanyaagarwal25699@gmail.com
Subject: [PATCH V2] ALSA: usb-audio: US16x08: Initialize array before use
Date: Sun, 29 Dec 2024 11:32:42 +0530
Message-Id: <20241229060240.1642-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Initialize meter_urb array before use in mixer_us16x08.c.

CID 1410197: (#1 of 1): Uninitialized scalar variable (UNINIT)
uninit_use_in_call: Using uninitialized value *meter_urb when
calling get_meter_levels_from_urb.

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/52849/11354?selectedIssue=1410197

Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
Changes in V2:
- Updated commit text
- Link to V1: https://lore.kernel.org/all/20241228070317.2956-1-tanyaagarwal25699@gmail.com
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

