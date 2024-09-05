Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC6194A42
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526211; cv=none; b=NiQIhWxx2MtjotaLm/xplNGpSY5gaJIyc+3gNQeIDfhz9zr8TPqWsKpQHOxnT7ZtYO1lHJ8h1zWGbQMQ9e6lNhgO0rgmjIiJGpwP1HAj9WYo0gsLjJyZcJzoXEORSqBH9S+SYvt2XUJQg1jww6kde/ICdE3juO8w1OoWRGftd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526211; c=relaxed/simple;
	bh=oJsRqGbUv7zV4DSlVrEki66Rp/lc1XySOlXe5UNgeHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCM9peTLj3A7XaSRuEa90WUIOebZfsilSQWxkQSJURmNc5zHpWVKbNEehwrhHCiQ+mXCMpXLyPlIBb4wO4cGrS762ficF5IG5y87UokyhQJeLY+lVxdFNnaIB7jgP4dtvfWLLDmnfGIlilE9bQSKI3toVAA5Fx9VyjEOIJ5lpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANV8dyqH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANV8dyqH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bbbe94b88so610915e9.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725526208; x=1726131008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+kzOOCalxHLc68HF2HD0WosOI3DFfQ3f96z76/2pDg=;
        b=ANV8dyqHG4f/o9CGy7+s95OAywxh+QoknuBcsCX3AP3ej8orrX+PRGGGU6xa1i2mGk
         XMrj8YlXn8QtRf7xSGbzN2KG4/8r+wxCUY1uUS+/YbCpNrh8AKSnFY3ADLZ9beUZdzvr
         gbOzXVhNFcsroco+91CL4eQTJQKdHpimd1AK+4Adc6qR2dxHZ1mr/3n1kux1ar2OG2up
         5kizGk1qj29NBJN0TjF1pTmpPiYFaQJQHRjJotxSV2h8MN/xhGViXecg+D6X42giwAc2
         bS5sWuX9t6Bx7difQK9BXRiij9/pzyLQRTSSG++akK4NfQrPPTNjJHK4mNnNXXq8YMjq
         NCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725526208; x=1726131008;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+kzOOCalxHLc68HF2HD0WosOI3DFfQ3f96z76/2pDg=;
        b=JbP8ZTu+ew44xHM6xz6UIOZfp1cO3y8si4XRmlvlJd8Fi6/ru7+GcaejmXVtxzZY5P
         rWXEx2vkmfEfKLlTenlvWHpzldkhjNzPYOe4x3eyRsCH7bbbIfKxWPfzdGpZndXXKsr1
         OllZ7Ty+9s6QqkTOJreDzCr+6699Bf1G0e4nH1DczssBx/dl9b1mPWxJcj6ivMG7CVtr
         FYozAJ/iMH29Wg4Ge9GOWPXurGSZmB9AMeNUlQAi1JT3S+0CdvVW+JuK8DsqUYy9HPa/
         FZc0y1QIzHU3VsPF2A4YtUBgw7QUvc11/y3GwT/j/IqhLiKdYHwWclEGjtn8LPA9997p
         TQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXf8SrlsC9qIA/R2uQe78JQ+4dJRXmycH+QOWPDRWdYpacNSMPX2F0hnQhnhAtMICLtRO6K8sOJDpU2+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzplsGJwFXh1Za52wegSFBvDj/gSl9J2t4SLrbOTmPHDq4PRfuU
	pXdZdfJ766tYYLv+DMYPuSaYzFyZ5FgRq86KUJQLfNGnRfynXU58ni0m4c74KB8=
X-Google-Smtp-Source: AGHT+IFLlFIBQ3Oz7FeSxG7gin+H07tdnOHkNUNe8fBPGEf9pt9BrQkq4L/4b026jgr+qr2r6oQE6g==
X-Received: by 2002:a5d:64ae:0:b0:374:cd01:8b73 with SMTP id ffacd0b85a97d-374cd018ecamr4388242f8f.10.1725526208077;
        Thu, 05 Sep 2024 01:50:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c99b5c66fsm18638755e9.31.2024.09.05.01.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 01:50:07 -0700 (PDT)
Message-ID: <b7ab5953-3dcb-4e19-a776-4ebfb1343c13@linaro.org>
Date: Thu, 5 Sep 2024 10:50:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] ASoC: Some issues about loongson i2s
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
 <CAMpQs4Jqx56NRkdVPztPe+xXcY-A=WDxGua-pc1OyYG8kD2Q0Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMpQs4Jqx56NRkdVPztPe+xXcY-A=WDxGua-pc1OyYG8kD2Q0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2024 10:34, Binbin Zhou wrote:
> On Thu, Sep 5, 2024 at 2:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 05/09/2024 09:02, Binbin Zhou wrote:
>>> Hi all:
>>>
>>> This patch set is mainly about Loongson i2s related issues.
>>>
>>> Please allow me to briefly explain this patch set:
>>> Patch 1-2: Add ES8323 codec required on Loongson-2K2000
>>> Patch 3-4: Add uda1342 codec required on Loongson-2K1000
>>> Patch 5: Improve code readability
>>> Patch 6: Fix the problem of unable to detect codec under FDT system.
>>> Patch 7-8: Add Loongson i2s platform device support
>>> Patch 9-10: Related DTS support.
>>
>> This was based on some old tree... or you do not use get_maintainers.pl.
> 
> Hi Krzysztof:
> 
> I used the following method to obtain the email address I need to copy:
> 
> scripts/get_maintainer.pl sound/soc/

That's not how you run get_maintainer.pl in typical process. You run it
on the patches.

> Liam Girdwood <lgirdwood@gmail.com> (supporter:SOUND - SOC LAYER /
> DYNAMIC AUDIO POWER MANAGEM...)
> Mark Brown <broonie@kernel.org> (supporter:SOUND - SOC LAYER / DYNAMIC
> AUDIO POWER MANAGEM...)
> Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
> Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
> linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
> AUDIO POWER MANAGEM...)
> linux-kernel@vger.kernel.org (open list)
> 
> The code repository from MAINTAINERS:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-next
> base commit: 097a44db5747403b19d05a9664e8ec6adba27e3b
> 
> Is there anything I'm missing, or where I'm going wrong?


Yeah, the list is incomplete and wrong emails are used.

Best regards,
Krzysztof

