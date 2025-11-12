Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383FC346E5E
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762967816; cv=none; b=fv8ccqOgxbFUmpAw1oPBdkaHjFfk0B5PMDq6mHL5t2UPa9CznF+dDAy0nGoko8wpABCND8FMjwC5CfzdeLaxusVMvpIq2+TSl6q406X7hi2etvTBdgE06n3cBUAnnZX+IqrQWcvlsD9PH1YML+SrNEeID3INp2oDVxxUgcvfBQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762967816; c=relaxed/simple;
	bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ItqSIdC8xPtQPjOBvgyq4hB3XV++pRsv/9MbVT9xYFfkESmLCUkTK3LCduhxQ1WsuDwJh9aXptdjODcJglhPAbGdoSmist0tWjU0D++9fce02Q6wN5vI8hdUCqvlVXl14Rk3Po/2k/RwKMMvQhbj1A1gWf2mub2MPtN2PbrnfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpRL7Cxr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpRL7Cxr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47728f914a4so7219955e9.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762967813; x=1763572613; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
        b=GpRL7CxrRFx5sPYkiKaq/kIXW2ATW/s4UELrw2+KcNS1tux0hR5+SULsz1oK5AKVzb
         y+6o89hQwQXNnh3XjlmX7zFFtdrymI6+dXRIMENF/FdKv1EaWpXgjav7afrOR0+Cn4wj
         Kv1y0KEF+JmyUYuIp0a59um1mMV68r5DjwqLQvDFHN7jMIHA1A4cVazTBWD3BAUBswOr
         0njPJ+8m94dSgcDeCgMzK5s+s6oLaaROCytaVWkolVQb5awzdWdalgBNPnNdHjr1lS0G
         ad2ygOSlLwTpums6JBsynHkuwH4A99ZqGhUgJ8UwVgsMrnV5uXWDxls+H4fRKLjOz40o
         +cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967813; x=1763572613;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
        b=oNy2H7QVFic6IgNZQNMMJLke4dQTDtJYw8DHkXPN24AjKQAsIAdYy/SuCtrPa/eKRF
         q0uz1vAxt16G0zCI5Tx3tm4Zfvhwc29aWJPh45NQAYlutlSTtA6707+2+ZGGxTxgAN2r
         1irUzLctlQwzq0+FlLZpYLpbek8ZRmsa+YlBChK/kH/vd1gycrC3683f71Hf8IrUQVO0
         HdX40avtbvUSVJfqWbo3MTCZp22Iziqu3SCBwmQ+W69GVLvbtjqr4Wr/meru1FL1sz0b
         4cK5cFJLv8ajiG33hqCJMiFySavFTobcIXoXRfXAtg+xnwdNvZMY5vQe7/kXaeurr2QL
         jbUg==
X-Forwarded-Encrypted: i=1; AJvYcCXwrCGEbm9uPuZ1cX3RJ+0YLbNh2SGj18mMVCiGv6ZN6+O/lFrnX+OXh21j09cPzcNGwx8FIFdE3b1DSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdRcV+psJzpuu9Lg2BJiHxxYY6RTiaNaK64XjeXo7gbqNg+ta
	yeZAUY/Ou+mMvn1QrYqGDpAJsCRuJXXiA51sAgCicsFGuSKpkq9FUBin8ymBEmRKQIU=
X-Gm-Gg: ASbGnctIA9bYdZlzBHfWWWKteGA9pDLuXa1Gz+6JFZYm7SEKlmxVclQkU5TJ1kvcpTq
	tZC7cvb/WqZhXY4BIeMd4PGKPAF3lArzfruT9edeI9OJmZ0T4A4xC0rMQYAgFIwmrjLT0/vAtIj
	bnXmY12wRzQc6VA8KoI3JeOuBcawGtpP+iKcvWGUYaM2sZmV3OV5zASekYAcW9+6+5687uc48Bi
	mtKvD2ac9NkkP+O6erWXvxpiEnqewUeXZ8tuEYem2RfgnuPCKfkQOEILmBkdeOxJYo5lvD/Qe9V
	G7nfqLhDha04PRLpijxi7vkvjFFRcUU2v2ZsxqCGesePyJ4f+NIvkUFAGMTG4n8Hj+JF7WccA/l
	P8S8KBA7rMtmplENDs5DNM9xOayzkQoOkb2ZE6lsxqCgiCG2yxLUck/7gTCySC4Hz+m77CWYDEu
	gVkFsf
X-Google-Smtp-Source: AGHT+IFK1LEgbdoe82XE3jZoJK10kkTDE6sfjAoioDSlpzb+hbqMgzQ5j6+nhIYvnoRpyBG+UEDLMg==
X-Received: by 2002:a05:600c:45c4:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477870b9237mr36446515e9.19.1762967812580;
        Wed, 12 Nov 2025 09:16:52 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:4fbd:5c9b:d8a2:ee64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e51f54sm45322705e9.8.2025.11.12.09.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 17:16:51 +0000
Message-Id: <DE6VXJQPNX0Z.1LE0XW9T5T1LR@linaro.org>
Subject: Re: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srini.kernel@gmail.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>
 <1c7d62f5-1816-4ecf-9376-2751ec06830b@gmail.com>
In-Reply-To: <1c7d62f5-1816-4ecf-9376-2751ec06830b@gmail.com>

Hello Srini,

On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>
> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>> Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
>> family of amplifiers. Such amplifiers are primarily interfaced with
>> SoundWire but they also support analog mode which is configurable by
>> setting one of the pins to high/low. In such case the WSA881X amplifier
>> is configurable only using i2c.
>>=20
>> To have stereo two WSA881X amplifiers are required but mono
>> configurations are also possible.

[...]

>> --- /dev/null
>> +++ b/sound/soc/codecs/wsa881x-i2c.c

[..]

>> +struct reg_default wsa881x_ana_reg_defaults[] =3D {
>
> This does not make sense.
>
> All the regmaps should be same, it should not change with the change in
> interface from SWD to I2C.
>
> Could you calrify this before we start reviewing rest of the driver.

It was sent initially in nov 2024 I guess and that one was v3. v2 was
sent in December 2024.

I am currently reimplementing this. I obviously agree that registers
are the same but why we should be 100% sure that regs defaults
should be the same if the mode is different?

Or do you suggest/expect that, for instance, analog defaults should be
kinds applied on top of common (swd) default values?


[....]
(The rest of original email was sent and quoted but I did not
see any comments there, so I removed it but if I missed smth there
please let me know)

Thanks,
Alexey

