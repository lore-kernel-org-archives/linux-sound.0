Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DAC17BCA
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787698044; cv=none; b=WbvYhMuzanh1MiSqm3agv3vpj9c4n7QaXhJSBI5b1rZBSAPksLtHH6eugTbQ/RVbocIyTTSESpTaNs9qsSmnR/FX8KzAKgY8EDariK7SJrBuU/+TQUaL/dM5hexf1yFEaifM9FjbBgYgDnpuLJqenzsosJ4nU9wX+8Gfr5Y0j7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787698044; c=relaxed/simple;
	bh=Fxvq7gQ60qitRizSTiYHYRhZYnUwZB4x+KoZbC2IxkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCwkwYrdWsrLRu8MJhJ+IZwG4jeeYliC4/0vNxFSxX/8xYm2KOUv/wgl48vYG8rZ5zCH5AO0JJQtduSn+DAPqCrGcathyfj8NZhS+gunfuiwPdG1siCR+D6xHFFIZqVM+6OHIL3qYzqek1RjRVr1Q6SPBgHaLrDEuEv9usvYlCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZKB1Qvf; arc=none smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZKB1Qvf"
Received: by mail-oi2-f7.google.com with SMTP id 46e09a7af769-7eb6411c01aso53699a34.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787698042; x=1788302842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LX7C2JtoUw7wWfepZV1wqe5dnaVfwK5xCAuLp0sm/78=;
        b=qZKB1QvfsZ3CWBeZLiim77itHBXcmIAuhsfnvXsBD1i0oWg2Pj1MWKs7BlHezQQoGb
         sL2slKsCGIFn5qrCKwas90rbY5qrgKVJbHtWgo7xgXKtbsTJKVJqZxM245tuztNCAUHb
         rCjspAn4D8hNmycDn1ERydJNv2RcI6RXzDdtB3p17lnPPBKaWNxZyRJe92wBF8iCFgc7
         RfPncLyMFuoC+aKPU39RosueveGV3r5xE96zvr3vvs3AhpoCLh1Nl0WHmLN+5X9QQHKf
         m/JCd79HMxIKGLC/ldk0EZVsz6bqy7QGv1MtZ8FPvqM3PW+LUSYzUVkj0aNUpgSaf+o2
         PKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787698042; x=1788302842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LX7C2JtoUw7wWfepZV1wqe5dnaVfwK5xCAuLp0sm/78=;
        b=EOHi/U8AoWdppW9rBSR8Ai1N4vxH1PueUFQEBNB5RXd8uvr7x9xp9lgnA+e4hr1v8X
         LNSaksmCKKuKdU3nmzS/4zg7H5Rdk7cCoFJe7bWEQm7CF/z8s+wXcuZKi/pKHlGUiCPz
         valJMruL+Hd4N0vcr+hS8h0CWcAehNN2PQly7pK+eXqLNJqtTSqgBVBI0UP+nuZ+ovzE
         0hZ8RTmJZFKjq9Sg+gM5rWDZCes/d9R/uIutacb8DoCXVVjUWo4MyfUNMCuLvR1tufsy
         23vBhTh6072QnZrjWWmJhspuh+JZzvaDHw3heOstMkMrEBbnzm1jWdYpQqjNtpnPishY
         0GNw==
X-Forwarded-Encrypted: i=1; AHgh+RpH2oaaO8/Pzv6YpuTyiH21paMw0bPAd9DgFUU0NSsdZ3UspIMU4KhykwQhYUE+vzzkBDBDR/1WphNKNg==@vger.kernel.org
X-Gm-Message-State: AFuF++m2Rd6eEcDVzk28swjkoqeuWbjUHkEvWCtJVxdYqrVUxQebJqBl
	pBsRfXKt/EFVo2xIVy7v2TU9XaTUtTdEImQArGa/aSGG+xv6gxdfzO5/
X-Gm-Gg: AR+sD101SuPvCg7TJv561mR70o6hRDvx5cdHkBHrzGDfyYMgA/u32SUg5oXBm/8eVYp
	uwGI6iE6FXdoYLjx4plZ/edVlHSjF1uS/Nqys5kyeVJ7hJDwWA+jDbVleszHzBQIexarur1TEm7
	k84HSUPnJWxGykfMFl9GwonePMJGwqNVRMrBU7yGAIUvWJ1+m4/uRuRWml0p4fPVe3EL20l0j9j
	GyyUUaSNjadKFYjaDM+AbfmdclxO7FbY7GuPtqR8AaHWXYA2gNH/sxi/stVvF1cPhc+1tz5ymYU
	CVAryp+l93z0TpysFHJPvvVbnrD/w1mKcMFJ5ItLB5ZPGmAHKPWpCzbQstf1aWLahtmnbBhjMhn
	oxBl3Tc7S+9cIJ0Jpm20lhB2WJYQanhtMl0LF5IP6LSHldlXbvtUya8rdC0x+KQ0YoUCu6b9FTc
	XcRJZPc94kRUD3MYW8PMN9hcBnlvNVBvYS1IwHgl0wv9CmX/pt+I8QRaZA+8htqOojfq9EnkxkT
	+7UrLLnY+krm6Aby14jiUCQr8a1CYZ7WO8JpMCc8akVik2ouQ==
X-Received: by 2002:a05:6830:a1ce:20b0:7f4:c88c:7b10 with SMTP id 46e09a7af769-7f4c88c8104mr392073a34.12.1787698042042;
        Tue, 25 Aug 2026 15:47:22 -0700 (PDT)
Received: from cachyos-test (74-194-119-6.rstncmta01.res.dyn.suddenlink.net. [74.194.119.6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c81d7c76sm196644a34.4.2026.08.25.15.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:47:21 -0700 (PDT)
From: Sehat Mahde <hskmahde@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sehat Mahde <hskmahde@gmail.com>
Subject: [PATCH] ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 16
Date: Tue, 25 Aug 2026 17:46:40 -0500
Message-ID: <20260825224640.13662-1-hskmahde@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BIOS on the HP OmniBook X Flip 16-cc0xxx (board 8EA2) reports
acp-audio-config-flag = FLAG_AMD_LEGACY_ONLY_DMIC. This binds the
legacy ACP driver and registers a PDM-only card, so the SoundWire
links are never scanned and the two TAS2783 speaker amplifiers and
RT712-VB codec do not enumerate.

Add a DMI entry for board 8EA2 to the ACP70 ACPI flag override table
so the firmware-provided flag is overridden and snd_pci_ps probes
instead.

On the affected system, an otherwise identical upstream kernel
without this entry binds snd_acp_pci, enumerates no SoundWire slave
devices and exposes no internal speaker PCM. With the entry added,
snd_pci_ps binds, both TAS2783 amplifiers and the RT712-VB enumerate
over SoundWire, and the amd-soundwire card exposes the internal
speaker playback PCM.

Developed with AI assistance. ChatGPT helped analyze the ACP and
SoundWire behavior, structure the controlled A/B testing, and draft
the patch changelog. All hardware measurements, kernel builds,
reboots and playback tests were performed by the submitter. The
submitter has reviewed the change, understands it and takes
responsibility for it.

Assisted-by: ChatGPT:GPT-5.6 Sol
Signed-off-by: Sehat Mahde <hskmahde@gmail.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3021dc498..28a7283cb 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -70,6 +70,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
 		},
 	},
+	{
+		/* HP OmniBook X Flip 16-cc0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EA2"),
+		},
+	},
 	{}
 };
 

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.55.0

