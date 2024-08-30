Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBF16BE0C
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005250; cv=none; b=NLTMR3zCeWn3YW5bytaPnRv4t5t/fAwCsv3J16LCCAAe5gsspVfh4MnxjJ1kpP68oOnItoLQAlpe9DAYh4csFolNke3ATgEYobvS2Qj8bGWF6JDJqA1OFSSEAWaB+qs0gutp0KW2lQtvig7G4PbH5WbzvxK3CVJmEWjkMT8DUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005250; c=relaxed/simple;
	bh=djhJwdPEBClU58p/NBjRr2izhAJvns+9St76RaABT5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uufVZpZEgk8gPRmaAsp+frG57J9kwYdkqgnFcZclqasExzZMOH42Y7rg1NdP9GYe9N7Y3QaOADnr4tEOdASSVEDHUyQvNWI89jC/6g8HbFLkwVFzVXEp2XXr/CZIBt4/LUer5YgHUA0xtcVKWnzyyWuA3Mwk4RVf2zbZxFyxxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JgqgEnA1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JgqgEnA1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3e9fb6ee9so17842161fa.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005247; x=1725610047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=JgqgEnA1GPu7FZrOeNdQmoRqABnpwiHSzp3d7emwxHIRj9Wgnzq6PBGDNmnnBzmYYL
         x3LJwz+R7IBqQ40+k3rKDXrIJ88L3napEvpMBG+7wMkS2FNPZRZXM5omkQn5btl7byXt
         qpIYkacHPwzKEkgCY2knnkHGpf6kJVKT/dt/oq2RMflfVwM+9JDSPAa54gjP6AlAI+aY
         4/8cLkk7IBqihSjKWPzqJcf/8pWJ5uZrRT2yAC/37o6f+43adSwwhD9iEgTnftbJMdbU
         Cw9sfjNnx6ssKHEl3igS+VacFhu7r8gc+Vjq1U5UKET8ln8qTBjtXr/+GHXIM2Itzv1g
         A0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005247; x=1725610047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=NOA4y5tYTZk6Adp8+9D+p7VUUzVnVy/EKUwL4y2Q3juqGUm36+0qvPLMxNGURdFAbr
         WMU1mW0VKgE2mpWV6AdHXqnCTnOeFK4w+J0flQ3aEadh0jSWq5p1t02WrdwBDweQGSiG
         2cO9LG38B7Xhnsv5LJkhubW7rT97SXS/n3vce8/66tAefOHyOBvu0hzUqJgCKmx1GxEh
         nnGBGfKlds/gci45n8JRNHybvlwGNVUx1ADB4MCqSJ+KApa2h8k8frr3amJsJhMAgHG+
         yPbS2gxnK+DgpcBIvyrTpCYEGfgFNf52nTzXVR2Ww9UWWey8JhT+3u9I2jcbrTEkHrMP
         nZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXksXWxSHcD3m1xnFSd924+1heEDMAdz6wrR6PQ2WLftAOIlnLanB0sGWiaXKYKJ5ifXgHv3VKWNnK9Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Cp2mq2WGzJjDtr88YfHt7fPHXFT7h0M3VPsZfSiHbePfVmkw
	Kwxnlb9ZmaC2ajkkkEj7rKukHmuXTwzl05/JCjTvxxFsHAPNDJzoZorFbdc9/9M=
X-Google-Smtp-Source: AGHT+IGLGyFncOCO8wysxVTyS2DCKX0ca/6jgHo5yOoDP9+DIjbDvXHAA6oekjEyFn5hFdhhY5PoUA==
X-Received: by 2002:a2e:701:0:b0:2ef:27ab:40e6 with SMTP id 38308e7fff4ca-2f61055b5d9mr33274671fa.49.1725005246070;
        Fri, 30 Aug 2024 01:07:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f4ac91sm5326961fa.72.2024.08.30.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:07:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:07:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-ID: <rlb53soai6dhhfcnpwmdyqgblsbofngh2ewub6hphh2d43oofy@arcqq7edrm6c>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>

On Fri, Aug 16, 2024 at 10:12:10AM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
> 	- updated commit text to add more details
> 
>  sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
