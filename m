Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF354720
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077375; cv=none; b=nUXxJD5zQzdPcRT89ZCU1otlYRNw6dxhuXd0yHrl23LPNQ2mso7M1aA2kUgrPXqTMw2vL+TCFYePX2hqTFKDQXhtINmthaJyUzZDxku6njV4gQw5R7mXpberoBKQTr/GLltTnqi5maAGpaAnhtrUz5ibdHp0Vnx6u4R274m1aHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077375; c=relaxed/simple;
	bh=0oZ0fowpposgg1hmSxqfPXm1dtlRuKN3xpqiuu5rB6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHDLXCE7EzuQnZF+xAs5u5/S9NTX30ABkKoSDnZ/QWcQK+5blA80RA5+hGrp213VRkijkVsq0z9hlQE/ZulMYlwVi838PUj0ekTh5CACXZ+6MPlBBogRZ1YDb/1YbFsboFMT7IJrbIAla2Vnau+IyvU2UkjG2PbZUzE2eUzlogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkX24YXU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkX24YXU"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01afa11cso3007183e87.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077372; x=1722682172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=WkX24YXUsz4cQi/PxZhds/JgCJoFN72mJv3KS88/+z6++xWLTTqTKQN3BB7ezyyikI
         Whzy++mEiQrHfFSwRwq3BeEFmPU9yXMgufZT9QAc0mzJrwOlwK1fBSsKE++SvsyrYYFN
         g7jZVToC89yLSQ8HDojQU2RFzpzNFHOHpV/mRYOhhQqWz0nqYfWRLCNEAS1k+mcFfNr/
         YryXxtDJYxyPGsqAgy6T3EdPcVseylmHFkl368CsFCgQBQ4Gr/qbR1yJixFll5N8SK65
         FZcWxS8qR9PITOrXbdTb8tZ9Ouq14Q5rGc7oA78TesuOLLHfydVTZTQKvg+T66Y1aNYr
         6Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077372; x=1722682172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=rKePW2PJBm4QmjE0bW/N4Yg1CIBTE2O30mGikBzK/d18VwpIcjTh2c0J/CAMdo4/Jt
         mgucOMJbX127bq6nXaE+/7IczmrOGGHcvItxJ08qiNkOsATB/HseZYYHd9wQPG8YsMk4
         mvMHorK2lny/ddVUtP//Qyz4R9tVv2/IReXmM8MH6vuLVWaxPUbEgkNM2Lf6gD6m8Ynp
         sRwmDiqdT1xmu4oNwqTJXlao00IbmLKCLVUb9PKPVh+9B3YEQ9XP8MZ5rsbpscnWVhNu
         nm+RPxotGIn5OO9AgpkcFyaLwJAQ91/UNfAcX7QI+8ild6sX1/1x1HMwRrCHEMMazo17
         5RZA==
X-Forwarded-Encrypted: i=1; AJvYcCWbdbEZPrK3o83DUphG6TIQoV+SAG12sCMNfCmaE98nn0u/LMkqncIuTOq3R0dIcdmleEepiTxn5GxxU43VeTz0pd8FXIU60BtxCi4=
X-Gm-Message-State: AOJu0YwoTpdnLA0M6HRh6VkO279c8hv5cermloGI5jrgAQH8B/cdaZ4W
	cQoHOLc/FUe9DkxPPL71uBd0h2GulGZUFffB4jzt28Er7K9XwlwIU7FOixZ0hZw=
X-Google-Smtp-Source: AGHT+IGxziVLosYTzs6fsYoTWkq3wWwSbcxZCa9nxslFM0uZIZe3gN9qbnNwurh64J1lmrZMg2moVg==
X-Received: by 2002:ac2:4f0f:0:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-5309b270661mr1909187e87.13.1722077371627;
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2c133sm734387e87.252.2024.07.27.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ASoC: codecs: wcd938x: Move max port number defines
 to enum
Message-ID: <uc3zgtkfw2gbgy5cm5hyf4i7qq54uagirxnp7sqva45wfc3zrd@wlqsuhx7mhgb>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:48PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
