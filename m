Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76131A5BB0
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581495; cv=none; b=aqtqhMeaMmikyzTI7fH+jef3i4OtKczxYcm/5B5UHuCsoPRjixCpl0XE7CkHLTdRi7UySWaDUWcXx0NUKP+v/AvaB+swI93cjb16+x8gQSGrQPiOwxeTX5H6X/o0zvr0ySB4XgmFVwHcvX66X1nY1VB0FfirblC59vWN7X1+qIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581495; c=relaxed/simple;
	bh=0cjdRtAyc7Px1cY6aHSxrqx02qbVdI+k/2UMUqPwMk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sm71n+OOiYSgzheWF6WLW5HjZPHAJkknStaEoy3kVeo4a0b0awRzP1etyKDKqu6YLv5/hPrApnAT40iI907brf5Tl4v0EPW9ROxtefeVSidVllwqUG81SAMB2CzgOgq8pJf5fXJvZnqO641EvMgGow74x/sfVeV8wRHZlIzjfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQGgFccE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQGgFccE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so63938735e9.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Apr 2025 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581492; x=1744186292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWB4iyOPjGa3JvhHFf0OgRFJSrqP/oOM2ls8icvbkUg=;
        b=CQGgFccEALP9ATYuS6WWClLU+UeHbfI0FthAwXU8cbcQBFktL1D0xJ0XHkOmy2rSaK
         gt8he5G87QlBoyTp/r+FL9A2m+bAihWL2heWRrygtkl9Ce4aEpHKaxLgGronwissRVGN
         9QqZSmScWW0YtQZOeqw0wlKsBZLltx1vqTQiva4VG7x/8WQgJrlbS6tHRcv0bhIxqf8U
         aByF/Yw9TXVU269LzVTeDFn23YMcH7VdBbR0HTXbmlBvLkOD5cXQdYcwVd0zVmwN8F53
         WcbH5+RUvH++fZhfU/luv7KRhfg2Dqof3T43OwCBZ5COjSq7nlGrhi12Bpc7gFA5ij+/
         Kc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581492; x=1744186292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWB4iyOPjGa3JvhHFf0OgRFJSrqP/oOM2ls8icvbkUg=;
        b=rNhqhe+MCbSt5S6kgDupZJhddGcRjP/tsl6cV3CzmUCdAGTJT6v7cB7H8+YihvSIO9
         vHZq5gNizYplaSs96CRIVTGzdO8ThzXsye1/EtrAJHe2C+cYoiuaIpVr8g0wT1Gjqy5M
         ak7dsyuf3mgZOlczeiSghi42RLIe8yGy6fR3+UunGr8/1K/RlqqJ3E4kX8p6eTXyNxEA
         6SRRcvw9lC/YMjn843k0RN9ohZxUWBIW9bPmi+dP5Ux1BBVOmr6477qcuuLJKnociQ3o
         CBig54GT/Aoxq0k4ZmCd4RXYqAjw95zKUVxK6yNKBvfmK0V4Wq31TGBjB2IWVx/8ExDt
         FMYA==
X-Forwarded-Encrypted: i=1; AJvYcCW6SpA3FXvPrgISSx7XqpPTSh0LuVkkxeKTXg+a5au1nXZXv3ngmAOOIxaBslVOkCznUcKojggyK5YAmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxED5CU0IyFyybGqzPS4sjEEmWVNiVcMmboSr3DwtzDZXW43yzy
	3avuWRaMDTSC9Hss9XYd4u0AyMch+6Z1GKm28MS4bT5ixyja5kLoyDNts2rrfZk=
X-Gm-Gg: ASbGnctGthZWob0sYIYbdhOuuhCWnmXL5BQ5wdHPh1ieXOMtkueV55sjlHnbAAKXSlU
	eC1XlxLajizIhJJpvwa4BOBUltBvAaB/gl0C9hs+LLJJriDn3QxrzatxZLB47oZXsJLCvqJpu/Z
	YmiIo4ZWqk5BWhAQKka5DR/wxJu0PySQuClZ2D3Y0OFTCtiuMHMi593I5hJuZpmuk7OBtixd+PS
	GG/8I5nYXAk/w2Pe93UUHEHtoBThFKnLcsLwzo4Wjla9bKGELiOZ0gHN73ILM5X3eB+DELUGxFy
	OACFXghGx19yYHAkHL0LfF+K0wa3Vg/kjPxrQfz2TJTGfxHEtOnig7P/vb9D6TM=
X-Google-Smtp-Source: AGHT+IGBlatt9XRxf1VEZzEp39rZq64LmfgcstZnSIvck/QvLxH5SbIITWq2cnYOJybXJkyGikBbpw==
X-Received: by 2002:a05:600c:8411:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43eb3af4581mr16487215e9.7.1743581491995;
        Wed, 02 Apr 2025 01:11:31 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0afsm16439234f8f.65.2025.04.02.01.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:11:31 -0700 (PDT)
Message-ID: <e1ce7e09-0398-41e5-ace8-50b9547622d1@linaro.org>
Date: Wed, 2 Apr 2025 09:11:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] mux: gpio: add optional regulator support
To: Mark Brown <broonie@kernel.org>
Cc: peda@axentia.se, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
 <e8bf5dca-16b1-4bcf-b3ab-3367f29264db@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e8bf5dca-16b1-4bcf-b3ab-3367f29264db@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2025 11:16, Mark Brown wrote:
> On Thu, Mar 27, 2025 at 10:06:29AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> Some of the external muxes needs powering up using a regulator.
>> This is the case with Lenovo T14s laptop which has a external audio mux
>> to handle US/EURO headsets.
> 
> The ASoC bits of this series look fine, what's the plan with the mux
> bits?  It looks like the two parts can just get merged independently.
ASoC bits and codec bindings can go independently, there is no compile 
time dependency.

--srini
