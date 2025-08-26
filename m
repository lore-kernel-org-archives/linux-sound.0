Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A22FAC05
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199165; cv=none; b=RQMQ3XG1tDsUVZsIoKl3vI1nexmgr5qP+BpUf2j/hNnvCmKm+xbnQtoVwewnluEL3dgNNyMM+bCR9z8J3iQrtT0mCt8xrN9yBvjkJ0uiN2AbJquPUfKHDUf5a+mgNOCk+hFVu7QNGegpMOye3KDS+Tpfj0IaA/PXiLZ11+XvHoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199165; c=relaxed/simple;
	bh=YgtaFHi/bxrhz17NVyh3pLs5z1ygFjpcVAiiYPcL668=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T4e5v9PnrkWBQGXK018edFzQ18f4sDkYk2UhOWAXZ2Nd3ra7hjFCUhPIdFlOTSFWSvrw3TfEhzGTdPv0HSE/HbyJ75Fbj8Rochm2vhX3RO3pdjhv9wDDjB4tuQV4yuRWaMmfSUcHkXMATSsFeGrnF6VYoD9qJe1VI5EhN3YkYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b=bZf7RCtP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="bZf7RCtP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2e89e89fso7111448b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1756199161; x=1756803961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZe1UjdRbGOPov6yiPQ0LhX88zH29A9ZZWF+7zEKVVo=;
        b=bZf7RCtPK9OLNLjQXaV/fGMB/bGS94pLw55cMqc6fi2YcOX9eiP9u4UUxRiR5pvkMQ
         9sqV82U2EwfsyBlasP05Px0ptFn/xvp0QkMBVK7wBX9yY4BCUJ1mBf28hDqm8LXmBpHs
         VRQnZQ9ajdJci49Mg943F7WNHNteGdCOHL5P3c16fI4uZKtT0PppBVE6S+55aDASFAgx
         76Dsblgu7Mf/wcof0gwfDgmw8I2rqsYJ5ai/69o8sUNje7giUYzm7EZwe3n9s3wdOjKZ
         YNeiq3BZqohZqgLCnwJU9UyZiKSk3mnx+J2sysau5X25i05enp6kZdB2lKkEhaWQzoXA
         DQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199161; x=1756803961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZe1UjdRbGOPov6yiPQ0LhX88zH29A9ZZWF+7zEKVVo=;
        b=PEH3W0/PTLwhXPRi6CFW/TZ7OAGu5sN1Yb8cyY+1j9Sl7BzKSHuVBMNIB9oxabwJz3
         IGWfgfdm1UsBS5CeJXcr9UPZEi335P06q82lEnJRPor4iP9kkosFUT5BJqawx9dApdy3
         +qTGzjBOUBc++Vg37zcCS1UyBcqJgX0TUD1Dmn8XoHEr41rQiPrM7jIOTUG8iESr5Qhb
         Y+NjI6IVYcAp9zNRlST+FnS8jpeSZYUy1VveerbxPupco/RnNtMqeMClrLFiZehhy4Y0
         xqKtBGmOMDM5y9u5sK7YJJfmYKxK15rc8hZa9gug+HNSOyxWdyyiaAg0mpOL0J8AajVr
         xnNA==
X-Gm-Message-State: AOJu0Yway+6wXZvdyH7oSSm/FcP8b+kCtA4u42Hfob/y6losT5KU99QX
	JSeDoYYElmBT1JOxedreN4JcxaaoFIPbpavNiTKJcr+g1NZsKKJaE2C1eJb7EryEYLc=
X-Gm-Gg: ASbGncuICkEyEhk4t1KCpEv0ncp8MdW0HGg9KL8z4RiHK1YqxO5H+l1K8ZEXLOid3KQ
	/6OfHI8v0jBJnKyQMztrgbDx7nOS1HVDeMUjE+S1Gho/M70IZo1GlYIJhl419xeJOwYK2daEM9x
	hj9BhOggFoAT+YFJmZNts7llylR0DLPx7NldDRN+1p+BByHh81fZ4spSZrgzZq3M3VNc54qF+z9
	rvD2MHb7apbgj6OZyNcZ+avqBhaXbLWEl3KaavKJTzCX8hqpf+Ti1PDMVFMV9nkKcP8AzfhtalA
	LWt6GHNnJotB6RFGc7KddnNik1UKZfptK5NlXDqxv++n8lMAIDl4ECRe4OhPn/EllsJckvH3vU7
	757jk0Hu/bNxXdA2zBcgd1gNSZQLTx+RMHVg6VQJQhODUVuV1Tf0Cjll/IPHl8Q2rocYHgkS4Qw
	sKRZZury4WyOITdqBPIxJw85Msb2KM263RZzRsNI7JUoD1tYCQrhA=
X-Google-Smtp-Source: AGHT+IFF3yN7+WJotq830CgHmPvmXMKEJdmaqjUoUbu/8vEGyPahcd8Cv+OX2SGGHwyFylNgl8pxFQ==
X-Received: by 2002:a05:6a21:9999:b0:23d:ac50:333e with SMTP id adf61e73a8af0-24340e6bd14mr22095061637.43.1756199160864;
        Tue, 26 Aug 2025 02:06:00 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm9796053b3a.79.2025.08.26.02.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:06:00 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mac Chiang <mac.chiang@intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v1] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 17:05:30 +0800
Message-Id: <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing op in the device description to avoid issues with jack
detection.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/sof/intel/ptl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index 1bc1f54c470d..4633cd01e7dd 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -143,6 +143,7 @@ const struct sof_intel_dsp_desc wcl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
-- 
2.25.1

