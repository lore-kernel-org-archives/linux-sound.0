Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886992;
	b=4MhlVmcXZeLc5zMNcdQ8caN/CJQFUpFuf8nikYqlU7sXQQKI4nUzfxFIA0kta2zFItoM
	 leE7cdPF7HiPVkfH4vUKo74tvHjhaxddGZEhPK+cTTfo3eQgRbbRXfxplEMgY36Gkx4Ec
	 /w/G329OMaxBRapoYG8EGAvqkKIsDr6kTaxjKxQtnqubGEvsW62IPdSJX+3/2Oda716NG
	 rL01S46qsYTDAiKwvGYFIog3XMP5ebLgaQUI9enDlBIlIQtx8DAL1wbygums75izjFQZS
	 R867cCcUmoRvIw8nw1mrtlX894JcO0hHAOBL/AufTi5utaunwLrlP0SAQ8T8nFGrPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
	b=XMRwtc0Bhvffu9KmDF7n1zBfcqfkZrX9UH9djg75Jva6NRglcFbwi0N/D3k49YcM2AXA
	 4e6MDSijnbBDYTrSRVb3GpU9DKzmuYXvCepEFQgGeaQBHKJh5YI+hmgurzN5nnUjiYAVF
	 DElDmZ6INlm7SsekirO6Bc2PCcWcbmveaRw/PfttbcHB2vw+O2hzv28bcvsVXvcylXRLf
	 HqUJ8boFPZZmcs5idZtJmNoEzPPY1cDDUJR2v7w4aZQZ0DM3HKfcJxzWPnCgAI/hhzJUv
	 TIADERgZGY7nS0AhAUZ0RgVMcU356ubAs1yBzz9b6LqkDnL8ZMj8rN174YxuoqTe4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L35JyBlF;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39001606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39001606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L35JyBlF
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efd432714aso4548665ad.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 19:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886991; x=1795491791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
        b=L35JyBlF/o0S9PMiCVE4IkeMFVdZ3YXp+JSZAcvz5D9RwAP3brvGtQYDCXyBe3NOUw
         RuuITAzm+oKtrVJBp6wz8OwyT/haihs9l5Zb9RF84sA3uKKKqL78/9VQ/kTT6AC+uzuM
         87KTODBnXBJ3Ysv7md/RyO5LBcA8x4K/61847vA7jkT6ZPKUhFHM3RRCFyC6qKK/iWCF
         MMcfjuBQ2vLLWVow0iA8ULvhxlQeV8Fq+0xkxpCPxUsHiehe5yS9qmnICDLOrZfRI8RE
         8N0/mNnEAF9wPoPDFGiCTianHHYDjY3uJ0XgzJ/SOOdGctD4uutJP8n3vEixW4PMb98Y
         egBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886991; x=1795491791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
        b=DKPUgqGR29xWVKSNq+o+pW4+lyPY0KNA7llSp6UH7edPZbuYHFSwMAxum/8Cec+Ps6
         lu//tx0EGqmRCRpGuEh2Z8JwNEinPBghaoZcpq5Ivqw/D6CmVKlzFMw6UcPzm829MgP5
         6uvVniHV8JrNECNi9iEMMnscLf/QPk5nmwXbfqFK1gcdkqvy44fmCpHtz0DPwtVDAqwE
         R+oQg8R4TWDF2XCXAW0INdpEJ2nnbzYEp3ZTKEQBVTCfoTRfuW7fcsfuOUHi8ln6S9tH
         BgGndM+4iGaovw2h7GGHPpatxiXD0HZZ05rADIfXTnb5FACGfcr//WSffwO9rGGUNwLd
         Nw0A==
X-Forwarded-Encrypted: i=1; AL+hErGn5umRra/J91hZkbFcWfXrcBdu8CKMUlUQvK0J5MsHK6caO33J93+tPkhut2Bv7KOT95EYe5xJ572sTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OaKp86i5pNURB5kHcXlC314Ari6OyHwtS/IcMO8xjWLlPvU/X
	s2UkxIr6rHe64nhRpOur3YlvNzJaOek92Q5gILv/MR56XXimlLOKWhQS
X-Gm-Gg: AZFdTZeCin5dTzAbjBYKPJBlmGBe4ignPe0tsojb3hnLi0guhhFmDR07BNkGq2IYsKl
	ntHV3eKMmZEoOhTMYfSJxmU98pa0ZEIL3BlwdyxuJFI+m0mAsh/wgwjPSY7XVitstKh70dmbqFl
	UpdosIaB+QjBpFG/hALyxUwzJJJCr1Pss98uojuKN34tZ/hpIo9aA6eLtEx9gDkYGR6msEFAE9F
	w+/lBb1MEEP5UYyTxONupf8FCwMygSkZTa5i2ApmY2ahk2EM8V9xeZ8Tuy5Aqqf/JnZD0UdzQZi
	g7pvq84y6BCvSBn/PxuGMKn7Afc21q0a/ZLbrDwZc5u6BCgQJ92RoW+j78YuP0IZwFk/d8r691H
	w01TfKeMQZIecPPWJ9y3jdI+no6Y2LB6bgQQCOR+BK+Cbb9RXwjMk0/PAYTCAQQj7GRBieTnk66
	Ub5aH/vjmiDaKuHTPjV1/33Zxl+BECFsY67bjjPPab4uBmXf7HjtztR8gHgI8OJnGj8gam1MZse
	YVsKFh1XXOWzdqiXdAEHS7rDdkuQqusiX1DXYl13pWfSKicQQWalZnQ0o0NU8961V0Dr/RkOymX
	PURqwu0vnpf/yfCD0sA7TmWzw0n5kjNPlwyNNDQvLvauv/JpmggTicc5NWiI
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr118955035ad.17.1794886991445;
        Mon, 16 Nov 2026 19:43:11 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87180sm6533155ad.62.2026.11.16.19.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:43:10 -0800 (PST)
Message-ID: <63472ed5-1bc5-4acb-97ba-55749ec93c2a@gmail.com>
Date: Tue, 17 Nov 2026 11:38:15 +0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-2-YLCHANG2@nuvoton.com>
 <20261109-grateful-white-meerkat-090edc@quoll>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20261109-grateful-white-meerkat-090edc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/26 21:11, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:12:50PM +0800, Neo Chang wrote:
>> +  nuvoton,sar-voltage:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR Gain Tracking Selection.
>> +    enum:
>> +      - 0 # VDDA
>> +      - 1 # VDDA * 1.0
>> +      - 2 # VDDA * 1.1
>> +      - 3 # VDDA * 1.2
>> +      - 4 # VDDA * 1.3
>> +      - 5 # VDDA * 1.4
>> +      - 6 # VDDA * 1.54
>> +      - 7 # VDDA * 3.12
>> +    default: 0
>> +
>> +  nuvoton,sar-compare-time:
> Use proper unit suffix from property-units in dtschema.
>
> Also, Sashiko feedback needs to be addressed.
Got it. I will update the property name with the proper unit suffix and 
address Sashiko's feedback in the next version.
>
> Best regards,
> Krzysztof
>
