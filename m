Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BC433C4
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077192; cv=none; b=rIzT2oaORUj5+AwjIWElywTGyMUgFv2lv9CMDWGYDqgnXveNvTQMLi5KwBGZbeMmLERxBWOEXpfnnokJ+aqUxfeu4QwJJBq3++H0iXN0vO0HFaISl8d5ADvTuzYMU2Pr2aYxQOc/zFj2yBYkFY6vcPcg21zE67nrsd0croIj0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077192; c=relaxed/simple;
	bh=fa7kLGj++0G0Eg231uyiEToWORgo2WWIgnIiDtLOJqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAl8F9HScyiJQoAuDiVe2kosbZAoFMC5ZVNBUlDo7BFzSgAf8xEns7an6NEfFWgw3Wkm7koquJr5yPXWI+W9PHfq2M22PW88dGWC/PxbOeqNiRwNZ7bEpEdWGiHF637JmPJqy6S4222AiFrNWpEzCGQ0wg3Mv5pWXDwQxrV9/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zS0aIosM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS0aIosM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f04c29588so3525708e87.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077188; x=1722681988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=zS0aIosMcof1+y4RkLmOh4tKkhirP6S0w7mO1iwPqyPhFbHYI9MctmJqqdEnyF9maq
         4gQEsZGlVBoLKmusjkQ9BrW6cFXDKZZodsT9EKmZA3M3BcJtX7jqVGqQJlWeDUOioRtl
         L46x0+ehiKxIAxSd+gLEd/07j58ZkRfKubhon77diGL2iy0SqO3VDDSq4UYCG6xXDjML
         /y/cefwqOn1rR/8tHR3NQ9h4mnfxqt21uQ+OM5iRwjsP7h5O+jyUpWUTaM0zPi0BEZGC
         CNRUnO6oee+pR/+ZdoAYV4okoOxWrT/zpQ1MBW9h1PW0tMpji3Ywr7V6GPJx4GqmYYVj
         jnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077188; x=1722681988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=JDDm0/BgIpmiDuUbDcme2TJaD1+YvOq8N7y58LeRDUmJjHlvbPtYYV0dEbAteru8/K
         1hEwIMQSu3QHjtVNYPFUnL7rK4qADqFsVSa5iSCB7hTAipcVuiERv0LZYHny3obn1W0i
         B4onb2OCkMQ+7v8NrJbsail+dPuwk9UwTP4VGwdLDM3e6dRdXYrV43lCr1p8wAWD827P
         mVfAkHZvWdYlIwWa3gBr5rB5aN5W1nJayikCmH5RpK5uwKWEMeCcyzvIlPiNXfCYIetq
         DB2N4k9o4feMWg+ZdRMywMk9+61NPWP71THQfY7e37z0uhu5hFF77VKupiHI0DI8Mgs7
         uOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsmgWtppabAmWWhuRupi9U9oN0yhMOwngoSMwxqme8erjXs9+scn3uZfO0siCk4lWxPbD3gLmHY0Hpj6yN593oPn+1Pfhg5sS8NY4=
X-Gm-Message-State: AOJu0YwxPKRW+zmpkO+85uo891XyN0TgSi+8djflVOr+AbdHry1ykWhF
	LGMkX4lzMOLEsUcmuchfAyeguBxfNE66+9xFAhUYxDo9eWdYY2Rq3sKJMfwTJW0=
X-Google-Smtp-Source: AGHT+IGGP1B2SaB4xulY6ueyuAVpyf5RWWcSGeN89eSnIuMZurceJMYLWHdDgl7Jret0zGlTBndyrg==
X-Received: by 2002:a05:6512:128b:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-5309b2ce92dmr1450181e87.54.1722077188458;
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09109sm729450e87.178.2024.07.27.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: codecs: wsa881x: Use designator array
 initializers for Soundwire ports
Message-ID: <bsnfiskyvzf2zrsarek47irjmt3feqyqxi5b6s7zbanagkh7dl@yhqpncgaxgtv>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:43PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA881X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
