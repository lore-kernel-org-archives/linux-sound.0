Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975223F40D
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023686; cv=none; b=KQs3zxT2H13hM2HhZ70I8/i5741INF1oLms3UUp1sFRUfGzdv3b08IwrIhtCLQ1fofKUw0WoSyLFkIhTe3DmtmQujPYjdxqbQ9ft2Ln3xIpBuOg7BByP3VLA8DiRNrZ1j5+TChO7yqyfA+P7cIv1mHfL8TzOAWRL16PYoiU6o5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023686; c=relaxed/simple;
	bh=0aM3HY/1aVJh4jGU5kIYvSVpXhXTpBy3+OCQo3m3IRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTIvUvAUgEjIZvnr3N/kfLpz8NQ8QcBpaidTAhJuQZTHBiOUhqA2grsoK+yCkxCaJ0vWTkwT9MQtZwlmh15I5mseffaq82l6HTbFvXcZDqWsRG5qwMUPDp4bTfHo4DkQnz9QOY6JsENj3l89bP1/W+SCIt5pehC910dhSC2wN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ddc5a5edfdso172243137.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023684; x=1763628484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75iAsF6vZT2LRBqNQRnHkvddKffQGnmtAsacOCaiC7I=;
        b=bqU6D5pH9o5KT7eoGIRL1u7EAEW8sC/Wu1JEzEgrT3M3IX9d7F2ci/6SU+NcbrkRbB
         hmFc18IxIGk73xYaiBj50CuDZANWEC7suK5mQQM3u1LfTOEwEG+UkdACCLAmXxJcok/q
         lAsxC3gKNmOpP66KaGsV0pM3d4SDDDy//fKNXVEqYDpU+WroR34CxOkr3uyZWkFXljbI
         JSKjg6O8nbRlDs5D8k00n+zfJNWAzqiofcEAYKGgQrr08jWkwTKNocUDjxE6jNIxJuzZ
         oxyqbzLsSKbgkIf1Ebgg3sXbEtVh8S5SXUZtv/5qQqXkjCmT4WMkqtXf3RWTKh3kSMqv
         Lmrg==
X-Forwarded-Encrypted: i=1; AJvYcCXvFUQLqQCinWeu9LjnMFB0Rqz1psgbT0VadQKGsCEEqpTXw8xRwssJ2hVF2jpFSB/STkipiYfTm26Y6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHeXnuU5Oka1iqvCnA295nqUpkaHNzD4tqDUgHTw9069J5hr/h
	lCykikR/wPMh3eq4fM160oU6mImkjGJOJooLeGxXx9ZGKT89p3XnlgW8mZD2/Txe4RQ=
X-Gm-Gg: ASbGnctWi7JPsgEarBPeJvPBqqP9m/IlkvhVeG00fvpvU6mOlhoPxs8afjpMAhApBc5
	6Ra9l7RpqEY7IO0eWIiJFZ7b7E9/MgWXo5hGpk9umOsvz33tJVhDdQ41zRf/tptxG/L9zIh15GZ
	lLFCpgmOA/tb+5i7PLEkw2EDKunDhYLYVnfYUyj5AL/6vQqM/EtMep717vf7eCRHXDs0Np3NCv0
	yoRAkSbQWIAqZfYdy4L1p0LtHCRKe+93mwrIfNpcXo2QhhZ7Fv0qTNBB/KcH8yMwMtoLxwv+dFT
	2zCHVqgeKpNfWL2AnaDL2dQpDYGNeEnQrayEQ50CHeu7RBq8OqhBrTJG5WXExCCeY0RN0S4Ybls
	6Jw9oIEFLHjf2c3KExZE89T00gxjU253dMNfhjWLryjZX0qaty64liFFzSRMrPWR4+9DANaZekr
	mYGnkXxBkMMuFVmdDtiKOIrtnbbND8seLRzSaqnA==
X-Google-Smtp-Source: AGHT+IFiu+80GP8Yy6dl+uyLJ+jVCQNO8gFbo2cUCD1BdPlffEjgZCPJGAs3Ucsxx6wamM21YrbYNg==
X-Received: by 2002:a05:6102:441f:b0:5db:e721:8624 with SMTP id ada2fe7eead31-5de07cfc640mr1695107137.1.1763023683856;
        Thu, 13 Nov 2025 00:48:03 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7075253sm420862137.3.2025.11.13.00.48.03
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:48:03 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfaf0a5da3so188551137.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+bnpM//eANDyQ91ZqPLTrGUhpkQvm3vWeTBNWs//45qBrTI4yG4yHjI2nz1XLpi0r8bN9YiPfLneW4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e09:b0:5db:f440:f1b7 with SMTP id
 ada2fe7eead31-5de07ebd7d3mr2100093137.32.1763023683344; Thu, 13 Nov 2025
 00:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
 <20251112154115.1048298-4-biju.das.jz@bp.renesas.com> <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
 <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 09:47:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
X-Gm-Features: AWmQ_blYo73iDu2aXnp11g8_9sf8FYwelNX4VYfCxNFVK76qka1yJ2ScCZVozO8
Message-ID: <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "biju.das.au" <biju.das.au@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 09:02, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Replace '&pdev->dev'->dev in probe(), this makes few error paths shorter.
> >
> > nitpick
> >
> > '&pdev->dev'->'dev' ?

Woow, that "->"-pipeline looks confusing ;-)

>
> OK, will fix this.

Please use English where it makes sense:

    Replace <foo> by <bar> ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
