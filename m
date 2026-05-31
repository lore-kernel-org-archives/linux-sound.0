Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0335675D
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222348; cv=none; b=cgg0ip/Fs+42FkLHMVOGylvGutGOuoHdRqyPjFx9wWKRiaQxfTAWZkoBVRfBDliS5fAvEyhFXbBuL/buIXvbSKaBY/SbHO45U5QJloamq1f7Ukt4L5e8uRp8xnTXd8MJJFoTD44lkErETU5668f6hEzOgtOahBgMqMEPm5TK1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222348; c=relaxed/simple;
	bh=PeVfZjGGD6vnpATXGvPJ8RNWcC+mfOffuToOiXVCtAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsy/CLmJoY+ZMyrTXCPfAVBkdUHD+rqNxz/9jN4fdlQCnsdGjS1LxNgB3HqXTXJ1Nlvw8MpUm2U5/LHaZubPcAPv3XyBk5GELULax0k/MUWhOFpaGstGq48e23OxjpGUleQm+sstoD5vJKanzblf515Honj2aBv31QJSRqMGDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8Dax0xo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8Dax0xo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so69896265e9.0
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780222345; x=1780827145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FhNU8iy/Pw02vwxZLCOBLpS/iNq8CZr57lpsPr3HCU=;
        b=U8Dax0xoIpsot3pjPyUhk4e6k8twHAdZxskGifB7N3HKEq/0TL36KB3YdvbAyePYcP
         GuO5cUX/kSzes3gxiz9vXRDCZK2vvkvCsouCBuEzOlWL7vlsrRi0dU9jv0H3G8eo2UBu
         vbc78L7KE/aTXRBlUmAich8felmdYMjhC/k+tV2ldewD4PMfRAYTHQhhOlg2X19+Ilpq
         1sYHhjz8qM3pePR11hW4vYASuMqNrrcHn8GaUSoc78iIVUhOrIGghO5uZx8d9K/PCBSB
         XHytMPIK7716i2ArmhxbJl1YsjDfiSty0G9fhYYV1xXGZZ3yJwdNrigk+I0BVjl3XGbD
         RzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780222345; x=1780827145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FhNU8iy/Pw02vwxZLCOBLpS/iNq8CZr57lpsPr3HCU=;
        b=XpWbrITWcR43CYxMGU2rUG+sO0MUgQ9BhK8b2eenE7GBe/JNcPm8bzlNmu7zn1lTM4
         cflSCIwPA12vAEvfcZJsL8CtadyDZUgad7iIyzUX7Qx0z1zvVApPKfq9UND3MiLjr4Ei
         rhV4GKV9jo7Pu+xutyM0XeeesE2dOatg4LEOK3mv1grg1F/onV731E5n3AfoEB32tZrx
         9ejAejRjrIEdaD1GrLikupTlVnsen79s9bS18ndf4KQRvgrjyBki//UHxhoWzQRwRnz/
         uSx1iBq5FMfNYXnVoiIufsSqMKEIXtbTPezgo8UYWtVGgvy1mwevclx8UZCnIWThGxrt
         S5hQ==
X-Forwarded-Encrypted: i=1; AFNElJ++fRUri5/raLwWRTUXSWVPiE31n9vG1xyLepPbk7Racj4TScGVl44qqbsaHpMG+MMCQTKnd2XLvYLX9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9TjVFqpCf11Fxb3RpUa3hzSJoMplyIsF8UvTsv2ta8SLZglg
	YKUUcElwtmfDsTvjMG5uoiOB8wPTj8bXASv22mA5CKWiAasCe7fN9GMm
X-Gm-Gg: Acq92OHpat/SdPFMgcnY8tAwKsqpxIO1D+Zge8YLWNwbH/LXLobH2FST8ecL4FXHnuI
	hl/2vp/RSDgr1ojLVtJ3ovKOEZdVw9vYoro6iPXafP0hECba6HOge2av0Hs5lQ1fKpFIM6pK3Bv
	1/D38gbIfWJrxAhK9QKS5QHrzwdUEUBRxjrBGNmPYSQ7g7Ghuz0qFNdVjF9zyC39MWkwhEt6GyY
	njwfyFGxFfuoU7S9a9dj3clzd5HN/iSfMLgwCPCvGqhtadEY4KiK8lw9dOWowNdR9ToMNXttVYW
	q8CFhSDbVzqtRNgmnBrKdq6WURHLjjyuQcPv5iK1mciFSPVohKCd69gQB41pEZ95jE8T1AhjFyx
	7qqlt9n1EdezjFMljuNkb10VVnfH0gw4RMmGGeutTDuvfJ35GMndpL4jAB6k0FsctClEz+wsrLs
	GnxVAX6vl9sjBV2uEL/2byaYbIaIhsxbH+8ZzZgv1k5rPBeVN0UR2ahmYEjUAv0YfNTEsIYJ6Cc
	eUI/ndkpiE=
X-Received: by 2002:a05:600c:6287:b0:490:a1a6:6f24 with SMTP id 5b1f17b1804b1-490a29338a8mr122547445e9.15.1780222344593;
        Sun, 31 May 2026 03:12:24 -0700 (PDT)
Received: from developer-notebook.home ([146.185.239.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0d4f4esm71156125e9.1.2026.05.31.03.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:12:24 -0700 (PDT)
From: Aleksander Pshenitsyn <brains.fatman@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksander Pshenitsyn <brains.fatman@gmail.com>
Subject: [PATCH] ASoC: amd: acp70: add standalone RT721 SoundWire machine
Date: Sun, 31 May 2026 13:11:59 +0300
Message-ID: <20260531101159.14241-1-brains.fatman@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Vivobook 18 M1807GA (AMD ACP7.x, PCI 1022:15e2, subsystem
1043:3531) exposes a single Realtek RT721 SDCA codec on SoundWire link 1.
The BIOS reports the ACP audio config flag as 0 (SoundWire mode), so
snd_pci_ps claims the device, brings up the SoundWire managers and
enumerates the RT721 peripheral (sdw:0:1:025d:0721:01); the rt721-sdca
codec driver binds successfully.

No sound card is created, however: acp63_sdw_machine_select() walks
snd_soc_acpi_amd_acp70_sdw_machines[] and finds no entry whose declared
SoundWire peripherals are all present on the bus. The only existing RT721
entry, acp70_rt721_l1u0_tas2783x2_l1u8b, additionally requires two
TAS2783 amplifiers and deliberately exposes the RT721 as jack + DMIC
only. This M1807GA variant has no external amplifiers - the RT721's
internal AIF2 amplifier path drives the speakers - so that entry never
matches and no machine device is registered.

Add a standalone RT721 machine entry for link 1 exposing all three RT721
endpoints (jack/AIF1, speaker amplifier/AIF2, DMIC/AIF3), mirroring the
standalone RT722 configuration. Place it after the TAS2783 combo entry so
platforms that do have the external amplifiers continue to match the more
specific entry first.

ACPI _ADR of the codec: 0x000130025D072101
(link_id=1 version=3 mfg_id=0x025d Realtek part_id=0x0721 class=0x01).

Verified on the hardware: with the entry present the amd_sdw machine
binds, an "amd-soundwire" card is registered exposing the rt721-sdca
AIF1 (SimpleJack) and AIF2 (SmartAmp) PCM devices, and audio plays out
of the built-in speakers.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221282
Signed-off-by: Aleksander Pshenitsyn <brains.fatman@gmail.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 1ae43df..18f2918 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -619,6 +619,45 @@ static const struct snd_soc_acpi_link_adr acp70_rt721_l1u0_tas2783x2_l1u8b[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint rt721_endpoints[] = {
+	{ /* Jack Playback/Capture Endpoint (AIF1) */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Amplifier Endpoint (AIF2, internal amp) */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint (AIF3) */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt721_1_single_adr[] = {
+	{
+		.adr = 0x000130025D072101ull,
+		.num_endpoints = ARRAY_SIZE(rt721_endpoints),
+		.endpoints = rt721_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt721_only[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt721_1_single_adr),
+		.adr_d = rt721_1_single_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -711,6 +750,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt721_l1u0_tas2783x2_l1u8b,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(1),
+		.links = acp70_rt721_only,
+		.drv_name = "amd_sdw",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
-- 
2.53.0

