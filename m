Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E82349B0A
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274710; cv=none; b=sNjca0cMAyrmHBM33w8BiA7vbRHwhFHTVHuRYm14eN9p7Q8489HKhWzm92NCXib6YAJ+iGd/PP83ZFT6Uv2SxXOTpVBPNsDHUeDo52AtwCzVd/TCnjiM9yWG2HYF/B1+3H3vE44SgG+cYOzALX4t+Jgl4HWbJMdaqLv6eV4NHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274710; c=relaxed/simple;
	bh=hA3EQ6NGh82+AwwxLF9pQfeChp6zhM8Sbh2F0J21T9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tg6RTDIXE3oy53oKVRmBvkKR5V5XFU6v6UG3jdNGRfhfMEW5RUFptZGkR84U7ae/5D6nCtNlvETTRaFw1aMDu/54UQem1CMrq4NCPYOBiukVghF51cxOwTe+KOmg7Y8ZZTtLUh/x/U/AhfhbR9XC44Eupii82a7QWtBGWS5qv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1784451a12.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274707; x=1781879507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ctV4WQ6XNHzaDQh531DnVbwuxtW2dAJDIPTs6QoUPY=;
        b=ONAVEDA5vpcvywa9Eduo7jwZ+VzopZuxEukr4HJKZ8qqVlGKny3PzVCoSoA0o90sH+
         8OnYE9GCpdpJBpxtuLd5liLpu7RC8mArTaDTwcEnNFfQNWwyBZaI2/E3R43scAo5A0yz
         PgXCR0G7BBLpKNnQjcqZu17hsmZE/nZvG1E7y7dTClTu0I35xSEzFsAWe56J2eBxT8oE
         cEn2br4ZugtZB3qWCMgoHbXS/BCmZ+/b8w9uByOW0TRkVhjyVB+20AVA9oFueXzyr9NI
         bhlnAJ94RLpj4swj2W9QFbp4BkoWGmNPjCSxGCGvEo8fpKxqlvXhHojehmpeoDCPjtxG
         Z8nw==
X-Forwarded-Encrypted: i=1; AFNElJ/sXcEpugrW76VkdJh9T9YZkL2GN51yfveaPXU005ve73jICVMegVbikhnPCSnEgS/RMa9Uo4tHQTH0Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBBmMGlTr/K9M4WsBLKfTPtmoPlKjRlx8cgu+y1eDRJ820XQC
	h7jL/dAR+8eobjrcYJx5OwZtHXGP4KA/HVJ0K6O4U1Qyormh97cjCfB8qJT66VCb/aw=
X-Gm-Gg: Acq92OGdb7L0u/jcMrYel5tIfpp1OsP0+XHZ1edWLmbz5KqmBjOrzr4yEwfM9LbLWu/
	W8psOtfh9tgCXTZWKJ8hFgMSsX4qbE3lZOJuQjV/y+ZHWx27aToS+CKVJiok+qiMMJoH2KWwkH0
	e/4KjXMQRdgnVqWmridZexYEeq7VXBzruVSNAmqg3mMUPlxXDdUJcdcltD1d3wsB9kTB+KGT/8U
	Xwyr4v+UP4BYHwJwq26cZCxK72tUPaOPBLvocYauhbGPwLsLXlURhSAidLly8CFxeiwWhSSTlC3
	m8tch2jtAUU4SQFPjUDzXEUWL+BZpOs65rNHxyLk3tzt7p3iRw+GLxi399JRNWf8glG8ln1ELd1
	FrQLrMDO25SQStpU1dz+MT/Ht1/9TfJCsJeLNhLcg+iiP/oCdhHJmQo/kgCANSpdXwS+eBUUbts
	5E+B/mUv4J08Z4YxtKlM0Lm+FH6AIxefAICsrvDn8Z12Ir7GkWyZdc6ZEy17Bu
X-Received: by 2002:a17:906:2092:b0:bfe:ed35:e857 with SMTP id a640c23a62f3a-bfeed35e9cfmr37451566b.51.1781274707053;
        Fri, 12 Jun 2026 07:31:47 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm113050866b.28.2026.06.12.07.31.44
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:31:46 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1784337a12.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eAg7mZ81VfZYXYyqC6s5/E3I/YWJGfyd8yq52bZFjdaHawSClA6sBL4ZfLUXm4PXmre6/MTnK9vWNXw==@vger.kernel.org
X-Received: by 2002:a05:6402:3213:b0:691:afc9:f59c with SMTP id
 4fb4d7f45d1cf-693784eb0abmr1551827a12.1.1781274704600; Fri, 12 Jun 2026
 07:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com> <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
In-Reply-To: <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 16:31:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
X-Gm-Features: AVVi8CdbLq3XktR5SNY6UI5yuB8PMlJ_y93ZpORIxTU_5bqPrPMevfVX5_O9YCY
Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 12 Jun 2026 at 14:54, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > According to my schematics (RevA), R120 is not populated, but R250 is.
> > So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
> > and the MCLK-pin of the WM8978 codec.
> > Which revision of the schematics and board do you have?
> >
>
> Oh, sorry, I misread it. You're right, mine is also Rev A, and R120 is
> not populated, but R250 is.
>
> > I haven't located R120 and R250 yet, so I don't know which
> > configuration my board has.
>
> Please flip the board over; these resistors are located on the bottom
> side of the board rather than the top.

Thanks, confirmed.
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
