Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA62FABF6
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563412; cv=none; b=gVbuqXmV1odqQRfzzm1NNK5X8nNfeEqpPwk0Z90e66f63/LwukmzKcU1JUThg2eZgQehDfvV9l7XHhXDCG/pRvJqdc/sR6SrHIb0fllSNN0x2kTs/MTNMW16xk0XjhPtiwePsy7I0Xq8Xmhi0NV0fvnJM1KFCkVYLUreqVBDQDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563412; c=relaxed/simple;
	bh=8wyZBr1q2/meAs/BS/myb5RUaQIClY0d6TJBq79E3bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTc96ueqly5BRnq5GAzLji4094lXmCx9o3p5v559KXbezcWFylAMgbq5wEOQzbDrStyLoLmB/v+0aQUd4A8vIvnGfpo8rjS/b37Br3bsKfkEAuSN1GfJJXuOcqTA81Kf6DPodtGDoT6/3+89H1pBXn5KyPWOw7LzeI5r/zLASOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmIz+7kt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmIz+7kt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so9158125e9.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 04:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761563409; x=1762168209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aWdXCwJ+YhQ4cLwd4Cr3iKtOYou5XkiFzRnyXeKZjA=;
        b=CmIz+7ktoXmU78nafAImZeCq9aedu2s6L5GjRKecLpvUb++YaJTlSRg9gwHvB+V2Am
         BvDxDglIsMTb6xvYOIKB4OeQ75UZfnhmv0lNTvPsHg7RDaVwP2mJMgvnR8aSJCy5ozyX
         822kZDjjY2sVc6VRQCpF06/bI+V5HrzI3/pBoISAbbaQIFDJplEJzZortKGdusqMJlp6
         nz1yrWyo7zduNt6/Fw69LKsZ7KYYPDhKhIvDFiEkfkCadpUxK5FsWEZQ/TQw+WqxC7js
         P9uu5S3hzRAPR1+xnw7FBmK0Y+Uy1P57qVvIRRAm/TvcIverF5kkkKADjtqGY5FHl1E+
         oldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563409; x=1762168209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aWdXCwJ+YhQ4cLwd4Cr3iKtOYou5XkiFzRnyXeKZjA=;
        b=LsL8Rr8x7LzIUk96fwP3O79/fj7x0Kx8+VLXCqTnT77KWQ9z4BKoniQF24S/q3eqhg
         CFbfZzTshpx3jojT66jFHFhRK53P+srdzPuESnjYVWMn4YQ3VK9ptTfnzAW26Ufx7Wzg
         +EpIU7BYwY/3jYYhVJ+80km1NN0M2aWQeRFV3fOGu1ElxUabZc70d3olbGiYi3Yw3Mh/
         Zfo7EI77JS9kh+TFB37JW5zDmiShW7CZ8B5yxJ2dUAQYQn4jVFr9FX8eslxsm3DG4anH
         REn+ihppMwCeUBeBOwQRvtgiTHNjZ7Ce+sHPfaej7SRvTuzWuzQ6RtpEVQAC2kGFvVTr
         xaDA==
X-Gm-Message-State: AOJu0YyElxdHbu7VE5pnmRHhHArzRZFNNjlVD/JfsnpU2q/3Ju4Dg1j6
	xdQ2neIZuBb1RiRVVGeGBddkUd7odGD7kNka3iso5xkzeR1YmLjOB9F0g+RrIQ==
X-Gm-Gg: ASbGncvhwcpLh+9Q5iEtHddRHPj6abSEahwZQjxVxReVl8giAlpdooGl5+CFLCn1nZp
	rSWHD68P/z1orG4Nro/AswQAAHV2hRY6f9FZTJKSClCknPBAIYwy9qOO+ZlVoH57RFtnAsaYvIT
	9LVoDH23UK2oaErZhOxMJQKFMcvjC9w/cUKMPAvplVKCmVMiT16fd4OW4KU5KZoUN4Z+3GRp71M
	TwQXu4KV2dsRkRXZRIX3N7fGKgbmi0iSRE9OI66fPsmk88LdU16zYNEhvop2GsQwdRf+l6yioIS
	MbWtIxnvWl3wnh1nYfYEnD5ervd/lAsq926pYNA5N9N6II6q1naa1JBJzZ13rMWVQ6kMBZN7fdj
	4Wk0HfCjdAojXmRK9Ij2woI/0G+i/ZQplrqVsAwa5dx40qyKgWbw5UA6i8SrnvbbYMaONN6hNqw
	kQnJnPWCRZ3Cq8YQ==
X-Google-Smtp-Source: AGHT+IEyBOeYmSCp0OOu82gmgYO1jdZpmARTD9KSme50U40dGAs/B5Yhj361/mXtc8deDtnGOJBsFQ==
X-Received: by 2002:a05:600c:820b:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4770bbfb890mr34826445e9.22.1761563408851;
        Mon, 27 Oct 2025 04:10:08 -0700 (PDT)
Received: from nixos.mu.edu.tr ([2a09:bac6:d6a4:2682::3d6:28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02cbc6sm133857865e9.1.2025.10.27.04.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:10:08 -0700 (PDT)
From: Eren Demir <eren.demir2479090@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Eren Demir <eren.demir2479090@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
Date: Mon, 27 Oct 2025 13:58:10 +0300
Message-ID: <20251027110208.6481-1-eren.demir2479090@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87ms5c3elt.wl-tiwai@suse.de>
References: <87ms5c3elt.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt due to a different board id. This patch enables the existing quirk for the board id 8BC8.

Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works as intended.

Signed-off-by: Eren Demir <eren.demir2479090@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b9e5c091bf3..522d4792ec59 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6577,6 +6577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.51.0

