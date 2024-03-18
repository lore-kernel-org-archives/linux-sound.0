Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A238388
	for <linux-sound@vger.kernel.org>; Mon, 18 Mar 2024 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760362; cv=none; b=kQ6pNpo1cs7WQW4g3wae2ZyBbnB8kDTnpxmMiVBROVvxkc19/wufjAcbnBG9zR5Hp6lHoHaW6rkiX2SfQ76vgdC+HAVZ0I079YzFk8wv5WTZ6bxZ4wQi75U76Ca68molEhVbRBfadPOPdDKjU8/bVK5ZWTn1ZEv14mNNvd6BkUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760362; c=relaxed/simple;
	bh=0Bx39X9nrmaOe2siDGBtD8UvPB5+0atvcfW4BaACz+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTgFh/S2p/4qIZ9gBv2KysVkCggZs3VM428meOsODnixUN9g78ICDujyySiQS5Cy/Ef3QxnCDptInSKKN6RnauVV9OBdaJBc8BLzEk9bedVHnVZDyvS+qk62K7DEjgez4fcgSoblkKeUVyZN0yn0do3aLt7N9gI0MUO0pKVPHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in; spf=none smtp.mailfrom=cpp.in; dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b=2ROMi7FD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cpp.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b="2ROMi7FD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609f1f97864so45693597b3.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Mar 2024 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1710760358; x=1711365158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJoZDN6ezIJlLMa5gaDKCST13mLnHhS66r8V7Evf8Jc=;
        b=2ROMi7FDJwptKqSspUrVQ6fZTE/NhmeID0jQXfMNvLylVl03Isq/pPLOH4nvdmX7Zh
         9KCNUm4bUeY4d1Z2jy+IcbCF040fCMqQNv/K+o0Jz3qNnGqCP7yfjRhhOrMTGeLfJ1XS
         rMoNEFfhP2MhzYeYfGbjNMN5BONjXhKg1PHYUeUqI4qKtw57aJ63VlT5j1CaVW0rorjA
         PD24HbD2Mx2IIfVCVzpDkMOyWx63JoRqZICwfMw6b2hmdtTJf3hWfSFtbQHxSEsYC1f4
         Iu8NrchQQBlb8LntshiWgPkRgjmlWPWBYktSPectDwSM4uVKjwHysD/PINR/CLYNGBUY
         93pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710760358; x=1711365158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJoZDN6ezIJlLMa5gaDKCST13mLnHhS66r8V7Evf8Jc=;
        b=gGv0aNN2h3acA0dYrlEMm54B6Hob4Nfr+z4JOizsvwvvnp5ixrL7v9maFbaR+ySk1R
         tsskLENqbwfGjcEebsoAMzBm6NxnEBc5rdRbyal0+KpAskNUBxsTSJc5MEJGoGwW1ly1
         2k5p1+NWCZsnHvH17Zt2VGEq+JiCsocf0u2txCKZgdJRQgnhh8ubnikXPC9A0BtAx1HA
         BYX6MnI54voxkRuptBJsnERZxs/NNB//wFiwwNTtHcHltWHXkIsnD7mqNuD3hGo9hzpc
         Xr/daMFc9OETOYxGFKF93qaclPIrHDe8bjDVNeA+JoOkogDhx9BjTHIaEsUSRUAh9/MM
         89Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXHkF1c0+PslZXDF1HV3Q5Tvr41OUDF/WfKZBZ8ZUUt/4Bbh1WipvDQTwWmxlbeOeJ38P5JXUeWmiZ3Em2GMPyxqBQeajfakuk3+PQ=
X-Gm-Message-State: AOJu0YwoIyj4pL/dhYiPx84zuC7kopW8e0QnxBuoUeMTuaVeZAEuNJku
	5XhD96ev94QHeqdc9Cw0nAJrlRpaUpcsrtVVgYHNNWVDxz37y68fIw3fSHwoHi9uMey96rT5igO
	oGOVcdDfHCfaq9YVfr1OI9kS61uHABPl6EE8o
X-Google-Smtp-Source: AGHT+IG/HgIgdSgvQqy3AXOe0r/4PVhQlkf8W/nO+Clig28YU2mx//r0WREn/yYLRmNX0scfU3SYjJOJrqswVfJx9YE=
X-Received: by 2002:a25:3187:0:b0:dcc:1449:71ea with SMTP id
 x129-20020a253187000000b00dcc144971eamr8864308ybx.50.1710760357653; Mon, 18
 Mar 2024 04:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <570989e3-299f-4617-adde-b6b8d1e06277@cpp.in> <000901da7922$c81acee0$58506ca0$@opensource.cirrus.com>
In-Reply-To: <000901da7922$c81acee0$58506ca0$@opensource.cirrus.com>
From: aigilea <i@cpp.in>
Date: Mon, 18 Mar 2024 14:12:01 +0300
Message-ID: <CABYkuAi9+XmXnJP0J+jvXkOaOGyK0pvRiFic1v2LmxkGo4ic0g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

Indeed, my bad, this patch is obsolete then. I will update and resend
the second one (for the patch_realtek.c) as more quirks are needed.

On Mon, Mar 18, 2024 at 1:55=E2=80=AFPM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
> Support for this laptop was previously added in patch:
> 33e5e648e631 ("ALSA: hda: cs35l41: Support additional HP Envy Models")
>
> Is your branch out of date?
>
> Thanks,
> Stefan Binding
>
> > -----Original Message-----
> > From: Anthony I Gilea <i@cpp.in>
> > Sent: Sunday, March 17, 2024 2:05 AM
> > To: James Schulman <james.schulman@cirrus.com>; David Rhodes
> > <david.rhodes@cirrus.com>; Richard Fitzgerald
> > <rf@opensource.cirrus.com>; Jaroslav Kysela <perex@perex.cz>; Takashi
> > Iwai <tiwai@suse.com>
> > Cc: alsa-devel@alsa-project.org; patches@opensource.cirrus.com; linux-
> > sound@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
> >
> > The new HP Spectre x360 has _DSD for CS35L41 amps in ACPI but
> > reset-gpios and spk-id-gpios are merged into single Package of size 4 s=
o
> > _DSD parser fails to parse it.
> >
> > Overwrite broken _DSD with the correct configuration.
> >
> > Signed-off-by: Anthony I Gilea <i@cpp.in>
> > ---
> >   sound/pci/hda/cs35l41_hda_property.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --ruNp a/sound/pci/hda/cs35l41_hda_property.c
> > b/sound/pci/hda/cs35l41_hda_property.c
> >
> > --- a/sound/pci/hda/cs35l41_hda_property.c    2024-03-10
> > 23:38:09.000000000 +0300
> > +++ b/sound/pci/hda/cs35l41_hda_property.c    2024-03-14
> > 18:22:01.887566917 +0300
> > @@ -64,6 +64,7 @@ static const struct cs35l41_config cs35l
> >       { "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4100, 24 },
> >       { "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4100, 24 },
> >       { "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4100, 24 },
> > +     { "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4100, 24 },
> >       { "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 1, 2, 0, 1000, 4500, 24 },
> >       { "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4500, 24 },
> >       { "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> > }, 0, 1, -1, 1000, 4500, 24 },
> > @@ -405,6 +406,7 @@ static const struct cs35l41_prop_model c
> >       { "CSC3551", "103C8BE5", generic_dsd_config },
> >       { "CSC3551", "103C8BE6", generic_dsd_config },
> >       { "CSC3551", "103C8B3A", generic_dsd_config },
> > +     { "CSC3551", "103C8C15", generic_dsd_config },
> >       { "CSC3551", "104312AF", generic_dsd_config },
> >       { "CSC3551", "10431433", generic_dsd_config },
> >       { "CSC3551", "10431463", generic_dsd_config },
>
