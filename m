Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763427260F
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983124; cv=none; b=NBFECPvHRcOFLfcVFSfkZQ7Qx9OLph5OGWR9Cx10AdPblD41QtW/MwIM7lU0ncb0b5g2aPd1ermGlY7dPPx5TuwBmkTIBiBpt2IGmkrmy9d+p+BPYRDFxyksSUWLm21UBuOPwVg+V3OvujunP9Yb3HBFIAQqUGuJgQZfyf+xoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983124; c=relaxed/simple;
	bh=0hRQPUOFtVRT/vuTqi26l+2s66+hGknfAuqzEEyzsCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqnI8MP6xMMXZIuqDDIiGJGPwfchhZOLkA+sgR4HE2Fv6QtHzOhjHrmbH7ZLVmJEjBtGo3memDvzGcer8vS0vEGO1mTEoHvFeXpNQKTHHFPCwofdFU+yycZfaSMdSPotkJdO+1aJE7hcjS9KDjlAXJPigPaFjmNmWAUCuQnrIm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtIk3S6J; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtIk3S6J"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829a9d08644so1049163b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772983122; x=1773587922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWe/VwNZRAGsRbWYDwWaTqIEE9ckZabtpEv8pWePrKk=;
        b=AtIk3S6JQrGGmECOc7l6PvfT+LCGj/Ko8qNJH5+OBmvj2vaV1TTEioPEkazLc0NybC
         SX+5tnrpnjBPvFSVuaq1T4079qUpeTUNMZ4Z25JyK9MCjOM2c/GyXFpS4bUHrGEmblIw
         R6jG8a6sCnZ5tbVFrVIfjcYv9OmzGKvi9XZGztae5I83eVkw1T1E98SS4L29vL0s3eyS
         J237TBQF569iqYYsla4Oki1ZoqFWAp6vAbhvlizcgrAaYheSIOep3UKf/ryOnWsDpSp2
         XGWLpntdsGDSk9AHPcP4knhid8IRZy/i38FcBkxX6uLwRq8kYub6IKJ1ivxfw50wXk21
         +X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983122; x=1773587922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWe/VwNZRAGsRbWYDwWaTqIEE9ckZabtpEv8pWePrKk=;
        b=pQV2iv3xiAF9A3gKJqArvBwGidCRDJSNyViyb/BZAQWg6I7URbnEEvSRoZ/vPaRVgk
         wXUT66S6cvJirKQStun/hPySGg1CkhrK3EjavEfhj+7mH6JveqMGm5Qs2/I9l16zWwfR
         Sr8FJLVZ7Qe7Fu29G0sXNrJMQLCK4jVgQca1E22lCr+MJJz5s7chPuayKR4/ISck43zn
         VjK8sA4Z35vt3Q+DhVk31kdUyIuu3INyhihsknUHvPfOD5DcbVexc7urTy5zqcWX8dMj
         5WwyxeUn4Lw7sF90HD4EPYU/bxWszMUK8OiUXZHp199UMKNbt5dbQzC0iHaotSRylCMZ
         sjxQ==
X-Gm-Message-State: AOJu0YxcIZERV4LyEAm1zkZpzAhRB/As0k9mtiGmBd4RdoYzSJfQwotB
	+eIjg3Er/KNLVMFVDT8vZkka/FtMiNf5ruATS9uW8t8bO9R9Cki/S5/EszqQ2zAngXQ=
X-Gm-Gg: ATEYQzxlQITEX2XxkJdoJoMWYAKm0j0E+hJvYgKIznN//K+phMicZAyzNzOfuXkSII2
	9S9PvJSxXV1cForTcMj/SfIBL5xFyWhZsaTNfKcGWltH3371riFBGBMNT4ehY5dFmaK523B+GZl
	owKwE13VghvOkdMSyPsT/U5ds94jCARLDDrSfAvAFAOHha7XKkqGg34tpAgjFcaTdO/teksiCQa
	QaNrnBDPqyBkksDbLoOR1K0SEpXUuwhHINg9100El38DfiXykFJJe9bDPeI3J3ooiCDvt5IThB3
	be0LoGmf42ZsinDbnkOs3U9eq2seHbLD/7iv3T4X+Pv9a1VWO25zVi9+tIfANQV6KkJpDCTJa2H
	8dRDhD0NFrJE/oanb7L1Fepj5m0JmQ6vXkMijEkTgZCcyItcubLtdhwxsdVdo7Svmn024gVfVoN
	o3LNnPIhv+GYmvGg==
X-Received: by 2002:a05:6a00:6f01:b0:829:793f:da78 with SMTP id d2e1a72fcca58-829a2f90aa2mr5859271b3a.48.1772983122389;
        Sun, 08 Mar 2026 08:18:42 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm7432513b3a.56.2026.03.08.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:18:41 -0700 (PDT)
From: hasunpark@gmail.com
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Hasun Park <hasunpark@gmail.com>
Subject: [PATCH 0/3] ASoC: amd: acp: PX13 ACP70 config and machine quirks
Date: Mon,  9 Mar 2026 00:16:51 +0900
Message-ID: <20260308151654.29059-1-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hasun Park <hasunpark@gmail.com>

Hi,

This series adds ACP70 platform quirks for ASUS ProArt PX13
(HN7306EA/HN7306EAC).

The goal is to keep platform selection on the expected SoundWire path and
add the required ACP70 machine/quirk entries for this board family.

Baseline (without this series):
  $ cat /proc/asound/cards
   0 [Generic        ]: HDA-Intel - HD-Audio Generic
                        HD-Audio Generic at 0xa0440000 irq 160
   1 [acppdmmach     ]: acp-pdm-mach - acp-pdm-mach
                        ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC

Result (with this series applied):
  $ cat /proc/asound/cards
   0 [Generic        ]: HDA-Intel - HD-Audio Generic
   1 [amdsoundwire   ]: amd-soundwire - amd-soundwire

  $ aplay -l
   card 1: amdsoundwire [amd-soundwire], device 0: ... rt721 ...
   card 1: amdsoundwire [amd-soundwire], device 2: ... SmartAmp ...

  $ arecord -l
   card 1: amdsoundwire [amd-soundwire], device 1: ... rt721 ...
   card 1: amdsoundwire [amd-soundwire], device 3: ... SmartAmp ...
   card 1: amdsoundwire [amd-soundwire], device 4: ... acp-dmic ...

Patch summary:
  1. Add DMI override for ACP70 ACPI config flag handling.
  2. Add ACP70 SoundWire machine link for rt721 + tas2783x2.
  3. Add ASUS HN7306EA quirk in legacy SDW machine table.

Hasun Park (3):
  ASoC: amd: acp: add DMI override for ACP70 flag
  ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
  ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine

 sound/soc/amd/acp-config.c               | 15 +++++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |  8 ++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 61 ++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)


base-commit: 5b12bef92c1dca68a0e6ae42f6c51dfafb58e322
-- 
2.53.0
