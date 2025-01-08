Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11501A00FE;
	Wed,  8 Jan 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338761; cv=none; b=iiqKyHu3FQWrn2YY37UsqfX0KWwJBepmwr1Um0b9HGz8mBnXGx/+iysugkFr2HrgQDyIhQmspJre4hcqH6AnwYH4ZWb77FnxbLhWwsdhoHZuH+b8fwOCvTAFdFDhp5HI7x9Px6ObKLbuhXXKcEt+Fm58INDFcirhQ0OIv8m8xYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338761; c=relaxed/simple;
	bh=l2wuy6uutmjlMwmvqqU1Go/FyQ3viVYg51+dLSMo4CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANeq76Ox1LgkN7vHGWpHYCHmTWAdKMBOgXm/DjTi7sec8fJNeptSRiAkEdIjvn7CIQlHDdFwnr6ID10BYTWjTKdNHfOgfYCRzARDwFjVrjcwXKZOoE/Cbo1knDkKBFEK7PnINEbQo2KWKU8K/OogsOKXvp2I89WqteKxzshjYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cq6zl1ZA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cq6zl1ZA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4998085e9.1;
        Wed, 08 Jan 2025 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736338758; x=1736943558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=Cq6zl1ZAzlNj7lYYxdfbm13gFcewsFaVqxkG2Ru6DHxB6Re4SKrps65qL7IZUzlt6d
         tHmBBFosWI8QX215hzRDx+2g7tiQTtbPYjukuuO9wv9KpUbnsVAeHT/z9je68ZsP4/7n
         zq7E0wf4b5pvpPz1xHffxKEQ8g5QmFQtw/kjF6c9naWWdA9sO56ANlweW7OMNgeZf0yA
         6fv6NAVJUCpii123Xbf9ap0Xj0L5QVx3uHY6/IIgA7fH7I3b44QmWmR2xRSfcwlDYaxn
         JfSfFDV2wVxDkyWML9AkjQen7xLRZ7Z36XgT5g96ArnBG/Ncm7ZEx8961YqhldBQHHoC
         klwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338758; x=1736943558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=awi187fE3UN4rxxJOxdN1V6+m0d/FIvbGZn/sNx4F5FwEKoFzJMFgJvH37LaTrjL83
         QHCztQO8T1Kv2fn702j2Z6jPhqPZb2JgyRDaHrJmLnQmy8WBAXG2mfzDFc/gUtgjxCFa
         U9u0jM8kz8BWrspHDaUduJiE1sOL2QeeiaVBAdYoi5L+adjZy3FBop2gnzs08tGkiHde
         lNMb0aV+pZAq2YhcZu8iQCqL87F19DFemt9lFRzVL4GyFliZCMVxZ0sEufzloJywT8PG
         ljKEAZMX8BkjqmpNByePiM+/XnsmG0HxqLjQ3QaBV5b8NdLx92pPi8Bat1bzcLGTKKpO
         UpXg==
X-Forwarded-Encrypted: i=1; AJvYcCU7yHwDIHTvDZ2b7uI/+aBrMKXtRu2EukfouRjTux7OI3SX45x3tJ8HtbHiROthyLYDCjv/rdRhZq+9QEY=@vger.kernel.org, AJvYcCVZ7P4OVndYkBZakkPtbgwOQtHJw8TGXDyidd7vKRMeIpafgffBv0HfBaWoAG8A4W58yEQ+daQ0pjee@vger.kernel.org, AJvYcCXjfRYyLVwU29TcWFLUloGbUEe6C92uolhYShxodq85Qf+6SQI9eIgq8YdCh4kvXzvpYhFRCfL0juA1rBJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rElMXjc5GHCFKBT7mQuPsj1ArCn1NzdC04og3bn7N32JZztu
	D4vWJKhByZbgN/M78tco0SrOJGE6anaGJjz6mog05A1TbaLorzAI
X-Gm-Gg: ASbGncu2c1LlZSK4Lh5TTOBQ+6Wf5opBiDd80jzqIYiRsVyMXQw/aHvZVANXwx1wicH
	FSdHUElz4h7gJm57en1N7pMNcW1OBpogF0rb1KhawmcCYyVwSoKWehA6sGICgnkQw7hZuhp5e+5
	lXhx/k6OIV3zq0sI0FmspKfFjfjqRttdjZG5jyu2HgFYPLBO1T5q5NyYsARPMOpYGoya0IJq21M
	pMDbnJ2GneRSaaFXTR6DPox6Skn8Xm7bTnT/BP8E0OgrCckPuO1fSzmd7J/u92kULrjDmavZckZ
	cF5EtQ==
X-Google-Smtp-Source: AGHT+IEZ2TsyG7bFlOCK2TmeGPogWLKZEqI34rc1uiTT2N6nITdoJEt+KA1su4EcHw8h6jyV9z9qzA==
X-Received: by 2002:a05:600c:510b:b0:434:fb8b:deee with SMTP id 5b1f17b1804b1-436e1e4ae91mr23270555e9.16.1736338757809;
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27008sm19375005e9.0.2025.01.08.04.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Message-ID: <e5665b6a-c2ad-470f-8a36-b7adc05c1cf0@gmail.com>
Date: Wed, 8 Jan 2025 14:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
 <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 12/17/2024 9:07 AM, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 09:50:37AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Introduce the 'widgets' property, allowing the creation of widgets from
>> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
>> introduce the 'hp-det-gpios' property, which allows using headphone
>> detection using the specified GPIO.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
> I have impression you are duplicating audio graph properties instead of
> referencing proper schema, but considering that the bindings
> audio-graph-card and audio-graph-card2 differ only by number "2" without
> any description, not sure what is correct here.

Please correct me if I'm wrong here.

As things stand now and based on Kuninori Morimoto's comment on this
(https://lore.kernel.org/lkml/87cyhw8lg5.wl-kuninori.morimoto.gx@renesas.com/) I'd say we can't
(or, rather, shouldn't) directly reference audio-graph.yaml here.

Now, I wonder if the "proper" solution here would be to take the common properties
of audio-graph.yaml and audio-graph-card2.yaml and create a new binding that can be
referenced by both aforementioned bindings? Would that make things even more confusing
(we'd probably end up with audio-graph.yaml, audio-graph-card.yaml, audio-graph-card2.yaml,
and audio-graph-common.yaml)? Should this be addressed as part of this series?

