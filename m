Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012EA25EFBF
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 18:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713055; cv=none; b=ZVebb9UYQXM6UsNC36ziypOWyFy6DaooXjrNa7IMGAhouGOT0NyUpEXLfImAjvTMIVHtq7ok9jF6IgGByPvtjG9DSpPT1VYpgxUUyyIEnAICyW5irF2DMYntMn3NoG9f7MyjiBFDlND6/fdnbCW33bYQHl0K2LDRtw79eeHTeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713055; c=relaxed/simple;
	bh=OpFpKI+KtlmIT9oYEBNy9nRTNf0yv3CRnBX+62DRQw4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jaQF8iux/Y+R2k7TSg5gxqSOCWCLcN0KEEn4UfJCqvOkz7Zq8L68X//lScIpOMMr7T6fbG3y3FPKoLkT01EN+fG+S7X3hWV4Lidg9M/7evJtyfwFGPzXnt/LogzPIMLLgq5xwG7cw5Ltt4VyDH23DvKgo+x0+I5ViSQN/jxdb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7UFMh+u; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7UFMh+u"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso802315e9.3
        for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755713052; x=1756317852; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/AR5JOfPXOoSWz1scRPUv02h/vmF6EJ2WDbLA90+dU=;
        b=P7UFMh+u3+qZUMXsFVqBRmxNwYYrVqeWrFiQJ2fi71wFQ4hUPQG6h3dWef+ZtvnlGn
         Fy/PDrX8UD1rL+zOnrs50zBsoLaAZujAHTOQj7Y6LvjkFUb4JnRU0bfaz/vXAY/djs48
         HskhBZ2RwEmwUgEIiLprvRB7qfOYg740cTPU29VA6Qx4Po+FvDPA+6zbgVOCnXIgn1KR
         4N4uMvlQpTVJrHRNd5rplXy2D3HpgXzYzTryVoeYMYoL3PVC179l/oFvBxICzHRROdbc
         j3+mkoD7mcwEgDebtiUv1vl4rAHMA6Uao3xOAmmh19euqj8kq7YIQnxvFd0EI/umd7gr
         8Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755713052; x=1756317852;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/AR5JOfPXOoSWz1scRPUv02h/vmF6EJ2WDbLA90+dU=;
        b=r9OXKnchho6g0d54kQReneE62H3fBSe+1/ZfyMqMcdr20QtJd5+wK+vHUhgCIX48Vh
         y3ceO4Cfb2Le/Wz1MCy09TAU9ZqmKMt9Vsy6IpQxmepDEjYM5NJHncMsc3kaOnh3hUlH
         zvz8T9ku95nodqFA2l3TPnbf4wk2ExmWlYmO7v1LV05/8O26ohqA9BT8sDKEh0uGsce8
         W8itavSRh2L818xZJU3Rmvk++JXbn5xHoPt1c5xISdREctVbTqJXzgi759W9HBri3rsv
         b0raUjy+sGXNWmM++p30YspmD7o5zdsN67UbR1QYv9dFpaUq7iI7he/1TVwPLnn/N4sf
         ArbA==
X-Forwarded-Encrypted: i=1; AJvYcCXOiEestDeizFOpAiHWQTazsHYQajiXHdF9oWgK5OwgXogNqv1LRriNYx0VqaRx6mrAsxywuE9ExTYezg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KkdbmN9+Ds16hNAE28oSH/9fZkbFnpChlZPvHPoNSxirwYDK
	6YwSwj+hIth/3f1KFV5WxBbG6QdEKTNlfgQCOXRjxFKgLl+Zkedna/2x6ZgeF/3ZwXQ=
X-Gm-Gg: ASbGnctyWVn9M5bnbFrOK4DW61toPo9KhPimzuVo27RC6NO926SLi/tUwZM5DLKiZdL
	kunbTPIQC5LOFoj9XuX3wOOceNfkERn6fYXYfOe/IE31RIJVDcwVShq/kKWaLnMEzuHSOZD9lDX
	EoDQyezrD9Sxs3o01FIjEEAiO8ZF2n6blTywusw/cKYYprcbz6IKV3qPrYIvz9wjbuuDnJa2H9N
	VPYsxK6knf76v7g1vfnPIVuJe8e9qQ2u70u2a3RdmMtiV8L1OwtbknPLp9nlQzVxZCrVFREvV9b
	J1+kE0lwznnBXyBNS6UYUke6t7izIAP6MAQn4U7JXchbhEnSW+KPr6c7wmbRGmolrzwYQQrY/6U
	K9mFOuF2499PsWAk8tvn3gnghC94=
X-Google-Smtp-Source: AGHT+IF4HffwmvTz6VUbz/+5M+jcK4ZI8rIXlBiu5vgtpE5f8sju5xfz46Xbc5v3IHdDPzI90a1fDA==
X-Received: by 2002:a05:600c:4447:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45b479ad42amr23982595e9.1.1755713052212;
        Wed, 20 Aug 2025 11:04:12 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:3a9b:1de2:5440:9326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789d1dsm8464172f8f.49.2025.08.20.11.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 11:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 19:04:10 +0100
Message-Id: <DC7GC0UEKZDM.2C8KIM6TFLMHK@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Patrick Lai" <plai@qti.qualcomm.com>,
 "Annemarie Porter" <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
 <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>
 <DB2HSWQRGFZM.JVPTBYXCOTKS@linaro.org>
In-Reply-To: <DB2HSWQRGFZM.JVPTBYXCOTKS@linaro.org>

On Thu Jul 3, 2025 at 3:33 PM BST, Alexey Klimov wrote:
> On Wed Jun 18, 2025 at 1:34 PM BST, Srinivas Kandagatla wrote:

[...]

>> Pl use audioreach_set_default_channel_mapping() to fill in the channel
>> mapping data.
>>
>> Why are we not using channel mapping info from the snd_dec_opus struct h=
ere?
>
> Okay, I was re-reading RFC and can't really get my head around this.
>
> So first I came up with something like this:
>
> 	switch (opus_cfg->mapping_family) {
> 	case 0:
> 		if (num_chan =3D=3D 1 || num_chan =3D=3D 2)
> 			audioreach_set_default_channel_mapping(ch_map, num_chan);
> 		else
> 			/* mapping family 0 allows only 1 or 2 channels */
> 			return -EINVAL;
> 			break;
> 		case 1:
> 			if (num_chan > 8)
> 				return -EINVAL;
> 			if (mcfg->codec.options.opus_d.coupled_count > mcfg->codec.options.opu=
s_d.stream_count)
> 				return -EINVAL;
>
> 			memcpy(ch_map, mcfg->codec.options.opus_d.channel_map, sizeof(mcfg->co=
dec.options.opus_d.channel_map));
> 			break;
> 		default:
> 			/* mapping family 2..255 shouldn't be allowed to playback */
> 			return -EOPNOTSUPP;
> 		}
>
> but I don't think above is correct at all.
>
> After re-reading the RFC few more times. It looks that channel_mapping in
> opus struct has nothing to do with channel mapping that we need to provid=
e
> to DSP here. The channel mapping maps "decoded" channels to output channe=
ls
> and seems to be needed by opus decoder logic and in some sense is interna=
l
> thingy to correctly construct sound for output channel from opus stream(s=
).
> In other words if output channel is present and valid then channel_mappin=
g
> describes how and which decoded stream or streams (coupled or uncoupled)
> to use for producing sound output for that output channel.
> This is described in https://www.rfc-editor.org/rfc/rfc7845#section-5.1.1
>
> The number of output channels here actually matters for us. We can constr=
uct
> mapping for channels that we pass to DSP based just only on the number of
> output channels here and let DSP to figure out how to scatter or downmix =
or
> upmix them to its own output channels.
>
> Conclusion from my understanding:
> -- we shouldn't mess with opus_cfg->channel_mapping here, it is needed fo=
r
> the correct operation of decoder, we shouldn't call
> audioreach_set_default_channel_mapping() on it;
> -- mapping output channels to provide the mapping to DSP might require so=
me
> rework or I need to look into this.
>
> Or something else that didn't came up in my mind yet.

As discussed during out-of-list chats I'll update it to include mfc module =
in
compress-playback path that should handle the mapping to output channels.
I already have a change for that locally and it seems to work, at least it
doesn't break playback.

Thanks,
Alexey
