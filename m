Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CE20E314
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381411; cv=none; b=m4pUQucgZLWyHcGaf2kOBwh9FPumLxu8ib98/WYreZF3pHipDQ5HvC98zylx9ZOLTQaSO9I4df1PMZRBIUXGA8HKx85X9FTVQG+IQ7ZxNz4oGd0xJ2uu5Cz9r/AJKPIlfOLF4VOA9t7/H7Q0UnE1NEAR8XVAm/vO6YJnr4FW46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381411; c=relaxed/simple;
	bh=laYiaUcTGUX7WZdRFzgO/xJoajwzTuQucUs/osES3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lljYwUFmIB0SVAl8XRZuhMlWV1CoCjJ30LR+6uZ+5BWLXigWIizqa/6VXbsrlnWZEdBDfMk/4bL1d1ynjf+gaZfvRCHg/u9NMWabamL0MEM6nuVLADJ5GI/WvuzoKQy2FmhdqcAF/ErbODTkzqvJ6/UH2cAV7fhdfKYaInxdNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qsVZO20T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qsVZO20T"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439554db49dso21394715e9.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 09:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739381407; x=1739986207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm33hzJFjmJ8ryY5EAhPR6Zq4d9imOcOnZK3nzb8Vvg=;
        b=qsVZO20TA4YcqJkokAIpE+CPbPih43vzwFIonEmfjibtZIzwYSn8vlyI2l96QWkWdh
         OlKiCow25TjJzqshdFRiEZ8YTlihWkPRJsIDbBTQSSl5oppxFkBVcjqcFPtUd8ycjL9M
         hCgr6v7a05XsIBoAWKLECOcd/bnpRaZGC5PY2AYR2jWjj5UKjVO2DWrJDf9/o4n7MpY3
         9SU3mcJkJiB/aFfyzSBtn6fFbjYsg4QJ5XAr/ITa28zDhz+zXEBNw5x/plGl50xrZsXb
         RHo35gcTVhJEm0lAdjDcfXNhEX1eO+BDYgtOKL4g+XM1d7BpMsb0X5HycuqTI8n1CO0v
         /ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381407; x=1739986207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm33hzJFjmJ8ryY5EAhPR6Zq4d9imOcOnZK3nzb8Vvg=;
        b=rjmipK6ecOxKqMZoX/tEInHHUNie8Ogup9J/xUEyEDluRcYHzNqdUBawX8GGnQp8bg
         UtnoYDhDRM40uGTnh7NwrpavFBFAVb+WfyX2eV7iB8iaSfTX3Ow4X0qPlDfb6TGaJfB0
         aI+rm1o7m9hsLJtqBET8Hx9M2qOPDcwh0GWgqC4JZKdHI5EeLH0HUYA0NBaXZj4fYkny
         GNL8KVPJmfkLBP+Qhstp56feEYyvt+1KLv2pidOO4y1ykAoIEIeBa/BrAHm7Vv+uEJkU
         yFJyHPZsxOJ1FISbtDsHwtgq7YKeWsmNV2paZe8QevTSufDutWnr8ZOEzsVtxz2zmnyd
         DQeA==
X-Forwarded-Encrypted: i=1; AJvYcCW7mYuWCWzK4Qw7bCG189khy+bwlsKFbD3InsvllRfqqiWig1lIID3lWwmW4TCR/muGJyAELqSoYaH9xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlLCmrltXijAdAneXc9lxbDmSwTXfk60+Nn71eCch8aNaQfhl
	H/2nrW2akT2C0WaJ1zUsWUM+LGCUtvPHCUetjjRoUoqPfChbMa8KUjikf7UFzBs=
X-Gm-Gg: ASbGnct8l/0DK3lNtGto/yjydoHnkZpdKLDOYMqCXK48ATDLG4Igi15H/tvjOIXxAAv
	X2d4Bbx7XrV/vAwiAPfEHu+1Tf341v/83BTDHoOLORLOsiKxhDOP/MP2QgMbgbhviWk6qHn+0Mi
	oep8m3iJ2Z2s5p0SXlgimNpawKtt+hqclyJevjc2ZVJRETTvtliwWy4nail2ymsqEkpWdtX0gHa
	HxQzGRH++ZiunFkt2IYo9dhAX9cCDFZ1AvnypnIPwIEw6ax5N56+L/MQJFy4XjFhzRIhdQI5QEI
	TQvwcKf9deD/HHhy2bNPOXoszlwJ3ePHt5RqsR+JxwJDs2PhbDsD6sb80Q==
X-Google-Smtp-Source: AGHT+IFmtH/Z0/wfvfi4zBd/2JuSkW4YNabBwKnrELBkty/sNT0IOpB5DaaClkovSbkXskxtQ4Vp9A==
X-Received: by 2002:a05:600c:1909:b0:439:4a1f:cf8e with SMTP id 5b1f17b1804b1-439580d5f07mr47517675e9.0.1739381404118;
        Wed, 12 Feb 2025 09:30:04 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43959d3ca9fsm26613465e9.0.2025.02.12.09.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:30:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luoxi Li <lee.lockhey@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: Don't import non-existing module namespace
Date: Wed, 12 Feb 2025 18:29:47 +0100
Message-ID: <20250212172947.38970-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=laYiaUcTGUX7WZdRFzgO/xJoajwzTuQucUs/osES3q0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnrNqLELLkjra0885y2Rx/x4p/lb/4/2SnPkLJm 2wgZCszcuSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6zaiwAKCRCPgPtYfRL+ TnwwB/sEqsIHtsoz/5FrIMoIO3yYNFDbfwywPBSPEUQZ4jAGy/S/sXJgFcP8DQ+Z116NP+hu2C4 zFW2cMjvaRAhust2jaw/fbsrofvRYo47IXJA1NQeBvtDMj2/W03g/TQK234uliwZl11R+ycRXN9 9SirscZkuVV7Zgc4XKuMN6nGk1VTPvobRVnjpLQnPlfPDFqghW6tRPpBnw+TKssguMeLbZp2AXj EqVzSI2ZrUBPrkfHXZPKVSvNQGakVix8miWScNoQcDuPxh1goH0/Zz0MrVTdnsPO9ysDrZ0gxOt 5nitufhpqFaSeCwX5w/+pseaNK81We5R2hPcNuLO/Luy1BHB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There is no module namespace "SND_SOC_SOF_INTEL_HIFI_EP_IPC", so don't
import it. Historically there was such a namespace, but it was dropped
in commit 97e22cbd0dc3 ("ASoC: SOF: Make Intel IPC stream ops generic").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/soc/sof/intel/bdw.c     | 1 -
 sound/soc/sof/intel/byt.c     | 1 -
 sound/soc/sof/intel/pci-tng.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index e1f0e38c2407..79374dcde89f 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -694,6 +694,5 @@ module_platform_driver(snd_sof_acpi_intel_bdw_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Broadwell platforms");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
 MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
 MODULE_IMPORT_NS("SND_SOC_SOF_ACPI_DEV");
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index cae7dc0036c6..900cc10a3b7f 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -475,7 +475,6 @@ module_platform_driver(snd_sof_acpi_intel_byt_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Baytrail/Cherrytrail");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
 MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
 MODULE_IMPORT_NS("SND_SOC_SOF_ACPI_DEV");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index b585ac4a85c2..3eb7400942dd 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -245,7 +245,6 @@ module_pci_driver(snd_sof_pci_intel_tng_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Tangier platforms");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
 MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
 MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_ATOM_HIFI_EP");

base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.47.1

