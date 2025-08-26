Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E053093DB
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201056; cv=none; b=i5QIzwJBdiZejXQiD+ZpYf4wP9AMyzu2mzJVIX2VYp42V7WHRgbfnK4da0srRuYp2WnjTRUMQ4LDiJmc8CDPRB0SQ5N1HGCE5Ps3UW775GlZv7LtH0us4IKTXKIw1wZDu/3MvAF4aYMCM2WyNCwRTn7NoMW0CLRO7jAP3362bRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201056; c=relaxed/simple;
	bh=rOnwfMAg3INdElV3aRVOTwiBkwEa8av1tj4H4Fl0SEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OlO8XAFOrR6CCrABncspJWaWde03N4PQ7vSwXQFF9tnAqwd3SYFKUoSpPZd0Kpkv4vjrHfqTC25jQQyUq6ir2K58zdv0l81tyV0N8tb2z3IC3pN8MLXg4p/AI+QjAu5SkfhkxJ61pnUnrxLjYAi0MieTSE65t6TVZodXLeGxu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b=VjS/30TQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="VjS/30TQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266cdf64so3968469a91.0
        for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1756201055; x=1756805855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mcb5bkMtc2XORNKLuQuVAdE/1TJbciXhfUQDl6LaYc=;
        b=VjS/30TQaZBXx2j6q4eLoGo1RC0zSL25RQunMDDTYrLdCjS3CUJbI5EtSYVWmoUrM6
         CbG2+K7iQ86phiZMUI3VFK2WgFtN6AXELpYM+sK5kAcL9i5vl3I5adm+aFf1uZdTI24c
         ikrdLRB+hzg69kIA04jbXg8LIrS4wYJWR1CUNp7w40o2EVDF17hG7DoS9wOultzhvgpH
         UIyrDcPeS5Kn0kL6W0Yrr1/72UOi1gfoK4owFcWZCSbNMw70IngPnSPMwZNWxkFwVt2C
         tHWRjdzGXmsjuyg5FfSFVD5r6EB61CNTy4FOwtorv7eg0l2Tfp8k2HkjZh3wtFeg5JWK
         DPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201055; x=1756805855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mcb5bkMtc2XORNKLuQuVAdE/1TJbciXhfUQDl6LaYc=;
        b=TBb9m46XtyaLaCHTcjAg4mKVkFgU6vreCfxn1yXI/ou2579InkrwCnZ/AcQ/ILiZvy
         y+PkTl+GpFcV9Mqi41aRCu9vbnyiMHJXhhvYECFjgNr2TTOln7xDhbFf8Dfy1rAs6yTQ
         cL7s2kpKuPRNaD/3Z8w6YCKO2shPVoVVAYPaaaCaVt6GTLQh9z+bhXLNhQubIEmYdOhs
         ZYOMFdQA1S1bL3uRL1HPSUSuh5CPKcatSX4lpR2khsGvf6aMlTus7E3Fu6aEY3LbSf0y
         Cdi/mYHfUtlGBOdGXoJYAWz9wGUEw2tKPHxWkLXwuAW+KEntfjU9zY3mVYAfPidkQW9u
         g8yA==
X-Gm-Message-State: AOJu0Yz4y2vdvyP793P2MP4xPmqR8VJ1qdjVn/PDdD6iNoAPrAQ/fKvM
	7+ZLdx87YCipOP9snJQXTtx7N1UQ9Npkzh3Gp/3MQgTp71sYrQ6S0KymvuxfBBMqiEo=
X-Gm-Gg: ASbGncttd6mjbMTOIIO2A7F5HzjSjXSoMV5LpHSpdptPMpXy4V3lnL903oQ+4tQOeEB
	wtXTdf+jhmLLcyMj1hEcIVa6ptz/fRB2kF7wdWVO8zx1smqfTe3vUBJpldy2eOHYlfnkl7EY+i/
	b+b1+aG0SZpXKeeepXy7iORChGxcMERZGsl5hNHPHNeJTvzLdBYn1rlFaunwqrayMcC8S36Y73l
	BOcmPi7gSRtiAuxoqUOi2ePflU6+neFbmeALu0H+31mHfIwdrCp5j/79sBC1cKK1yyiE1YnXIrS
	Noft2QWJFJA1i34NG5lZA6oaxFctFTUyRGLJJ9Y7BGigSEkZh3MDsHMEVgPuVcLvj6b39sVlRn1
	znCaXdbiKAzDCMTA8uVIwJLhZV8u7UK2oGfBe+Zx5El4EvHYVF3JskP5ujUEf21xx3YFqwTZP9h
	IglA5IAraMTORlsbi/5V3Urlf1QKIU+biBgEbEypn0
X-Google-Smtp-Source: AGHT+IErMpCIz6xZ5L4Dai10sGE88F9Po4L0thCMVQfmK480d2PRNhldDxgRTc81OY9BE4TV9ujwsw==
X-Received: by 2002:a17:90b:384c:b0:311:ea13:2e63 with SMTP id 98e67ed59e1d1-32515ef86fdmr19131536a91.13.1756201054504;
        Tue, 26 Aug 2025 02:37:34 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32549fe6c21sm9530925a91.5.2025.08.26.02.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:37:34 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 17:37:25 +0800
Message-Id: <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
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
Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")

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

