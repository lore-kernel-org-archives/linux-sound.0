Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5852F0C73
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126540; cv=none; b=Qn73qr8CJb2AR1RA/liUbcwCL5j30sIwWINgwbxQqbmgxIOH3lOAsB/nfskOBwxwfCEOABrpemKn2fha7jNs8FsKsQtKrPAPGjiOYX2lGsXi+1peaQBtS2fARMwNgbEG0/bWsISWcbkxIS8dLpGxpqxs8DFJmy4q16/ewm2EStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126540; c=relaxed/simple;
	bh=D3VCs/yBFzDfZDnvikVOvGWSHbXeqmmlCqMVXJKIChc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GICEYzA9wqN64FUYUpvJ/WobwzYGmJURri4/qIEcNWEsOvx2Zf+WJO8ijW+O9CAfuxQ51WLsYNhUAFreGfu5XWoFB3QGSTPmme1B6Wzngw/+VJw7yP9N9yUlVrmmp9RXTmlFYcVf7BaIazBlDIDg9I53Gk/RtvZrVSQpe3+ZVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlxveLth; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlxveLth"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso1564775e9.0
        for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755126537; x=1755731337; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYzpkw32rfojTro/yo7c1tGpbEd5gb4/gc+Z99oDHgE=;
        b=OlxveLth0PbFbSinl2x3O13ijMXjQfKu+/hI8/4tziXCGrFSRzKBOkkOxaDjFOhgev
         pu/c8d/HpLRsUuoLe+m7ExvEWe31G32wkO6gZH6QfsOrhl76em65Q29WSrYg2YaHFZ78
         zejUsVj6ZBezt5WMfPNc5PffkZ+tvIk1k5Y4SQhGr+AGjYWjK5F80kNhF/SGmFWImX69
         nwr41r/tnhdmJ/wf/Y9D2xS4GTzxUUmUoo0pbSbJRunQGJ/PmHgpnjzzCGjdlx+8vq76
         XUqqobisBGphIoKFwbS0CUG13EngYsGii1yH2qc1D1OG7NnF6FT8fnHE/hk2yeCZ6rgE
         vdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126537; x=1755731337;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYzpkw32rfojTro/yo7c1tGpbEd5gb4/gc+Z99oDHgE=;
        b=SUJsJM7ANYYsxxIeV8rUZy65l9ljlX+3RCMRu+vZWYFLyjSjcerXTWpVkAtHQa18Cp
         OeBlRuclRnJl7zr9htW3r1p3gJm9TRAflduXb5bon+KcR/r3qGoicLjWXkwPOPMV2sjH
         Yd9Z4zfBYQCK2Ufne0Kc/6LKRTwHX21H0WZfidzRvkuq1vJpiz5xNsbTfGZqBzPh3JoL
         fn+FFKLcY0VEhFuEJgUMy1UxToithU7HItaGvx5EgqtRr4ROAPGf+1HPqtktiEM75ECQ
         Ggq+4Htjw3KzMIyNqJsiKRRazBx2SIAgv8Xn2948YY4QOhMKuu9nIPQyK51DaV/MR9IL
         eT7g==
X-Forwarded-Encrypted: i=1; AJvYcCUSENndvCjEx4nhzAB3o+QLCxEbyc60EVey8gVFeL+hC/usppRJ8DiAN/ELJfRapJFEJ3PBrIkJ/MiZkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztavcmookfesDc0mzaJA4usaDirUQU11DVJCgOj5x6m1s7bGtw
	kCIz5AKgoGD/HGb76UDMpDuou9jaiF5phv/AxNSuoG+RAVw1P141LIBHa2H2gmBvEcM=
X-Gm-Gg: ASbGnctpbRe+GbJkt8jHmE7n44ljVIJgmDQMUBGO7mgvQlz+ReWnTP7lAsQBcvCcUAf
	wU6a1SqRlOCebkQWDAEt1YUOPBzmxgtp6mgRh6mSEaouCS5oOsvCtY3Fa1jXvSIzI2Wbb7J9UvF
	dE5inud2X0iVWuehos5ZK0SDRiDnv9iEWGFKVsUQN3C2FrukqS9uSjqmAz7smrMrkFkIJSBHwxP
	aVjCyUjJ4f+efC+ztFxLE/XfO5H7YoG89w7PXqAwAfAoOt1jBxzy4cFnWocnI29ciqz/7NkuZCF
	zeOazIO93zhBcu5mbC9FyP2nFZir1Jte8PwspzAu/htuUHctbYi80qNfcFZVEhBJpiuYLyyq82f
	mK0nKCZfocjlLcMLYV07LgWbrv7g=
X-Google-Smtp-Source: AGHT+IFbhBknykhgRmGNQ8HnZA9S45Dxb2/Sf7agYpr4TtNvocsFTRipZsdaZQpRwhDbfSKf8QHY8w==
X-Received: by 2002:a05:6000:310d:b0:3b6:436:b8ea with SMTP id ffacd0b85a97d-3b9edfd22b1mr647097f8f.6.1755126536667;
        Wed, 13 Aug 2025 16:08:56 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a590187sm16856315e9.25.2025.08.13.16.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 00:08:55 +0100
Message-Id: <DC1OFJFCKMLD.28U6N6FES0OC8@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>
In-Reply-To: <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>

On Fri Jul 11, 2025 at 9:29 AM BST, Krzysztof Kozlowski wrote:
> On Fri, Jul 11, 2025 at 04:00:11AM +0100, Alexey Klimov wrote:
>> +static void pm4125_unbind(struct device *dev)
>> +{
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +
>> +	snd_soc_unregister_component(dev);
>> +	device_link_remove(dev, pm4125->txdev);
>> +	device_link_remove(dev, pm4125->rxdev);
>> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
>> +	component_unbind_all(dev, pm4125);
>> +}
>> +
>> +static const struct component_master_ops pm4125_comp_ops =3D {
>> +	.bind =3D pm4125_bind,
>> +	.unbind =3D pm4125_unbind,
>> +};
>> +
>> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, stru=
ct device *dev,
>> +				       struct component_match **matchptr)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	pm4125->rxnode =3D of_parse_phandle(np, "qcom,rx-device", 0);
>> +	if (!pm4125->rxnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->rxnode);
>> +	of_node_put(pm4125->rxnode);
>
> If you drop it here, then you do not need to keep it in pm4125 in the
> first place. But this will point you to the problem - what if
> pm4125_bind() is called after you dropped the reference?

Thanks for pointing this out.
It looks like that component_release_of callback should handle that so I
don't think we need of_node_put() here at all.

Best regards,
Alexey
