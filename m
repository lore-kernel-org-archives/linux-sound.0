Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C839FFD
	for <linux-sound@vger.kernel.org>; Fri, 29 Mar 2024 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711737561; cv=none; b=bxGZ2jXrFds9az9D6iq4Zrwa0JiqhJugb8+gQp9VUdH64fhgcxw1ZO6Y0zvWpFxucdJOUJV9pZG6ycHExQ76V/Cj8SE3GmzsodfZtPRDFZ+R/V1KPwoVQiQbTSeG9d+4CvTm4GzRNBgAnKuNHVBV6dDVvoCVxdBrZo1k+J/PHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711737561; c=relaxed/simple;
	bh=qw+LyXS4Jxo0zDRbwxDiYKHnX2Jw5hLsTZxGE8VC8ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQCWHJwRkDG0nMryrJguu1U4Hd4r405b8tf4wDFD57bRAywnj87OfT8Acy4F7CfWWZtN130NvYSQhyu8NXOlriJ1REoWFSrgQWkPIawn6d03zKhXnE2pmVJlU/i7nrZp08Q1sJg9wG+Il9FFKTki0BSwR0XSzwhxnibVW2AwGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKZOYBAW; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKZOYBAW"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-614555c384eso5593227b3.1
        for <linux-sound@vger.kernel.org>; Fri, 29 Mar 2024 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711737559; x=1712342359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=VKZOYBAWIFzcgAl+/tnYagcx8bjcRV0nljVD0rIR7EV/k2KcqNWxuur0Bdy1NN0Agu
         a0tLFRvQsZxz9AGE5LwZl5rxPCIbyN8NQe1VeuzY49LOzfbuVLxLu/+xv2wiurPqhvmn
         AJdu24FYZUHT061l9qKyiwyPdt3QVpQCyut72E41oYChQT2wrfaf6P629rSscBBXtalT
         5O/QaBwA9uzmazKMStkXoxbozwmfwav2ADcNCSJtaZVZwMiC9uDUDnQ1+AceYL8BSy73
         yo2KLvs3coj/r0+eC313LBG2X7Ny3S2o9rImIMoLLii2eMd80bZF+UT4PPwaLAk/nrkk
         eKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711737559; x=1712342359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=O+99bqeM7GgrycmcY/F6eThRN51V8qgFf+i367GnR6nciFFKJCsj4peuKMTlKtB0J8
         gCtO1n3Yjf3Oeovyu/ZbE66ng4Mrv+oF8vWHNNbT70PzSEe7/iiRwo0f2krpPctueSqB
         Eq2zGiTMaupoFLQ2I4VfC79iAK69GH1OZGG1wv355ktBJZHXBUWRpibV7vdxZSPrzhQn
         iQXD4nQGxai75szvX1m2U1Zr6A1up7O16nSEOvgDYfoAsL3w3vdhvrYeTv5Mla0dmwpP
         Lz1Y/uQGtBwJuultYU4nueADQvvyTTKDErbJMUEVpp3+zYmP01S4SrrEB4eHGwI0dUfJ
         lj1w==
X-Forwarded-Encrypted: i=1; AJvYcCXK2Z03QWcZhIMbvyiHZ3KzWGNkG9WvxClb0QP65I4j7+Tfk2z2g++zb928XZF4IqCARvd7vojQOoLBlEtTLKQkMle/IQAKMC6arrA=
X-Gm-Message-State: AOJu0YygvQi0Bhoxi0u32NCy1Ovp6dkdP9e8NIqmPFA4t1CWEQgux68n
	Hchi+H18szXJalbjOw/BvRv3yFyAzsjAeQzW+fYejYueie7mS9QSbeDajWECuaz0lhpb6V5wnFM
	fyGR8DCvUbtbtcbDwyaBpRO64x8Lik1SUrCMaBA==
X-Google-Smtp-Source: AGHT+IG6LHCIDykcmLA6i5jn5Wvc80VbM5tLJ6fDDXX2T5HcQwx31rikXyypNkMk6YErFbMKbGLu3vNXn1mOcGtZ810=
X-Received: by 2002:a25:f622:0:b0:dd0:972b:d218 with SMTP id
 t34-20020a25f622000000b00dd0972bd218mr3373650ybd.41.1711737559195; Fri, 29
 Mar 2024 11:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com> <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
In-Reply-To: <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 20:39:08 +0200
Message-ID: <CAA8EJprLB6+i4H5tK9LbJYOEH8v9QF78u-+HMmqPqfpvz5J8zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com, 
	quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 29 Mar 2024 at 17:20, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
>
> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>
> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:

Please turn off HTML mail composition and never ever send HTML email
to OSS mailing lists.
Now quotation levels are broken...

>
> Add machine driver for qcm6490 SoC.
>
> This initial supports which includes WSA883x Speakers with onboard DMIC
> connected to internal LPASS codec via VA macros respectively and also
> WCD937x based headset.
>
> Add compatible for sound card on Qualcomm qcs6490 boards.
>
> Granted that qcm6490 is similar to sc7280, is there any reason why you
> can not use one of the existing sound card drivers? Like sc7280.c or
> sc8280xp.c?
>
> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires additional machine driver modification.
>
> Example : Required new DAPM widget change in machine driver for MI2S interface which is specific to qcs6490/qcm6490.
>
> So, using new qcm6490 machine driver.
>
> Will try to use existing sc8280xp.c machine driver.

What about sc7280? In the end, qcm6490 is sc7280 with different firmware / spin.


-- 
With best wishes
Dmitry
