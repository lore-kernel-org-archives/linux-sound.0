Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C916DEA5
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500578; cv=none; b=UESZKMSkZ3VYQe5MKNdgrgTe5dZXdMSSS/HvaYFNv5bqr8PGKfZ0RaDULri3rEVIWUSTiZ0j2B8ST68WdUKz79dxKu1MR7rIX5EWZt6o+TTb//+OYZ5eAjAdAGpyQkBUTekwFuJ+jcreqiH8LU5Gb19muJANEUIlPx5+DuiFesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500578; c=relaxed/simple;
	bh=DT7Z/Dr7EC6wH3bHClnXwVde/S0OfRJ0y8xo3AP575Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti8lgUUzgGlOhyahHF2pkB6CgEEgr3gzBNJd5HqWbciFJUWZTdCjOboCnjcO2/byH2LyLEx8AFpHas4u7Wqb/vRZUFmB0SFevB7MIE22DEYy1UmGh4r5m7EQnFdrxj7ojWcx+kVD8GQjYZ8rXtEwmL3xxDW47vLHRSzWbrbVmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gS2UdRq+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gS2UdRq+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efba36802so11062182e87.2
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500574; x=1723105374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSGnD2DWNUSNtIkP15Czx/EJx9+uS/yBEuP8HGdsMsE=;
        b=gS2UdRq+FH1IQ88u23BgjIvht3gryVEtpZjwXs7g8GtL3NuMCv/sXALqECsDO+8zDd
         mxgbduJBk69WMlgs5GWXVJzHnZ2k04hqt0aB7/T2Cdzxx25Qz4LWjavkuWALWUoq38bx
         0juzW3OQu5w4q0+qxsyCS5QVvj27L9zEHnnL+mu8O992iN0rJc36OSe7YVvlkMv3flBw
         6ZJLYQ0GaM8UZlCTtNcdSB/qfAy/UISeRLxhNz3qayVYiydZXWfItnrmqlD9OlaJqtrc
         ntjaIXXvyU5MFLd6LW23QdkGY5kuVRy44xltPLd19Yr2w7GmOS6sBhuVhGNIZT/5PKY2
         4zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500574; x=1723105374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSGnD2DWNUSNtIkP15Czx/EJx9+uS/yBEuP8HGdsMsE=;
        b=YJuqjJ0fbi6viKTBMiJ8CZmdBQNVPkxs4rv7xMVPr67IYaNJL8kiLSrv0O6VYjTdSQ
         +58uxk/Q44ZRYIn9YaTixLRE4kl7UKW7w3vH9T3UtlonJJKQDUz2Jks8Eb3YyN3/G5Li
         5ugKUH5eQv2QnItq3z3fggw9wtzK1mH6hNXIVTCw+gAI0QtFiAVkiClef5EKpqY5BQJD
         Ad4JjU9aIdUBvNSUP5Zm/ygPQ9tdmJEzF0LGhEpT3xaXUy3+3BMuB0lPcZinvGavyMZO
         20s4o6zJvVw8Ax0pqIiB2gEfVXM8dzMAKIl3mJfbhrjsngsUEJrqO5P6Kfyh/dWfnR3f
         8/vw==
X-Forwarded-Encrypted: i=1; AJvYcCW3tqWxYmTQCfgQXKssvAaRJREwBMhKgoxZ36PQiiIQY0+1TxHetii/4fwp+rgFdt6P7DJoP2BhKplY7NabnI1jr+np7X8qt5fRSm4=
X-Gm-Message-State: AOJu0Yzm7UN+9Uws/D1m5Ea09ccOS5m8SUD1r/Gh/PZbSQJUUq/7Jy02
	1MkfXrx6VaA/C5X7csXFcNdxXX1eTtuw7kwT1WCkVH1mOU7kQ7/AbfX8MLRaqiA=
X-Google-Smtp-Source: AGHT+IEWp6JLVNetkx76xZrMoBBE0Pp+5XNDbasSkEXbs7i9l6MQsrr7uyA9rchqJH6Db172CYonUQ==
X-Received: by 2002:ac2:41ca:0:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-530b61f3485mr858416e87.56.1722500574277;
        Thu, 01 Aug 2024 01:22:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd1bsm802326e87.179.2024.08.01.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:22:53 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:22:52 +0300
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
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Message-ID: <hhz6m6mzvwh7q5hxbiitbwiicgi5gjv4mx7wnq4m7ihthw3qab@3dy7xddqfczh>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:30PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953 platform.
> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
> supported by firmware which influence way we set codec clocks.
> SoCs shipping on at least msm-3.18 should use v2 clocks.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename functions, add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
