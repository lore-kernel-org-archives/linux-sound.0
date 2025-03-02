Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438421DB933
	for <linux-sound@vger.kernel.org>; Sun,  2 Mar 2025 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903621; cv=none; b=HclVqexSHX5IYq1w/NhM5nsfMt5kZl6vzbGkYWet0tmGkxNmm1iE5VreOr/yVklwuBu+w71M9r4/rgeeEtG1TeVeNriXpRxHMBMw/wk6k3GgDkLd7KqpwAbxOlpvA2jVczbS3C0AKWcmchE1Bxsd+FQb2fL5guaCsGWdmSEQ5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903621; c=relaxed/simple;
	bh=LqSAfv6sV6rOVtb/r74cZp8FOqhM2qtObtu/CEfkeyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXsNglkuoSoghGQL7nx3ypxQ1IX3zd7rt2Am1MPKmv8NDj5TSmg3CafLW6wYuq596WdgDuRzAi1Zj8g2Jphc6nCsoF8mvtYHcJ6fZo3ALX12HVogOTLjhXcmvURo5ItD1sSivF1QuQFc+xRO8X/GaGjo3c4GiCOShnUrOkAJw0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lz9v8jlq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz9v8jlq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54965898051so129858e87.2
        for <linux-sound@vger.kernel.org>; Sun, 02 Mar 2025 00:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740903617; x=1741508417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fdu8h638dVfYIqAfQGe64knL8yNrxRQQc476mt3At4=;
        b=lz9v8jlqFKNLpkN3+3DeByaAdSD1jyd2FPKTdcgiXwyr/td5Sgfiu+pgMQZo001CMR
         4xuFB0sla7XaBVSc0OA8yW99b0yj5Ytkn5wQEZ4o/0mKODAh4o2Cri+f7t1V6qqaTotS
         cPAddTSpsEAczWifLh1bBOEUpUOCpQs7tAHPRyncflrLI2YPnAA9iBf7Kn/wuEZEkAXu
         EY16T3VONd12iHn5qOEZY3jPSRc5nwKG6X1w2FtWbYTtVuRsRRTzpV5dFM98si2CzI4u
         FhDJ816DeZLv7RvLMuNhxIPOejG1okjLyAvqWQ7qetLQGtz3hhqiwaCF/JVNfSLuFgxW
         Hh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740903617; x=1741508417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fdu8h638dVfYIqAfQGe64knL8yNrxRQQc476mt3At4=;
        b=WvidU2WzREW4hYpzXEW+CRD/fTauE4HCBL4ix9CXm6HMar6WI4imIMDGQ8My1OYlG1
         S73Yi1QiJNlSUhCLvsxOsUBoo4mDxnt2bXYoV25UCTilGOEtPwNAMu4CflexWHfjffGB
         Ub74Wha3qklOcWQ/M990GPJLzIbjU/YI/Fro5ZmzTfP3F8q8Id2y4u+9rfZHiGcg1NT9
         RxNtPGkjS6ojp5TvI1C2meOKV6hjDnWHqc30I+wvnuRgSTcKWENSXhKCz2h2Ns+VwLu8
         6fvbCRHCAGeRnSDgYvm3hh/z3ZPH3vD1Aniy3xdDlkmdMISE2a7vVr0+dSEFaGfSJYQ2
         obOA==
X-Forwarded-Encrypted: i=1; AJvYcCXbO2pweP/d8tOtlJiw9iDi9jVIWGVFgOZOW2jXhT8tFBAkjvQO3uJ1/64exgZM7C34tr8+IN68Y4658g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL45ctinSWUsBf/MvS7jHyctf9IMDeyZ66Z2it8yPYfx2GRjX5
	Qi6pr3/5nObLTUe4d6hqLWNFLWKDcq+dAC1nXGT24gHcKMDRkyJDFANlfyvO+Fk=
X-Gm-Gg: ASbGncvttnaTvhQv195E2WRewE17mlpKYIcYYIkcMRevQAYQnV1cd8OaWQgXoOZ9/di
	lggn3u9sPVIsDQ6KFKQkZ7fjTUur6t4oF8DDE1x31SpcV222iD0ovSHkcwA2JBgvrdrkQV2PfJl
	NZi7UeNUD4d4kvQYn1o5ZaH4BTWUD/QlhzmGAP9jWDPPMPXYocFF0sIYC44o1+cvOHzG+5OHq2C
	WygQNQGpF4qJjt+a7x8wcJvTAl6EhFc8o9f7JVj3hZy3XsSdM2ek/rhSPki/lREbz2etfAtKiZQ
	2Ztv/dPuI2Q2POuXbU7rMLMNVA9XnxW6WEQg9WK0HDyIr5fGF/mGjif95M5UiCXIMuIU2JwQ5hS
	XBbdjDD23PW58aeH2NaCbl+/Y
X-Google-Smtp-Source: AGHT+IG6MwRyMAkP0lusijaUUwBA9N6GITEOtr/qCaV5/Ffw5je3hsGzZ5FfyJKo0ZYon/HXdKTf0Q==
X-Received: by 2002:a05:6512:3405:b0:545:746:f36a with SMTP id 2adb3069b0e04-5494c32fac4mr4044874e87.34.1740903617294;
        Sun, 02 Mar 2025 00:20:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495b8eb16asm317095e87.35.2025.03.02.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:20:15 -0800 (PST)
Date: Sun, 2 Mar 2025 10:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290)
 soundcard
Message-ID: <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>

On Sun, Mar 02, 2025 at 02:49:52AM +0000, Alexey Klimov wrote:
> Add soundcard compatible for the soundcard on QRB2210 RB1 platform,
> which at this point seems to be compatible with soundcard on
> QRB4210 RB2 platform.

Is it? The RB1 uses PM4125 for audio output, while RB2 uses WCD codec.

> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index b9e33a7429b0c063dc5f5b806925cd541e546cf6..2493ed99268bf2ff8343020150c2c9aca4262514 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -21,6 +21,10 @@ properties:
>                - lenovo,yoga-c630-sndcard
>                - qcom,db845c-sndcard
>            - const: qcom,sdm845-sndcard
> +      - items:
> +          - enum:
> +              - qcom,qrb2210-rb1-sndcard
> +          - const: qcom,qrb4210-rb2-sndcard
>        - items:
>            - enum:
>                - qcom,sm8550-sndcard
> 
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
