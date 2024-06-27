Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAA0193092
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495488; cv=none; b=Dqkpbv1p5lhXIalaWEzyPEalynJnU1/+B8r5qz9JGscbZzm2Xfo0kB8dKgcroW1R7MU/H2KVrBAsoFDhND4kDfwGmwk2ZCb+ZhQfkoiD/ZSJek5mMeFaMxliQd8sXgK3SIfTzdOiweGskccv0bxOdzfch9KIybHpU0/TcimErJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495488; c=relaxed/simple;
	bh=zlWbv23yLnjGiL+Hwn58YyoDm6gTItwlsW44BzEfxBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wor4DVfDqbm9po5q3AR9DN06zlJQJqBX0TVtR/JqxYimcU/zA01w1z0XTo9w9CXhSXT7S4noj+T3nTucJd1Lf0uGDsrsdhSvfMCK/WJnLqC+8jimvCQSOC0BaNOdg83h5MBe5jtTv7+kYBrbyq9H4Rz1NT/IeWs5heN1326zA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkzLdkXK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkzLdkXK"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso6140005e87.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495484; x=1720100284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=wkzLdkXKrkVzMZfTFpyu1RlIjx9xu4fQn3lGWfIJdb5tkNVCKLljBDjxejWRbf2vbW
         TUY9oD5DQsdt9MKEF/bwej77Ey5VqET/aeRXi2vxFlW2ZH19w/SULSa1O4zXekMWcCMZ
         HzFigy2ccgGMGwrPOh9FiracemwRs643TH/Qm5RTCzeLZ4JvaYavY48yWViOihKfL7rn
         6roJryirzb9qAMcqxH57Qeij19ShiP/AoVSy2OZChyUtBhikXWO7ROGGd9iMpS/0iq3H
         QMY27Ux7c40G4i5pzB+9KLC7xM0cnfjP+p/qS5mAsytCU64QhVYi4wVAnXVjymToHitY
         0vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495484; x=1720100284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=XOacmlxwubxYxlqPiwxxqXiOfk6rBtvt1E+RD0pwlTRpvvKPe+ezb8kqzG2CQ9H3Cc
         268acIGh0Iof4mUhUjMiIsbTm//x91EbUT+uvJVmUMkiJ7d71f9VH5HfVUcUpCCMs1bO
         Vuic7QxPWw2Qu7IDptadG1VvI6jlD/jm0CKVGnVE+vYBwfh0UMs5cFHcHvPFAWC+AQJ1
         PxCQHN9O36p8rUXJGlpLoUad/XKe63KTT8fMEK7jozrVZni7ZS/NC/UQLkL48ip2HHDW
         wWyhSy9wtAvwLdcGWgUpECKk+zUXsnRamWpkB8jq2hSLzhgVzuTARkFAMEfFqk9GM/ps
         2YjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6dZ1AUUC1TohlZwWxDH2B0uP19YnqvCJQJh0VbJlhFzDMdOitF0IkTs/jvMdaGCP7uwnUsB8AKgGeZjdgcblN7e+LSQVeAxoRWFs=
X-Gm-Message-State: AOJu0YwXkO71+ivZzINFaFix8VY/+VvTCMcCJ8m8v0M+CbI8g7spb+i9
	vZKx5lx2dOvSZTkGLuodAJNkFElsajqpzJxur5sCpP+SGCNugRl9gzn/K6JAoWE=
X-Google-Smtp-Source: AGHT+IGt/T6ryAQ5fIZrriDIODzgzCJHjaJBSRs8dHehQYvz1xIxu8NpVbr7FP8bm81xWv9Zq+eRdw==
X-Received: by 2002:ac2:5607:0:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-52ce18614d1mr10442288e87.57.1719495483953;
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7130543bsm207833e87.136.2024.06.27.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:38:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
Message-ID: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>

On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..72ff71bfb827 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>  	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa884x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

Same comment. Either dev_warn (if it's something to warn about) or
dev_info.

Or, as your commit message mentions that it is required, it should be an
error if the port mapping is not specified.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
