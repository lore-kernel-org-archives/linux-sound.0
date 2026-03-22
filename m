Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130937CD33
	for <linux-sound@vger.kernel.org>; Sun, 22 Mar 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208943; cv=none; b=aQgxqauTHBLSGJRePXAKSa1OjPtNC+rVE+x9SjVaJYylu442kXwVovfJm1TX15m/5r+PVkgXHkcHr2VEcGcMUApK79xnTVkYjm3f+K1cPmS7+a6QTvvVAiEW08O0AOwoTrRb/ttZKEsDH5beLD2yFCuECXdLMUB0QTKJoZVJ09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208943; c=relaxed/simple;
	bh=0kt/TjFxgMJf+8xmQqNeqyEh5qJ+88h2wzuOgqCfM+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kI9whk7EVRyL5YXVzFH508tOayR8kzkSC/T2bMx6Ji5TrBZav8WjD5lBZaT5Er3wZf8ummIAD9FBIgLLsV1bVp6XSIW+Hppfq51l2DIhnoeGj+/bhlZxQojjhMw11rK982HVs++Mx451hwOeGdAZk+IG645tb8aPfCXpNn0Mw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX6zRJL6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX6zRJL6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso32571035e9.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Mar 2026 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774208939; x=1774813739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kPmBbR/3kGmdb5cb4yJBRnAWV/p6TWyODVjcQ7VXceU=;
        b=SX6zRJL6OecTmrJc1i3LFj/KIOYbWSFRdG3LdUuNmjM85RbBL8isidRbywFyIxHcCw
         5dwbVtbmAoOhW86YVl7ntsxxt6rz2AOqzXbSV/8+x+KSJVZ6FvGidAdPEFiZbl9/SQ1x
         Eu+piFzDAsacctyNgKXq2y81Xcvg7M9We+V2CRC/LRtE3tJQTEzh2ZGmQPflJwxd/5ZI
         v4pwlVQAYZfLZyIGGdl7f7U1x5a+9ChYD7NyXrYfmaUTFOKaDmTKFmxuN5tksEc5MxWu
         2QdJmQiYeb5+bh+t5QH5wPjlwABQrmTvbj6Z5BHFaTGybQgv+zIDLnfp33luuDpFXlFr
         6XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774208939; x=1774813739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPmBbR/3kGmdb5cb4yJBRnAWV/p6TWyODVjcQ7VXceU=;
        b=D8HR+3in8Z89HlZOP+TTjRcAo4+JrBOFfJXkTpEBqgweJScZ4d68H69C5VEJ/E/qUb
         pnUgAs4DAT3c93tQFka7+sTiquT1jf/gFfMgkMKyQb3LmFgtFJTEfpLGROlvhoYdLUTd
         phD/CiJ6PbIrhkWY8cQSFoSSjdTrPxs4GlK3OXx/rVwAwky4yAnL+YidEdJu8ZjC6dqz
         tSwPyUqNs0ttmifFrla5xIZdvJumeUEJ8cTgqMMmmC618svCqrStHvBHR6aXKXGN+ODa
         ma3HAG7mtZlMcz+zpFtNVzli5bx/SVTsjBjVy2ol9JmvWw4htZ+0aoj+1rDiTrlMpHwx
         hLqg==
X-Gm-Message-State: AOJu0YybuyXGWGHDTQLqmNEUMSzY1saMZIHC13ZxpMf7Ojc5smEB7Obz
	wY42XuFD/KAZR+Lb1Snd8ACX5/8YHdG5F/AOzP5Kn7+SHTtsY3AZyTiX
X-Gm-Gg: ATEYQzyiRGeUv/m0njMHSQLER2KKgVV+evOQp5AfBBrCgaNBpsYrLfWdR8s6uixeF28
	cEBFM28LRnRHDBseuMxWeT0kZSrfAWNIwCURKF18mF4h2N3REQhJS9TCIHympgsfuigiAzVLu1B
	xJ0jyDrLrShJ/+LpN6VXaRaPQAyFWN+w7gWVaia0qDrQEC2Lr8S3ylZtPf1vmzfR2de+fgt1GSb
	y7igoPJTgZiSgOt9ggKJoacw6cU5C+cLQyeJtZg28siDQNM0Li8N1F89KPI89lu6+RFWEpOTieW
	W75ZoSFZ1X4uP49M7faPuBv/7LJEoH2z2GvzZUF+p42jBo33wsrDYUdZN+e5prPKcznkv79ueF3
	CrN8hncMe1goQqNNyv1BmYxisgJRbxRzZT9/JZrfSfZfzaJk9peFODMcyMHwmvNkF8umWaStUlm
	AnGwFzKxrLVDy/+iBNwMqoBY7GAuD0xN4BjwYHPoP4JeVdQpRUx9WXe30=
X-Received: by 2002:a05:600c:6749:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48707163156mr37438965e9.13.1774208939235;
        Sun, 22 Mar 2026 12:48:59 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm341153015e9.0.2026.03.22.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:48:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	liam.r.girdwood@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	david.lin@intel.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ASoC: Intel: boards: fix unmet dependency on PINCTRL
Date: Sun, 22 Mar 2026 19:48:47 +0000
Message-ID: <20260322194847.1126372-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH selects PINCTRL_CS42L43
without also selecting or depending on PINCTRL, despite PINCTRL_CS42L43
depending on PINCTRL.

See the following Kbuild warning:

WARNING: unmet direct dependencies detected for PINCTRL_CS42L43
  Depends on [n]: PINCTRL [=n] && MFD_CS42L43 [=m]
  Selected by [m]:
  - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=m] && SOUND [=y] && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_INTEL_COMMON [=m] || !SND_SOC_SOF_INTEL_COMMON [=m]) && SND_SOC_SOF_INTEL_SOUNDWIRE [=m] && I2C [=y] && SPI_MASTER [=y] && ACPI [=y] && (MFD_INTEL_LPSS [=n] || COMPILE_TEST [=y]) && (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=n] || COMPILE_TEST [=y]) && SOUNDWIRE [=m]

This unmet dependency was detected by kconfirm, a static analysis
tool for Kconfig.

Fixes: c073f0757663 ("ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c5942b5655d3..aa20020eb436 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -530,6 +530,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS42L43_SDW
 	select MFD_CS42L43
 	select MFD_CS42L43_SDW
+	select PINCTRL
 	select PINCTRL_CS42L43
 	select SPI_CS42L43
 	select SND_SOC_CS35L56_SPI
-- 
2.51.2

