Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15EB3BB69D
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325064; cv=pass; b=DEhIBU2jkvGv0hrYCO8aiBc9Ku2ZhSCgbfph+wY3y60U0+I6Z8ohQO0gwP+YIeHmUXibImzA4Hp/40Thy4zwZ3bae1hJWnx+ssY05jXfZ1rFBxPY2iv3HK/BvMYTzCCCNDUpu3/vwGtQsaOqH1e2PapWWOyBUHCnATx3GlHdLio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325064; c=relaxed/simple;
	bh=hCbc8aLnsEt6zgLzaF+eVqd7nZ5pbDQnU0hBPvvS+hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWDNMDW22WeZWqf+bpmDuXZ4dKUT1zTnaQ4+jrSr5wzYy65iT1Zu0KvvpimZPHJuNz4E8TRiiDCOZun4g/kahIpq3+4//J+XPk66WvdrZG+uIDnfmjYs30nJxTa4YOv8+nbn5OKr8UHIvLqpOzLFvwQpJIv5i/8pWicQotMo5e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y24Bv4rd; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y24Bv4rd"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3967738c801so16108811fa.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Jun 2026 07:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780325061; cv=none;
        d=google.com; s=arc-20240605;
        b=DBKWBFLic21BA45dScr5arogKJsMuu5b6LLSWivkE4NcoxJ6NRL0e4YGCv+Pwe6cOj
         htHruo7/9C2/R2diDkLLxdcwO4tvvbZz6idynignYbJFmRvcz20GKoigEnNcQ8sgLC0P
         FyCg5moXDbuaMnO/bLuJcpe4DOM6JxHFpho1v/OmFPYqEi1xbdGXDbRu+khXNlvUJP7/
         8XNXbUUl8t8e4t3f8eoUVLuLyVBxxDOsG7cgyabH/sah7kJkfxTf9WubqpQDiLZ9P4pj
         Xsq9QRT74T3ACSCZpHy9oIjqQW21woXF/gtxfsyZwKdcd034mXGHsT4CmIf5jwH80BAg
         rr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LeSGQAtfbqIjwsYge5eawocxe2T0LG78G0yrJejDqDA=;
        fh=wfQm4zHhUwHrV1Hpnqk+yVoeteeuqLmh/iWNOokhtbE=;
        b=HYGrgwUaTWoqPGF3CCRwAhDD0uvqhbVM7agYPq8vQEqnrZe2LUtpTsUh/zo+r7DzIn
         q8UI5/9wYyQ7ey3Y32KPM12o+GrQi9znSYk6Nhvg4U+V1pB4lCDJlhFvmEC8O43z/Sse
         uPS76Xsd0hhrWg/Rd6FCCW7iTrJutuBcsWFm75EE9JoHXOD6IZXjGxX1QCtvVFaZnMBA
         vKeDnqXisvEFTIbMMt+jvtiLKdQDZ73IczFqM3WdoOz0Mdxf8OeQIGakxDY58+DBcWlY
         Ddl1mgxn1SdtLialIhDLV0ThbuLunAya1Kdm54a9k1MuhXxlps8qGeu2xyzCEZ8+H9lb
         s5eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325061; x=1780929861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeSGQAtfbqIjwsYge5eawocxe2T0LG78G0yrJejDqDA=;
        b=Y24Bv4rdsrmmukExgAzC7EEcxgQy77C8V5FmpVmPgNriNoRYREarRPwAeHZ4q1E0wO
         a1+itvk4B2oeneNI93jKsLVEEBuJm5A8X2wz8FaobI06MabEyVJ94r2C/Ov4OkyEC5fn
         SVNfU1yi4QRrk3mcfiq4goRbux+CvnAWuCQnGIi5tXHv0b3tVLgEv9Qi2aNNPF31iGPi
         VsoDd3nU/7lC66aTaodSQ34XTx6UYxQoW4ui5orzZB4JhGDAb1SDCzXZxdteZgsRBNKp
         ba8mU7Q6Jgvg+B8XsIHwpLOiT6zA3iRaDHBZgt8tZdt2oMfBlgxkWQyvhKojyp3AHrd/
         QXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325061; x=1780929861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeSGQAtfbqIjwsYge5eawocxe2T0LG78G0yrJejDqDA=;
        b=YD6mGyCXMJTmdscc5XAzUv2kACgdrWfe22FwaZMV+9yfU73VlM5BvJQfCF7M1RBmEY
         NhAclzIrJRUOXDORsAIIZuzFC8VgWWMoaX3GZVzKeT6I4oF5pnJqMIi6bjEQv8cZPOiE
         rJhbs7cWmYjeFI9c75cdRw6kB8+jWPmCK7tP3XklCm+qnUTO8Ou53RyBdgxPb/lYEwCE
         +6q5L8N+zwRlkhdyLJQfbMVSMIpqQpIarAYy1ShShezf/3m3MOEs8q2BNfmtTetoj0Jf
         GdoG3Ro9pSt6dG1KwlYVEeBar1kpYuG2+3K1b/69O2zbjcgFhAZSkFjReKpEWEnQvDTj
         Wm4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Qmulm2Hp2oTyl9hqm2iC6nbGZQGO1V9WiYqyy/u6WUdVa/1J433WbuEVpoBQrHUgH85mYHojibotr3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydVBqEFPcVU1zDRQA6DDL6sgupBfJRghyAz8t+OKJ3umTMo02r
	AsHnMbyMt7SeeN51raVW5PVjKf35YNqf+aS0eJsq5PQOPwUTRZ/xHJkJrXO66AsQMXV1Q/O+Jux
	X0x+pVm82AXcLGu1txKUDxOQFtL9CmKn3GgAH
X-Gm-Gg: Acq92OFkO8qfRvULlV16V3eOKqL6SzSlxAHtCVfaC2w7IfgIQjsCfzT2DU/AdZ1PuzE
	hI3kmHIFfTgWYhpEotAo45Dh3j+OU6dEN9HeKebBoq+tHdDX2XqFI2bTXSPpRzx64gm6gw/pXEw
	RaTmTBT8Yl+820IL/8R9KLcAZDI208JCTwfZqBtf3o9S+xKb8d9rFY709DRNQfslXRevErpTXeb
	PA5PFkvio4LhEEZku3OxcyatJ2kfu9j1T8TmmdGQ3T7pkY3GUsTI47vRlEHk0PzpozTPMfbwh5E
	r7/9YMwZdk958FNbEp0=
X-Received: by 2002:a05:651c:1473:b0:396:7f19:3b2 with SMTP id
 38308e7fff4ca-3967f19079dmr17097791fa.20.1780325060874; Mon, 01 Jun 2026
 07:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523213548.5219-1-jmiguel.ghp@gmail.com> <CAEsQvcsYnjBK1vor3MFKs3GNzn_wAvOP4rGthpW3vYkcnwMxgQ@mail.gmail.com>
In-Reply-To: <CAEsQvcsYnjBK1vor3MFKs3GNzn_wAvOP4rGthpW3vYkcnwMxgQ@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 1 Jun 2026 11:44:09 -0300
X-Gm-Features: AVHnY4IzOQCoXVYrkT8H8KNAHxJSA939A6_zGtK5fYYBOcze80qLUKQffrBtXJo
Message-ID: <CAEsQvctnNjLv5i0wc+6PkCE+x3BQcT2jog=0b3GrsE8Ufi80fA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
To: =?UTF-8?B?Sm/Do28gTWlndWVs?= <jmiguel.ghp@gmail.com>
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jo=C3=A3o,

On Thu, May 28, 2026 at 3:34=E2=80=AFPM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> On Sat, May 23, 2026 at 6:36=E2=80=AFPM Jo=C3=A3o Miguel <jmiguel.ghp@gma=
il.com> wrote:
> >
> > The MSI Bravo 17 C7VF routes its internal digital microphone through
> > the ACP6x. The machine driver only enables the DMIC for boards present
> > in the DMI quirk table, so on this model the internal mic is never
> > detected and no capture device is created.
> >
> > Add a quirk entry matching the board's DMI identifiers so the DMIC is
> > enabled and the internal microphone works.
> >
> > Signed-off-by: Jo=C3=A3o Miguel <jmiguel.ghp@gmail.com>
>
> Cc: Mark Brown

I'm pretty sure Mark missed this entirely, so feel free to resend
the patch but this time remember to use scripts/get_maintainer.pl
so your patch lands proeminently on the maintainer's mailbox.

Thanks,
Geraldo Nascimento

>
> > ---
> >  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mac=
h.c
> > index 7a637d6b5..a93a7fd48 100644
> > --- a/sound/soc/amd/yc/acp6x-mach.c
> > +++ b/sound/soc/amd/yc/acp6x-mach.c
> > @@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_tab=
le[] =3D {
> >                         DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
> >                 }
> >         },
> > +       {
> > +               .driver_data =3D &acp6x_card,
> > +               .matches =3D {
> > +                       DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star Interna=
tional Co., Ltd."),
> > +                       DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
> > +               }
> > +       },
> >         {}
> >  };
> >
> > --
> > 2.54.0
> >
> >
