Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77A16C85D
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500466; cv=none; b=cYHnHi9cw4TSmVKyIiFsiGxnqVia9LwjbshxgBH1sLkb/F/pc3IgFE0m6GLsmdB5TgpyEFKwesgeQf2mDX5J8CdYa/KuyEAQKDwBGHuedf/wZM482pmReyJ2K9cS2JuA0VoiIadv5D+5ZgjUy9XkMn8u3j6/GclUmnBlujugUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500466; c=relaxed/simple;
	bh=Z/R/jE3UetsT6jIzeeUL2oO4nHocrgIt0QNSJ9yXa1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+x6jUcQJuZexe0Gdf/K3mO6VtB7HNo0uoHBvD0eGlELxN93tKdbMraV7z1CcnMxeG1oYhknVSxN9WWv6ewvbp40DKV8SRe0WgH55ntajoNfxwYqRC7xHj1gs0/sFkr9E83zAhIyoyyqYAwnV07MEmhlmV1tfbXtVsC6wJMTduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XnyxjlFg; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnyxjlFg"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f025b94e07so86716831fa.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500463; x=1723105263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=XnyxjlFgbVZt4olAK7yBuLYLCB/svNm+FWPUA5ZjttlNHgYRSFa8gEWMben7m07nR1
         XXWa66aWyFgKaAOgYZXQx38nrFdp7JH0uo4Xn6qsI290MzjU+nW+iNiDMpZVHbPBPIFA
         /aCK4OMg9zALOgf/pGI7RFSUZwjWe9kfPNYdsgZz0MQhFcy+kMhkznvbasMzEn7IXjYJ
         c+d7mZ4dHub7c+uDK+/Y5fT1WOYhi33Vb2wE7lmKziaOL9F45XAKovcwEb+GVw9w2stl
         xWvhTqI8kx2OgNrb6BhUkCCDmgBOifg87ylnZL7pgedJRzvv/jwGGcCuR6xyfrRLd0BN
         1Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500463; x=1723105263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=J1SqH6hlaMSveWxMuQ33Ig8W4LzBBBSBKIclDmv0DMN35RUAwQacmAeQY7dML0Nhec
         qQ4MxlS2WDwQIYZt6VBU9cU2jZmVIbHZlh1DWtt9Ha/KBN5vERwtOscWyhW1baSSrZh9
         86MTs55TLw3XYxJPsMP8OffcNak5P7eIchYgfmJBcu1w3dwnCRgrW+k9XNmypr3jh51C
         Et1AJ1mpCAi5lwPRZ155xl8TqNuHa8TkIyjXRmRi59u0YMTRn4EZVulOqSZUwSa3QpZv
         oIA6e94nAiU5LXk2zAl3krkM60GQotiBP0Cj76w6IDNLkvxOcfRgvUj5Mpv3Qs3DPRnL
         LG7g==
X-Forwarded-Encrypted: i=1; AJvYcCUD1sAkwbQOKh0kXn17EZbadonKk/DDb5GZTeFivmVlzQqDHPKPXyimoVKh8Fi5sDGV11xfoWzbf4dNgAXBJTlwC+dm9IQhIPUDOL0=
X-Gm-Message-State: AOJu0Yzmum+rEo0a9LXZtkHk3PgSI9ZkTC44cliOJn0WzkmPxi2LMJ4e
	QYt59/HwF91XnNw2ImdkBqJ+B4wCXgIEOnEu+pquSjGYJa3gf7Q0s9Mi6Pc1Oas=
X-Google-Smtp-Source: AGHT+IH2rrp/DcZo+alL+PQQLhSzxuBc4O3JwWhJX/xYrbDZk4ReJ8Td8cb1JnBDOgBdEencF/BngA==
X-Received: by 2002:a2e:9b1a:0:b0:2ee:8d19:85af with SMTP id 38308e7fff4ca-2f1532d3daemr12584361fa.36.1722500461234;
        Thu, 01 Aug 2024 01:21:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d074b19sm22171011fa.110.2024.08.01.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:21:00 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:20:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <fm6wqsznxxxlofht2nouqtaryl7delloatc2v3b737unt7hqd4@l46iayvs64ru>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:25PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
