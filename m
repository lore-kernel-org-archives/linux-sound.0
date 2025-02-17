Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C5199921
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777572; cv=none; b=M190g9hVvjmcu1WAUyrJnklxgdPPgWzpNYh93CV3CFVAYgsunXnK6A+C/y9zHmF5YMrMyXgp9FrHlQnUVPQZDyTkRSowFDIiHUB9ViSZTyTwZKDhDLQONZ47r2ZMrn85svq+lGgSZv+HNZ6GWOMfGHtMX2R93bzOCnCfttvM1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777572; c=relaxed/simple;
	bh=r6aBwQGIKHihW7+Ag844yt6fSqk0SJomx7ZY5GraGU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DalVdqamT8whOhAehKL9l41zjdUDGqzPH6EWm1YfcZljsyMPohdUXzaRi1uEd3yV2E/F0lbXkllS8WZdw+VJN8BUhMk+w3HWV84qnCq9nRzJu8sOoCsJ1Z5fTtgQPUtRmPUC8+5o5i9iIleKpmQPW21BD6bRHJzGHFbfuXhhz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/bQSt82; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/bQSt82"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so5231805a12.3
        for <linux-sound@vger.kernel.org>; Sun, 16 Feb 2025 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777569; x=1740382369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=L/bQSt82XGSdLraoupLNCMzX4Qc6baDNAILNy7VNwqsGFqRAxDbyijzY5/T5swPIuB
         dAkBiOb3AEk8cx+XvHd6TFb1adgyeCKFyEkUp/gOmyc49T9dLFY9gNR7ssrBQhMWa7i4
         D73DI3RS+daKOmHWCc+0lJj4KUy7FR0inCFCyWXnZwB8ZzmOrrWhgxmeoBOmX97zPWjA
         tTSo4/SCnw32jObqpXG+rlN16/C4ia691amGPdnM21Vx1g1Un7zSwSkeQgqIso5ZSx9A
         ySmhPZTCC0Xx9rfpwxENPvjQF26PDYZAjOe1C1l6kPfP8MBtA9plTvoeoRmDE0eLjsIw
         SBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777569; x=1740382369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=bJil39ov3ddlO1JjkQC0BgDcK86mCtn5R2XISTRGzq+HY1Q/fm7xiYVzFM298I3HjY
         3SpfDhc8kQLe5s3TbAwe25p/ZWfxNgj3KHpqFrKzMeRGfrWMdyH53LUiXdPqZd9utLmj
         VlqaDSik8jZDlGoSSIuxiPTmWehVRy4qvvF8d4a1S1+kraiOZAnaBQH48rjQxydG+avh
         R7yy1prdsbxerofWHWkkAvHT0iil6WLCTKisdeqhThFNU6V6xENU8mePXJs7fCMtGBYK
         PuNztuKnw+pBHSLxc4sMngJDUD5XdysmeeMmcQdnZAWbi+XnGr6/YHYHUYwkAJcnK8EM
         1iEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4KPVfbDAHKamBTTgq5rndgxDYNMXnEwaMxQ74oiKLSEBrvAKcz849vKLxUaMz/jsQG/5Mk0KQ2NjgfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwuxQ7ilSCG81g7rxDQl8cjBy2tOMmAOXzL4jqzh5HogMoffe
	EX8qQu5xnH5NMhIwC/hFSG0JoMdHYpkvZzBjXlkQxsX6O+H765ypM1HV349acgI=
X-Gm-Gg: ASbGncslADt999c5y9a/BXfz+GX00+L3DfVsBhlDkYEXXJI2QnD2SQb6ksvP6LF36Wk
	R0clyZBqpRTBUBlI140xfhp2ZLJJzsgvB+3h+scBSn5gN7xa1f2qQ8lrqPUWuPmF0JHQOmWaHFm
	EtyJVHQBGGtbF1rJa4X0/ROR20VYHJ5/o8//a1ckN7KHjc8k9OQnRBnbqvkZF2ko11z1Mhc9PvD
	f9O9Wn8t4AqlirT8zanFetJYT99CPz34AiTVQwygatMCNmLblklqaYdqQCmrMcSUyQRUC65/wyV
	Zcd/jxNfbtl+eW7IWPMH
X-Google-Smtp-Source: AGHT+IHJ6d8K2hnOLwZegjEVoeae7Dajjoxiun/dSlgu+G3MOV8fyQIllsHLSF3ttg4CQNHc/VyvvA==
X-Received: by 2002:a17:906:2454:b0:abb:9c8a:fbcd with SMTP id a640c23a62f3a-abb9c8afde3mr235343866b.53.1739777569229;
        Sun, 16 Feb 2025 23:32:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbac867bbfsm7724566b.137.2025.02.16.23.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:48 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:44 +0300
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
Subject: [PATCH 1/2] ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
 imx_parse_ioremap_memory()
Message-ID: <68973636-eab8-4d82-8359-ae2c8f60f261@stanley.mountain>
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

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.  Update the checking to match.

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 82057af1436c..5a385d140bc7 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -338,9 +338,9 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
 		}
 
 		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
-		if (IS_ERR(sdev->bar[blk_type]))
+		if (!sdev->bar[blk_type])
 			return dev_err_probe(sdev->dev,
-					     PTR_ERR(sdev->bar[blk_type]),
+					     -ENOMEM,
 					     "failed to ioremap %s region\n",
 					     chip_info->memory[i].name);
 	}
-- 
2.47.2

