Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27853B78D
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216207; cv=none; b=AKbAOIGPCKRh2JumihvA5fiYZqn/eZtS+xRMkRKoOgfOJQ/RWalIH7v6CC+O6raJSS7ccIr0AX0YfIdZUQpt3HoIAUcPpyDpDt2evsUNyu9NujhG1eqh7xBcMDH40+5cRxA6ts0LN+PHzq+het2fgYljM668eG6U31eIqX0tIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216207; c=relaxed/simple;
	bh=XOoDEVo4OZzwLhKRiU4JC4hHaduq+EtwyfIuPbwP1B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRsBcGQnfDJNLEP9QlLAy4CRdNUsseFcc+G8OFniTTN3iRaenCfJlJI+3Mz6VC6Q93rmwxU2zyvsBLtvieFzLSznPwC+IIWOK2tcT2EYFywPPAMGCXTMbPkf48leawGAXpfYgtco70t3nlbcug7/ayVW/IMbcLFUT0/NLkIv5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCemn0Sq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCemn0Sq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c9034860dso222623e87.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216203; x=1718821003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUlMhvz/JBG0hn+cnvEVI731dfNOlIAiHpYX40k8o80=;
        b=xCemn0SqcVvJ2gDTBuoHsGbzC/unsRRE3JBI2txB7s3q91fa2eUlQS+Cmz+u9TZH59
         73eBB5D9Wk47YDD9+ohcPTj6Gtl9oKCg8VCFJ82+m2u69y3wBilu/7iAiF3EtwvIsvYw
         xOE1MReQOZOAU8BTd4DyCqqFZk3kSuPUwKMF8669Y72OSo+tIrTYuy7OMUCsgcLDr1FK
         3+J82UFpmffNcBvpWpjnpPEQuw7CNzDmd+fVTMWJEL7KX2fPpKHwbUws1UuoDAMA8DXR
         ioiFMR6mDVD4NZojfs+pjJM+UO7MbNto49nwSzgZXI34DGXJoDpRxTWrL3OtCvD1IhmV
         /IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216203; x=1718821003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUlMhvz/JBG0hn+cnvEVI731dfNOlIAiHpYX40k8o80=;
        b=pzTkg26stdEjea6pZ8S7RgT27y+ZiP3bKMc3vJM/K8eUUVut0Z0viq7F3+7IF+J8vU
         0xokBJ4yD4eq3KBV6+G5B8srmQpnyw3au6+heku5BiYgS6G14R2K1V3PM7+5pyAOZffp
         yo8D6rdHq+ewKrX1dG7KDNfimCcLxhutXejdHmkrxteeBleePMSbpzN9rrlTycMyEf/i
         nEZip01Uu4otLyaS+7rJf4R4VPAEqJCRAGiQ8vG98UrNF8Bvw4X1ZM1wPCD6FouT3vvi
         c8vHFsPhKAJjzANvSQAHN4SemGKtsT8Ue9mDmcaB4IXwu/GPXz7TPUt15d4c3lU6IdLm
         b/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxHoCRCh/QddoFlUKSaGZ1QY2LAaXAFTIHLUZ2o61B/Hu7k7yYPfdOXz/lVDkDO6cjvzE15WyFHKbiD9n/fhtR33tyPeumzjBGAW8=
X-Gm-Message-State: AOJu0Yzry4krhiRJsHzf4RbBBhBGyvWJ1JvINB2jz8fgtaN5gW4eQmp0
	bEU/pzMIXjWp6WnymqFwqXNJkJLqu90LX3gMzvz43KQB08MDbXUlVYDBctOaIY4=
X-Google-Smtp-Source: AGHT+IFi6JIRt0lupvSgxsB5ZYGwl4QJ74CdnmzB6WDu0EVO/YwQmQY0fZ4yKdEvWvDG3PDsu/+Avw==
X-Received: by 2002:ac2:494b:0:b0:52c:868f:a28d with SMTP id 2adb3069b0e04-52c9a4036d2mr1927485e87.50.1718216203024;
        Wed, 12 Jun 2024 11:16:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1e57sm2635583e87.26.2024.06.12.11.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:16:42 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:16:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/3] ASoC: codec: lpass-rx-macro: prepare driver to
 accomdate new codec versions
Message-ID: <ltq4i765kg6onbcknqntk5uarberl5mblar74l74tnvhsc7sfl@5a3sulhvcce2>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-2-9f40611a1370@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-lpass-codec-v25-v1-2-9f40611a1370@linaro.org>

On Wed, Jun 12, 2024 at 05:57:22PM +0100, Srinivas Kandagatla wrote:
> LPASS Codec v2.5 has significant changes in the rx block register strides.
> This is a preparatory patch to do the required changes in the existing driver
> to be able to accomdate these changes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 361 ++++++++++++++++++++++----------------
>  1 file changed, 209 insertions(+), 152 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
