Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598215B96E
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731420696; cv=none; b=TkECOKv+N3glTOj+3AL2pONUKlm998Y/yqYxkUU0cbhWxgILnvnS2kfETDkkkhCwPrI1YfSM4AfFT9MPD2wBr24t8VA6ng+3QmIamsRY3ov7KMIS0KXuH9oWMPo69925X7Sn7bhHYeoipAmoplebH0dMybEf6QcBuJuvM/yOdnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731420696; c=relaxed/simple;
	bh=1fZhEbTaDiiroktK8JnnW5AlOotjuE0UbSmwivk2zNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksBgG3OWTYPdnQkvCCDFdasqdTr8YUxzKaNXi+8EU01dUI5jNvghS1Vd21cPG9u506CM/JC0NEdJMo0p+2l+NApEG9X2f2LcRvNg3hwYATkl0QyXoUA7IDoR3QPP1QOjBPyWNFJWOSRAtZRtcxUCAOczRbl2rH8xB5ZxRSy1Mco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1/bVu0cj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1/bVu0cj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca03687fdso200675ad.0
        for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 06:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731420694; x=1732025494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkqXyzik8eZACIcFxqtlyAZ4d3oM6XwthEsQPSJKppo=;
        b=1/bVu0cjI6uYSnBA6czimetVLmc4a5JGirGFl/zFfaishrtCemA91rk4WvrIeXqLtJ
         Djzps+0sfFL0KSOYuggZhRAu4wd0K9M7BG2NjtGP8wa9l5RKj8hKuc1IYIH+Zi+qYGxH
         MDHIrC3+MhxDj/mwpaddYiMSPAzfwaCqTUtjYQEi/JO778EoHj/oDnkDj/07kRKaWAWp
         egSveJvzfPb0MJVPSx3fwv5TzRbbK4oUG5JtQTbQvPORKCVOtgx5jVPvEXaJkKGhmoPu
         FFDRTq6Oi3Mij6ZsBkRwkfmkfhPwNbzjwVGWAnS8LsWRXcVdAkKuNtheHtwdBHyvYAI1
         ranQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731420694; x=1732025494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkqXyzik8eZACIcFxqtlyAZ4d3oM6XwthEsQPSJKppo=;
        b=qkqq9qYP3gG7qCPLPb97uLKr0KLP9PrQAcsr8W+xF1qsoGNEDmNNozjocH/9kM6qpG
         t+YbLvgUS6xydS79XTChO5NcN3iWpLdUGKF52c2YE4djVG9K2Y+pqiyyrN0Lgnx4WKIs
         Or3LtqyosFK/eAG0Gw40ROPezxpB5HqXzIIvUV0Vd9eu3BcCryC2MJ0/R7lkXaf1Z4Ob
         VNLQ35vbAucrvIBN4Z4pdYu0myk5K6I2nUjbpsS82JSuo7YjE8oDg7z6GOUpgJPhPsRu
         JXQ7ASYfhnbcdtx+U5QAIZjqzMifBxJteEqzDhbJBVMRTC5YP8mYT9WAeZ2ga2cWPuS7
         k6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUDzVVve0n44v6fFhVs8sWIVAZm+A40gYWAOsbHxbG0cGn2cftRTf0NAfm0yJbNwInicwP+W1usAINOog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCzvnjHxYyNx4jqp64UE2pGti2GaHNa3heHZGhSGSBdOHkYHs
	vDF6Kkp+ElJ1stVaoZOa3lIP9SCFAl8C0Y97AIAUBwBkERpgpwsSmFQA90EvuUgLoFMGXFE3f1f
	p3/APQtFK/kOYewqyMF6gevfnaOEslNN+tMEi
X-Gm-Gg: ASbGncuZqqZmJsT4ulojgcxB+QNDLelcEyqMao88a1EFvKb4XGK28S2+xtrfT/XCLeH
	GiJsYyR2UuUR/LxDkB3JD3wmrQpP0lw==
X-Google-Smtp-Source: AGHT+IHlRgvzbYmdyT/fAOqtiTj4F4oiQEsE+/ajhC4KCnzbFZ6t8EIkbdeU7Hy/B+sKHd+rJDTDQvGKLo1SfMQrNTg=
X-Received: by 2002:a17:903:124a:b0:20c:568f:37c7 with SMTP id
 d9443c01a7336-211aceca238mr1984225ad.17.1731420693651; Tue, 12 Nov 2024
 06:11:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112074048.1762371-1-mmaslanka@google.com> <ZzNVH65o0ue6jn6a@finisterre.sirena.org.uk>
In-Reply-To: <ZzNVH65o0ue6jn6a@finisterre.sirena.org.uk>
From: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Date: Tue, 12 Nov 2024 15:11:07 +0100
Message-ID: <CAGcaFA3SdBVtOiPJQG82YwBX01s5_mJszeM4LNSc5Pn74S2Cvw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: da7219-aad: Fix detection of plugged jack after resume
To: Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Nov 12, 2024 at 2:16=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 12, 2024 at 07:40:47AM +0000, Marek Maslanka wrote:
> > Don't notify and mark the jack as unplugged during the "set_jack" actio=
n,
> > because this action is called very late in during the resume process, f=
orcing
> > the jack to be unplugged after the resume, even if the jack is plugged =
in. Let's
> > leave the responsibility of managing the insertion of the jack to IRQ.
>
> > @@ -33,10 +33,6 @@ void da7219_aad_jack_det(struct snd_soc_component *c=
omponent, struct snd_soc_jac
> >       struct da7219_priv *da7219 =3D snd_soc_component_get_drvdata(comp=
onent);
> >
> >       da7219->aad->jack =3D jack;
> > -     da7219->aad->jack_inserted =3D false;
> > -
> > -     /* Send an initial empty report */
> > -     snd_soc_jack_report(jack, 0, DA7219_AAD_REPORT_ALL_MASK);
> >
> >       /* Enable/Disable jack detection */
> >       snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
>
> This path is also (AFAICT only?) called when registering the jack by
> da7219_set_jack(), I'm not immediately seeing the path for resume.  This
> suggests that what's going on here is an issue with the machine driver
> unregistering the jack over suspend?

In my case the da7219_set_jack() is directly called from avs_card_resume_po=
st()
(sound/soc/intel/avs/boards/da7219.c) so that could be a problem too.
