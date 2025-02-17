Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE619ABC2
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777584; cv=none; b=ENgk+n7VKGmJ7h1DOlwWUq70cxA7U2UGCoKJd1cfssPrGI8CchJtfFuVLF57SuudOtef/no9YcLKk8x6E7oOr8Jdt4c4Powv3rwUdlzUUWSp0RMr3ig16EUqHUwAv9vuhldA3PHbBH0aGSP8TJp9e4Y7oFRC3hGdKIBQu3/EZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777584; c=relaxed/simple;
	bh=FfWHZuQZXypGn0iKgdsEA81WCv53fdyk91H2fpR73eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxw/cc+lNesgZzn55wre51+CP5HCohQKcMNkUsdR+FR2tseOveOQexrMS7xBUSBE9A5txuUxKJ4WpdlBjc0foSulpCkTskYj3/Lv7MfA/PrczD2jn8N3187e71WBEGsW+ATp44v6zdgk9GZn0h/1yidc1mdGCF58e0LHoAlpePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXMqjGEx; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXMqjGEx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso7360896a12.3
        for <linux-sound@vger.kernel.org>; Sun, 16 Feb 2025 23:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777581; x=1740382381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=hXMqjGExdlV7VkUlUeurStT6I7SP6UnaF+1YEoVfdfqZOyOaCOly3GwJWw4IhiWDNm
         lPxjH8xCMqZ+SMdf0Nla5o8zJjtlU+RBdUANdohgqOLHJSr8q+K5vqNInVijaQa2nWEV
         ssgSnfR+E0q33HmOCGojhZ1l+GAaUbNCW8JYD6JSM329WdI1z6NaFjWhcJNLwFJVdc1E
         yEiAoQZYzBMg2w4v7YofUPNcKb6QmzspCYJpv9PM9twn6y9oaMApZAm0CSiXiJPRvdV7
         LsY3mz+mM6F/F02dfrlT8wwSEh5gZIrifNm0udXeso5raINar4fJMOuf2vKrHB0EToPl
         XtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777581; x=1740382381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=WmxE+kJ4F1qTaUB1XMOW/K/Q32e22EfGHgH3wcZyMfWA6Rn33Uuy8tP9vGy0fJYc+C
         ggIedoMgiCMI7u91hCS46WoSmIJ1ZU99yMjmu7LArjvjY20eGGp7071mYt5yGkxAQlx5
         oekFelTkd+kSEjlsWJ+YRAA7ArYHWtKz7QYlxPODOBSM9HpYajBk1RZX1Sf3MuWFB8aj
         e2WArMHkuv3xrCgncWqlyfoCnQuh2E3Qivq6RN/q2TVO0EiLwTKCm1ex24Wy04q2xO4f
         WRZaWOfRxkXZFPcQUUW6x2X/0EklbeTDE9dZ2VwImUQYoI7PdPSbZtGyAAlbsOMrj0iw
         r3aw==
X-Forwarded-Encrypted: i=1; AJvYcCX+jH4EBf8ZWkDBOUKdK3KhlOJcjLJ04z5cRpkjnFwb65l7VMQNQdrIwZ1lAFfnrZJusJpsRk7VPDREyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXSwZLKw34b6v46yNAH26qift5Oxbn2DoHiVsMKrNcWpYUExv
	34jOE4CCI8CTuvp9Y38m3zEei/MLGDfqM/UTIABLwdVrsIH14ND73d9pMt1aHI0=
X-Gm-Gg: ASbGncskj83b7VCelBG9JPmL+bivGciA/L+PiDmhKt3eNLj99XyF2WmyHGOrmlRROIq
	Fbkfrr9y0Lp9I74NVdY88C17u5rW5N92/XMIsVlatRP4qxYfg1kgniqZ/9lsq78xGR/aIjSuJ8N
	9Kgc4t8XeVyOABXCSkcQyNZu17J2B2y/tURxmjFhH/uiiLTsU1ztGSL+ZIVTIBxSDfSqbo4O9Nb
	QvTP05aS8+zsUVAf/lY20sG+RZgSBNXDfiF47vnG0fwlXmYK5qzfWdWHO0LM4SFGK7uefTbsvk6
	T5vy8EzCUSDOwJ9nrBgW
X-Google-Smtp-Source: AGHT+IH5auVQWVVUALzd7Oc0j1nTT3hXLvhxHDF3eAMDVv+bnSi3aCKfLrXYNuutS90Ras7QTpnZRg==
X-Received: by 2002:a05:6402:2384:b0:5e0:36c0:7b00 with SMTP id 4fb4d7f45d1cf-5e036c07d5fmr7098145a12.31.1739777581089;
        Sun, 16 Feb 2025 23:33:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2867a1sm6812015a12.66.2025.02.16.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:33:00 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: imx: Fix error code in probe()
Message-ID: <b30ffe7f-21fd-45f9-9528-d6d689e04003@stanley.mountain>
References: <cover.1739435600.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1739435600.git.dan.carpenter@linaro.org>

This accidentally returns "common->clk_num" instead of "ret".

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 5a385d140bc7..b8df8bbacad5 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -424,8 +424,7 @@ static int imx_probe(struct snd_sof_dev *sdev)
 
 	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
 	if (ret < 0)
-		return dev_err_probe(sdev->dev, common->clk_num,
-				     "failed to fetch clocks\n");
+		return dev_err_probe(sdev->dev, ret, "failed to fetch clocks\n");
 	common->clk_num = ret;
 
 	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
-- 
2.47.2

