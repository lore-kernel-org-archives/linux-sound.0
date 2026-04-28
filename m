Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B948449EBF
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380875; cv=pass; b=Vb1o+JbecOJ8jHk/3Pl6LGI5TGPs9TVHPuKEiGmGQU9n2pJVP+sLvBnNEtMwQXTJfy06p6E2N0A9ePwYoS7fL5ZWRxLxyDA+BciM3dDk0sjUPIwTdfd6KEx1zAtUNmI9bI8KM2+E6gt/EwxEo5vIYpzdOGxUbji1NdOt1bTeREw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380875; c=relaxed/simple;
	bh=dN5yRIDHypYcmAgsa0nk3b8/VmYxtGD2QVKCaTBwFOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmArOYK/6MPPLDorkm23mwK8cy76U+uUnfCMUZLIpSGqg+uro9SO07Rb1KFBF9/EbwH5Nk4wvim+5uAc5ir1KgnKLxD9cpQ/FyNFVG3aL1btMeS97a4vOt7vvHgCMa13JDu8b2/jRkfuNFOEyCmVAjG7X2GwGbRHTBxa252iaa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhNYgt0B; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhNYgt0B"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-678a1642a81so6638848a12.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 05:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777380867; cv=none;
        d=google.com; s=arc-20240605;
        b=E9szeQSQqokLc0KwIGukFjH3A262YYCqc+CbU4ridAYgQFoJs58CaISaXHugd8Fxuk
         +y35bfj6l1yNdxvmbn4FoL597Yb87d1L+7j4BjnLBa4Crjq1wD2U/uhuUPfu4XRXLmyi
         4JcTrBKpD5wly47Q/8JhS5fyHu8YMkwKGus0ZrJqSEOnfniXWoH3nD/Di7NYRxdopTJP
         Iq7k8I36SA6CSte+uJ1Nod6RqmUygr9zngT5o+4T2tpuNOfUS34LbXrTMh2j3iTmiFCj
         ruY5QnS24l6zuYCQZxhBGTEjpb/EeYZ8siMjs2gko/HE4M4iHvN0REhCgHwJ+alvqiEk
         xgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ob2gAneCOHStuVYkJxgCRh61YpGSxKMP4iu4y7dYyY=;
        fh=YEhYxjvbks9xtyNeElmCDnG7ad6gw7d7Bi+k+T3FDJw=;
        b=AQiO11RL6cHRQdGSQrjlhOHCdf8mySNo8U2MhRpH3QCd703rHZ28w/ygZKUbgKd77n
         +qM/iR/JpW/J6Zn2eU+BcHj1Kvcmv9evlyaL/5iuyds7nUB5vNa4mutFmTbaK1QAj3UN
         668MifsD30ExM9AP9h4uMYM9ldfM8GPCaHDrt7/l7JI68WxnO3I8oTKz5QHd/PpYC1Dn
         pYivQKnYJ3puO0KNJner4O160Veuit1OchfOtikhqE5bQC6Dz1y72RuuxaQA9SJye6jr
         JVYcRXkhoHESEWY+A3WihnM/MdbXT2/wpABmc+DrEvDpigY7QlJv4wUpkR4hHKwo2aF+
         +i2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777380867; x=1777985667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ob2gAneCOHStuVYkJxgCRh61YpGSxKMP4iu4y7dYyY=;
        b=nhNYgt0B9e/tReLmpUZpwvhvL+UKHO0sJ6RQbd4MVsPPtGdBkaXYQf6GJpTVuHfuFV
         TleZqPeX5teHVGob6Y7AiuystOXkXESRwAhVKG12TneImJ6AH9GJcHXJ3XKiWm37GGf/
         +QCs+d7VOV2psAWkMSb6geSHx7IoiZV1Ywv6ruh1Sk6AV5R4YMexHnU7cPbpvqQPbTy+
         8nP4KHESaa6Hc1/WLLh5xFYtZb/OsvBzUyg0QNZFAYNucul325GeWQWS9qsvlrD4XOxW
         WlI0P+o0Dwzo3vjldknlztRd33iJ8zyQTJ7w4d0GIEVTu9g2uFM/LolAA1GsBn3u5et5
         SH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380867; x=1777985667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ob2gAneCOHStuVYkJxgCRh61YpGSxKMP4iu4y7dYyY=;
        b=m3m3MX36BCq14oUSz+CyU2z/dvqMnxGU7H5l21UU2HipeD2vell7Ay6bHUQ8BUCc6P
         wAXTBXReYhk8gG6oGkErR835lqTI3VSmAlML6+3wYxmHQUDqiLGmaSy1qDyqnKupcK+L
         0vCuKVMfow11sKLnyFXz3R/qbm1Kov0lClQT7l7Y2mdxYmbEZd2pg5UhTqULgRW4bXF2
         KwiqoESZtCbR6vMGXww2/VaidlCy6F1zYXaOMf0XuJjbA3DqqaBrmFUL2LPQqcY6uGta
         nr3iv401ot4cyAi6VebYPgaYXaAIVPEBHE53iGELx8qnZJFj+40FMb01uV8qXBgLAs0x
         b5fg==
X-Forwarded-Encrypted: i=1; AFNElJ/1ncNcxdNz0MLJsoQEUlhGCvq0d+QA15o4v1SbE/wWMfE1fxn7va8WaGUoM64ww3/ImUdMn0go5gUCjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0f2zg290EgVYflU4HuMo7MnDqE2VSyfJ31ity19LhWQj//P7a
	a+wkdhaGvjCmfrRc7/HGJeTNvaW1xM4ECp4/gX9GwW4tNhTXlXvBiqTan62Xcnbw3+jU9pFNosI
	i402D+bFcYFMhA1kubnnjqfFbbXyhkOA=
X-Gm-Gg: AeBDietwqSpKbwcPaSjY2AEm1eLKRyi4JaM2t0wV0VbenVpQCCUYn5V2Nl4bzfu3K1A
	vqdMlvs6HH09oNQ9DNz44JEElibNiUgGZ183K+r8gRKPXtB+vQIvawzOaXeEJYlhk11UTuTZ0Cy
	l8ipVsjiZQqu8jek9HZQ8offtX9LVqnH267uQz1Yyan4V7C34zbUGeJp1SJodjui00tpagtEXAF
	BJ8Rx6NrSdtwedYXvegN5MKwBN5sj/e08aSFy6llZmXMjszA+Dnth14J7D1eD5MaKuMYOxgKwCt
	vvcVixNLa7hFG+NXqGltpQRIFjfO9NeupKJKiZtsEeCEWd7U1Exg7WUW/opqJbeB0bnrQii/4kC
	u/Xr7XvSiUK2KzEPz5w==
X-Received: by 2002:a17:907:d113:b0:bab:30cb:a0fe with SMTP id
 a640c23a62f3a-bb804a2f1aamr176597266b.37.1777380866520; Tue, 28 Apr 2026
 05:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
 <CAHp75VdMEXag0oeRd620YJn5TpgqGy4YProDcR7EZE__cwwC2g@mail.gmail.com>
 <d4d340ad-d181-4892-8f70-9b71f2cbef83@gmail.com> <2cd5d716-1e42-46c7-abbd-8d2022b9fab6@gmail.com>
In-Reply-To: <2cd5d716-1e42-46c7-abbd-8d2022b9fab6@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Apr 2026 15:53:49 +0300
X-Gm-Features: AVHnY4IqvitqV7WabTwVjpYe5lALZOGeWuap8fS_lfHowA0OqA_gEJ51qyxAs_8
Message-ID: <CAHp75VccmALMWpuvR9SNbHtZNqygFai-qr=XkNy03vud-3Sfug@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?= <cassiogabrielcontato@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Hans de Goede <hansg@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 3:13=E2=80=AFPM C=C3=A1ssio Gabriel Monteiro Pires
<cassiogabrielcontato@gmail.com> wrote:
> On 4/28/26 07:28, C=C3=A1ssio Gabriel Monteiro Pires wrote:
> > On 4/28/26 03:55, Andy Shevchenko wrote:
> >>
> >> There are 6 drivers that do the same, why is only this one special?
> >> Have you checked the flow on the error path of the caller of this
> >> `platform_clock_control()`? Maybe there it calls with the opposite
> >> event to shut the clock down?
> >>
> >> TL;DR: If it's a real issue, it has to be fixed for all affected drive=
rs.
> >
> > Yes, I'm going to check the other drivers.
>
> I checked the other platform_clock_control() users under
> sound/soc/intel/boards/.
>
> The same bug pattern exists when the ON path does:
>
>         clk_prepare_enable()
>         <fallible codec PLL/sysclk setup>
>         return error without clk_disable_unprepare()
>
> The affected drivers are bytcr_rt5640, bytcr_rt5651, cht_bsw_rt5672 and
> bytcr_wm5102. The first three were already fixed by a02496a29463,
> b022e5c142ef and dced5a373a96. This patch fixes the remaining one.

Thanks for confirming, I based my previous reply(ies) on v7.0 kernel,
it's good that many of the issues were fixed already.

> The other two MCLK platform_clock_control() users, cht_bsw_rt5645 and
> cht_bsw_max98090_ti, only enable MCLK in the ON path and do not perform a
> later fallible codec-clock setup in that same path, so I do not see the
> same leak there.

> I also checked the DAPM event path; failed widget callbacks are logged,
> but there is no opposite-event rollback guarantee that would balance the
> clock enable from the failed callback.

Thanks, this is useful information!

--=20
With Best Regards,
Andy Shevchenko
