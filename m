Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145223ABBE
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867281; cv=none; b=XifokI2W1h5U77NjN6KVT/aDO/QB6MAxlVaI7O2dPgBQclcljY/3PX3wYXdqfKU1m3k1j08eLUQZbn/Wqb9DairU9dAlvf4VMqBitQqShY3JKuRCZixnnGf3JniBDGwBr9BSRf1wTIfAOU1Mhjy69ixgGE3b3qRfvzFZTGRlKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867281; c=relaxed/simple;
	bh=2zaSWf5r9NwHO8bq30a3+zlb6fuk3dWRT56RBawh42A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nkpo0z9qGvy+OGdF6WUror/X2KFS8loKEStvYDi0gffhJufjA4hIU+3llZknA0LizuxgbhtD2SNQ7e0zARt5UCT6Vn1JRNwLnB4BPhMvZS96qPxq60P0ukqMmfcOsGJu8KiuQ0fLpt83RQBCnR8Pm/goEvUqzI4fu6oj08FxUz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3G44PZz; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3G44PZz"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so607690e0c.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 18:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867279; x=1790472079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7dETFL01Uf/V8b/sJtlYLOgTsT5+0OY9xqQKkVwMJU=;
        b=H3G44PZzgdTZOnwKmIw3EfAOWZV8DplBDKkbWkjwyy7wB6EfswLhgeKgMFJZEAj+VW
         n0OcUcITPU10YpZW+9qgeV2fXNWLyA0UVETSuHv4YWmKIhgNJdn9liLECsfe9iJZvmNw
         8zKWLHpDEpjvQ5hCGKYDsvnWUycdt0HYpgBGaGNq4vUWsrJm8AMr/hFEjXCEkRESCxM8
         RuOn1SoltfgonOAr1twZTSw3uHuAFyOS2P9IKJdDrF+gvHT7+5uEC017VLyCzZ/e5Zyi
         OaZc3L0jAKaDPmkXo/egZ5B6CiakuTn0fRuGhGuUvv8kCI37xMJznn7tAuH0HlbwolkZ
         nJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867279; x=1790472079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7dETFL01Uf/V8b/sJtlYLOgTsT5+0OY9xqQKkVwMJU=;
        b=iKucFRG4YSLhSFzfXO16iTgSoR3rAn4hHDPvaKw0zOn0aHlATJdn2+DySph/UCF6td
         VHzU4o2JXCQyDRLjObrLLfZ509bu37klJLtGkpS9njOaEu0wrJiPZ872B2SKjmL7J62g
         7RYJ5mxShFFNBSxMRQV2my4qWFFqgxVGBiG9OlijVIYfcefF3NnNbbMKS18PNx4YNg6e
         L0V06pi19BwFk9aywHPhlHcC8GMSYP9tr3o9KLWVbKo4FX8As1OpEelUYsD+w4IBlZrX
         3Tdsc2db1475+TEPRxssldKaFUx9ZFySS7o4GzGTSxUnMB+iFYCYn57mmclAK10Cw5i3
         aODQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2bPO+wKBe6ch1YSK1GpX1kt2Ew3dgB0S4qZhVxyOQk8II+DZ0T7ABiM1ZWitO7Jgtbw4VO5IsxUbUhw==@vger.kernel.org
X-Gm-Message-State: AFuF++lzxT3dNqzGmVR/JOcG/pGa87Ro1PVmDzMf3N91aQi7zftglNnb
	gwKkWI/LIE45rQFu+OfUs8tKt/SuOi/DD9uORQ8KPz/AFHRvNZQdUyUb
X-Gm-Gg: AYBFou1dIastw6hiY5v/rRVQ53UNVPq8TN5HN+ISX94GxDg1L1NnBJmVmYVEoWHyl7M
	P8F+ff6/p66wdZlO+A7GQ4FV5Y677RczuUIt0rIyYim9ZW92Oe4Ne0M7EKeimYFQq1L0gbSYSL/
	RJ5R+IFzG13go8XpM2pQmeK8W4b16kvvff86iIAw0ha2dhlviNCmTLKJB2fdhsz9aB/iPMNqADP
	zcXU2hXi4Zh2LxiaLOt2tq978GdkmVNllb7PtoqjDg6ndUgU1fufhctAc735u2DSb7Ggu/M07JB
	N9rSFztwb6G/leT1HS6gGIKqtWUInMaRq+9fvW8xC73dzGg2FRWqRuGlhIxMoJXF2WSItK7n/dq
	UxAs+l57FNc4ZYJl97qQN9KE3VvNIRnAsPNNZS/zDnKvwwOqmvHpvkI1FjymUfXpUNMiSYGSIeD
	wwnBzWrHWu/98e5JsekivoHfXTMvgEeePoI82vUn31k8EhhiJbFvcDZO79oujKN1VlSnfM
X-Received: by 2002:a05:6102:2922:b0:7a2:2a6b:e7b4 with SMTP id ada2fe7eead31-7a55a0253damr2427061137.2.1789867278724;
        Sat, 19 Sep 2026 18:21:18 -0700 (PDT)
Received: from danozmo ([38.51.243.36])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6ac5e08c7sm4064319137.8.2026.09.19.18.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 18:21:17 -0700 (PDT)
From: Daniel Ortiz <letargopausado@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP
Date: Sat, 19 Sep 2026 20:19:20 -0500
Message-ID: <20260920011920.2482786-1-letargopausado@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo V15 G6 ARP (product name 83UU) uses the ACP6x PDM interface
for its internal digital microphone array. Its firmware exposes neither
the AcpDmicConnected _DSD property nor the _WOV method, so acp6x_probe()
falls through to the DMI check and returns -ENODEV, leaving
acp_yc_mach.0 unbound and no capture device registered.

Add a DMI quirk entry for this model. With it, the machine driver binds
and the DMIC capture device is created:

  acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI
  card 2: acp6x [acp6x], device 0: DMIC capture dmic-hifi-0

Capture was verified working with arecord and PipeWire.

Signed-off-by: Daniel Ortiz <letargopausado@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 79858fc..f3f3592 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -381,6 +381,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83Q3"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83UU"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

