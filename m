Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1727283FFE
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140938; cv=none; b=o5sulsm9QVAm0b52uY6YdiLCs5GJgWuNrh8xFXoROC1vMMYbcyh1HpFxKxIIXhyNwk21SLGmekxYNJe11UJN2Y2yf+Bpo8Eqo3RWsFD0vkfE8ZaDE1yDHGe4GOJvyB1NT0YiRiPh11q9OsYwWw/Q8tVv3fnXGxhC1q58xhieSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140938; c=relaxed/simple;
	bh=iylBZ6YAVkkMCPfAbOKWmfwqvwPCdi6SPesOAiL14QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drtnvWlsGAfEiQQsQGy2v2oiuCmDdh+xLUKLbdbJ9JfrJ9nSzbaZb3VRr0FiRXzz5xGxT5Snu29QkPHAT3nNIJs6ic8M3MAMseMdkGzZBMX7Z3249/+jMV+8XhqrsEdPFEda+KrsphZo4/TBJolfyWztbvwNmJFiDLhYNOOhjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z52omiM/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z52omiM/"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e816aeca6so7889696e87.2
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140934; x=1747745734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=z52omiM/mz4Cl8dd7yBrOlhVU8SenHLAMwaF7+1aghOdVKH12oQqsN34CzrYeDpvPM
         H6awPiEGVjzo6GmiMDHl7d+703bcW3BHF+ZS5puhc0ykRyjIDTUwcL+OOFtvtq1zceEu
         zGawtUFsbV0QB9AzM7ayo+gBhOzRKEKfdn+i/0yJv3/GU4w1uH93jafm1O5i0FULkUO8
         RcsPCxb6Rl+jpaWw/mlpmTTQ+Xh2JtXd62Tn3YONbmwghDtzDozDbs5X+3QcQ8T1pngk
         wlQAoA08YG41eJYuRn1lrAo29/FjjeycpsZ718fiXd84PRNZ2C2o7JuVanz+H1WAsebt
         GkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140934; x=1747745734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=J5Lof+GZMiwElCrYi3RURnYlXg/Gvh7227ELxcYgvkoGy5x1KXmxyXtRShNJmIncfU
         yexwK5/zMU7VVIPtum4cLGwUDMLlbahN3KbBH+gda2Vrwfo5kztTDKH4G5aoikoUY483
         6Fqkez/a7VoLDiZlMAB5gvgg9nu8KW7XQPYRtmxsWpdlqN0Vs2Fz6d8f63rCiPjeVg4h
         pgPJJPgtS1ZobQ2GYkkR4m/ml4vP9+hD99gCskqzlSd9RPuBb/GqVy2VYkWBOfUNTYMh
         BUmZ9blchtgv3cAmy/3MhBefQUDSiynJZAti+lYQWnnZA8J3p4nhsEaLHgygnaAc4vIS
         wCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj6tIYXTWWXecGEtOUNQ0/7wdgMDZOPG2bDjr00P0KvzqFB3scdqmWFw0GQLCvUtLK7gjlvfgewFCObQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vETgiUPRH2amN/WqwZ8Tq+VSJVxHqraFvE+Lh6kBXBlYLG1D
	mk1166aEqhKRqVhBOnxzuXYu21VZMWMoFSXLNaUZUVERk+t/xDRa/31TGTKKJhw1SOwR4EHH0f2
	VME+DkU4G8AU8h5bI8L00Le1ln+eyAa7yRqHBqA==
X-Gm-Gg: ASbGncvdCJLzQkx/gqsfmcGHD8kxocfiUoTTEXJwtTIfda+YTASJ8f/ewp0AII3q+1G
	txZFBcN+R/FAcW26FFjF0o+SOPxvTBV58fSM0qcHughzRdq1DMdQDlZXM5XsgT7/uM3fKIEHvfA
	qmYl1rKSH5243xITRttGrgiCywTcH2Pgl6
X-Google-Smtp-Source: AGHT+IHGovcuelmkIHIcldh5FppOD2U89RgWqFm070+YuOgGBNXYGlP0KiMRTWQlufrTDljXXvF3C/mspJXZOd7T2qA=
X-Received: by 2002:a05:6512:608b:b0:54d:6aa1:8f5a with SMTP id
 2adb3069b0e04-54fc67b883fmr5938671e87.13.1747140934068; Tue, 13 May 2025
 05:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:55:22 +0200
X-Gm-Features: AX0GCFtLssLQUl20MHg0DqNZT_Bw55zYPugiENgOkv8p9lbTgkALLpNTHQswSks
Message-ID: <CACRpkda+QuDqBf4MvpE2=w=tg=EkDnA_dnfg4+kt6k2bJNtBrA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, Hold RESET LOW (active) until all the power
> supply rails have risen to greater than or equal to the minimum
> recommended operating voltages.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
