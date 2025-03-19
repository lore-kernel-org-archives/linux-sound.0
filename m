Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16D1FB3
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399969; cv=none; b=YmzcpzAHxPHCbZAVc2uNyvq8jQOrpznx2HMGtQdYj3tePOsb/VCITKeziZau6Ats6XolztpIRHeOjBcVOLFEtqM4+WZCoyQjsuDodH80xmoI3mZCYQIEj3rkv2fjnWCFvCXW77mZQ0+joclbHNvFwJrtED4gc9a/L8gbWOPHQwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399969; c=relaxed/simple;
	bh=ILRmyU4myaO9C/neNMKWw4w0x2c4drxeRcZb2f8Rva4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLJREOP4/lm3HBSxcID0ljGsWJZAHNzIxBAIs9fv1siQzYOSBPkUXipx/uWaLP9bhr/pEcVRCGrKo+mFkNBVEvXuMM/Vv3Aj/4PzfVwMc0aqKXjcOt/Mhw7xH8dtL1U9ZwI7no4GqQRH+12tGlxsGudxLZQAsoOh5D61XK+sQlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHN+vrmg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHN+vrmg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso42972005e9.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742399965; x=1743004765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtY2N2Z3hL6nDVea2tco/rHxiZy4oFusiROnhy6gmTA=;
        b=CHN+vrmgMkGPvbQAT593RxBshrs2ccP7MfNzizhLORjvlBAPNJTy71I7Y4Tl4cza0M
         2w8YTmKhIE94AerAISn9RUPkSmH79q6RZsxGuikcA8b7yfDavyHs/iwvpOvZh6g2Mqd8
         bEPi9+1FWy605vqJDtmDFoLe/izRBO9V5RwVAXDR559gFfRSjGYrDUWjguO1OpnVoHjn
         9i4lwg3S1z2DaUpPejoSQrKWZzSkVBSS8F3/jzIfjJRD4OSWkGuj4ZjonLti6hbX6c8B
         75Zw7Lyyg3HsNJrMdbSZzyYVyx+3lzuUfg3D3jeaXG2YVnXG20sPGxXgahqKQO7lPxuQ
         lxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742399965; x=1743004765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtY2N2Z3hL6nDVea2tco/rHxiZy4oFusiROnhy6gmTA=;
        b=Ih8VfuExVvb/P5i8O6jm4tcJsukhC2DADTyT8SNEXUG2LA3g1uzOys7pEGDyHbi51z
         Ve+q7Sxq8jU/wSk2I+v+Srala2oLwB659WkMdRLiIVce0Qyu5UT9MTBaRByPkth1G1kE
         dLfYRF/GzmyX7A31fEBnRfdZoUzzhd+iuEqRFv/k9UgQhNNHebyj9FDoz5cZ1K2JmepT
         3lW7s4x42pmHgqklj18ckQ19bwOCwqEDi0QxMMdvExrrKb3JEZdASVYISRZDbu2k/nEy
         gZANWxi8tbiZahtg4ycPhDPgW/4Or0nIqR3lSv5mxInRmepAHweENLhR+77N6Q/Upi5b
         zpPg==
X-Forwarded-Encrypted: i=1; AJvYcCVGWS+KvkCuB0a7zdr3nA1kfk4yuoi3bubUQXUUI34Sxnq3vsdFy/CodSRK1pJDw3HISDH5g4yljroa8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDw1cSQEDth7Unic4dtLnEidOntlDMruNyQciOeVH445lyUW49
	YxOTwpexe2s1HkRm4Ho6wNvAhaNVD0Kh7vEXT0sTVgEdIBo+gjAp9SCgaUEL/kQ=
X-Gm-Gg: ASbGnctT+iFJVw08qDcBFYbxqD+56nqVwafpnoXTzkeFUSfWSJCl+//erD4zBoj7hBX
	qUqBoQ0TNILb1kXh1BjV2pxGW78KtJFIEBDkHF20Er1drnGCSQsvdD5I/60iRH/QGDYtW14vuj/
	HAl57dBNDDtm+tNkd0eg/UGvt2o4okDCDwvS35ajkuhH2Mw4SIr3nHbanS45rip9tV5nz7/61oX
	QXfAlsjNefjWcKCo+PQmZO/XldVsUhkxJhHfttqz0XPkUpFcjb2hpk5kjxAt7/jBTing68S0yQL
	zyF6XD/8FjpNC3qz16WIVF5iv1JXqyxj1oLtGnySbaYf0pxgdKAjwdcoWgU3tRuh83a1VuNfbw=
	=
X-Google-Smtp-Source: AGHT+IFT1fxNfAkvCwKqbkyK9yZU0uyEQjN6KyVSpQ/fVLar6fXo6SrJ0IJJdrOVJ+naJH1oUUHhzw==
X-Received: by 2002:a05:600c:1e07:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43d436c7be6mr33579945e9.0.1742399964859;
        Wed, 19 Mar 2025 08:59:24 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d440ed5e0sm22136525e9.37.2025.03.19.08.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 08:59:24 -0700 (PDT)
Message-ID: <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
Date: Wed, 19 Mar 2025 15:59:23 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, lgirdwood@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, perex@perex.cz, tiwai@suse.com,
 dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/03/2025 10:01, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 09:16:35AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On some platforms to minimise pop and click during switching between
>> CTIA and OMTP headset an additional HiFi Switch is used. Most common
>> case is that this switch is switched on by default, but on some
>> platforms this needs a regulator enable.
> 
> Is this regulator supplying the codec or some external component? In the
> latter case it's likely that it should not be a part of WCD bindings.

This is regulator powering a mux that is driven by gpio which is part of 
codec binding. So I would assume this will fall into the codec.

Where would we fit this if not part of codec?

Unless we mark this regulator as always on.

--srini
> 
>> This patch adds required bindings to add such regulator.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,wcd93xx-common.yaml        | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> index f78ba148ad25..fa00570caf24 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> @@ -26,6 +26,10 @@ properties:
>>     vdd-mic-bias-supply:
>>       description: A reference to the 3.8V mic bias supply
>>   
>> +  vdd-hp-switch-supply:
>> +    description: A reference to the audio switch supply
>> +      for switching CTIA/OMTP Headset
>> +
>>     qcom,tx-device:
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       description: A reference to Soundwire tx device phandle
>> -- 
>> 2.39.5
>>
> 
