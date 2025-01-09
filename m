Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976A6188714;
	Thu,  9 Jan 2025 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442957; cv=none; b=nvLCPVdgbqMinUGnPhMquQCZ4nELlPrFTgKK3W6wwzubi1TlEEX+RChqfgHebICOKwDnvwYOacLt/VIrwSIC1xgd2fM9FQ+oKvRH3ND2i3UNeTqyXNG+jFTOo1baIMQcmCriJnLIgcKz5n+v9j4Pstu4xsS+IvjDbmT5rmYVq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442957; c=relaxed/simple;
	bh=cAdG99CBgsb55zuPQRJg/YylspMtXfgAPt4JsfufZLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxwqZ/1XDeoI/2HmPsPTjXrlUK51FZDP1gXDfFx9nsyHBPct0v/kOewVt3PLSsutT9YIXyQpPH06wK4ERKtIXCnpsElaiakURfQ2b3jEnqCli8FY8KXucyULO/dAvUu8XpGS6RjdFPLZ4CMHzb5zdrAZsZpGdmDRFZfT6MXdIkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMi9EQD4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMi9EQD4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216728b1836so19231555ad.0;
        Thu, 09 Jan 2025 09:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736442955; x=1737047755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kS02Oi3HkyLb6VFrQfG7711xuXZ9e7z8zcKc8mR2/BE=;
        b=WMi9EQD4DozPNKbJJMZAswqFWwrRzR90Jl3ZHCHJ/3CjGjTor0yLthWZYe8IFUqnd6
         3cM004jATh0sncz7j+ALYUSggjBjq6SAhv4LU1+4t/XK6emoRjOSxjPvuMAJHltwA3hA
         Lxuli88zwIixaZeN56lbzldC7X9g3ks5lFLGZgdf9qm7ugTn0ohnD6mjw/vg6R4/oz83
         ouBlUIFm2JsPOnWuDzzEIWDTIlr6XFTj9SHptjAxqj2dr78wcSGvtEypNwFBWUrFukTD
         1jRhdhKL7gDmNlsnCF5doDhWxowfc3VnZNOGuJFK5aa+15h4swMxjn9KmjzygGz+0Xko
         ELcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736442955; x=1737047755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kS02Oi3HkyLb6VFrQfG7711xuXZ9e7z8zcKc8mR2/BE=;
        b=inqvo3TdBicxWq6zym0EAnRS3NzU/M8MX6q3JTtmbparp94bV2+q1I3aXYEKK0t5hb
         ooXZixTqvGP8ZRCQXTkEb/8debuSZ5kOl2C5qNRKAcLbbS9pry07P0puzUM1YZQIewMb
         M5daH0Dk5t6TbaOohGxZGl9fVghuhwnqDMoB4B9gVphQo2yhZijSE81QHEz+FWgIyTw9
         J45EwiL9kmrtIjTMy11kf5FD3mhIc6MzG1hnt4KF5c/zUARSju/TB8bWuGyAUrqhaz/K
         rXgdaMOpkiTTW4So2cWu2FOvuwgoOxeACfvzj4m0Dtp6Z5yo6N2WI0TFQQiJQq5MGt16
         d60A==
X-Forwarded-Encrypted: i=1; AJvYcCWkW/RkjEHZNNZJWbMbsMiZpebUso7e0VVNoS0EVpbVqUIyaVrbF9V0iUmJb5+4JfcmBUEZc0Tj/WBjNN0=@vger.kernel.org, AJvYcCXmvtzzIVquHa++Zt9s1OkRj4R/6kCu3T63+yBSFO9utkdNojSmxg/vhkZ0rjVOMwCbU3Gjwa0nqmVVvkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hqeVxM6Lknr1L3R/Blqw86LJp9JCBdg/RkSDCTbxzRMaV9Qc
	pAjNvbYR6JB129ES8k8ULTqgRHuD2sEREjZf8eb6rYSC9BFJjCtM
X-Gm-Gg: ASbGncsSaxGB2J8ssLjh2jUyklGMzSBYD0Q6/E8FWHoNAyjTeD6hRpIHDD7V/fQGjZu
	QabYpw12DQXGzrKdYohx8o1ndubNdkxovWANbPCCjEMHdu7o4BTt/UVWHReZ3SKTuXK5Ys0xG6K
	I24s6FEMoDnARFFDEG7OEjXoOWlfR4aSqFpVsSFPlCILOD+PskGD0Ixhh1hP//SwqhSGm6cXI8Y
	gGjMILyHggsrIR3YjJGdYwe3ESrYCgXZfLVCw1KciVSNkuRbRWBV+nqVfZrgQ==
X-Google-Smtp-Source: AGHT+IG8jXz/rKc68FPcmKWD3karQ6oHK2yMPNYs64ese5SNI0laYxYxyUGhkJWkPCLOhojhP98zvw==
X-Received: by 2002:a17:902:ea05:b0:215:e98c:c5b5 with SMTP id d9443c01a7336-21a83f440a8mr122713425ad.1.1736442954724;
        Thu, 09 Jan 2025 09:15:54 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e970sm442335ad.29.2025.01.09.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:15:54 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: mario.limonciello@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: amd: Add ACPI dependency to fix build error
Date: Fri, 10 Jan 2025 01:15:47 +0800
Message-ID: <20250109171547.362412-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by the kernel test robot, the following error occurs:

   sound/soc/amd/yc/acp6x-mach.c: In function 'acp6x_probe':
>> sound/soc/amd/yc/acp6x-mach.c:573:15: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     573 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               acpi_evaluate_object
   cc1: some warnings being treated as errors

The function 'acpi_evaluate_integer' and its prototype in 'acpi_bus.h'
are only available when 'CONFIG_ACPI' is enabled. Add a 'depends on ACPI'
directive in Kconfig to ensure proper compilation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501090345.pBIDRTym-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7590d4989bb..803521178279 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -105,7 +105,7 @@ config SND_SOC_AMD_ACP6x
 config SND_SOC_AMD_YC_MACH
 	tristate "AMD YC support for DMIC"
 	select SND_SOC_DMIC
-	depends on SND_SOC_AMD_ACP6x
+	depends on SND_SOC_AMD_ACP6x && ACPI
 	help
 	  This option enables machine driver for Yellow Carp platform
 	  using dmic. ACP IP has PDM Decoder block with DMA controller.
-- 
2.43.0

