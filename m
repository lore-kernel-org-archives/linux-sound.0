Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE66137C3C
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136508; cv=none; b=h9SocCwdC/Sp+yqytXXDiyEBkBPDPsMLkeRqdXsoaC8gKuGMbKTQwl7LIhEom2vCUupIEkOuSfKqv3fWBr/3T1owd8bTsClfmP7lQ4Lua4KLpgaRPoj7hIJ+Mcjledi9Wh8t2IIP6wtZBv4h5qm4QQKQexuIyvsec7vwKvFl9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136508; c=relaxed/simple;
	bh=2k1/oB1b1xsSx/hwwozwCabonaX31FYcHee9Ghg3YQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeqmWg1OX9R/0EXBepelBAgbcZ9QT7lN+r8r9/EcwHzNdU5LTJ8HTJg5VtOkkRQMAHJabO/RxQCqTQthn+S17k+LRtPL3elbgrWdeDOHvTu/fwLF1s1sI2XfrVcpeUpXvB9JQ+3d+eWkJA+JldBsmNG49PM3fMH7S7+IuelhIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBc/uMzG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBc/uMzG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a315f43ecc3so31472566b.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706136504; x=1706741304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2lDJfHqgAnsylYiJMOYGwOrJ3u54Vpc6bMpn+gMMhE=;
        b=CBc/uMzGdn6xiHDrfr1TixFOAR08xZikk5N27RgDXrwv23x4NwxY45ZXlt1CVpYWTA
         70GtPBcg8IOv7ydK7hYLKub/mt/wHyg8p6L89m6Ky85xItk9sEpolyu5c+7miroOUNEC
         kbjS3wpzbawkDMXw01sBiLA22A1B0jNHV5cYophG6BI4QyuP+a3mghrLIi3iM8usWsaK
         bBstnDUva3PpGB/U7G5WQmGTevEKtU57QXUyZliNUwpGaWuiW4emJuoZOTJOLKGwRYj8
         VHzrcdHVfllMR3H3GuNcguL56VC3ORylfA6TsDmmV1mt16/pJdzsnDVZ5gkdiw+diTG/
         /8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136504; x=1706741304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2lDJfHqgAnsylYiJMOYGwOrJ3u54Vpc6bMpn+gMMhE=;
        b=YyBtjSs8ij5oF9M/GCuXYVzwNzL8GURq544Slvld5nRvQK6KCLOVDBYYzhQ8iy6pnT
         jLZDo1BusA17XHRwhEei837yEEA7uh5WeaVtAsz6u/q4qVKyjAg7/vW00DvYNOjTgvwa
         kka1yaxGykrNep+qml5/xddfe8RCZVc6hTFqW4bo27fs35nJBMv0n5734Aad3sfO+FZR
         RyfGQ4gNHUPNdeCTNb5JWi1VbH4sAB2WNQiyYfqWEl3k4CQEUTN8gIzGIOKlRoQVqVc7
         tonNglTh2qmcraq4Y6ocNv/9cbt3ja6Jhlxb919Wxhb4vz3XEWRHCdjfIYm4hsmsQUWQ
         M19Q==
X-Gm-Message-State: AOJu0YwtrP3LtAarYgfgv6qkdZBmChjtjgNiMDmph360h9AorVg2A9Bk
	zSF5nNNjEc1u7TCDUE9Ktm9Ped4AjK6e4NPOtPzmKAhgI3rgXryyW08I0LvmdTlv3do4qg/97uB
	IGyFFygMdxsChMAyQUYclbdkq/TA=
X-Google-Smtp-Source: AGHT+IHCheky8a8aA5K3Tecr1RkqI1DhEGpvVY5LyYTE7NlgxQkdJF+1lmYlOIPa6iL2VLYE6/P702J1Ts8m9SoehM8=
X-Received: by 2002:a17:906:4091:b0:a2e:81c3:80c4 with SMTP id
 u17-20020a170906409100b00a2e81c380c4mr17143ejj.159.1706136504221; Wed, 24 Jan
 2024 14:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:47:48 +0200
Message-ID: <CAHp75VfbgJMvOgjgEU49y5zPV4RPPPR5e-nKv+oqP7ED6AsndA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider
 for the PLL
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

...

> +       div =3D fls(freq) -
> +             fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1=
].freq);
> +       freq /=3D 1 << div;

  freq >>=3D div;


--=20
With Best Regards,
Andy Shevchenko
