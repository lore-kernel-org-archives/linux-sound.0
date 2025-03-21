Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA3227E9B
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560158; cv=none; b=NtNJDqTkziIUSp6/pAmi5QcrXM2UBLavMrM2YcJt9DcWMPmy63vhG58/kHBZnUF7Cl1meDCBVRquCNNWgHGCImJU5Y52OqXvnWkmkwU0xU1WL+grS8uSykH2VZYBHUW5pFPGsky/CD/3iBXo4xt4qZYPnh/Q/t6OTTZDEwPr7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560158; c=relaxed/simple;
	bh=rVnQZXzA6JyIyOTUd7XuexNwWQ+JpNN7mt/BrTRTsVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQDwJe6iCcz4xiat3CMKUwjTMglWYt0lEl/5DROUPs0vsk0qNkK1WqeR6j7V7Yj/tzamODUzmbwq0QdVtHb7bneJsG2uMK9mYLbAnxFPCMxNjO+P3Lf6Ld8ilbd3jGDAJ+uUd2Dt4TrVVPf8dho0qf2HPpkSXPASxpIAop7w2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PylM+OmA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PylM+OmA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1552612f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742560155; x=1743164955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3SbkmY/ZqJcTj/0FuWSzOs5OjdIbM9VrnkM1LTgh1k=;
        b=PylM+OmAE9PCm3Tcq1DmejBitqz3rSVDqWvS2+bvHjo98lkHGa+4hZnSzTWdX0qupE
         6rOSZRGk/g6r1+tz+RCcm950UcCVP9J66v32S+X79KEsYBqZhdb6urXm0vw/Mtz9lZFm
         G/CP3+fcOKvWI5k/5eltvrbg3rbXRL560ap9UhVskDfnQLo2kvUBPUau6HVaZafwWzWI
         vn0LFCcVkvlzbpwayU+OwG6oPeD4wzjw9fJFX1drprYK0Wc2qECIi17z0SMIpXbeNTpF
         c23lue4e5/c9MAdk+C0s3sVLsWPPiUT7y2hy+8v1OXbqMonMzJeU/dL48WzG0uedT2eG
         3J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560155; x=1743164955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3SbkmY/ZqJcTj/0FuWSzOs5OjdIbM9VrnkM1LTgh1k=;
        b=WU4RO5kbOQA3u6cIsex9OBl3l67HVIlzprIg0mOrr4NlKgu/ucFXw0dwTa1PBJENvA
         GJQOcMsFWsI/kZjUyS3ed+j5ROam7v3vLw5HBMG+6pj3oW6PcD2liUudLaJpvhPS34zb
         +XLAiI54X5LG/IaVSlppJQRcPcQUbd/o+UKg5UrnMLXVNl88Czyx5oBNxq0uPye45WST
         wLLVeV2zwRdhidRb2BmapuUuCXDU1kpPGuMzx74pD9UjIw9/2leCZMvtpx6aem4R6lnY
         XQuBLQb2bPHV3CjfkF/gwqTw/wgHL5rbkb+RpcV/JpFeVQl3QGiqBDtN/hN/kT1v3Mzs
         05dw==
X-Forwarded-Encrypted: i=1; AJvYcCXaPNpi1v1wgHTzBAE/JZqeTAXaVdJcwoKZmgc1ak1AUzIZ5s4M1IHnxt1OFV+HVXmmi+ifIXTiS1kZ6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YylgWUeNBhLfxfIU4xRKzew3dzvCSYwPr/kq/x2k839BVsAPGKM
	fkvHnaQ/PcY5hoSlJCmDRQdChxL6vMrHk2mvIHELZTjlo4lltjnFNvedgWUT1XY=
X-Gm-Gg: ASbGncsTYT5BiRoCIePgxQHQ/+/0l9d9MGCQ0qBBQd5/9WL9BbGCwv9wa5jfguN46Tq
	R0CnWSFF/Y65RlsEnf0gHN/cwrv1LhxHWvsMr+GIbHz0mYsS6ntey5iIjNgudrGhYS3CNx1F796
	eJ17KELbPeOD0iMTnYmYQHAqv+6L63ZdKN21qm+A7pBeoTwuDF2SOBy6Pr4lGit8/K485UJrazv
	uizBxiBeMuNgMKaeEtxvwKzwyozMUv52q8AonlfEHSE+RNW2YwuFQOTgQf5ndLCZcoGoG+4ZlXD
	uO9qKOuBxLZBiVZSuygivFC+a6gW/dnVqn+bAtenDXxNgQz1O/YMrYCbD5x8l+M=
X-Google-Smtp-Source: AGHT+IFBZoh/8u7yI73Eo6y4FHWJpjFIM1ekg9sKkOS3yKX2k4UHIdny93pk+Zu+zSOxe3lYxYq5TA==
X-Received: by 2002:a5d:47c6:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-3997f937cd7mr3013030f8f.34.1742560154684;
        Fri, 21 Mar 2025 05:29:14 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9b25c9sm2225387f8f.42.2025.03.21.05.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 05:29:13 -0700 (PDT)
Message-ID: <c276c310-c6af-4ee6-8635-73430aeb4bbf@linaro.org>
Date: Fri, 21 Mar 2025 12:29:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: wcd93xx: add bindings for audio
 mux controlling hp
To: Krzysztof Kozlowski <krzk@kernel.org>, peda@axentia.se,
 broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-4-srinivas.kandagatla@linaro.org>
 <e2dc0587-28c1-4294-9bce-e18952ba645d@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e2dc0587-28c1-4294-9bce-e18952ba645d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/03/2025 09:29, Krzysztof Kozlowski wrote:
> On 20/03/2025 12:56, srinivas.kandagatla@linaro.org wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> index 10531350c336..e7aa00a9c59a 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>> @@ -23,8 +23,13 @@ properties:
>>         - qcom,wcd9380-codec
>>         - qcom,wcd9385-codec
>>   
>> +  mux-controls:
>> +    description: A reference to the audio mux switch for
>> +      switching CTIA/OMTP Headset types
>> +
>>     us-euro-gpios:
>> -    description: GPIO spec for swapping gnd and mic segments
>> +    description: GPIO spec for swapping gnd and mic segments.
>> +      This property is considered obsolete, recommended to use mux-controls.
>>       maxItems: 1
> 
> 
> Assuming intention is to really obsolete/deprecate, then please add:
> 
>    deprecated: true

Thanks, I was looking for this flag..

v3 will fix this.

--srini
> 
> 
> 
> 
> Best regards,
> Krzysztof
