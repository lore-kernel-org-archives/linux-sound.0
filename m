Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473A25E466
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816010; cv=none; b=Lv3YmRzDNb3OOODIW8816b7EvdGRmkeqrmV6MDciGuh4SuCNmd3JP9nfsUYILvdKmWeL2bTnatf8W1ozKCWpdKFRQZLwvJHrbe3S7CiFTmfZeuDbF3bCoIzHRMudkTO+BmymBuXa41gbVQ2KEHjt1m7SV7VXh3BQ2rEjQSb8hl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816010; c=relaxed/simple;
	bh=0QhCQHHqNirjdYBN4QdEl9+nTA8hPopgI9hEFzjoWzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUx7RouTg/5QSdvTmjBXLlqIgF+T4dDaDrX8yAj2u2jjuOxtnOqglDdmk2ogCpUvxdb4DyMDFwm7kytmmlYKqML+RUGzppNpLHHItgzoqWYc9LFbc6IbuuF4X6CLDXNmH1XdWkTSSlUSvxVF/PrrnLXbeF9l2acRLOKMkty9SOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rk+6Q2Yy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rk+6Q2Yy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3965c995151so2091836f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742816006; x=1743420806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZaqAclEJIkWjFVuVskTZM+5u6eA26Yq4IN8pnm0qc8=;
        b=Rk+6Q2YyZ5mwJEAB4v6YJLWozKyNqVLumD0a1sxc+G6Cqz6C32Zzk//+/wp9wD87qj
         hp1Xk4Ucd67hLMhFK8M+R8Agh9rMNGJTvTlsJ2yWRllyO0w+4zPbPgy4FJ2WoVQ0W1n5
         Mg87q6iSV1oPEM0+fdGq05TPo9jQBiJh50z+Pgd4V2qq1VFc/VamwWwkMbXIy+DBZyyO
         8W9/xL/9UR8rudXN7oJ+wGtZKdrH0VOY896sXrbN3pYDkJ+wNN9LIUUY2Rhw8jIzg0Jr
         t1mUBVhn11HpaD5wAcHSVk4VAL0Ru3Nf3LR21NrJ/OVhfL8OB3DgDBvhOBBdKvjrG+zG
         /AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742816006; x=1743420806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZaqAclEJIkWjFVuVskTZM+5u6eA26Yq4IN8pnm0qc8=;
        b=pSmWmkz60iKU57g7PnYfIza3dztVjd5e1p3Wr6DHIYVay9iYeClmyMzllxrDk+nsED
         2XpjV38lzoHHhrtPDrzXoCJPi/iCoq79kgL6v3XLFf6jFvEiG/iONYO1o5Swkj4D2t6D
         FWMwsPZWUwjoXUkfWigu1FF9PJpY/lQUHtFbaqot0JKh4gHmErmA5VFAVzPU2XVQFVtR
         WkpnFAhD/feJT1jIlcljYR/Zj3a4zju2acqrg4/JoCeyZ+ifVYXEJ9fQGq6nUgLMGrbt
         vKsjJowUBx7Yq1v7LXNR+tyCJ+uXDANV8w9YqFTSQvdQuqBqXFdiZpPQM9y2Nh7xh6T4
         MVjw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7qW/IlFqOYbF30ph4v2rfo3N7vBkarJaS4E2focn1u6S8zoC/QD6Qk6BetLlb3ZuQs+AH2SvJ80Uow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCIDlIs5gK2jeMvk7ucl7FGz41wJP6i2SnI7CDffho+pGMPat
	SnBgjOVWCj/Ky8G3UwoqhbaK7pa8NgWTtXie9cwpBs7+IhKhtkNb2e7+a/9fZbc=
X-Gm-Gg: ASbGncu3NF4Nflva8aDVPXcfROJSxIO6R/p4g8OESR5br5eUAZfP+tMGSsKxhKnr+g/
	g0N43f3PryJMSpAL4/jZ7hQcCQPG0cZn3UL7jArgBF+fy3B+t1vTHG0HLqjbAe6umvkoVvk0yv2
	4HkjIO4MCgSWBdFPHF8H2zt19M3PiSIfoz+3oQJUTurq2ocjiekSCYT3L2Vf++mxeO4Hod61XR4
	WHYe/hZzqVqWbZBocYi9oeMHP7nD8Ft4ZY8/PgoOEprqdO6l4wUzjptYspb0qGmOFNXndY9btzc
	1pytdbFe2Dmcd0zGuS7HHdW5Izc/1YeGIAtYBgNfwr37CCbdAuL4VSrCKOXwFQ0=
X-Google-Smtp-Source: AGHT+IFSfs1o8ReuKsDzD9hr5+CF5RuqGwYnwXccjml/f40pB4QQMqmLEg2EktW6960K8d3RhxZUkA==
X-Received: by 2002:a05:6000:186b:b0:391:3768:f448 with SMTP id ffacd0b85a97d-3997f941b0fmr9625633f8f.49.1742816005906;
        Mon, 24 Mar 2025 04:33:25 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9b517csm10918673f8f.51.2025.03.24.04.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 04:33:25 -0700 (PDT)
Message-ID: <4256f8ab-d975-4f5d-8762-50d301ce4dcd@linaro.org>
Date: Mon, 24 Mar 2025 11:33:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio
 mux controlling hp
To: Krzysztof Kozlowski <krzk@kernel.org>, peda@axentia.se,
 broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
References: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
 <20250324110606.32001-5-srinivas.kandagatla@linaro.org>
 <201dc2a7-e031-47d7-9c17-c4275365b477@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <201dc2a7-e031-47d7-9c17-c4275365b477@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/03/2025 11:18, Krzysztof Kozlowski wrote:
> On 24/03/2025 12:06, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On some platforms to minimise pop and click during switching between
>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>> case is that this switch is switched on by default, but on some
>> platforms this needs a regulator enable.
>>
>> Move to using mux-controls so that both the gpio and regulators can be
>> driven correctly, rather than adding regulator handing in the codec.
>>
>> This patch adds required bindings to add such mux controls.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> 
> I claim you cannot test a binding in the way we understand Tested-by
> tags. Testing a binding is part of the build process and we do not have
> tested-by for builds...

I see your point, Normally if the tested by is given to series Its 
applied to all the patches in that series, I guess even b4 does that.

Will make a note of this next time and not add tested by to bindings.



Thanks,
Srini

> 
> Anyway,
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
