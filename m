Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983822258E
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467887; cv=none; b=BDdTA1jOqWDreSt9gcxd05MQueOxHqqavAJXgs6hN51OQRyphi9MVLCnOeVyJKldc1lZ2rOsze7T+NSwBbwUVkYpTGACXB9wyo8ynCNHwYrRlCNNlKXbZmzjj+WCuunN5r0o/sHKlqg7f5ElfkMXkIkNcpRrtNQSMnvtlf6Q8so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467887; c=relaxed/simple;
	bh=L1U+bcSW7YBmAkqow20Q/7C4mb141BejkLwPN0H1D8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mprpSNW502df6bKOf/1+7kjcteDxLbfYjCiWX3QVPImhjnNc5mLLTuJ4hMHUOFXk8JGSsMntTdG9BJz3QBmA5tJCF/iBmJi33dcKm6UGhFRPxWXlTicB/ZFM5fKlggh82LE/RtOj9ugUCizjtxkyswhnOAZXKtgLpZr8jSI1RFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUA56aLu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUA56aLu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3927705e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742467884; x=1743072684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKb0bPBVVY6/KTAskiDvg6ejT22LGD+C1zdwso8I9VI=;
        b=CUA56aLuBpZFj0k+V9oJWMoj375kPA0vDUBw0Mo/aPm228+mwu74FL/xXIUqk6pZsW
         BSKZLFKMR4mF07QT/P4B6ctNop0lvj8W7yp3CImsxC298B+t8OMbIoVxcgqk8nd7MeQU
         3NUGGwsPF4shPPvnxWyIr5IFT+2yx+MGLfSSHOIkBKxc4XzdUwSv0n7QFEHkaAgw6dgF
         dN2Db2FMJpUez/HF1QPVun6l+s7w0+SFCGKihy3b+vadaYxD8/wRN6NuagHGgHSJAtxT
         TGwTcXZS7QxOOVzPEOY+b58aehoQtEgK//diul/LGtNNRVDyuNTvTTNLh9ypvDDYT6A+
         i0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467884; x=1743072684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKb0bPBVVY6/KTAskiDvg6ejT22LGD+C1zdwso8I9VI=;
        b=t76ImUuGAxmlIUELB6L9Vi75Spjf4bjh99OsOdOmpR5Mz+jRaxXUWLtNIzqv7JyZc+
         iLRjOnVZqik2obT6AItknY3gIvwfZPiS0Is5oXFHWQ+g40WOqMfwhTb/yKQkuY0utLNt
         i7H1YhYUPku8uuL6WIqRb/bkM7neiEtvQpeAGziwtMz5oXXxmEwH0bhV6Tb0nEXPwhls
         qA5AgFkk/IwBCDl+bHZaqdi7vpmO1YeN8sK/i47t0sdBIf0iOQ6b/riz41kkJXwUHP+O
         V3yBeUW+F26jU1T5/PWXp7++Ayg6oWGyROV0AXulpaq2cTVbHAD5DIoMdxA9ZlA5KNpt
         gQbg==
X-Forwarded-Encrypted: i=1; AJvYcCVrll107UklzJTM75F6vWHMV+ZhIEQRYxbrgPKv8QEXJLJYIelcR9fP2dfNLOSqhhOIEUr9vcc7dM1V2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQyywELgE5fDpwfbeTa8JK7eXC1YVf8itiXHwMD+T6hSejrbM
	bMhy0WDbwohAAmlD317VWHj3dUCCzGQ4D9Ac2LRl0Gfm+yezCBqLZdcJuRsjbcI=
X-Gm-Gg: ASbGncufHbBdoqJtM3f4jlsNV94jKKR/a0IUDndBhxx3x7OwjQ3KAtuA/vOdpOo7AdL
	fHjlExnphzEAy5pcXJyZd8jshO3+B9oeUr7Lwo1TsjH+QKjHO4qTLTYFz6AyAFPM4ydfQY6INAa
	ee9WOcJzqrn070FBC8P5PwDZrRfTRwCwVjSRLDrrL1+0pk3dInP4VMp6uOillrX9LVMPL89K/s5
	pl+wRe/t32cgEE/Jujz1k8I8Js9vD0eaSKF6ZH/iQkjS4HV5Wg41UTf9Wrw9b0kyn93ROlYxhC9
	Dw5VovW01waEWspb3zQJbyEYfRmqz7u2wIzznsH7OPi7xU+CofSBMO2bYPBDAzGVxMC+KRjWjQ=
	=
X-Google-Smtp-Source: AGHT+IF5aG2ScR9F02Ij63Lszxbdolrxhc9/khSjeWGnACxp6gXIdgu3JK1Wfic3Xr2VhHMhTlyaIg==
X-Received: by 2002:a05:600c:3556:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d437c2dc4mr56164285e9.18.1742467884219;
        Thu, 20 Mar 2025 03:51:24 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d440ed793sm44630255e9.39.2025.03.20.03.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:51:23 -0700 (PDT)
Message-ID: <e14e31e0-1621-4fc6-a356-261810c2ddcc@linaro.org>
Date: Thu, 20 Mar 2025 10:51:23 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org,
 lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz, tiwai@suse.com,
 dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
 <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
 <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
 <938cb09f-3fb1-4daf-802d-2d95222f30db@linaro.org>
 <20250320-feathered-super-walrus-8eeef8@krzk-bin>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250320-feathered-super-walrus-8eeef8@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/03/2025 09:31, Krzysztof Kozlowski wrote:
> On Wed, Mar 19, 2025 at 06:00:51PM +0000, Srinivas Kandagatla wrote:
>>
>>
>> On 19/03/2025 16:03, Mark Brown wrote:
>>> On Wed, Mar 19, 2025 at 03:59:23PM +0000, Srinivas Kandagatla wrote:
>>>> On 19/03/2025 10:01, Dmitry Baryshkov wrote:
>>>
>>>>> Is this regulator supplying the codec or some external component? In the
>>>>> latter case it's likely that it should not be a part of WCD bindings.
>>>
>>>> This is regulator powering a mux that is driven by gpio which is part of
>>>> codec binding. So I would assume this will fall into the codec.
>>>
>>>> Where would we fit this if not part of codec?
>>>
>>>> Unless we mark this regulator as always on.
>>>
>>> I would expect that the mux would appear in the DT and consume both the
>>> GPIO and the regulator.
>> Yes, its doable, so we would endup with a mux driver consuming regulator and
>> gpio and move the gpio handling in codec to move to use mux control.
>>
>> Let met try that and see how it looks like.
> 
> Looking at schematics this is clearly not a supply of a codec, but as
> Dmitry said, separate switch. Actually two switches.

AFAIU, Adding single mux for both seems to be the best option.
Eventhough physically they are two muxes but they can not be driven 
independently, and logically/functionally they are doing only one thing 
of handing us/euro headset.


But if we represent these two muxes as two different nodes then the 
driver is messed up, as all the resources (gpios. pinctrls, regultors) 
will be shared and we can not control them independently.



thanks,
Srini
> 
> Best regards,
> Krzysztof
> 
