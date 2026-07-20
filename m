Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83005414A3E
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563451; cv=none; b=LiBmlDbNGBRQhU1y6q5vXvCBr58q0PWOvphSyWvn1GNfuskxd0MjpITfWrPNmE+mnK4jrdmjjwx+GuCVzjeBQvm1t4FxjxhHEsrOr2sU/uLBBdm6pncwKMQURMUBvK+SlETEOd16MaE1svzqD7rJAdadF0hdRVjUmsDt+tCBSe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563451; c=relaxed/simple;
	bh=u3z+lHD5m7/qFz7kQW7VowSbBq/fycf2z0IDWgC6UQo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GG7vvN+qFcSMxVJJyd3jTs7p3CIF559jhjhZVIcC9Ex+T+FTuAmy3tGuOmqJVv5Im/dMx1/WuFvoL+tK3PshboYBMWO/750T2uDLo0Ri4tfAsa2ldnoE4WsWMbg1IsBOlGf2/Wdt5lCZGJPVUOz6NliBQeSxLriQi71PnMJ+qZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TenWakaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TenWakaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563031F0155F
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563450;
	bh=u3z+lHD5m7/qFz7kQW7VowSbBq/fycf2z0IDWgC6UQo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TenWakaHQXZLPErPCHKrQngLteyv7OcgYAF39bxdrthS9qyPHcpOmz9JkYH3TXhIZ
	 MQUXGRdZLqrzMw0B5sFJPfcFl1aEeVQ0mfYeOcUTX+/481ul+MUzRTKLH921/A+IK5
	 fzeSGLYHodmOfjhKmWA3iGsT/nQeAIEzLIp81VqZGGiee4oYClRQQDrrNPr/9W8vSe
	 Glt49Gqm7Mo1S3ccasOxkX+tOUFUik+1QRKumGmFiQqcgzR5gB6p6GQb/Ok014p36e
	 fHWy/zrWJrMbTl2scEir+PZn+VtieMbb5ROcy4C1yX36ehDKY7r4XLuHJf0NXYCaZa
	 1OCTXY+DsXDbg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b01146b205so7629428e87.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:04:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqj7D1NHiYajONAAu9BCDTIRhzBm+oMcT4tw+0aZPdpkCOeYmV8R1BoT7DTkrBGZB2ooLApxAC/yuMF6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeBe5LoQ/AhkybjtDfxHPBBdwMSEhvLqUw1mLYWXHSMQI+L0r
	XoDAwe7nip/7SfjM/yYw/+/2ZK6q7hAu97kCDYczn1Wstq4Pq5fq2WhvreqG0YcjR/DkWn1uboz
	7PAeOPhUWEEbgK/nR30w8NOxTmI6Ej297SppZR7blLQ==
X-Received: by 2002:ac2:4ac5:0:b0:5b1:51f1:594f with SMTP id
 2adb3069b0e04-5b28f9a58b4mr2058147e87.38.1784563448908; Mon, 20 Jul 2026
 09:04:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:04:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:04:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <44ee60ff-c7f8-4ca7-ad65-7b610ad13d24@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com> <44ee60ff-c7f8-4ca7-ad65-7b610ad13d24@kernel.org>
Date: Mon, 20 Jul 2026 09:04:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf6tohNxQ40AAcx=MXb7ZQN2mj6j4LJ=4V4ZpQfPktS3w@mail.gmail.com>
X-Gm-Features: AUfX_mxOVg1PhmmsBrl72jslVLexlQFkurPRt6iAzfj_5V2DjRA_XPcfkRV349s
Message-ID: <CAMRc=Mf6tohNxQ40AAcx=MXb7ZQN2mj6j4LJ=4V4ZpQfPktS3w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 15:54:41 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 20/07/2026 15:42, Bartosz Golaszewski wrote:
>> On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
>> <prasad.kumpatla@oss.qualcomm.com> said:
>>> This series adds support for LPASS low-power resource (LPR) voting
>>> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
>>> platforms such as Hawi.
>>>
>>> On such platforms, LPASS requires LPR resource voting via PRM to keep
>>> the subsystem active. This is handled by adding a new clock ID and
>>> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>>>
>>> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
>>> dedicated DT binding and pinctrl driver.
>>
>> What is the merging strategy? Is an Ack from Mark required and the series
>> should go together through the pinctrl tree?
>
> Why would an ack be needed? Cover letter is very explicit on that
> through complete silence that there is no dependency (except that it is
> not true) so why would you take ASoC bits?
>

I don't think the cover letter is very explicit on there being no build-time
dependencies, hence my question.

Bart
