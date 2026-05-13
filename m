Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB63A3E8C
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649710; cv=none; b=NSgMILwHTEEaLnqAn44b1GOwhXOZRzf32+lTWwIKlEVFf19u69AShFYHRN+sdOB6FFYC59pH6A6T/8jVYxejPdQIgZszR2JdwfJlVTuqprYH+u4m0rX5I7poxaXMbWOq2at8b7WCQQdoeNY7HlCJpqbIshpm1OCMEtLOCA7DakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649710; c=relaxed/simple;
	bh=NFSga8ecoEnHrZa4bR1DBRQkaR+JysHTX+yZ7cpW34Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gao9WBX7cMYp9/ZVxuFXB78nkHKyiE1xVuOWvM9xXsMOBim6iAlA17oom/V58mwryjxYQcXxSt+dhtORDkxH/2pOuG8RF7vB2Fw8UNkV+e3HDHuTvJ9GIuAYA87Y0DD4ISTUJIx6fF31yrDZcW6Eu3QdkvqlZO/JJO+xf997By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mofqL8qk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mofqL8qk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so70187185e9.2
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778649707; x=1779254507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgSx1IAlA93JFWxwaWFMw+AnvzeYexKax3i0EBGl93Y=;
        b=mofqL8qkISKAPj95JRMmBE7JbTJ7kXvKlOkkBOkTBn72ibq1QAhkO661RgGh4XODVs
         d5Hwzo47l1bK/VC6ORMF91omVPME0aQvIOLg7URDmfWYwtyoWpSbDwGnE4mTG8C+P7TW
         SOSBOv+15k/yjunrtUlAzQFIRQs8oufzsuX2m0XcQW3kQa8HUPJeEcgGNc17r6l0rt3X
         A1q9ArvVSNmwfW3D7qj7pt5sGEQbgptN8nuhgjEeloIbhh5ucqiNthWZZfE0F6iN7DTf
         D2sfHOxKx1C3IkHgDLZT4Xekm5AyoM5YKcZpkj2l9seUoN84YL6yBXp47y3R9x4V9BEO
         /Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778649707; x=1779254507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgSx1IAlA93JFWxwaWFMw+AnvzeYexKax3i0EBGl93Y=;
        b=EqkGeHVGVTkHOqnlgbhAWvoy8oaynjbyisFusgEiU3RBvKMihm1g/CyklUACPUYg6e
         9zSeJzr89RFuP3n/owm/t31/U6rySnrIxrjYxQv0VbkEDBMN8pSDOU23NOVcHq+x+9D2
         9LL/KOCvrldjGSLcMP7bbrDPWTgAXypYuGSdKPXtxNkqT4bpmVkYjEZsK/PPWi5wSHOK
         PapgYm7/2lfQTxitEYGawJ06V3fHeUfvvobzItdiZU1pCN1WUs0QNf7rD7dIolcgyMOw
         aN67cxBTBXtoAXHtBIY99Ly97F4eu9vqVT4PjuodA3SeH+vwdQQlFTQDJe83qdF7eb4u
         V/+g==
X-Forwarded-Encrypted: i=1; AFNElJ+1kMzCupZMep0e2E6iaUxaDtgI1XxAi5a8jSkCEC0DXumFs0+KTMXGPjtxAidiw/Vtt6cktoTC5PZsiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCSbUhu0r9mNWM9oulnb4WbpC1EYhnvj/k8xqW8RwiDaZauH8
	85IJCvb5VDDtCyby/jFXeiT0aJdntHMQ/4qPzDOx0ceLxiNN7ASq3mxj
X-Gm-Gg: Acq92OGfmk0cfk2HjxPqJCf32PcrPALbzJQD8wDFSyxhmZAMshInWsh5ykufQxyZK3o
	OnLWWtNERXFY/7l0/lSw9qYVhN35/USbJ33vv+8SdTKL3sDwpw/RLpNYgo1NImT+DJkrjdPcZ1i
	ipKz5UCfNKqWoj8+T0G8EL3BMkeWvnn6P2RnJKwXhE0MRqgAD+0qEhbAjOIJTngEPM2K0iw6qzn
	ckUqz3+xzRQzLE/y1xHyt7O55yZJjwhQc9V7GOIVk+gTzwBr9QJ/Ob/bCiybuVAea1lBPHZP/1e
	CssedNMz52+YeAxMGMi6FjgHzQ57Nyi5WjUcejwLxZjZwaDiwHn2xE2Yl4+DTpsQfa81fUU3VYg
	53/iH7dSquV4kqWXDvh6RfjHGpgVPAAdMo1tJ4ZyYa1+F+pfUghmrG5Yd743HoVtw0CH5GWjY2O
	RGDzOdUqaAypi1lbkgXdO7wHIv1ukerJ5DKOHLmTXFafISLicIwEvLtZ9S
X-Received: by 2002:a05:600c:198a:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48fc9a4d99fmr21367475e9.24.1778649706571;
        Tue, 12 May 2026 22:21:46 -0700 (PDT)
Received: from josbeir-zenbook ([94.110.189.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fcdf63f05sm24472205e9.1.2026.05.12.22.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:21:46 -0700 (PDT)
From: Jasper Smet <josbeir@gmail.com>
To: Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jasper Smet <josbeir@gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16 UM5606GA
Date: Wed, 13 May 2026 07:21:37 +0200
Message-ID: <20260513052137.56703-1-josbeir@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Zenbook S16 (UM5606GA) with AMD Ryzen AI 9 465 (Strix Point,
ACP 7.0) has a BIOS that incorrectly sets the ACPI property
'acp-audio-config-flag' to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC) for the ACP
device. This prevents snd_pci_ps from probing the SoundWire bus, resulting
in no internal audio (dummy output only).

The hardware uses a Cirrus Logic CS42L43 (headphone/jack) and four CS35L56
smart amplifiers (speakers), all on SoundWire link 1. The corresponding
machine table entry (acp70_cs42l43_l1u0_cs35l56x4_l1u0123) already exists
in amd-acp70-acpi-match.c and correctly describes this topology.

Add a DMI quirk to override the flag to 0, consistent with the existing
entry for the HN7306EA.

Signed-off-by: Jasper Smet <josbeir@gmail.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 1604ed679..309dc9ed6 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -30,6 +30,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
 		},
 	},
+	{
+		/* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S16 UM5606GA"),
+		},
+	},
 	{}
 };
 
-- 
2.54.0

