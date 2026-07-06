Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B137BE6A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 03:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308333; cv=none; b=GTx8m9rUnSMiZwL+uSY2xiTP+770Rc3wTgpBF9xlypIm6ntZByJgV+g8mlWHxpxADkUqVH2Od80oG0oUHuT/jFe/hDcWylLvbah8t3qWfm2HGF6RE5nuURr3XfYVXIdNiasKkIPQiuWLvhWhZDFbfrfucLMic11MCPoMu1QxT0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308333; c=relaxed/simple;
	bh=3M4AFgg5AocNGF3AzQgibwDCAQy05KMhECy7Mmf5/bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raSnwQ1ZFVSmSNAuiEg/uN0T5cESM+1yh8HGCUVqxqFJut88wMqomvZ0krCzFuxbj7vhHr+chgWG6WtgKSDUSUB5SIDZ3TL1WHtSTqABp6wyrbqTTfOeP7Y+G+I+kO8SVX/BQi6J8fUp3e+bRjkobaBoKWXA4ZSctrCXZfL86rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1wAF5uF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1wAF5uF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cac59f8b64so29462415ad.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 20:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783308331; x=1783913131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alpVrOd6n2aWZg+GKi3BWfgonMarNUPCjsDlmyEHlpk=;
        b=M1wAF5uFcmvUxQFOV9lmeZ3txRWx3tjDcG824HCR6d9DCZXok2XCBeoIktcAFx8dpg
         Ng0zotB7rvH4Xxfhjq10o0T7pkwIu9P086JWGcNdYvQj07fDi6wH/7JJqRBy26SxLAra
         jG5pcC6rfQFBQO78h6YjbNUP0PK4v4kPO8eLUVN68DJNz7ihrGXlrs8+HqR6D2hz1rQ6
         h8dBSx8rpYfGqNuPTNtDb+Rb212nuZcuHidV7ye8CTuYJ+FRgd1nUU8dVtg116Vtldgz
         EKRbSJQX06uD/khPOrIOoYeniRbMaE89gSx5yZST5jZeOsFa+K0S4lXrzyy0NM0a2R1Q
         Snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308331; x=1783913131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alpVrOd6n2aWZg+GKi3BWfgonMarNUPCjsDlmyEHlpk=;
        b=DEEQVu99KYkp3X/ygX+QxrBLPv50iV/cOmyVq3wBi/SaV5xfgD/cL4oZ3pNt55PnM4
         VnA5AuVnJCg8eRhD+ExVjx3kxYZjQ1NIq4pHFtBEBZPA0nHapM9yre+UaotyyQ3wl3j8
         6ASO0Oqw2ETf4bCcK1EGHzUfFj0IuC6MjWrtYOqzDhyF04mzxq727ftGNku6CI+lDABS
         2sOARzJXugJv3jkF4xZ0bt+CSsHT/xiNoSJrksRn2S72L/x05oFKDrHpWAhjHHoapNam
         /8Vbd7V62M2ub7XqKZPU419isHpZyBueTot7rS9w+B7vhQ1j0OXL+EfdNdfSI3Q7ZcdQ
         kDmA==
X-Forwarded-Encrypted: i=1; AHgh+RpLItRZK3/TrHndrWbv5ObehShGFAmrWxBhArlCHT6c2QtK7qVARDGv4VeeO+1+bsHoCS86dkXBMzmueg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQiH+fCBt1uMf2jYPvvfaJsEpu5qCu5mRiBURD9+sLpCQdEE4
	Yrl58zgbEOUCdpLRpkYhdwdePMZIbx1mcgKYLz71hUbaoYALCpH+zbhX
X-Gm-Gg: AfdE7cm/+AoDeAqhCwBXiYK4lCAOmWA7RadAuj/iBNPIB3HWVNsAKyHllWRPPOcD5bE
	IK2mlRgysfzzXzvJ8KpjtXcUOjdRNhqnz1krfrLUeWlBGL4VnsfTYaokfesU9HgOc5/N2c9sAu0
	KSCa6dp1hOOaEVIaowWUIo5lwVQ9pQf0VX3ruq/Jw+1kOv9WPJiyBVALWam2olQoRvb6jVaX5k2
	KcUI9AdLpsmpwjKXrDBtBY1kJnvtkjsJbGC3mvJxmclgDzWBXyP5/tvnazRJaIhKFS0KzjccDdC
	4D1pYv7givjyuuJqqGWcgW/tpa3F5r3tAWYhg2zCisNFZiN+tG9XyuGp9UzLTPo6TrPXZY0ZpdW
	2p1AVVLboxioVBqR8iZhnRWy0EP1FsjAbDDeUHC271EXrM2hlb98/vruuxgtg+XNvKMn810NVN1
	TlSpvTQtVFLqDUOwsewcaFqK+rhtUsQh719w6O9Szk5cNA1/4LzoNNJMo=
X-Received: by 2002:a17:903:289:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2cb97e47c33mr78483555ad.2.1783308331180;
        Sun, 05 Jul 2026 20:25:31 -0700 (PDT)
Received: from [172.20.10.3] (114-137-158-217.emome-ip.hinet.net. [114.137.158.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776577esm41505185ad.39.2026.07.05.20.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 20:25:30 -0700 (PDT)
Message-ID: <61a878fd-1e49-2403-9e63-66544d17861d@gmail.com>
Date: Mon, 6 Jul 2026 11:23:15 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-3-YLCHANG2@nuvoton.com>
 <66ce56eb-95b9-4915-8658-a1e4d1eacd7f@sirena.org.uk>
 <3b32493b-b827-e4ed-3ad1-281dc19faf40@gmail.com>
 <akpOy2HJsDCu7wVx@sirena.co.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <akpOy2HJsDCu7wVx@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/5/26 20:32, Mark Brown wrote:
> On Fri, Jul 03, 2026 at 11:26:12AM +0800, YLCHANG2 wrote:
>> On 7/2/26 23:15, Mark Brown wrote:
>>> I would expect TDM to be configured by set_tdm_slot() from the machine
>>> driver, not from userspace.  I see the driver does actually have a
>>> set_tdm_slot() operation...
>> Our DSP functions require specific Slot mapping (e.g., Slot 0 for AECL, Slot
>> 1 for AECR).
>> The standard set_tdm_slot() only defines active slots but doesn't handle the
>> functional mapping.
>> We originally intended to allow dynamic mapping via UCM/userspacea and then
>> apply these settings using set_tdm_slot().
>> How should we implement this mapping according to ASoC standards?
> This would usually be doing using DAPM routing if it's expected to be
> runtime variable, define AIF widgets for the bus slots then route to
> them.
>
>> Should we define the default mapping during the codec probe stage,
>> or is there a preferred way to handle this via the machine driver?
> Device properties, this is better if it's supposed to be fixed for the
> system.
Hi Mark,

Thank you for the suggestion.
We will drop the dynamic mapping via kcontrols.
Instead, we will adopt a static approach using device tree properties.

In the next patch version, we plan to:
1. Remove the SOC_ENUM kcontrols intended for DSP functional slot mapping.
2. Introduce device tree properties (e.g., nuvoton,dsp-tx-slot-mapping 
and nuvoton,dsp-rx-slot-mapping).
3. Parse these properties during the codec probe stage to configure the 
internal DSP TDM special function and path registers statically.

