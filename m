Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299F13B28A
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377532; cv=none; b=r8P6wodaWptfgr924jLUHORFqLqEGCVMh23Snohjwukl3aQ4SwmWB/o0OfFeLY/SPKqACgLqwFFFSeKTp+vJWMzcl13u+i4cICeBnnFtl5FzyNxVrYdxKsOyEfP1EaCMyKgKQifzmy3OKqsz6uAOY5hfhyzmJoL/V4B5vNjijTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377532; c=relaxed/simple;
	bh=YWCP4XS9NCMeFl42NORBvKgAR97zTeSKqwDJJ42RPHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgqO/9lFFuN2Q2zQDz/dQh2NE8/FbrDSC8437PEm+b0YVwVaTf//YK7zZWqc6dHx9koyDV9Y+Jtg+d8eEvNyItBJg2yiUPB0w3pUrKeyMVrxk9SdNE1rxXSOg3BObVekB+hXF3AJVmlAyttXmzuC/73Vff3N5cHmIQLG27xm20M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/czBRDL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/czBRDL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52caebc6137so5897324e87.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 21:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377528; x=1719982328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=q/czBRDLs5jw/8xT8lBWuNpfHypa12ZNozSfjkcI+QTafxcFsOpOL96ib+f41q2DCB
         xFjTeqOqnsHvTOrAp3/PYvuLbqWnYREtesbHwTkYelHB5ExGsD4j2gZsvbydpGb2foFA
         aG/VBac1asieM5Qmu8z+i7u7nZ6WHIl0hBRtDqzurC6n+mbx1QDzveEjtmb+Z1KPiaVB
         Xha00pj93f5hZyB1O63fLaTFncLUqN5dND5ISEdEqtfd1AELeIm2qr0lwjzH5d7AM3ZV
         BBBjSRBQTR9gnsDORNGpePk9O/hDxvWLyLyK9jHX6qB26aR/92zmsq44PJFzwf00A0Ti
         YIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377528; x=1719982328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=dsOJ8W0h6TRkO0tV0OSjjHYeARldZTg6vIfPHX5qv5v/mrfm91pKIrnBTyqr+1nuZG
         lFFNRmEm7nS95lc15UDXSjwcdvDn0dH8JoIo+OYrPTBr6ida2hx0kBieTydIz8XcsUJZ
         JovgeYV6m9whDXO4omYUJLZ4KiIwhu+OUMgq9Npt/4X3uISsHIuulEGfQGD2zu/I3+Pq
         B5MLbQ1vsGlztvpMH7O0urdP6jzPa7YRbCfXDBoG4RXx5vycmQSlOjlqoZKGBAmYbJOy
         RkFbzzPckHCPZTCm79sWAObfu1IDlM3axmTeHFianTKEMxHvzmbZP+sNrumonzgCoSP3
         +Kcg==
X-Forwarded-Encrypted: i=1; AJvYcCUL0AlGtoDTIHWqtaB/nj0+59Le2qPbz7a/0ThZyRJ1+QrZZQDbh5TrPWMmdGcOWbpWPUTzcqsCaDxnMAU0qDRcdG9vEDNQWj79b2c=
X-Gm-Message-State: AOJu0YxpozZCLDP7yhQgliErnv9j2sA/cvQawsNwYPGhOaruKP4QnBCk
	yjW6yc6vdq8TDQx9nWYkg25ArsKsx1ddBAWs0ktRp2vfBxiWZMfNIOwX3izVp1U=
X-Google-Smtp-Source: AGHT+IFZ09iILP6kHgbKBpqNhbwz7AeISIrZ1LRcAxMhjyJ00DcvGAljOBBjtcKB7z+S0JfJ25G87Q==
X-Received: by 2002:ac2:544f:0:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-52ce18644a1mr5111412e87.58.1719377527612;
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd810d633sm1394422e87.165.2024.06.25.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown
 version
Message-ID: <6b4rnvhqnqf2w6kbafceaclri2gq7x7lttusllqswy4nkxzqg7@bqtmns4m3ghs>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>

On Tue, Jun 25, 2024 at 06:57:35PM GMT, Krzysztof Kozlowski wrote:
> Qualcomm LPASS macro codec driver parses registers in order to
> detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
> we know that there are earlier versions and 'enum lpass_codec_version'
> has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
> version, driver will use random value from the stack as the codec
> version.
> 
> Fix it by mapping such cases to an enum of value 0:
> LPASS_CODEC_VERSION_UNKNOWN.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.h | 3 ++-
>  sound/soc/codecs/lpass-va-macro.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
