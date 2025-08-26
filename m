Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0C221FDE
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222849; cv=none; b=AOd8IyDA3teehbtHOhMqoI3EpBLSZMko2qTSsnIoErvPmQeIZfMIsxYM5AEA30PRA7QtRFKXx6QWryBq5hGwzgM7q4LXnbJ15pj3WUin3QG5GDbN/llNA6xhbOc/sPqZ6ND5XCVwF9vVM/gKpf1ftttljkbYTODVgKUWFxAcP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222849; c=relaxed/simple;
	bh=e1IxRhJNfBVPgixPhdtFHmYVX1m5TSkpTuyErZRKZio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IGzPjDyqeoJcwownuzXQQCHryonx8VhaJwo321vPARG4KWPlp4PLJD4AWl2cW7i1kdqNE2KIN1OrHPFoqyu3DZjOvt9wOVf6Fo3b19gflzi4cOcoV6cun62FQinoIe63ii3HpfmyEL8Ipl34q6LYYMMq7lcSiENnVtWNQtawmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b=Ow3AQbo9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="Ow3AQbo9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24687a76debso168745ad.0
        for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1756222847; x=1756827647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6f+oL5erjgnIG54ke5F/FkltoGarOf5946uCvH5YNQ=;
        b=Ow3AQbo9wjVCDVcaaU4gbvdmlY+h3ZK2H5iRNjdPArRjzRqrPJMih3P1W0C0VsfljD
         CPhsTxYJJO7RkW6BrZZYvCoVpcoyeaBSsQfHivSxKGZXU6c8Awn1JhQ8N5uSwCXsnH+F
         /F4Z6ozOl6CN24IIT+5Kg0roAg/i4fQwOneO6K7cnG+3DragP4lFrIWjTLJuCQ4KEFiC
         1L/Czf6tt/1bbwKrwOiLZpUdXWSvasgDXqks6luZCm0NObnG5jQaBsP2PUadesMIW1h7
         LA6i9E7khFldrKjrbPedd7lV1xNYoMR+2+4Km7dHG13Tin5q1HxJym/z0nZ+doBhcMhA
         yO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222847; x=1756827647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6f+oL5erjgnIG54ke5F/FkltoGarOf5946uCvH5YNQ=;
        b=USxunmwqN5O8bp9BVPWKnCXf4jZi5BOltKHiU4f73yQoml6uuXuv7ir4Vqw4Mhxphq
         y3ygVik9+S/hmB62LIW7OYAt7t9TxGAIDL0I87aHGLE502AZx+IGX+GWkgSuf5L8QYte
         si8chp3Vp1nNEC5qPbRHu8Ne/sYSGgrkm5+2sGav5PcW9dfsDK57Rum3WNLrGLa0JKFp
         fcuGW6TpcAGIEryA/I7WD4WSnBug93IfaE+pMtiyJsbeBoEGuXL4X8f4HKWzEKRnzAr4
         3oXz77cEq4n7HQAR/I2imLRSW6gq5V2LF7G4fp8fC4TwYTZcJVJsYKa3sfP4q7omaGCz
         Ckyg==
X-Gm-Message-State: AOJu0YyRmvFTdhBv4BQF1bbeoIvOFzAl9WtcCSczY6hE1Jqks3jhqIat
	BrTY9pCMTH3JSt+VXMpzr+KF+O6Lpda63ofqAa9Q0I7/A2lquWuwh+Ym/A6CEo8rrV8=
X-Gm-Gg: ASbGncur/yHw8Y7xYlLHWKZFLXG5aQ1NQ7rKY62qScndFJVKaKpS0ZRoZ4rPj/8mnxc
	ZHj1rPxa0GoaIk1qJMtv3kpSloFOe+WRUwXZ75je51eLLgWUZ4GFbhs3yon0d3ovEHrh6t2ZrBW
	yiU5OBDD0HZniHgQld3q3ILv1Jd5hAL9StmhWWEBoKm2JQCALR578P/LZrpxjP1CtbOhQLC18UI
	MfhXLVsmFK9EygrNh20HnqocTQjbAqu31JPMiLgElr94uSbbs+FngFj1s4DwilniSnDB8q9pxwU
	VC9AgXLUME/eqQnhVFUu4YqJfcasqlbMQQIcMW58NZ6M4YgFmIgvdRNOw65BBkOIwjwVT3viHSu
	Bn3S8/LzA6lPc7MxeEe+13GFttzUXtGq48jiU0Xh5Tn5Z0YaqnXEfc8NeifjoFn0QJBWJUrO5BF
	yFldenEboy3LhO/oNrJJeaQvvNqEQ/tzr8aldTO/n3
X-Google-Smtp-Source: AGHT+IFhBVaZYGu9IKPFKe9pJlE3st+GV2WgnybrgrUPlI9dqOaccQqXFsDRq+o5QdSDJZXqXkvTSA==
X-Received: by 2002:a17:902:db01:b0:231:9817:6ec1 with SMTP id d9443c01a7336-248753a26eemr25285385ad.17.1756222846647;
        Tue, 26 Aug 2025 08:40:46 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246a4e7f517sm75905195ad.117.2025.08.26.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 08:40:46 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 23:40:40 +0800
Message-Id: <20250826154040.2723998-1-ajye_huang@compal.corp-partner.google.com>
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
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
v3: Add Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

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

