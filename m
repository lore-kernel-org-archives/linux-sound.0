Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE842D2494
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722303; cv=none; b=gmXsnitTcf6avQ/CJnoRblQ2F1tW9MLqfn0DQXlvJSq+DNHKhND5+bzwi0jUrgK0DuUe7LynQ/61MIGEc75z9VOcPI+s09d9LT1kX0CRN5l97A/1EoogiBOcFLo4Q1YyLExWNloDASh5uGsJPr0XZReZlv38YiAaBIUpgx6ypdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722303; c=relaxed/simple;
	bh=ecmgWyt/r3NhyI7KAZNK27WV0ALYJNBfyBVF8Ko8M+s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z9+Uqgc8REsDpAuzFqhRrdvDcwWSi7O80XFlpqJbuftUKO9Od+Gfl5h7LUuve/z+pOLoz1lDFGHTRwHLE5KExuD4vSAXQXgpCeVqC1ha3vic7etcoT2H5jd2nQRX2eR+v5yuugA4UmbHPVVqyQnDGE0upUhmSR+e3E+NyPLjgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDQCTVCm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDQCTVCm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so3105788b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761722301; x=1762327101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKR2JIltJZH3d6vVv5ttIX5RgDXhzdjyF6WPgCyyT+Q=;
        b=MDQCTVCmZeJ+qqaZ3RDqhw0rJGyAPPzPOsQXY+GTWdKptbSIQnSNaAcqvagcs91cA5
         S3kqfgIyz9hgulz0BoDJ2R6wYWkaXzQNam7P2v4EPqxmeNs0C/NDMP419yrNM3uiX3Oj
         v2A9KC+iPw7lbUwh9ZP40im5OTS9/GLjSz6WDsVJOSSIVFuvD2e4u6bR5Ukf0MeAuhgF
         n7Ta0Hoj4SVLN9KPPUKPb9asuHUmdfosWCzpQ1p0CmHaaGgPLQA3LNHUyiiNe/9o1KJH
         qdtodEORxdJGsge8V0zEdf2ug+1D+OjI6z1IPCu7m8WeJ8XquQ67a0AvP9VZHYJh3Bcz
         kLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722301; x=1762327101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKR2JIltJZH3d6vVv5ttIX5RgDXhzdjyF6WPgCyyT+Q=;
        b=wrrJ9ZNU3B/5yrBHdGLR/Ud9OYJ4kH1FSrjvbOId6I1yYPD8w9sMcExY9GFqAIeAjH
         NlFQq+55xBTgyuyctUwI0cAKSWWuNqq/VUneSVDWxdBiuyTbi6Ybqdm1O6ZO2C7A9Svy
         O/BhSAdVx+bIS+apj2P+1601SzeC1OOkqK2Txc8oZ7TAV0/Yw9/KQOMcxqoTa2B9vsAC
         VJVRRGKxNahLW3Hb/HMRp9iMhm4xCaQZudIJDBHmgTXTkWExmwK+lsXUd/3Qwn/tJKBn
         HRAx7bwtCI7PelZWiNZM2JQF7xle05aDUNH4ohTBmQ62/bVhJmJq5yRiVm8k7fFQYiir
         a5dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvVIDlZX1Az18zMlYoWUMbEUBI3YMY5VGO5hQbqHXuA2jRw+uybOcCpeJN3SaLXO6mXvnw0HnQjjm33A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoT5/XO6rg4O11r1R+iCLp4gmfp/Hvw3EQj4a86b4YgQV9TB+A
	3NeWfro9D29e1qR1/4Ro0Z4MoztgQ44+kUSXbdBdPnGFJ6pWJTHw4VeD
X-Gm-Gg: ASbGncsCtDFWtaYDh2Yxgucw70WH8HFgl2IqheYul2ajYE/k08RJcTNCMp6aJLsQVZs
	yW3c/M1hH18n2lgM7+zBTje9ZdB5jvI1jnqFjdcoogqLGhH7rQVWySnkh/hUrwRbg8og2meynXf
	PbHwg9X5cMMmCg39btlmvWCr0W5UUe1J/PRSbq4MObYsmH1PkQgCoeseSdR8+3y9jHed0LHR1Mk
	Pm/W8L8S1CwbrDVhme9rX0hMpr0F17d3USjlKj0NhNZzGISsEokZ3LY/cZW7k7U9OI2I21AbNNo
	JuSgD4IGB4dX3DloGPUykh68ex+dByl8LhZQXFt328uc6TU+C5jgeCVbXuO8xtwsqaSY6GsbccB
	bdHJ1AvydRDeIwa4gtIr2ICfYhPAWtDFc1zhqXBAOhJgc4bz2BlQrKhB3ap33xEXJwNPB3LoRn5
	m4oBwFK6NDlBkTqwHAWquXXQ==
X-Google-Smtp-Source: AGHT+IGsSohj8ZyfRUklbkOshcfGyTov32rF3rhJPbt86LKk5fmrvTuOuT8071qzdtGvIsEZK/0xXw==
X-Received: by 2002:a05:6a20:3ca6:b0:342:44f3:d1bc with SMTP id adf61e73a8af0-34653146b2amr2346432637.35.1761722301330;
        Wed, 29 Oct 2025 00:18:21 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41407a0fasm13910908b3a.54.2025.10.29.00.18.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 00:18:20 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuming Fan <shumingf@realtek.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: sdw_utils: fix device reference leak in is_sdca_endpoint_present()
Date: Wed, 29 Oct 2025 15:17:58 +0800
Message-Id: <20251029071804.8425-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus_find_device_by_name() function returns a device pointer with an
incremented reference count, but the original code was missing put_device()
calls in some return paths, leading to reference count leaks.

Fix this by ensuring put_device() is called before function exit after
  bus_find_device_by_name() succeeds

This follows the same pattern used elsewhere in the kernel where
bus_find_device_by_name() is properly paired with put_device().

Found via static analysis and code review.

Fixes: 4f8ef33dd44a ("ASoC: soc_sdw_utils: skip the endpoint that doesn't present")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 270c66b90228..ea594f84f11a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1278,7 +1278,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 	struct sdw_slave *slave;
 	struct device *sdw_dev;
 	const char *sdw_codec_name;
-	int i;
+	int ret, i;
 
 	dlc = kzalloc(sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
@@ -1308,13 +1308,16 @@ static int is_sdca_endpoint_present(struct device *dev,
 	}
 
 	slave = dev_to_sdw_dev(sdw_dev);
-	if (!slave)
-		return -EINVAL;
+	if (!slave) {
+		ret = -EINVAL;
+		goto put_device;
+	}
 
 	/* Make sure BIOS provides SDCA properties */
 	if (!slave->sdca_data.interface_revision) {
 		dev_warn(&slave->dev, "SDCA properties not found in the BIOS\n");
-		return 1;
+		ret = 1;
+		goto put_device;
 	}
 
 	for (i = 0; i < slave->sdca_data.num_functions; i++) {
@@ -1323,7 +1326,8 @@ static int is_sdca_endpoint_present(struct device *dev,
 		if (dai_type == dai_info->dai_type) {
 			dev_dbg(&slave->dev, "DAI type %d sdca function %s found\n",
 				dai_type, slave->sdca_data.function[i].name);
-			return 1;
+			ret = 1;
+			goto put_device;
 		}
 	}
 
@@ -1331,7 +1335,11 @@ static int is_sdca_endpoint_present(struct device *dev,
 		"SDCA device function for DAI type %d not supported, skip endpoint\n",
 		dai_info->dai_type);
 
-	return 0;
+	ret = 0;
+
+put_device:
+	put_device(sdw_dev);
+	return ret;
 }
 
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
-- 
2.39.5 (Apple Git-154)

