Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2D25BF14
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078935; cv=none; b=ucwIyWqaWAxSBSqM2ifO2OiDR5HDzLSbjX1m8wv8NHA4BddLvrtJpn++aVxCJDuBqjjWX3qIAEbWLI5q8oVvkm9fh1c9I7XLvqUvzSrO84pC31t1ma7DyJ+W4ro+WvL3i6TFHmbvn6SX+ovTzFR/5QGDjeWfE5LlV4xojefmv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078935; c=relaxed/simple;
	bh=ZpJV2g4pswmR5fsLqMMJdtUaMVZFpU0lNRhxLnBhCuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSJGTFvv6YNDpLDkXPzdgIbysskbSaoUkd/lQmxn+ThnojLu/LCdlaQhS+FyG3LNBhJ8FvpqqNmGK49SZSZGsDAKvFvd/6khLodto8Wu2Vy5BnGtovPoa1L8k1g7i0hNw/T8UjLD8tQlWCniu/Esu9MUltNfvNrpwudM5byAdLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueksEoO1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueksEoO1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b31507ed8so4693341f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078932; x=1764683732; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qj5l2CM22fDA1fw+7YXGuZnpUGxoc2eRov5FmLwIscE=;
        b=ueksEoO19hUTXGB4rL8xhRm6EbWa4xy0G7duVxt2CWVHeTc6Cu2ZFdQ1umK3fAcnCY
         v0CaKBjLoH2wTJXlSzieVmKG3XGXPVEqEQWj8R5mTlL24hikbcPhkxrl+Ozd7pICvP9B
         439wv0g3vfM5xMnm/xVhMTNyamayipgrRQnH/cTgpndUHBsHRfY1NDpwxH9gdQnDpcen
         r9NODBDkqDMsZbAoU/eib0ymbgJRSaoOvOaowoW+mNQ+h9ap1NOQ5AbqF/VIJQqthxw3
         mynMdmRHLRXYii+pFn6ifQmce+5nt48Q8fFt/jsmivMKv1N1t7ixzdZ09muVpQbsQIxn
         cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078932; x=1764683732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj5l2CM22fDA1fw+7YXGuZnpUGxoc2eRov5FmLwIscE=;
        b=YXFy+OYoG74K8MKA6pSOCH9JDv+6sY0pQv0XjPQ6BjfjS49WvqDrKMdNtCh4peEMIh
         ynUuNSPQP9oGwLdaXNwN9saiSk6GKWvi7PSKkAzubuIgNUs+68oaikJ4mhb4SjLgeh6k
         ARS9eO5qBc6YTjo7DbXCdtaR7Cbq+qud9WX5HSbEFkc4HBK2fSzd7BCRasIFbQMdhGbm
         VT4ICgoiGmpTdeFVV30UE8P7/IAX/6LVGIVh6GAbdOPuEHw4Adie+kgQ0D9qJXpiKso8
         xUulQoan1PUaHqoL/t9louWdFeHic8YSD8S/DgAewX14uB6+XotyOe5lO35/SjA47elL
         T03Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyx1T999N2qrSi7GUnW406thzVnKjMexyRZ5eIYX/VHYolq17eHBGtz4vpdkCdtEkcQk9GIwP2qI+lGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQE0vbwpjGsuh0faq0ywBJb/+OZ3MOxYAafNQi3UPHkpkOGBGp
	sechkz5pagV06OOPmixrqR37kLjx4Zmsw2UEi23D0LdNxMIwINFHm3R/ekRXDHqwdAg=
X-Gm-Gg: ASbGnctyt4njfP0sDn74FVpOHPwJxEZzW9pHiK6wmLnfdD8OQ+VieCRAOKFyAMGjtop
	fYtMdHLbipErsgoRDUT2/sC/LFawKdDAfo3QgkefPPsTSD0alSFshjgIBTiIAQ4aYvKuDwRrnkT
	t1Chyw2hJwEWvEj4cZmJojwOZic+ybet1nBZOWcrEWjPKRO3k+X8x7nxBTqKIrycXkNmcEgmd5g
	H0VxjkDwQUBjqyZbuX465rJGwdnRvD4NUXi38qaTfuieoT99LeXr6bdV0t1rQXLw2QsBIzfuewh
	jKSro/htjdpc3jBVWg5QLfoezuvqwPQFVO7j6zlNDS/sC00IMLBwXUrN8oBx4PUpWpLYspLQbsL
	jLvS5V46O67fKoxuHcTCAGwc9F4JcemYKo7i6Bh4lxRoMZ9F5zS1xDmJCPUc8utPQeoNfM8jtx6
	rmN7JjoMdqtxK8p+RV
X-Google-Smtp-Source: AGHT+IEoviEwOKyAo/e7XcJ+LgAsfut7GBUDSalEwMV+33vddcxo7V7q+O0kWwVd3H/WFPuLBKzd1Q==
X-Received: by 2002:a05:6000:1789:b0:428:52c7:feae with SMTP id ffacd0b85a97d-42e0f3492bdmr2780337f8f.32.1764078932198;
        Tue, 25 Nov 2025 05:55:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fd9b45sm34841588f8f.43.2025.11.25.05.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:55:31 -0800 (PST)
Date: Tue, 25 Nov 2025 16:55:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: SDCA: Fix NULL vs IS_ERR() bug in
 sdca_dev_register_functions()
Message-ID: <aSW1UOgMCiQIaZG8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sdca_dev_register() function never returns NULL, it returns error
pointers on error.  Fix the error checking to match.

Fixes: 4496d1c65bad ("ASoC: SDCA: add function devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sdca/sdca_function_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
index 91c49d7389db..c6cc880a150e 100644
--- a/sound/soc/sdca/sdca_function_device.c
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -96,8 +96,8 @@ int sdca_dev_register_functions(struct sdw_slave *slave)
 
 		func_dev = sdca_dev_register(&slave->dev,
 					     &sdca_data->function[i]);
-		if (!func_dev)
-			return -ENODEV;
+		if (IS_ERR(func_dev))
+			return PTR_ERR(func_dev);
 
 		sdca_data->function[i].func_dev = func_dev;
 	}
-- 
2.51.0

