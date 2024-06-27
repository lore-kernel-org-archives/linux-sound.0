Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F26194080
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495395; cv=none; b=GNpeDFvkwSRZaCe5UnjZ5O7vKvFktpiPPCKI1auyR6LfzuJvwK8CRmkQbgqW+LQLMOnpPt9KZgCI6IozK/7Q4IaGtduvIyRcUuxFsPmnfRbN9mtYk0PY5uVcmoNdhRXqAX+J0+u2PeooaadWMkn6cY6eJLHZFEVChFu03tENCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495395; c=relaxed/simple;
	bh=jrJYPSTr+kFC6rNqtUiTcC2Ht6Y5ui2Su1TvOnzxGV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hdt7JDEmu1haiB7Wn+dUYlxU4ysvutqwEi6/rrQ55PqTv3xk08FrST19kgR8GVGUwrSNsUtcAb5HTtDDo4qhFTMg5hzRAF3zClq7rjKvsRsrfwUYXEOAoxD+6CueF141lNpPtmMbxBUC6xU1ysNEa1awN9Gv3W/IVbJvg8L5OWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqqdAR5z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqqdAR5z"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdea1387eso5695441e87.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495390; x=1720100190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=jqqdAR5z1A30dqwKb86648/w88Fte3dd72x9JW7AACLuGKhhIEyzZPXr+wgcknwJVn
         SS4G2e49DzqoYSWChui25WwqYp6xQXUGKtDfsP2OuSHEZSVNyUoUWlyFW+NHC0shpHji
         fjsPnpfPIQBqGrF1FyRM21Fqw4neWGHZsxNmvfG4WjAtfHneFzFHC8Iypee85iMmSbwo
         vG89CwvCUlPtt1wTxa8152MCE5fxvF4N+FLnFSCbI0888rdskEjN6LYCeXweQUOxzger
         GdgkifOFXZGtVisAspAe7UjKZtBhCj/G4Rv/CZFVhllwJpyaqTGOY/XTKbRinoDMFqEz
         LJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495390; x=1720100190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=lbOgvCmm8CpkXJlLgOCNh1Gx/l3Rc+UyyF5YxGvsim2B3e8n2cbRStoDvBUnk/Qdex
         w3eYqi4ivv+KUeYrnFFIyIqv0s8fTyLaPWydJfix+g/EcbakKn4S9MVzM3XSid4X/NH7
         RoP3aGUXOLZiXHaGVUUZeWpemS11VdMI+Yynwx+PM1Pc6IMPW1c12W0BP158r6IjsfOg
         d0K/ZPxrbPkUNBwY1y7ocrLFXSRvM7sUZ8IITvEAVkwCMlvdCkxra2iuHSXNhRcpIc2w
         YTqYmqDhsp8HXjNDrCQ7TZt/6PZzOhDuCXJL9q4qLr91JFg89wURbtcL53WSeTGNVNEr
         iApQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOBQCIMYDYj1nU1LXLHIVB6EbDryACtEnr5RmUwxCo8y54PB+oAE0EP3gisWyaHl6FejNCz/NZp4a1z10+69wsIiyutqAMW3u6BXc=
X-Gm-Message-State: AOJu0YwnBzftrt1l9JDBxnuXAx7fKX2XEMjTGv6bCn9RovfgrkAgR9My
	PZ/fRr2t00XGMb6k1w+d0FjpkPkHvSsOuqezhZVnwDlKl/Ru4Zv4IT6ERHuEX1U=
X-Google-Smtp-Source: AGHT+IEntGnW3r885rD535krGu3gOxLvLpYzJ1lI50RGmo2x6rQxE9vDmBzx8zivqRScd/qzBnU23w==
X-Received: by 2002:a05:6512:2813:b0:52c:dfe6:70e2 with SMTP id 2adb3069b0e04-52ce185f9efmr10637532e87.47.1719495390235;
        Thu, 27 Jun 2024 06:36:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e76427d7dsm62272e87.156.2024.06.27.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:36:29 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:36:28 +0300
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
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
Message-ID: <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-2-bd8987d2b332@linaro.org>

On Thu, Jun 27, 2024 at 12:55:18PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index a2e86ef7d18f..43156d39480f 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa883x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA883X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

dev_info looks strange. It should be either dev_warn or dev_dbg.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
