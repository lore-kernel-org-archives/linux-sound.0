Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA61A318144
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756472262; cv=none; b=Lm+HaAdRJvCljS8y2NTcVN3KP2EOqvDlUxVMnLdKpxM5d4+1KpdqUhnXBf6IaaecbgI5qcaTkzOJ8x6pJjg9U5cx0g4hd5NIZZW/5RW8mV7dfShX3DSEOnF6SSft+fvf4qaCMgdBLj55ukJ/+pNBTd5+zvCsVPEczeRil/QVAxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756472262; c=relaxed/simple;
	bh=4DJ5TD3LPs+dlaSYUK9sPSDfziv2OnIO0PiD9AsLDxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQzvpoH1fQoq8D/f7FFyHi+KvDTHIOP6Y1kcwzteaHa1xyBTDzT+ZOl5pC7IY1PeRxtCKXDoJuOzkFbNZ2P01AWcLaZoCbUJCliZPZSTIxmk1P2Kc99gJoVMCkmgAtL6JmHbjahxJAytcNuvbTv1wB8VqdbUneVdrp4tNKqzEK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jxge4PQR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jxge4PQR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so13935315e9.1
        for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756472258; x=1757077058; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpA/ewX5yJEUV+0C4r0oVn+iS4syCSTzFuXWGmDLoYo=;
        b=Jxge4PQRM6ldn+kEndjUQsHwSfNENkYWtpTB761xF6t6jQWewME19cNo2vIXp4tom9
         1yw0gaiyfsW7s9LFCKMXrmFZnZ8l3Av1yqv+m7C6xCD5zSUwxLYDTyhBpJ/nPRTHR+zy
         cqsEewq9GnG6y12gQj1xYdR90v3+ZgYsWnsnAYO8a3Bc/fBbdZpORZBKjr5WfuuJ5swB
         jUGGpnrclPmvYOmgwFmku0IGFzs57LY0klRS/GCsYa5EDSFZtH2VLDGrTj54MuCl+rZp
         MBzQqycPPwm2Q4Q4guhZ1vP/uOtqUaInzCOx7Y7q/9GDvR+IBG2KTO3xVFVLTNc0hCNg
         Vizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472258; x=1757077058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpA/ewX5yJEUV+0C4r0oVn+iS4syCSTzFuXWGmDLoYo=;
        b=m9m+ofZ2nUftl6dMJOMxsHIGnKfIHOkRQs1/d/W9jviC87ObeRge3jCMiF8JlCmZh+
         tWcirn78wFvJn/wHTuTZdMcAJ+J6JFU1B8mkxJAw4fG6XgSZSj7zNUEEplALC6X7h0ZA
         VOukQ8el/xQ50NXbjhcFkc9r30lg4ozTJFMmymoUA42iWOl1h2IRB4w+cwHYX+82CrAo
         DmePHXrYA2z9Wrq2RqMYyTJZxApdXSx/wqd/lRV/ZcCVawrkXdGdGII01rtCPwIImQHk
         h1+tMxRVvordMSfmOVxHK4O+3K6YQ9jSNi2d4DV9b1ja3HLu8Bi5yV1fqQQzOVNxqBDf
         OW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV42vkH55x6Ff+22YgmdGkpd7a0M24n1wPHxS5K82jU+WJwnhReZj0QYSDkWrNtxkZ0R/glHqUmOjRs7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQI/q0uULdnH/s3ClUibSVbfIjcFJSKriLGHZ9VMszvzQZF6Ev
	i8Cz2Y6uv3EnKfvXPnLgJ8R4y2YNe0YERvzKHNCAzzSG0a5sQdKWy6grRdk0JHWx8I8=
X-Gm-Gg: ASbGncvD9aEINvl4ddakxaJ4eIFHAdbf5eNTRUGixq7FJDhwral6hhnU8WHwHs59Ih3
	zb28p81qCjfZZ8vvAKOaPgS63IxdGTcg29Ueu2B9SCT0khtwhKCHl5WNFCojkM2vG5U7Cv4PkOH
	18vnzQsu6aULQ0ZRP5febBSP4ADrCQ6UOpJfM3CqDNOSdshNyS2DfuQopnc/uIMN4MpciLjUXQR
	cwWNd6tR1kiF3nVvQfOPyrPTdT+jAvbHZU36KTbMeMZmurrrU+6liFg79R2Q9aR+j86m9JSy7Vm
	9FdFkkUmMTkVz96JySFbYYI5XTsjDLxCZjSoPTLYfh6IQxT7wjf8zkNpWRsxGbnytfYyX4GZem7
	9G1/p0QmeQ81PZL4S4kQXN3LiBXjFczaaaov/47Ky/o9X3nPj
X-Google-Smtp-Source: AGHT+IEk3X0SmDDJCM0kDCrUQkEzXw5unbHaqvpYBH8N1Kie2B/+aRAtHjZ8wJqalzmQyaEOC0bTTg==
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id 5b1f17b1804b1-45b517cca56mr247842695e9.25.1756472258171;
        Fri, 29 Aug 2025 05:57:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e8ab832sm37195035e9.23.2025.08.29.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:57:37 -0700 (PDT)
Date: Fri, 29 Aug 2025 15:57:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codec: sma1307: Fix memory corruption in
 sma1307_setting_loaded()
Message-ID: <aLGjvjpueVstekXP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sma1307->set.header_size is how many integers are in the header
(there are 8 of them) but instead of allocating space of 8 integers
we allocate 8 bytes.  This leads to memory corruption when we copy data
it on the next line:

        memcpy(sma1307->set.header, data,
               sma1307->set.header_size * sizeof(int));

Also since we're immediately copying over the memory in ->set.header,
there is no need to zero it in the allocator.  Use devm_kmalloc_array()
to allocate the memory instead.

Fixes: 576c57e6b4c1 ("ASoC: sma1307: Add driver for Iron Device SMA1307")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/sma1307.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 6a601e7134ea..b683e676640d 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1737,9 +1737,10 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 	sma1307->set.checksum = data[sma1307->set.header_size - 2];
 	sma1307->set.num_mode = data[sma1307->set.header_size - 1];
 	num_mode = sma1307->set.num_mode;
-	sma1307->set.header = devm_kzalloc(sma1307->dev,
-					   sma1307->set.header_size,
-					   GFP_KERNEL);
+	sma1307->set.header = devm_kmalloc_array(sma1307->dev,
+						 sma1307->set.header_size,
+						 sizeof(int),
+						 GFP_KERNEL);
 	if (!sma1307->set.header) {
 		sma1307->set.status = false;
 		return;
-- 
2.47.2

