Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269E2C21F8
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 21:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843318; cv=none; b=nRXSX+/dzylssAkZBlHSHzxEITPer7mFpNgskwktldAxoNKKMILuwjj27bfU4P2ZGzmDvROEu0C/bTIOAQUofT3ZR84hzbcFM69SAjGwrW+7gyvH28rd0eP5mRs8TKFAMCvjgEVvfjeAWM9GkqwADYUzIUWikc4BPQTMXmihI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843318; c=relaxed/simple;
	bh=tYupaspFfCJOfKetalRjhlUYhov1a4SvzMQl0DK1eKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuoFhvmUpFcuQ0OvivXHQ9lcyH8DQdf2SBmvV3n5JU6R7HLVZpRGvNMdzp2rnN3ekC5xoBzBdsVrSX3GgtE2YgRzBVm/68znK8ffdxoR5BV3FxzlSbKhdBIc120kYSwMc6iA17iyYUlpBklcvssEHYqyeOV01gAQwPH6x6cSqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfoeJrbL; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfoeJrbL"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b5232009a6so26153786d6.1
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843316; x=1778448116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=pfoeJrbL62ow0rySpojl1D1gZ8bDjQ9IyT3V8V8+p64iwTmdTKQ+jQ1yz/E9aYW/9J
         gbxcbLcwak3wDgGLZmm8aJplu+Q1gPR7X8Q0uCwalY8LkaVuWfOb/wT4HOp4Jt9v3m+f
         C2tdC7xAMj2oYBxyNL60bya44bFLtuT8tv9A0YxxRXGJnVvdCCSiF4tIQQWvJbd1g0Ds
         gCtTdzei1cJYdh1vOfEtuXn2dMU+VkC03rhyJFC+XKKfZuYj3cpaxbtZRHPxPqPKvh5h
         +kbN4iv1bnVLQBXJU+gaHMuR6UzzIkclsig62I4sNMqyK1SrKJ2G/5SsuAvEONp6v1bB
         Ng8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843316; x=1778448116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=Ml/vDJsth5O2b8pZRBD2flt43iRla1IcC/o8I+IxszuSbZQYSXic3hr12zTOChm6QX
         0E7XLV9fX+phDE4G4fMzZHO98ewv/h+Rtn/UNVvVFtH4gBrJq9zFFD6420TZDqjE8q/l
         gThHi/dvzsjLrmdqI/ERvcjx/vqQdRuDMRtX17VAUv6jZ/Ii39UAt4vcnKGj/EzHUDTh
         w6ySp7/+9STP4QOFIRrsNaTovx6CG+mDCP84jGidzSRgKRJxqiavajTkXepDBUBmIS+t
         h6WxTv54v+ZojXzLf+ZSadqfeOeT14wIALnqEwzNydSWhBqwohgSQFZZTd4uQpt94ifm
         4Atg==
X-Forwarded-Encrypted: i=1; AFNElJ9UYeIBrdVup+q/VMdH0+lJiAqtIay5jBj0KeUUyUfW8lR7LDL+zf4OTQd3BIe27NhBoZ9AvoB72TdmUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH79sLMWNMxPQmjJhOHPytlxzbkOUt0KyE3/CRvinUW1vl9jdn
	gssjnVwN6k/VFU8cc248Kzm09AeRaxom835P+ddAIvK5OWs5byNe+icr
X-Gm-Gg: AeBDievpW0EGXImohoteojtgqyVoqucfjqFhBgYYXcPfKkV5GHd534BhqElJfW79mbO
	bWmiJawCEzCp6sAfg3UCkK/WlYXDmbgTYF7QXmDZ1t0Z4Q9p8OFpOvnZ8m0SqeBnQQwmL4grhpP
	EXrw7tWh7NirAJsfTdvIvTLFZ7W9zTYqjrMwEYgl/jwGnxsmo6wLWMnP2hOTNhGlvV+lQp1yxom
	UwHGjnj/tEZg794OMXz22eczTUlNjpFgrPWZ4/wvl0Qepi5hsud4d8OK/BgnFd4w0LlCQz02Hu1
	9PBdK6HAhvhDzw51aQKXLxpdPbmPAyP8dKViGBYhm4212zxXDWfxhAhoU7eqKc4R/g2iPuFT3pJ
	VcHLrfC3FSeOEUCunSyzxcFZ8CmqPDeGcTJRs8TrYQIYM6nCd5tWJ+4deFBsrUEXHKFoEtUiQR6
	+gFmhLpDpmTqo4NY8jfIuiHI1Y7tAtljazyY3+dtT0BkqeD8NjEnYV+mqF3LMhqzqgx0yzqeTUZ
	qWfVY6QmolqhSrRZXMWfEKgdbY1RRMm8sBZ
X-Received: by 2002:ad4:596b:0:b0:899:f0b1:7332 with SMTP id 6a1803df08f44-8b6687360f3mr139026546d6.32.1777843311331;
        Sun, 03 May 2026 14:21:51 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e34dasm108625546d6.14.2026.05.03.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:21:50 -0700 (PDT)
Date: Sun, 3 May 2026 17:22:38 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add
 PM660L compatible
Message-ID: <afe8nm9VXytzxyxj@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-5-mailingradian@gmail.com>

On Fri, May 01, 2026 at 11:31:17AM -0400, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> index 15389645a3e8..074a20cda89f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> @@ -14,10 +14,16 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8916-wcd-analog-codec
> -      - qcom,pm8950-wcd-analog-codec
> -      - qcom,pm8953-wcd-analog-codec
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pm660l-wcd-analog-codec
> +          - const: qcom,pm8916-wcd-analog-codec

This should be PM8953, since PM660L has the cajon 2.0 codec.
