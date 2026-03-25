Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43D819ADB0
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774397737; cv=none; b=Ls5DsnmMZu30ek0s5Xj8GpO57tjQpBhjpFmpntfj3hkVu57P037xnVDu8lpyZY44o7OcCrnPF0gqOvWUejUpe5Rs2PfJiE06f3Yy99/m38AAfg4fQ78URsyzOA3AShALZSctMm5cKPcOMS5Nw8RzdSt2ZavOg34RqAjdzdm6yWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774397737; c=relaxed/simple;
	bh=jqh/TnAjq6SCyDhLkI/bK2/6GP4CVAOPQPS3Q/mVx2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqpAcx33v5xNHwPq+rTNQSthWzIWCla//UkFajpLiPz9nCljLD2MbdQtTmB3aFWHT9N/b8AwARcFpikyaGBEzgWuWqtYGB/4k9cHCZGkxP0OKZmC5yQohgcYIPHS4me9/X+RZN6+n7Z7R2xnjjwv2Lya+PrmihHbiHBtcNjomiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdV2wT47; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdV2wT47"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b96760easo16684005e9.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774397734; x=1775002534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=evIkBxIoJp3ii6ssPtPsrLZkaTHMapWbMqzLO9r5ThI=;
        b=pdV2wT47NGzjuoOEsurDT89UOn+EQZQtKk/b3b+MZxTCoEI3i2452bvmNRcRzTJwOO
         Mz+zghPEIQTKErsIoTBpX+EWr4f3zCxyUK+BKHs+6bvGG0lYaXX0rIKLR6iA1kjNOSed
         R+kDU6+8RITVYjYxjxahk+mOu1LFJ9EBgCvNClAEhseXdZVgrDERWRn7O45S+UXV9HUX
         EiyP+YNildpVWbQwsX4WnENVLNRRUpBqAmRgUFqHkU+Lrmtp2Oo91xtFUbbMyYQN+s3m
         YJsgODIylPpPtGPVOsxw9SpPoNp9Tbpod4BVCQc/hlnmdilnuImaWF/WUV9tJwIn+AdU
         BDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774397734; x=1775002534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evIkBxIoJp3ii6ssPtPsrLZkaTHMapWbMqzLO9r5ThI=;
        b=fYyXe+wvrrkPR7oDuCKoDvmhMkREUphLDDRSRsHObTYe1tbEvBymnFQWs3L4YtTIFS
         qJPL2mKEydeNlw3sUYoHh4tG5M1TZuizgXI/icD1dYqW9U+I0l45lcLdqGcQLSPI+7xv
         kzF/pUQcaVmZNINjP5OlWYjog8F7VVEDWXqFIhK+iC5fSTS1FR5pUsj2sbCbxiq1IF9a
         O1DHseeh7NZ10TJGFAfahm70eRfganugOa2xlp5+JgEwPoW/zsY37zJbnzJpZ45Hmgsp
         DlNVWAl1+3l/i/GSB/xRGXYYcPhhM2+1FApa58isgMFfOlzWlXfD25ew88Q+dsXB3h7A
         msCQ==
X-Gm-Message-State: AOJu0YwpBVM+jsSnPOu74uvqIWWjUZx36IxEJKxOrtQFVoGIttMb56Gn
	jd7SpOfmpuXWpVKJoV6A3ylbc44OI7roMEYNsTYvnetqpyvNw2Whv4p4qMqY1EfnI4c=
X-Gm-Gg: ATEYQzx1AHI+gdBN/MaKdS3kI8phtzZ9f6RYDu1P09wXOYNWGcv4LYAZx7wSixqIoE7
	cnmXe41ICOaS5WP+OH6NGlHSeP8YEW+O1Mt45tj/R/D3BjNxBIhhl/LqwOQrVCUq/6zgQ1B0zLF
	xh1bmbNSlU0OmvTlv2NdWYND6krBb8MTfVivHFlF7+BbuPiah9zCUBJZsZ0lQpLpdFTG+Wbmy61
	xJCqqc7yw84rfWdP3fSMm75kjKGGwcvN9HQjR2vl0Tn5u/UWE5MjYTF2meXH3U7sxgDpXKOTfoO
	i0GHsRtQx3Nk7m/CU1AE4EyGdp6UMnibhcsL8Pgmvqim1SNCwqMZdaAfmewaj79Dr8HP3aOFJA2
	4oTv14VBzvnlBWMD+DEhz+rP5qyZe9jePeH4dJruj9sNkY9QWCw+enpgi72JCtEvaBsR3Efbzut
	RLONk8PfvlTlq4otpORCAU4qXJLXQM
X-Received: by 2002:a05:600c:3b12:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4871606dc4fmr23619905e9.26.1774397734040;
        Tue, 24 Mar 2026 17:15:34 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e95c:5e00:30a:e2b6:4f44:efa4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6cdfdfa9sm32893962f8f.9.2026.03.24.17.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:15:33 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: Intel: boards: fix unmet dependency on PINCTRL
Date: Wed, 25 Mar 2026 00:15:21 +0000
Message-ID: <20260325001522.1727678-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit c073f0757663 ("ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43")

Currently, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH selects PINCTRL_CS42L43
without also selecting or depending on PINCTRL, despite PINCTRL_CS42L43
depending on PINCTRL.

See the following Kbuild warning:

WARNING: unmet direct dependencies detected for PINCTRL_CS42L43
  Depends on [n]: PINCTRL [=n] && MFD_CS42L43 [=m]
  Selected by [m]:
  - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=m] && SOUND [=y] && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_INTEL_COMMON [=m] || !SND_SOC_SOF_INTEL_COMMON [=m]) && SND_SOC_SOF_INTEL_SOUNDWIRE [=m] && I2C [=y] && SPI_MASTER [=y] && ACPI [=y] && (MFD_INTEL_LPSS [=n] || COMPILE_TEST [=y]) && (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=n] || COMPILE_TEST [=y]) && SOUNDWIRE [=m]

In response to v1 of this patch [1], Arnd pointed out that there is
no compile-time dependency sof_sdw and the PINCTRL_CS42L43 driver.
After testing, I can confirm that the kernel compiled with
SND_SOC_INTEL_SOUNDWIRE_SOF_MACH enabled and PINCTRL_CS42L43 disabled.

This unmet dependency was detected by kconfirm, a static analysis
tool for Kconfig.

Link: https://lore.kernel.org/all/b8aecc71-1fed-4f52-9f6c-263fbe56d493@app.fastmail.com/ [1]
Fixes: c073f0757663 ("ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2: revert commit instead of adding 'select'
---
 sound/soc/intel/boards/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c5942b5655d3..d53af8f7e55b 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -530,8 +530,6 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS42L43_SDW
 	select MFD_CS42L43
 	select MFD_CS42L43_SDW
-	select PINCTRL_CS42L43
-	select SPI_CS42L43
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
-- 
2.51.2

