Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE0227FB3C
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194175; cv=none; b=mMmxnvhOnW5PMqXsr+MIAlVFVB6GNqWHb3wocq3eMjFhdyzGXmYyShaxipMnOO2JfgcIFrfGUGcr/bNvFRn3qE0hmT2mClHRZQ07gil5T25TkLmx/Q0Sf2+Bu1LMJgkpK7rjQqMc3vWm85ccxr+DSYL8seJEgRLbJ93tYykUH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194175; c=relaxed/simple;
	bh=tHMkKtHBmZ73tPdWd4aypJGfuXMSP7pxibnwH/j5Wd4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WAcYmDXQVedpDuQLDmghOT5t/3WRPTB4oawWt/E0eNiZAWDltv824e+27gEYExHGe5Q9Kfa2lQO5fzHlXkjp1l4WjD9lB9EkQWhDsBToztVFxyIU+iViEoNjlzlBFGv8ebC4DW+o7BgHoZ+rti9qEaR/+Ct2uJ+IK6HiGqcQiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVpdQn7N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVpdQn7N"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso92639725e9.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776194173; x=1776798973; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwnCC544qTEaBYHUNox9q6JOTruzJjPkrEk1Y0wm9rQ=;
        b=jVpdQn7Nma4xmJ5IfwW1IeghwDPVxObUDhTUv0XirtQl5gaDOFi923S6i6LN11tfWV
         lZsbWoh3+dEcR+RXBG5rpszavA9Ap3UA09o+ihRuvMNZRsWsybnP07T/npaBTyXFvyZF
         kLpxb7vZ5KY4fK672LcznpUkS4PjscpIIAP9tljOmIQTD21sagpj8DsZ6wmLfmvOec8r
         I8H4Wkr5ugGAouegVG/8hM5gpnoQt51euW900Brw0jvB1fJa0A8vxtefDJHuzcSObrJQ
         c/6xw7SAkB1Tbivh2jveRkl3BJI5ZLwhza1xhR4ToKbAoGlucYNlwmAI08SMVVhTuXdC
         8S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194173; x=1776798973;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwnCC544qTEaBYHUNox9q6JOTruzJjPkrEk1Y0wm9rQ=;
        b=jl7wlK2sWAnJeo+tvxwFbUiIg5EELjSDyI7wrN1eL0jyFzFN6VkzwsluGmdYk+vGCN
         6M+L9zOGsC0/BQ18Qvv/bFvr4QbMu3UksHk1eXKdLHSUbphp5DusBxY+5jVlz37H8677
         SKL8KCtVUhZTp9tJgAPg2Xyvh5B8k61Y0nhvPzgBPjirqOqtGBf7BUPwGEOkCQS4ChLw
         2dY+/BTq1E6msMc3ZxMmgoxn8GlGR0K/AL6N1nFHNnGhl8OGrvaqDoqMFg25JGSz+qKA
         G+XV7Q0NZ3X6sJO8x5AosD1HS7sbAvKX8lDZFXx6aCwf+kw0gZh+wTcUDFlt+xQmT5Ru
         wS4w==
X-Forwarded-Encrypted: i=1; AFNElJ88Yv2swy3cu/BvaN33GLshGb8emA8N9kusOqDIPTzHVhSh2fnye2p/Q9zVV3tgD3jfqGfvLbHgzrktVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkRb8TJZ2DDBbXNYT2/itxkmncwmrsV9xCFJg7HWBw1SSTPrR6
	aEF9sAyIz14y7l8iFaFjD6Tn4UUJU5u2aBY/HCrdWEuuB5KfTTJgY+Gs
X-Gm-Gg: AeBDiev6aX0Aq5+dY6qOeO0t7rPlZD+bn371Vmm3VVNBpFDLb9h22zcfGwiQjVFSYdO
	Xu8Lg2rSC+Z/BG67XOB4XWCi7RycHU42j3G4wuol3Pl0CSPC1HpYkakggZQEVX42n/95Z8CkbxR
	EZLIRCMiKBGQTQIApIkTu3w6xHdGWSlYEKkf152umvF8yywC+ERLUPu2Ymkw10+e49Vm3lueH2P
	pUXv3vZxs81NyMVPVJH+7rApmVpUKo0uOXGteoF2giqje9e33hQSsTItHgEx5yZBriTWE0AUblE
	s3G/GqVNcIhutyVfBhANgZfb6Bsu/qf808np2PCiAtoTdEQZ7SDnSGx8QSdM7lzSvlqLg5z0yUe
	RNCMximG+8bX4va6tp4g/JFk0uTbbwVv/i7ypO4EtNwiIEqFIXlAtozkktF4fo6jpCWYv315Kl3
	c1a9SK5k2jytoqkONzmKC7gSD+1CdNeHSjYsDu00WthRxkiyjXaryiPSbatmZ/OPuV36nB9r1Kt
	3x0swHaPv2WWbON0itDnZVCusqWu2b+rkFTf4DCZR5HvsD6Qw72f05wLu+DJw792bvn4C6o3BsB
	73xO1qkttPcLa8ZDXskhOi5vEQ==
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488d67f0aa2mr232430375e9.12.1776194172480;
        Tue, 14 Apr 2026 12:16:12 -0700 (PDT)
Received: from ?IPv6:2a02:3102:4c14:1900:f233:a94f:4a5a:3424? (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee03898bsm68893935e9.11.2026.04.14.12.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 12:16:11 -0700 (PDT)
Subject: Re: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and
 rename binding
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260414034854.461661-1-padmashreess2006@gmail.com>
 <20260414-tentacled-mantis-of-control-cb08f3@quoll>
 <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <5cd2b36b-de7d-c51d-f495-6ce78fe5a8d4@gmail.com>
Date: Tue, 14 Apr 2026 21:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello Padmashree,


Allow me to once more propose this description, which

was in the original .txt, and you included into the patch v1, but 
removed for v3:


 > + reg:

 > + maxItems: 1

 > + description: The I2C address of the device or SPI chip select number.


You also probably would like to squash patch v4 with the previous patch v3


Best regards,

Kirill


On 4/14/26 3:22 PM, Padmashree S S wrote:
> On Tue, Apr 14, 2026 at 12:09 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Tue, Apr 14, 2026 at 09:18:54AM +0530, Padmashree S S wrote:
>>> Add description to reg property and overall binding mentioning that this
>>> driver supports both I2C and SPI. Rename binding to match compatible
>>> naming convention.
>>>
>>> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
>>> ---
>>> Changes in v4:
>>>    - Rename binding from pcm3060 to ti,pcm3060
>>>    - Add binding description
>>>    - Add description to 'reg' property
>>>    - Remove unused label in example
>>>
>>> Changes in v3:
>>>    - Remove description from 'reg' property
>>> ---
>>>   .../bindings/sound/{pcm3060.yaml => ti,pcm3060.yaml}   | 10 +++++-----
>> What v4 is that of? There is no such file.
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets. See also:
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>>
>> Best regards,
>> Krzysztof
>>
> Thanks for pointing this out.
>
> Since this is a DT binding patch for the same pcm3060 device, I linked
> it to the previous version. However, I realize the subject changed
> significantly, which made the threading confusing.
>
> I’m planning to resend it as a new patch in a separate thread. Please
> let me know if that works.
