Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8EE1E832C
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407256; cv=none; b=rx5ymIB67ndhmYuGe+vOMdJ5es/NymI2MbmAg9JVzouk1TEUXY8xOsIH8aBlJ4Te+xFro7C5+Tw2dxyZgKIThI79vUIYN0XslQeVXibdOLFts4SR5xgJb7abBURpCCAo4ikMmuSsSgNCt2Brtgj2NyGk6Zt9568AFEf8Su8/ZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407256; c=relaxed/simple;
	bh=MyGuRyQlDt+foSD6CeJddJn3OL0fjbCOG+6NlRxWHHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acG0XuV1FyYgTrxeMeyk2e7SG0Lo9qZJwNQmXmrq6ceAPEq0ISpR+cgWnpdxEyzFg+xI1SXXnbCs5hXBeSFKm8QX6KIlbKqZriQW2QE0/npXr9yX1uxE+oCmYDh7tb2l7+WTaex1IUSeQ08xHRreV87qNYIUs+Fw9qTmzNokqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IaVVn3EJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IaVVn3EJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso35174605e9.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742407253; x=1743012053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rEfxvBCDj+OUf6/+Bbrxfwwkqzx6X/wza22OdnfwyY=;
        b=IaVVn3EJ07saxjGiHiWtvGjXIF/qaa3WjClDBp6ylHibk4GkapEP+mybG6d1sDf6Dx
         KxPmFfnTzHnbrW8rGvo4LTexhNVDI1MR5FPvcg5Auxike2KywKBf3nuA/kREU7L84fk5
         6l+sy9jDzedPo/5ghDrqZNNVCwEb04nF3lyZXv1d3M6PqXBwXeS4/9JzU+2aSa9/258e
         TQhNAFFNs9ClowK7BRpJ7yjcOGh3YhL5OjJQW2BQLK/44maAkkt9zrGXb3bYlOZeRPOg
         C5GxSCoa2OMpiN70ZY5H5KO4tB+E99z/wO/vi2h7Xwv9+cmCLmYSm3HSqr5YGG8LM5IE
         m6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742407253; x=1743012053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rEfxvBCDj+OUf6/+Bbrxfwwkqzx6X/wza22OdnfwyY=;
        b=j+LeP5aty7+vfzNwo7zB0ES3QZ5OHhvCRQqZm3cZ3P+Dl6PCg2jCIATp1+KisKc8uD
         ZMsneAt8+ucRbfzkBk9uS+Eo8VKFHeMfbkkiNHoQlxEfz7slcFdgKynnfrCtP5Vd/Jox
         VZSMD6c4pQUvvZHjiIjupyoxSMNDzC6G557+t3eW7cs+7Px97qPYOzXwQFXHXb4uYhtv
         GNoXOXQj8n/10dVWgF5jtjX5eRVaYqISrFbZ59RIXEz2jxZPYDjs93FS3IqmPYiNZyRD
         tpv9GOn22F4ybh9/Lq7tkUUtl03C4aSZTdKt+wqakXUo1f/NylXq3JdIfVdHvD+jPw3o
         SwGg==
X-Forwarded-Encrypted: i=1; AJvYcCVxvUHhfESWzsbaiQl/Y6f11GSmpiQ9KFrGGSuvb2a7lkWyQPi1269d39YA3lyGDQxnqFsckA52CfbFRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyesah2RFsLvmqe06EFuj7wlAg0rGsYrcqGc9wkXl8/XValucOP
	e+nydE7dZbKv4PERTDNrvaXDIsjYJo1MJmlIwVXilfmCgfl7Ge7LnTEOEKmCuYo=
X-Gm-Gg: ASbGnct8sFXZdNgi3TVDsSK4BgRFmzswh+VI5m9PWfLBwvHt8TKRm4gFRQ7smE/5SIS
	8JNakk/nvOBQWFZynj3JmMkg5LMyYU4dndgePywsEiwz24fyTrh18KWvul0jSDvyQp+yreKasZa
	OAfHl65Wx71gVOppZkF36WA0eYbeHOK9V+H0rXOn9X3bvtrGK8V1sIY6FL8PcdiSYCkpzBV7kie
	4afcluqs8MlKuT8P2SEdn/t51Gjpi8Lcyumn5NONudn7wCZAr8wsxL7po5AFfxTiCkn3bKxdHNa
	vetmVXP5bI+NeSQRnQgh3iVSuxKvmbjDkbuPGYi/l5hcvomiWPsj6YYIkiFn0pE=
X-Google-Smtp-Source: AGHT+IFbFV/3Qs4DOHIi0NIjAkZVN8cQrhEL50TvwHlsiVaJpE49IvMubk5v6WpuWc3f92V/RIBWeA==
X-Received: by 2002:a05:600c:4208:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43d46deb26dmr19657885e9.12.1742407252904;
        Wed, 19 Mar 2025 11:00:52 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbb7sm22140437f8f.92.2025.03.19.11.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:00:52 -0700 (PDT)
Message-ID: <938cb09f-3fb1-4daf-802d-2d95222f30db@linaro.org>
Date: Wed, 19 Mar 2025 18:00:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 andersson@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
 <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
 <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/03/2025 16:03, Mark Brown wrote:
> On Wed, Mar 19, 2025 at 03:59:23PM +0000, Srinivas Kandagatla wrote:
>> On 19/03/2025 10:01, Dmitry Baryshkov wrote:
> 
>>> Is this regulator supplying the codec or some external component? In the
>>> latter case it's likely that it should not be a part of WCD bindings.
> 
>> This is regulator powering a mux that is driven by gpio which is part of
>> codec binding. So I would assume this will fall into the codec.
> 
>> Where would we fit this if not part of codec?
> 
>> Unless we mark this regulator as always on.
> 
> I would expect that the mux would appear in the DT and consume both the
> GPIO and the regulator.
Yes, its doable, so we would endup with a mux driver consuming regulator 
and gpio and move the gpio handling in codec to move to use mux control.

Let met try that and see how it looks like.

--srini

