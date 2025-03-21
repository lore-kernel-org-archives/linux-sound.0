Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365422A81F
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563609; cv=none; b=qk4hHGElxGU58cPHHqflW7HV/s6gTekKscX+/zgSWSrfTTqRhYB6NIR6B6Qfb8r7rLkWPeughF1TbsaRRFNfAcjEZdtDmcGBPrSbJjJLBmz3UWij57YdMy9eerrFJcbhh/ndL4+HtVhmys4whfLh5mLtzc/s4w/9sjp+jJMEgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563609; c=relaxed/simple;
	bh=xMeqGv/jZySimNc6vELEg0wI4OT6OHTVxuOS/HRWpzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEJp3TW0f9xxRDTSZgeDdAo0y7/hwrKryuDzCXRTbMs+GUNenrE8CsrDnr0sjOK/lBaJxpACp968U/6y0PQyGr247adbM38DjA6qZgt2B6n+a2UfRSsY5JF8hA9DiO1UXSyhmEi61egr3djmHMA9YZyoLRk2ze1KMuKXKSKV7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biNfksZS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biNfksZS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912c09be7dso1271296f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563606; x=1743168406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+nfdqXMXDIXPRHZvpsBbeClbsVJF3/i4egLlwdwO+s=;
        b=biNfksZSvhyJhkN3QGe/C7UTbAt09uwc8cwvp2Y6ZEhKEC8sIJjyhkaZublPCme9cc
         4VkG+kD3NjeqI1WeYcYx7iK03nFz96JmEe/l0FFtl3WqhUraZ2HhyF5tHJ/PcLEkgNOZ
         Lrm1SbYlkdeJJHzn1EuU6yx7IlObdv/x7p7XfyJXafSAMbaECbp2R1SPtmdjC6xFwdmF
         IFzt2uEzaOUFyH2gh+kWeP981x8KvfdVyZ9/NwNLaKEON9J0L0RuLe7Cevka1JmRkBgy
         TzRHdUEzGByVmtEnwzc3LoYJJaFrS09R3mHWkpZIsKD5ep/T4S1dnn8k8KWTCrsnfUOo
         mM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563606; x=1743168406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+nfdqXMXDIXPRHZvpsBbeClbsVJF3/i4egLlwdwO+s=;
        b=H/dagdaVvMazodUtlxK0vOXJyzjIIYvhOs/qxhy+/AQLdMW8x+7IQ/sGC5cm2FnWUL
         rpj9vUUCae7MLLnzKe2MW/jl7Or7FK8JdF6xm/xwFxz7Q48NyeXjt8FX5d1XpM9xhOjJ
         zgJAkBEqnaW64B7gvIvYOx1cT1AGjkIRnkAFbjHosnQsoBQvo25a2KY69gkiYHy1hgeP
         DNwSpJWeKwv1MK+QzaV2h1L9km/Ceq2SuF9BD1ljxWg7nDeiTy4iJq9fp3Fy4fyB5Fn9
         8HPmvJOs2/W6d0epcJkBHYfjVNZmApqsQqqEf8CAFCSexepL/3D9tcz8bT/9Rkd/3fMv
         SbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSwcg7zOOhi8G5e0zgh9DFOSJcRYNRNdNkX0w35XFg1WgnwNwzrBzsHndg62gO8aaDyY5AmjkI0ZHTdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zo5M9ZNSavY6DePNkUxoVNVeanBYUkF5OBD0ZbEyxhvzL8Sz
	fMgWriJHsSrntokHyRF7Vw+Kn97iFVBLYc7SbKyC70B6jRLzso6FYyWFLfHcb6I=
X-Gm-Gg: ASbGncs6bMD+4uYKicRjD/UW9gLuXAhC33lszZm+RHSvzEiF3DGoNeGrEucJMgJqCtz
	C/6S8VSgMHO8zKUj0/g7+fTaWZ0qpKvHQ7Ge3k8fXPsBme54lj9AaVKaSjEbca0hM6/DWgtxrK0
	11KC+0/SCeo/l718wcofWYGGYWM+x9mUuxN2i2BykhKYULlD0Jooy8edcwdMUvy5nakVXP9WI0u
	4kpa684PpkoFSVoLO+o3HNLieDEDx/kFiLXRr/EdnKi6ppxpjtZCRH6iBbEaVYLIanjhaWU483e
	L1KO+8Hg8+NVNsavcqnxvox5PttN2J2puzEtq9tRCqnoOqrC2dLbNT1vkIm/Y5L3A3MK/+PTqg=
	=
X-Google-Smtp-Source: AGHT+IFItBfdiuwTpyaV5kuTi/ldTSC9Nx5SxBw7qLGhnUVc61bpqSJwTkGLSn5VdoJA25gliLrfGQ==
X-Received: by 2002:a5d:588e:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3997f90e00cmr2957330f8f.29.1742563606193;
        Fri, 21 Mar 2025 06:26:46 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f81sm2419531f8f.35.2025.03.21.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 06:26:45 -0700 (PDT)
Message-ID: <1d93f731-66c1-47b2-a249-9bdb25205525@linaro.org>
Date: Fri, 21 Mar 2025 13:26:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
 <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
 <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
 <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/03/2025 13:16, Dmitry Baryshkov wrote:
> On Fri, 21 Mar 2025 at 14:35, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 20/03/2025 14:03, Dmitry Baryshkov wrote:
>>> On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>
>>>> On some platforms to minimise pop and click during switching between
>>>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>>>> case is that this switch is switched on by default, but on some
>>>> platforms this needs a regulator enable.
>>>>
>>>> move to using mux control to enable both regulator and handle gpios,
>>>> deprecate the usage of gpio.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    sound/soc/codecs/Kconfig   |  2 ++
>>>>    sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
>>>>    2 files changed, 32 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>>>> index ee35f3aa5521..b04076282c8b 100644
>>>> --- a/sound/soc/codecs/Kconfig
>>>> +++ b/sound/soc/codecs/Kconfig
>>>> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
>>>>       tristate
>>>>       depends on SOUNDWIRE || !SOUNDWIRE
>>>>       select SND_SOC_WCD_CLASSH
>>>> +    select MULTIPLEXER
>>>> +    imply MUX_GPIO
>>>
>>> Why? This is true for a particular platform, isn't it?
>>
>> We want to move the codec to use gpio mux instead of using gpios directly
>>
>> So this become codec specific, rather than platform.
> 
> Not quite. "select MULTIPLEXER" is correct and is not questionable.
> I'm asking about the MUX_GPIO. The codec itself has nothing to do with
> the board using _GPIO_ to switch 4-pin modes. It is a board-level
> decision. A board can use an I2C-controlled MUX instead. I'd say, that
> at least you should describe rationale for this `imply` clause in the
> commit message.

I agree to you point, but historically in this case us/euro selection is 
only driven by gpio. But I see no harm in moving the MUX_GPIO dependency 
to machine driver KConfigs.

Will fix this in v3.

thanks,
Srini
> 
