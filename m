Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1F1F1305
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328533; cv=none; b=g7QStLMODdIe8VuW6LDg47SwoGCfpa4adFWxGWDvaDAXC1dPQtYtk0JS1FaVqMcWsf0QhryQcZk32LccSAlqrMX6Z9CSJbl1RCZgx4LBHHa8aGZeV58XLVNPfOTrwXKSLBftvRnSseUrMg6impYAHGgENKoLbpnHnFChTPYnM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328533; c=relaxed/simple;
	bh=yA7y97nb85po90Zmk69+gL//XzthbasJe+UKvQBCBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDxlEugAazrwe3AXLHJwjQH1iT0iE9i2GUfCz66jQJqdJTlp3EtsMc6NIQ49Qee7amPCdNJgo5FYQF0B2JE/g6xj2l8F9cXH/XhmOakkowuN4lKH+BBwxAwf7aJvckwQzK0QI7JSDXv1uNpbdzSCJ7/nDRB4njwP5+qA0EmjZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vrv62d0K; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vrv62d0K"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso113660245e9.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jan 2025 01:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328529; x=1736933329; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=Vrv62d0KBPN9aT7G2fo5sRAsLw8PLpQzbuSWTiOTOcNzO14J8fnCloQgcZWp+vQQ6Z
         ioGAewjcotWKLQjXrH3+PZO/W5zPNyN04BTvD3Gw7P9U4B30GOLOKiUqo+soA7GkXfk+
         7ShBx+KLuCUyIH02GGBh2aJOHp2s++6fprb7RquxyktEpPwf53Oq6siW1Lo4vaZFpn+U
         jpgq0zTz9aI3uiJS1rltkK/WTWIEcYqQh2BYHmts8eQ7KwbTZY01uPXhGhw6Mrk3LYZT
         Jgi+gjpL9DlSfXjsltToLgTa7XrGPaDz7B+v4pB+vnOikr+RRoQAYx1pYt47kwnu8umD
         k7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328529; x=1736933329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=FtitziNC5fF1rOhq4XHrs/SEdDOkuH0G3EhdJuJzHHnKNYSm/komj6PyhvnY1278RY
         NyrUjNL+m+u3NDMfuMNLY7x5XoCxcNhMZJZ83qEIibtrAKppCkTyCxcsjEkYM1vM76CL
         PZ0OINWTYPqxF3DSi7M0M+fIiOUIeJPapFkPr9ePwJf5O/ovixYbeSzYtaVBTRmiZZei
         mfMeUmMHMMQDeTDZxXzzSCReOYy93bztmfMwF8Gnn/AuvoSTei4gCzjuyOCjnVQ1wybs
         /IlXOP3F7GZhkDEdJOi0i2+fQ5WB9tPLNbcfu21Ua3iYGSXzbM+UziX0DV5TMLUBbdZF
         D2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgOJjWYr+05RqWjwHTDbOWeLjR/tjCHrKJ9SfMN0oUmUXvol9Ib1e5a1dcFTFZDHbzLI69IFWr4B0c7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XSUYhjYuKnXNIW3c17GBgqftZhBryiwGfTq1YWBmdCRWP1z0
	0a9CGK+UBrYtqjHma1Dd8fuqsqEv1d9LCWldhqeEPqT8gBZvJCXbq3B7FAwG9p8=
X-Gm-Gg: ASbGncs89VtX08zVbHGlIOSSUx3IqadjjpeLls8IRn++pNuT0qGs9lcN0v74aQdIgEQ
	Fg2s5RY1BMu5ODKH0JqPVZ/5rIOu5ejNZYUxq1LmBrAl9H6PaqLCG8XDuL5qgAaYFi89E3DHyBd
	ilmr5uoKd0z0uOlGetnOifogXaL3aLQ4xHUFUzm1AQg9FpXDazjI+fRtaP15Y1Svn6hBo+9RKst
	jBRBA1SCzPJgc7pnZ4a0uB77ay/maFTV+6avnOrHsstyUWHBEq6nf1KLhYwXQ==
X-Google-Smtp-Source: AGHT+IEbOKQpbXnV0Vk4QEqZakle2mY4HuBVWDf4SPOXo+NOnQPd/LEFfiqdZj1V2NZzu8Gu4CgtXQ==
X-Received: by 2002:a05:600c:1d82:b0:434:f953:efb with SMTP id 5b1f17b1804b1-436e26f984amr12953225e9.32.1736328529560;
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92f60sm13995695e9.40.2025.01.08.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Date: Wed, 8 Jan 2025 12:28:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative sample_space
Message-ID: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

My static checker rule complains about this code.  The concern is that
if "sample_space" is negative then the "sample_space >= runtime->channels"
condition will not work as intended because it will be type promoted to a
high unsigned int value.

strm->fifo_sample_size is SSI_FIFO_DEPTH (32).  The SSIFSR_TDC_MASK is
0x3f.  Without any further context it does seem like a reasonable warning
and it can't hurt to add a check for negatives.

Cc: stable@vger.kernel.org
Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/renesas/rz-ssi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d48e2e7356b6..3a0af4ca7ab6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -521,6 +521,8 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	sample_space = strm->fifo_sample_size;
 	ssifsr = rz_ssi_reg_readl(ssi, SSIFSR);
 	sample_space -= (ssifsr >> SSIFSR_TDC_SHIFT) & SSIFSR_TDC_MASK;
+	if (sample_space < 0)
+		return -EINVAL;
 
 	/* Only add full frames at a time */
 	while (frames_left && (sample_space >= runtime->channels)) {
-- 
2.45.2

