Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3934399DC
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976341; cv=none; b=k3bAcdK7pYA8S1jwsZpgl1WxIW0zkvN/AA+CF4zjyWMhR0rmQtt96JGihfF3dHmKX5/FHf0mSrzsoC+qPIH8MHz0BYgNrzLzLGchAWlvjRwxM5vMzvSG1qIkHCIi6LhCR8g7kmtHgqkpjjY9qDMuxN2s0R1PUgk8VGXNzMOcZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976341; c=relaxed/simple;
	bh=1oGHKBzHrxoX8CDM/z524FTQ57Egw9xruprsovBKdbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3SqZgdB80yRaYGSFbS8l0Ksxtlmszrfo+LveLWQImhNtCFIYn+gOjg+6VJbd8o1zj1uXLCHNv/SMOi60GJ//LJ/dUtMfhLe4koBfR5BUKnRDsv8V9TT4I9Ex4YpwGhqMH9q44iyFBUuzkPOYUFHcqTrPwjuLywqaXJFiM+6MtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRy+Vz3y; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRy+Vz3y"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc52bd91929so1963640a12.2
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 00:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976338; x=1790581138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V1aVBw9zdrM4El40DQjPRHAcTE50i+bnMPj3LzqLGDw=;
        b=WRy+Vz3y5ozcfYa7Mv5blem/dBCCjHCyRcAtjn2OdhtCr0Yefuz8oR44C63e1N/JMQ
         FrkGY4iBZsXBnal9JeS7exsefo7MonEDFjxlTRD0/7P279F2Rbb41fTbb1/78UrV0dYL
         EVI6JUf1qgtHxTm3jQMHvtiLA06aUcQNV7PomtL2dDwDPLacwlYlFAVZHmqK10bvlpOs
         c4y0xCI6oT6MrKNV5NT/0k0snuGQRN5eBWqP+iJLQaSyptqQR4QQjPQYVOg7Wf86P9CW
         Eem4xjzEjihnBezO0sEMLP7Z+KbnuoMYILwj3h6J8AY/lcbxkrzCbKPTwApd4YHyQ62c
         xiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976338; x=1790581138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V1aVBw9zdrM4El40DQjPRHAcTE50i+bnMPj3LzqLGDw=;
        b=XY2bwUyNQn0uY1mWBJ3xXcCy6emoCJYYbrXw4MG79Qi2C5U9g6b9IFIF4QCPApeJNz
         zdx4kGSB0TjJ3iv1R+D4D6p4kXeHXF3dhbNLFSRZqUHgkgghc9ng42CbKRdxkkJhcGlA
         8x0tX2gp7v3y8Sftu/FPB4b1oyCUm3u65GD/oVNvsfg5j3HEqf3P1TAWlou81+J6rG88
         L9l/kI5eJ9Hze7KOfkHrr2EaO9pyCtHInnr6f+20XNybw6Li5GirDgc0YLbLt59mzkNH
         AJH+4+CpyLxO4pbwknpgzekQss/FmvP8Bz4GlwBR8pbwVJUUrCXsycug+1S9C7kkL22L
         QNvA==
X-Forwarded-Encrypted: i=1; AKwUvBwantiUu/m75qMNl1MlTi5k9mZK9z8gGr3aqJaXEJvPLlECL0rnVu8TX3cYY81PDfvNDQAR1cRKYZW1iA==@vger.kernel.org
X-Gm-Message-State: AFuF++kVoAfXddwtSLYoOa27BB6UC03mWL6DaekuNcbq7aH80Krojqey
	YS48nHzA85Ef/BZj+WX1Por4xc7gwOBeuqQnn5mKMedRg+yEn8ssu4jD
X-Gm-Gg: AYBFou37Kg873nDZsXVDzowNQAnAm0y9G+DlXwot60TRfIBeE+MJnAwi2DJqF1PJlWP
	RKksynWDcNu4foX1iYB91jCZ/haaUNIR0wEKwpQ7TmPTAOZvAwA/EeqWONnMYEsQ7N8EAi0UopQ
	sZidw7JM11sfA7k44T0TxOw0NGS6YIuv2aUaAJ0I6gvjSLlTcTqmVpSN7T4JdQEKXGrhJ7RXvCN
	0pmWVk1Qi7GuH2EG6ad3FhZIMaUYPjv8aNTbLfD0mQtLh3EOwmaB8VDtkZEem8rO3KnNaKtAII7
	60itRVwUjkzxpn8XOQkDq6fbgF9AUD5+y+eRACcvr2C/XJzkuP+Vxjq89DdYX3ZWNBDYQCgbAPB
	D/mrlt+KYE6mrT3JaM/t3TdaOoaJ35bp6r1gWSkuXDKPVSwusWT8/TuTx9G5kd/eRopG/KFjtOf
	36FyQS0zSUEBxknKNU3c3TbnAtyfatwZqIkWWRY63aSBq79+j6oFDdWw==
X-Received: by 2002:a05:6a21:7481:b0:3dd:a196:69dc with SMTP id adf61e73a8af0-3dda19677c2mr9204200637.55.1789976337848;
        Mon, 21 Sep 2026 00:38:57 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae71fe3sm2981178a12.8.2026.09.21.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:38:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
Date: Mon, 21 Sep 2026 15:38:47 +0800
Message-ID: <20260921073847.63505-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sst_acpi_probe() registers platform devices for the SST platform and
machine drivers using platform_device_register_data(), but does not
unregister them when later probe steps fail.

If machine device registration fails, the already registered SST platform
device is left registered. The same leak happens when
sst_platform_get_resources() or sst_context_init() fails after both
platform devices have been successfully registered.

A registered platform device owns resources allocated by the platform
device core and must be released with platform_device_unregister() so
that the device reference is dropped and platform_device_release() can
free the backing platform_object.

Unregister the created platform devices on all failure paths to restore
the missing cleanup.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: caf94ed8629a ("ASoC: Intel: bytcr_rt5640: fixup DAI codec_name with HID")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/intel/atom/sst/sst_acpi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 73624e1b138a..a1f16083bd3d 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -352,7 +352,8 @@ static int sst_acpi_probe(struct platform_device *pdev)
 	if (IS_ERR(mdev)) {
 		dev_err(dev, "Failed to create machine device: %s\n",
 			mach->drv_name);
-		return PTR_ERR(mdev);
+		ret = PTR_ERR(mdev);
+		goto err_unregister_plat_dev;
 	}
 
 	/* Fill sst platform data */
@@ -361,15 +362,21 @@ static int sst_acpi_probe(struct platform_device *pdev)
 
 	ret = sst_platform_get_resources(ctx);
 	if (ret)
-		return ret;
+		goto err_unregister_mdev;
 
 	ret = sst_context_init(ctx);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_mdev;
 
 	sst_configure_runtime_pm(ctx);
 	platform_set_drvdata(pdev, ctx);
 	return ret;
+
+err_unregister_mdev:
+	platform_device_unregister(mdev);
+err_unregister_plat_dev:
+	platform_device_unregister(plat_dev);
+	return ret;
 }
 
 /**
-- 
2.43.0

