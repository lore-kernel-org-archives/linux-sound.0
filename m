Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96042A95
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077205; cv=none; b=CnU6gVcMIYc6cUvxCHoXrWOeOJtn8NmkgXCSd1ry8Fei49hJJUfK7VMIpn0RSzuHhIPVBEolN2h2LZnKRZFzsN7zhltv7Mr+Rp9tk9HmubN9wztC9KV6qtCuuUZ1VFzV166X9teq8NkejxJGOTBNdpEZZEjbe0eRlMEWqCLTr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077205; c=relaxed/simple;
	bh=eOfry3nuvu3HHLuEem2iFGqJmfkmEBKnxmiPgO/CPE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGXo6OWI6KoGUeZ4EpUcmGhawkJbhgBIx+D5VT0Mhy9Kgm3vXCFPN9p9JC8nYFp11UjFtyOivFpqZ/0INsGazNRWmBXSdVjI8lA1pbNBMDqjyu+tGnNN6Q07TE/PGnQNg2p4K9xQhwfYcZixlNiBxOV/90GWd6ircvMmde8CLlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTuR7ebD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTuR7ebD"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f025b94e07so25581931fa.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077202; x=1722682002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=gTuR7ebDTw7OuoUlBzXeM+9+buk4aOWwGmH+ogH89n67LSG687iFPe6pF6f8fBQo/c
         9ABPblWDVDQ4q7rxJB/X1kjCUCJd8RtSH6i2CHCf7/GVRInHQXDBantFcrp7GenZdlwG
         eeV5+P03tAdVrC93J3329xA2lPqmEGZFPINxox0EsDuW3H0FaSfIQPvXYPmps9xVNzR7
         RFcyH5WS+K5DJUbLro5iRmzD3jId2V67lF3HfNXWhtCClOO7Ghe22/nl8nlzExnc5wAt
         FaJHXM6wwFBIfDkW6+OJrDLee32KenEwSZK6Pm3Zuw7FYDrvc7dc/zFCYTut+3PlSIiN
         QfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077202; x=1722682002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=WrHSqNjVVkekA8C/Sz97vv7wKVamnV9HUA/+Sip6XkgpWm3KEep7tpymJ1YGqPsEjA
         7JmZDFA9dBfbP6dpm704WdDw0Jm6AzoO/5gn9TCJIMHhQMeMbLSPqSxqqyppVAYRP/JK
         DDGHvOJXD9Q18GipYJE3zVyJvWVmSN+NraHVIU9013DFMtvCcecxSrGL0CuyD7zI+DNW
         xrAi84E5Xrc9VQDKR/27FJEccNnMqW1g+78znCHLtvRjT3c7JLyJUjD2MnfAySZk4DJO
         duqagwCH7RkeiFXrh/mp16cGJmeAu6Eu9oeMCfO/HrSsmmeBynHLBkdpdxjpF55p2Tj/
         WYdw==
X-Forwarded-Encrypted: i=1; AJvYcCVgR1EcwCE7KnNPmzEVBQRHeWOLuc5keoLANIIqBRQCfpPOLEaZAlfF5cIiLE62QPiz/vNJBRzS8vXjjQ1xGubS5b/CUpTZZe/iwbw=
X-Gm-Message-State: AOJu0YxODrnenL5m9zS1sIsTJhJV5IfmK0KUQPeHeJAzDjdXclNDNlK4
	6QpOjiBMsQQxrCkd3JhM4JI9KZikrwLsxwWtpEiTeOEqSo/EGHTPSWVziKKkTgQ=
X-Google-Smtp-Source: AGHT+IEJNsQBjiCy50HzlScOL2HDolaoWtEKLNxWFk06ri5hkBtcRmQ7gig1E9sGyOIgWavI8qXGNw==
X-Received: by 2002:a05:6512:2144:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-5309b2c79fbmr1374032e87.57.1722077201922;
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd11dasm727514e87.85.2024.07.27.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: wsa883x: Use designator array
 initializers for Soundwire ports
Message-ID: <dd7h6dg6uutup4av2dxvmtr6ucxhojmicsfnxoj5y7wtglnuwn@r4u3httvsn63>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:44PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA883X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
