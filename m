Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6F6A8BE
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077386; cv=none; b=fxkP0gjGLwbd0ay3k+lyuZAX17PnoSkw/1kRjueyQj/hUqK+USSb+dQoP12ZjpYnLis/6bfEbo5zMX7zvuowFWWdvrQcXzzZUueYMBTZnV1n1MVFIW5uR1qPqDazitnd8OY8tbXcpbR8mUiIAonw1u6apmm/E3WiNAGOZjs+bq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077386; c=relaxed/simple;
	bh=YuxfSJ4lv/oCw60ifWm2XJgjH+1otX685tSUrnHE5HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1dHnrfQ4EIxW/BCdnIN/mDa/T37OibAMNy3G8VR3QbQ+Vwh1tIm5s5UaSrKHV1Z4ST1HI3b7E4PmFuFF/FEVVkmA/mmIlGamSZHvpqgrkOR+I/9YFaaS4BYqm1J886xg8FBRD2FexfuhfPbxFHgeDjoGTGGr3pV66JHme0MVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcmngQIF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcmngQIF"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso20073451fa.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077383; x=1722682183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=AcmngQIFof3i25Ga4cluGvIa/CDNymm5x3Y/wwYYexNmU2mdeRWy7Iv/lRwUq2st61
         +eT7JrCOmG5Fbu170QFPu5+Sf4X5TKEG1kcwLLLuNMdZA3oAICttx070x50ZEiNrhW2m
         RZTw98It6I6BqRLXpFvg+QsylxXL3Gl3j9jpih7E//0Uf+b4jeE1gNb87dHThtai/WFt
         FKYUHXkVPQ7SuaQFKr1Mt6YWZrLuoU86cJ2N+UjUWffLCJMCsxcN15AQS0G86YAX5S26
         hZLilaVl2rLCy14ilWonNW9hVfqSAF63velLpcS6jfdJ3hWAYAOXXuCO73R5v6ltKfdD
         EclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077383; x=1722682183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=WotsgqkuGw6JHy7aUB6MpO9e/dM60awgF8k0JusUh1mAueA0etgH0SGwE78Y7E0jvP
         q2rgqkApM8yaVW7+kiWvxz9x+W4dznWj5PFFMaA/zJfZJOimvTbhUlgJ79FLNsJ6pvWB
         sEOshVoZf1Od2A3wyn/NT0pgYR4uqQ6g9aaniVBw+rj6Z5SqoYzCvP3/1nVPmgElNCVj
         jC7G5WkFFa6AkVAihcbgjddtJAEArY6zvMq85CYMGrZCFnmpp2qOYCLKZlGBB3WDpGrV
         y683ZJzGt8CJwFIsUe49fyJctdmMQFZwnZRYJk5ue3FGkh7K/sJxWabo5nUZ489JSLOU
         pmRw==
X-Forwarded-Encrypted: i=1; AJvYcCWxDgWS4lEQcF3M93bqZicKAI0J31JdQu6de+dhzUx8PJ1H6JU7GRgV5tBgosrIPzP1tK/V6Uu1GjERyScW7kZEPnyMuAIjktziPS4=
X-Gm-Message-State: AOJu0YySiVnKUFMDT3fuKWnxT968+Nr4iHkJGlLIMYMKaKEepUrEkpaB
	0WmU5aSu1akdmRuNa/lrO9cbXR5JZlXqMuT2k/NBOLzWLV08dTZUNg5zGG36hIY=
X-Google-Smtp-Source: AGHT+IHnIkK+HB2IdwYErth4W4SCHl2kIZXcIUCxD+QuK/EAVa9ImrPRHZ+ao6U85UaV4uncB6qJdg==
X-Received: by 2002:a2e:311:0:b0:2ee:df8f:652d with SMTP id 38308e7fff4ca-2f12f084567mr5772381fa.2.1722077383159;
        Sat, 27 Jul 2024 03:49:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d075489sm6626471fa.115.2024.07.27.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:42 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ASoC: codecs: wcd939x: Move max port number defines
 to enum
Message-ID: <h4f5c5ecsum3qdphmqvufmumqkrshrivn2qgkdgr243jgsoibn@zcngoula4vsy>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:49PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd939x.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
