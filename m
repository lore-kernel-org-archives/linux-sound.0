Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059A3F9D5
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742349942; cv=none; b=SmPxRPVrKJZF/HQ+OyIk6c4tZI7FJvtYNzC0zgB3a7eMA+34kuYwbKJ0uUbaNEJekTbvUnT5VqCIhv1FDq4THm7yU9zx6M7x3bHlpilpLplCGxofHtX2gTUC2b3uZijDWsEUoWz0fHUVLBsSG/wwrqUYHUcwHZiC6/VwXm2HgHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742349942; c=relaxed/simple;
	bh=K20NJLqSZ21WXE7L9+5gpy7Zn/xz1F+/Xr3J8pMYSE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOBtryKRxYUPRBboj4rHe7ViaVCi98kAAQ5LWVLbA2vQeLz14NAIg0hvDZMARei8s5dXGp9I1y06JCL5q/307KnSQQW8fzX/SLKpsr01Slk7rYir/RJDAjDByEPTVSIpfO0noM8ppX3a1wNSvvvNv9HeRdY330XnU8ik81uS+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivAbEWKr; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivAbEWKr"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fece18b3c8so54267407b3.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Mar 2025 19:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742349940; x=1742954740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QApmm1rXdnJ7lql3ke1x2t4odS5myc3ffJhU+EZuLmk=;
        b=ivAbEWKrtHWmBL0jmcCBn8S5a7PNCxP7C2CRlCVq/zRhdn/gMA9Gz+IIOU+ItbB3Ud
         6pRO4Vo+0GXhGyab6Ccu43H4jAT5Lv7pkWQQu9q600LMfMLPXVqM6j2iEpPTuCpD9iZS
         kLj2ONGKefFbEQgVsVuPwzIj5C2Ta1CT3MFO3PhpptNTb8GMM0EINYPiFkjOebT7nuew
         teSw4G93ZWWCjOrYDb3hLe9UPM5MDiAgbO4b7N3f8FG/5Hr2wNx3fye1hsrAoqLsPw8n
         00PYeeZBsY1HuaDG5ht4Vv7MJ1uVxhTZjmnZ38g9RacaQQN+idSwnyhge0Wj3mR9DO5e
         ylFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742349940; x=1742954740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QApmm1rXdnJ7lql3ke1x2t4odS5myc3ffJhU+EZuLmk=;
        b=HkQCeX0sE4eflknE7OCkQir53hvA5kT4y6sFqogftBdw3ewk65IwEbr6xJkyJbQn+W
         nBiU19U3KYWmkiNktyppS+GNzmDTwdlNVApgxv3q9gEcxXZGqu/0BxdVWgz1xQ8CLU0w
         /RHC+zcBoIHAT/BWUpZNLGUOltBfr0BSWaCT0oxAXOfc3/oBFTu/DaMLpvrFEtdJI8cw
         XTi1Xgl1SPV09PcgK6EmtG4TrC80LWuHNcq4hp4epXEzyWKXtoSfDvXQ1XdCMvKr5K/I
         g0cwT9e0OI1klEAtUej5urZoncCTwV5nbsByj7dRk6IL6wGjQPDwNOkRLuMBOcuV4ZV9
         gtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX7siYh4iFUTNYyFodwSUowaBwoXJtd0RNYwgsMMI0M0xjk8pADFPKwk6DPUGjqfA4P4lbZgaHtMzl0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3iqiLjuUb2Oataq4edYGE8rfE1dm38Dml3T5AQuQk+TnwQ+2a
	ZvjtAI9Z+53aiHo7WJeSUnZGJx48SF/gkkGXw82KHHCPqF6FS/LEKKtM3A==
X-Gm-Gg: ASbGnctq5EU9jdmZdlcBMW8BGDvgu112RTMbbWGcHLnPQxl6XqTT840ArTmh/jMDCW5
	WpyTkaH3/E3JlU+ysKwxebmp+zrja/BIaLDYi2r5KSkvRasO3eADQxo1pv/4EfmJEBHFoTd+vD1
	Wy0sVfmMi8y3cS7M7kGF+1uxuKzYy3zpzZmKv1T43QM8QcCD7xhHgRcd/CCSzIJkPHJvhAmaYDz
	qdj6jGgVC9SWdGHH1iSdjihiNTEkq2wXHdCWb6Y0s9X2tCVxghIsIo9zLeicU9G0BFajRFOFqot
	ZfQmuP5QqFanl76KntICXj1blGAULF8nEwmOjEAux/Fn
X-Google-Smtp-Source: AGHT+IEPZYhtiH+fu3O7ujynDFQaiDEGNx7BD5KjFUIlk8TMsxgOPOS/p6sdc2GpdS1HOYy2anA9lA==
X-Received: by 2002:a05:690c:6701:b0:6fd:3d82:f900 with SMTP id 00721157ae682-7009bf9ac18mr18301207b3.20.1742349940128;
        Tue, 18 Mar 2025 19:05:40 -0700 (PDT)
Received: from velo.. ([152.203.152.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cff5d5sm28698337b3.121.2025.03.18.19.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 19:05:39 -0700 (PDT)
From: Andres Urian Florez <andres.emb.sys@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: echoaudio: remove unused variable
Date: Tue, 18 Mar 2025 21:05:10 -0500
Message-ID: <20250319020515.22150-1-andres.emb.sys@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up the code in the __snd_echo_probe function of the
echoaudio.c driver by removing the unused variable i and moving the
declaration of the loop variable i inside the foor loops where it is
used


Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 7484de255a3e..4effcc0090ac 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1966,7 +1966,6 @@ static int __snd_echo_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct echoaudio *chip;
 	char *dsp;
-	__maybe_unused int i;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -1976,7 +1975,6 @@ static int __snd_echo_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	i = 0;
 	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
 				sizeof(*chip), &card);
 	if (err < 0)
@@ -2080,7 +2078,7 @@ static int __snd_echo_probe(struct pci_dev *pci,
 #ifdef ECHOCARD_HAS_DIGITAL_MODE_SWITCH
 	/* Creates a list of available digital modes */
 	chip->num_digital_modes = 0;
-	for (i = 0; i < 6; i++)
+	for (int i = 0; i < 6; i++)
 		if (chip->digital_modes & (1 << i))
 			chip->digital_mode_list[chip->num_digital_modes++] = i;
 
@@ -2092,7 +2090,7 @@ static int __snd_echo_probe(struct pci_dev *pci,
 #ifdef ECHOCARD_HAS_EXTERNAL_CLOCK
 	/* Creates a list of available clock sources */
 	chip->num_clock_sources = 0;
-	for (i = 0; i < 10; i++)
+	for (int i = 0; i < 10; i++)
 		if (chip->input_clock_types & (1 << i))
 			chip->clock_source_list[chip->num_clock_sources++] = i;
 
-- 
2.43.0

