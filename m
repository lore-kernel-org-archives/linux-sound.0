Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5201332B0
	for <linux-sound@vger.kernel.org>; Tue, 23 Apr 2024 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877556; cv=none; b=eHwNW2rItOjjn5Tp1tbjFWI+RC+Mdub8Xx47qvBKr57lqffvpDnapRlLzxdzE+AyLkQq8KLqstwqyflDYEYDaSQIRzP3ZFPxeqw3QKvWqnbllelfEPo8KbavcQMl2eUZGr2lB6dzMLXFKQvtUDX3llBh5DkfkAWN3mmSr/BJFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877556; c=relaxed/simple;
	bh=5A2UR8bAkghWUWUfYypbaxzizbaVYfwCvDQzO4rNSP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6Vbhf24EUrIXcjsJ9oA0Vk8tEkd35LgvIb+gm0qz1M5a94BPwaPE3WwP5mFOPj1ni3hUtn33FwHmpbcSRtE62Nd9LtLSbSAc7UXUsl6Zx/+KW5ZOjnoAUKa31GkRESKPOiKH0AW1q0zEqH5U9fM1aX93Umx1Ft/fXwKb6lSH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmwV2cAI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmwV2cAI"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so5681497e87.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Apr 2024 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713877553; x=1714482353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ehJp8IGQP8Qz6G2XT2Fya++YL6jKhQgUh1xIVBOWrI=;
        b=gmwV2cAI0ANBK8V2A7Z6NfGtNzNhdoLKcI+/txt7g7M9Jrcof+wo0f0chHaXUZyZPR
         epGusd5h5V1hVkPpPaWD5N7/jc6lEMTSjzz4pATgneDXPCJnhDMDH5t8oka5fRA2L3Ei
         fM/EdSMVtbiZ/ckO+1c3NBB53Au/Ws6I1D+PDWdthjBnliqJQgT5QGVEr0XBBcaDKYDg
         5XuXxFLzh+s8jmh4ZONw0dgeAM6CfcmtEQNwnE4D7nz5du/aAd9Td32e/XuSfRXlDOTw
         vMy7CJO1mMucMgfp1tTfurPhjDyquQqlrv+/FKr6CkmFoqTOU4Dr1qtJZ5YjdptDGD5b
         vCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877553; x=1714482353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ehJp8IGQP8Qz6G2XT2Fya++YL6jKhQgUh1xIVBOWrI=;
        b=CcxdtLnpzw850p+1KbcPa8Bt9Rch95dkw531qOO59yvc512KY4m5FKJAvoGzCFC9FU
         IlIf1pbGPF/TmxDsK2xNbvLJ8MqswIn+/tNDhTnSpQKLzwqz9PwTsSMU/fJfxanoTs6H
         Aesd289PR5SMU5U49nvbcCtMD3pRapk0zwWn+wcMzd/+Gy45TcLJkv+PXnPEu7pX8xGG
         CcTIspQTu7b2dYEftNkqbG9N6XUDv/bSdm2YImg8Y3DxSE3qpqXRW1uANBRO56GYhJwP
         cxcccLY8dnUc4Gvwvk1LeJLJIbClOiorrMQecoJgne/L18i4dPRWNjDt2LnqQBVMpkgn
         6fEg==
X-Forwarded-Encrypted: i=1; AJvYcCXckbuGbnmUwE5g8rJHM+Oqi1GTEX/UyWsd4BYVV38vPTHqngokxRBm+w1klrhvzN9ym03G4ffBHwAZciiPZAhrDxxz1uWFuhQKpcs=
X-Gm-Message-State: AOJu0YyZDj97CjVoDFqtiMEnJplOdRjv49DczotI88wRdMjTDs7VXtdN
	Fo9TQxA+mkn5bEGShxDDij4tKFitlGbx3d2y7Ij5N5PTJLDDjIPqdlL7fd79J9I=
X-Google-Smtp-Source: AGHT+IENCG+XV+ZCFF5kX7q625s4qkEBma4kX9+9/15z/8XLIss/sw3nHGITXHXQKBO7wKPP3HP5RA==
X-Received: by 2002:a05:6512:74b:b0:518:be31:9c33 with SMTP id c11-20020a056512074b00b00518be319c33mr8152823lfs.55.1713877553046;
        Tue, 23 Apr 2024 06:05:53 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id ep6-20020a056512484600b00519609524b4sm2008216lfb.69.2024.04.23.06.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:05:52 -0700 (PDT)
Message-ID: <330dd13e-3ed3-4582-abce-b3bd99898bc3@linaro.org>
Date: Tue, 23 Apr 2024 15:05:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, quic_rohkumar@quicinc.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
 <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
 <CAA8EJprLB6+i4H5tK9LbJYOEH8v9QF78u-+HMmqPqfpvz5J8zw@mail.gmail.com>
 <7cd89939-e0d0-c43b-fa2a-224bf60f4166@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7cd89939-e0d0-c43b-fa2a-224bf60f4166@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 11:20, Mohammad Rafi Shaik wrote:
> On 3/30/2024 12:09 AM, Dmitry Baryshkov wrote:
>> Hi,
>>
>> On Fri, 29 Mar 2024 at 17:20, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>>>
>>>
>>> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>>>
>>> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>>
>> Please turn off HTML mail composition and never ever send HTML email
>> to OSS mailing lists.
>> Now quotation levels are broken...
>>
>>>
>>> Add machine driver for qcm6490 SoC.
>>>
>>> This initial supports which includes WSA883x Speakers with onboard DMIC
>>> connected to internal LPASS codec via VA macros respectively and also
>>> WCD937x based headset.
>>>
>>> Add compatible for sound card on Qualcomm qcs6490 boards.
>>>
>>> Granted that qcm6490 is similar to sc7280, is there any reason why you
>>> can not use one of the existing sound card drivers? Like sc7280.c or
>>> sc8280xp.c?
>>>
>>> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires additional machine driver modification.
>>>
>>> Example : Required new DAPM widget change in machine driver for MI2S interface which is specific to qcs6490/qcm6490.
>>>
>>> So, using new qcm6490 machine driver.
>>>
>>> Will try to use existing sc8280xp.c machine driver.
>>
>> What about sc7280? In the end, qcm6490 is sc7280 with different firmware / spin.
>>
>>
> 
> The sc7280 is tightly linked with realtek codec. which will only support for chrome.

Perhaps we should rename it and stop suggesting it's for all 7280-like platforms then..

> The sc8280xp.c machine driver is more suitable for qcm6490, will use same sc8280xp.

This in turn, should it become something like snd-qcom-audioreach?

Konrad
