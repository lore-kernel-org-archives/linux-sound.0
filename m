Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1E175579
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334229; cv=none; b=K9S21EMMZi397oYG3NS5sBlIq/fmO+gKk0kTdH+y+roPV1wCWbGWDeWe8ay4HnxMcneI2cGBkoa0SYP9gZVCBAz7wKbUHAlGBOeE0Rr2QsP1JD5ONXzEpS8xzGtC57xkT7oUrCQdTqur4zv3zBEexGfBxIhLQ2KMmdtl5KOj5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334229; c=relaxed/simple;
	bh=FpCXBcjNasPCd7gzQ0d/1eVDiQnq9bdmJyABlclUbEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOoXLkHg2cDP0EiGViwlzJpEntixsV+6FH4cAkeerX2mwtgxn+0/UqfeZHCOJasgPU8BGZAOGwPFd3iCJnEWNkqtVCeZK9XxiJNMpBmp0/ULbed2mJTpJNHzbLaGFNq9Yut1MU4AAy0NSefEzwlbe4z2SPVn89kLrXin5DuzydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MN4EH9bG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MN4EH9bG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so3245892e87.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334225; x=1719939025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir2hWbZRQe6JRonqyk5LScY3xCjHxyFZ1ViC/BMSe58=;
        b=MN4EH9bG8sH5S5sTcgO7D4m+j1q0Fd8dduDS0k3frpQjuHC5an1WX0X0ldDFVZnWpC
         JiMP1KdQS2CopJG77hHrs1ji1y07hfLlooDQpXrI0JUVmoRdhRmFnAYIS2wNO+Jdj/Jy
         ELy0XqKgeDeyDn8XEAMcL0TXhNzkeiERIX9ZJbmByk33Lx3PGsdbDF0Oj6jVw78W/Eh5
         anwHtwB9xmAQnCh+MWrIFi2mBpa8O9ytxR1lFlCAvt3gGzPp1ftn+fQx0CH7Q2iDy04R
         YQ2mDTQIBiqf7SOgT4JXWfQS90xgCfRsouJeBbVd0igCF7h0pJzKODZUixiqm6aBemvp
         ggSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334225; x=1719939025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir2hWbZRQe6JRonqyk5LScY3xCjHxyFZ1ViC/BMSe58=;
        b=Y3OF5nUWC3jX5dGx6EhldzE8Z31XLLcdi5PTxdVmL3Q4Ex8PNDTMqCbh7USp1fRzu3
         +d6Tv3eHTfPpVU0Im9ejPIuDMsD9fshlruSS0cag/rfySlYlTcIWANctqKd04rUPYL4H
         8AI0vvcu3icAldspjqPuYwGiG/h4PhkLLHS+IhGvuezCXi81R5zn0zH0nde0qY4AZrwf
         GXnPuicGIcWsz4E6BW+LbvuT889usuXmktyOw08Od8Q2+1MU1Jgdns4rClkVLM1oq4jj
         fhzQg7UDNXRi+ifgRXrvbqMankBmQpxHbcvfGPX1FMg8Y8O/5vnANCRRhtziU+hpt970
         46dA==
X-Forwarded-Encrypted: i=1; AJvYcCW78tFwEbLte5Y7jjliHmDKYNGqwfufjTQvCiz3wbbwNhtqzF9H/JE0uGHTdexyj7FUCQB8Klw4MAYXfuua2bgtacSh4jbpfhPwRWI=
X-Gm-Message-State: AOJu0YySJAeQ4GZDtbvw1ZzRSyqA9B9yRheleUq/mMzv++9Jv9WQFukv
	L6R3ux6QX3hts7hA/2sE/XouQk54VXuasnN6kPZjHJNVAYTFxSuYvm+OVhSkv24=
X-Google-Smtp-Source: AGHT+IEWhnQd9LfyRRriXAv2lYlKo5QSl+8ZswlUlB2fAE+H6jrFVIyXYSOJ5WBxj4SizxoPJGOuBw==
X-Received: by 2002:ac2:4823:0:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-52cdf82574bmr5362111e87.58.1719334225501;
        Tue, 25 Jun 2024 09:50:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b47b2sm1279133e87.50.2024.06.25.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:50:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 19:50:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
Message-ID: <7kw3xiqoc6sltaz5w4m2azprieaqbu7jivupgpzzwesxynyjd3@j2fla7epac6z>
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>

On Tue, Jun 25, 2024 at 06:06:14PM GMT, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
