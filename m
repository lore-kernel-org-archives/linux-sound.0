Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F579E4
	for <linux-sound@vger.kernel.org>; Mon, 15 Apr 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713177283; cv=none; b=kLzv7gP9sYEOjKcdwh/8IwDKpvRFx3dXLJWcOPapwKJ87RAlzNd95ydoPRu3vVpFg1Byps237WAcNVr8hIrVdcXF1ImmhRltF3TZYS9RHqpetkcZc42EaYxh9wEc7T6GnZdZOA0g5RTUXe68qMybr7F6bVwmIEjfqEwFjTbLD8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713177283; c=relaxed/simple;
	bh=r+M9Bk+4YRd+zQ8ivjTlZYC6qhnETV86VeSJFPKxcBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdctyyMMPMoEtY9qs2xhFq++QX4yI9yii4Lj4d5hRDiX3YcIhk7I9QIypwX7nkRIPpCi0T4AQe7Lj0hjLKhPGOdpE/jG1L5KMwTUxPv/JTBdgIGmVfv1T5IjTWEmaAnWVqTRtERqEjPqDrgcXvqk/NLK5ahDVxqF4upoZ/xQSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hToGEX5H; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hToGEX5H"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so6617485a12.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Apr 2024 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713177280; x=1713782080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=hToGEX5HZtif/uUshqXAbmdUpUFNAUC+U+6Lw1EdLTFUHzI/diKb9dtiBV/ne/xXIx
         sMqTt9fOF0dt8qcsbXvnXkWQlxNP4rFvtLeYdF+xd/4Sg+qghCmn8i1yvBuQiyRsSjOI
         Qss46CFjAPpTF1ZH20qAhqK7c5gzMWewG6Jf8BAYN/pIEU0oZhqbWixyIgNgqzt60vrc
         p4Qjqwz05uojIdOamJ8mizixKj14RXwXY1LQh0XKcH4AlceicjfePESiIDBOZOgePjst
         +6LyC7BwNWkinc8pOtadnsK3EMye+vnWGIm8TShAmB4xnNfl+VggJNhjF70PKUlts5LN
         UT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713177280; x=1713782080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=N4I7NrM03xCG3B1R4n02Gj1mDl2zLUcp9Ji2ejVnJW+3o4EDUZcfg7283McUnuUGmg
         i/JzMm1hlXFZ+ACIEEB8SFE3Xfx3rv9Rvy2H/7XsJ078/nbEcsdUYoLv8apokqa8m6cR
         e8Y2/siHQasAV4smg1kU7y89H1g1+oqg5DeDcMTVcaSU2gPnw5kNAXfTyHmxXpdrmurC
         wRVZ5LUcefrQJd/3zTXk7fMa1YTiQm3ZQ0RRAx6d8Jn5AiF//6nt2WHAaLVAtNy4bNA9
         UuZCGluMey0jv+agL/HZzblPzv5LQcjvK5Ti48q2bby++bqIAqXB56HHcLg+nuInlwP6
         XHxA==
X-Forwarded-Encrypted: i=1; AJvYcCVX6aKDngxouBpvAiKE4RMSV9/x/7Kz5S56PIbPvlLvh+aUJCATG9RBGsQ36U8Zx0cMC8m9eN6nvoBtaEQoGEF0SOZLgzXqhMlCP70=
X-Gm-Message-State: AOJu0YxaajL7FmTq0wgMOGD1V24ywXdkuycaoUqOV0nSPSmDYO1G7bQY
	5G+UFpTvz6hpRl5XNvfNoDrakcsILn7EFOVCbpEKr4HWiHY0StUPMB85E009XrM=
X-Google-Smtp-Source: AGHT+IE8taSRi7cZZenb22Hrhoo4IcK5IkZ6zpDWyZ3iR0Lu0U9yZ+r/3VZ74qZxKOLyEcvqXb+uAA==
X-Received: by 2002:a17:907:bb82:b0:a52:2a65:cf2 with SMTP id xo2-20020a170907bb8200b00a522a650cf2mr7787401ejc.13.1713177279707;
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v13-20020a17090606cd00b00a526562de1fsm1589133ejb.73.2024.04.15.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:34:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l41: Fix error code in cs35l41_dsp_init()
Message-ID: <a50d27fd-716e-4fb0-8519-8798e3c79543@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code on this error path.  Don't return success.

Fixes: eefb831d2e4d ("ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/cs35l41.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index f8e57a2fc3e3..2799ccd6b5c7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1126,6 +1126,7 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	default:
 		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
 			cs35l41->hw_cfg.bst_type);
+		ret = -EINVAL;
 		goto err_dsp;
 	}
 
-- 
2.43.0

