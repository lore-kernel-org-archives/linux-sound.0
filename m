Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D8125A2D6
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803003; cv=none; b=rocrKP9U+9zY9E/4ASRqqn6FlHGmJK9QY7zmhzHkLW3VPQUpwzZIA+RR8m71Tb6SW4wzgUsU727o6uf2rjSpW9Ne3bNIkoJB3qTiettTu413/kcdb0kb2ehZ8IfPCxtuiXUJgkdqExoUavuR/4VgmaidfmjC1/FTvOTiY0/vi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803003; c=relaxed/simple;
	bh=OV9DY0EXmW6EdAj7X4o/XtYHW234XQJ0zlzRbGxadyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtBjrZEjDfjXn4RosJnPzGnPEaECYXNl3TfDJ0+Xle8V4nJJHeReem67oJHs3L2o7uqxthF4MXf/L4m9HNrRkPo6+Zsp+LX6PG9D52KcVzHNWhs0L5Ar/UgQ0EKxc2VKLp20vAX1aqBagUmOTqJUrBtBlzFDKETO+ZVj9Bwr5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzwaaEbj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzwaaEbj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so4846174e87.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802998; x=1743407798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j0OP1AKco8P+xjWS2Kr+J9Jp7K5JlZpKB0Y8PSLBoU=;
        b=CzwaaEbjTn76J2JHWpni6YdGDhRua4cFDti+uYaqIdvSnqO0wIVOnv6F84q5MHA3Gl
         wdN7BD8iZXU09atVFa+nJesYnYx224sH6LRpvT0P+5rVKSHbHhYxyMBMO0ml5fzKyfyZ
         TeRchu1teFReZPPtJ1kkY6fMhdPxGt8OeBWEYVrX/PEEu/1b/ycxeF41lLgwpvBFFFLA
         5PoDEBQ+nMdafhI5mqbiJPMZK5z5STVbNsYqulr/LSCv6ZcvleWDWpXm4Cov9ed2jgvA
         b12wCnrfT1vkOfSV7L9BoTSYpnylPwLPM+aTNDNaCDL0mAPisME2Qe0F+TNJ7MVMOva+
         V7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802998; x=1743407798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j0OP1AKco8P+xjWS2Kr+J9Jp7K5JlZpKB0Y8PSLBoU=;
        b=qsDNvkq08lD5VphnY4vPSzfNzW3k1drVp1Jt2+JBN4evA2V0ReDFzD61LRQUtAMH5p
         YItxi4r7zzv00j1QCHpIN/1pNDbo5e8tp3lPXkPR/T7cXD04RKsaKgaPv2la2gBSfgFi
         tf7JN0p14JzvKK2/b+2WMoj5PtLdbP/DpxjpWGgOX5J0KpbyEVN6qIpd7v12pGQ/4wXn
         V+DK86q02OVIQYYg762kR+0EIkzCG2yCT5Qd0QhR9804va/uevSvObFbRYzex3vyquuR
         LDFYiIECSWLtmaUibP3Mk9xY1wF9wLYMqy0I/FBNuohHPB2xH4C2v57K2MHDqjEknozX
         X3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXkBU2VMdvDE2M+tgQAYL1usfrPus98pdnV4OH2dws0GVBhC3ewp51SEG1wbpojwt/xy6ZcdFl9a7kjSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOQXZWGfWLvM2fZVXDRmMDhMCD8D/sDQohyCDHiGBKBfALjWE
	5GUNHe+rj0psDvSLWKpH/e0n7Eyi16e49/Tlpala1GRL3jgTjH13np/nMmmDOuqhEtH1A5OyGro
	RH3wCT56KCs+5RbGzpOzUtbe1pEgsEApD83/eFQ==
X-Gm-Gg: ASbGncts0TTGbgWGunWjxgStBSqcJrRTks1PK1f1PHGECr0gMsiw8BJufdzyz5R++af
	3kf9Z2LfNFzjbFndjKjAZk07EIt/p93AOy15/Q1XaXodAHMd6jSKfoX7sSKCdHG7PQDRw+5wT2Q
	httsU3Lrl9If/vPuJF3v9wz64=
X-Google-Smtp-Source: AGHT+IFtr+BxDWvLi7B8XvujijuE/uusgz+e1CxANxOUbWAMxr/DRbOjGsjgANjwrNpVsOP4YonBUJzw5RqtjWsnyQA=
X-Received: by 2002:a05:6512:1107:b0:545:2efc:745d with SMTP id
 2adb3069b0e04-54ad650d03bmr3863290e87.46.1742802998153; Mon, 24 Mar 2025
 00:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com> <PAXPR04MB845940BF9775DE957FFC6A1388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845940BF9775DE957FFC6A1388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:56:27 +0100
X-Gm-Features: AQ5f1Jrr5fC1PCYSaOd3zNEeWMha7OQ85VJU6OPpL4AdSdkXmmU848HXGJYyJYw
Message-ID: <CACRpkdZ4eDeN_DepR31R9mgTVbQKgzJcmndss5x2iQfgOefNag@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 8:53=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Maybe you can fold this into your patch if it helps. And if there are
> > more of the codecs with this problem, we need a similar patch in each
> > one of them.
>
> Thanks for your quick reply. I am thinking whether we need
> to force the polarity of remaining of_gpio users.
> Some old devices may not able to get tested,  and some
> may use firmware to publish DTS during runtime(such as Fedora,
> openSUSE using firmware based DT when doing System-Ready IR),
> so we are not sure whether using gpiod api break the platforms
> or not.

If we have an indication that this problem is common (let's wait
for Steev to confirm) we might have to add a small patch hunk like
my quirk to each patch to make sure we hammer down the
polarity of these codec reset lines any time they are used.

It's fairly straight forward, as you can see, and they are only compiled
in if strictly needed anyway.

Yours,
Linus Walleij
