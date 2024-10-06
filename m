Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789BB16F0EB
	for <linux-sound@vger.kernel.org>; Sun,  6 Oct 2024 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246610; cv=none; b=o2m5gm0qVvz8jCFVUT+kIaB8j83w/r1LFKoR68/TnHkLzXw6I9/GdcSyiRX3Iv67Wt7cnV4RdkUSXYh4ynl6umEn/pGAcNQHhRUyCt+m/E+58kcU4ORk/5YLH/OCbjDbyhl1Fz0hMVcAT2gXc1+JDB6w0K1rRAcSC3PSHM2TgMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246610; c=relaxed/simple;
	bh=4c9+KGTiwcO0wZGDXDgLt2CmDO69Os6Wz+W7uBwFA0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZNoJzJMZER8hJpdzhJ16xM5K9E6X1NY6u7+Yuy+ygOtHMi2GvUtczibxKd/OnHc0D5G7nM7fXlynNZbDJMyv5jKlG0RWEW+vYhOSrYQ3trYwhUjjIOh8+0OeMF71fYtdvUHj2HnsJWlaIqezIgj/F4zikcIt5PYcob4Vh8vMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3wH7NXz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3wH7NXz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539983beb19so4534527e87.3
        for <linux-sound@vger.kernel.org>; Sun, 06 Oct 2024 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246606; x=1728851406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=m3wH7NXzobZilQHuzZEz7wZDnUkbBUDS0zanFobg9gzHDsMiAO5VTczdlcZ7boeEO+
         CYoEvy6EabXKwgfnK8gAwUc2sWaQmT1sF4wssY3rEae9+IF5KX2Ar+WJFQHn16fxueU7
         K8TaAiS6r2UcjqZ44gn9MSidgsCQeryPqhOACa1j5/ll3fNFrGTVUMQl5C1WgWl0nBXI
         rZ8f99mjRrz2KRgnOCF0bdZY6raUjerxupFbwUjkQWlvSTAWEZpS8J6877NyP7+4wD8+
         sLdmPpxp234iujQgKTadUgtwOkvffadLdQR+wgxBJgGeUv3Jn/nnTDjayMgw/ygC3j5L
         wfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246606; x=1728851406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=P1vgEhMVXcXoNQ1+Ccvl6jnjQwUJbK2/1dEzpOmufKH8mgjg89DJAjfKtpyAsEvGVu
         wWemwwexTwLEqSmD2p5d3MoI1cTemDccImFaUo2LijHefedG/R3VQm3mIKN4BLoXv2DQ
         IeOomo4inWLXnDpx4mQ68X6iMe/Tz5kWRWmBGiIMg2MVsBPdr/e0uRcYsVKnjNaKRc5Q
         sfh1wF0ev49vNcWcdDLTyL9ine1UOXUIvw4cZoOLZUfqErkSM3GWaxXvwNJd4+33wgGe
         ONyT0KcQ9CsdGfYnZT9SHDWoc/cpjyOBRJ8LxTHfhekEzM7HjX7f8/XXR7OxYUikXzK7
         7QqQ==
X-Gm-Message-State: AOJu0YwApO4snEDU+qyIwL/PyNwEbKJVt4QJYDfgO67FjT4rfNn6z7dL
	/0LX+LnU1QKCIwg34ZUV6IGO5oGbgQy53ekO6TciJVBe6bfBSUjKm5nrfWyNHhkd6bkOXExo9Nu
	Q3xwz9Szy
X-Google-Smtp-Source: AGHT+IHGm8iXDV3xjDyilH88qj9I+HIKb78i59wZamBlD9e+iLmpZqrH0JJkihn3M1K3x9pCGJ9pwQ==
X-Received: by 2002:a05:6512:33d2:b0:539:9e9d:18b5 with SMTP id 2adb3069b0e04-539ab86655fmr4313110e87.21.1728246605637;
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff27a3fsm610809e87.246.2024.10.06.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard
 compatible string
Message-ID: <b6was3uqd4vcs5dsu556xkbsqodqfp75vhtvclzokpzuvbqjw5@q7f2nfvdxpdb>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-3-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-3-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:10AM GMT, Alexey Klimov wrote:
> Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
> devices.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
