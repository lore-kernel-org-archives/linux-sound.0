Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA422F8E88
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233260; cv=none; b=FmsmM0nhifY/TeyG+8sL+YcOVpayQa6j//mr4ZO0C58lt/AT/oFiIYvvNWctk2hSBVfwRs3jzSqbv/vcA8nR9LjaSiiBEUcGsufzbVKKNg9cYhVLXt9Y359zU9IAfrFE3fF723EgzmRNUCNwVET4Z8qyQZXjyPGrRS1iIYL4Eck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233260; c=relaxed/simple;
	bh=xfiTe8a3oGskPyDZaOXiPoFJX6+G+Uti0Ha7xnoWf6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GruGJaWXTMafhrCq8u17lCD4x386lJfzSBZKjFpFmvC+IpZjbOgLsEDxUNKIDeifsGr3B0Ta5P8ogl7a+R5Y9nk5go99/QAPcuRRTZ2I3GmIvy+YlmLXKTXAewLQbBndn4k2NyyYLE+a/0CbYueF2AtGp/6rGWw98O7IhY5tLow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNeXuuj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNeXuuj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B811F0089A
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790233243;
	bh=6ffqPgw/LcFO1CQ0ieSCT06YxmqsxpSpEHvtKUaBCIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jNeXuuj+7BsaiQRTJ9d5UjRS1RRwScMKZznMvrAO2GVkuWiCzpuzJCPx4jEMzfJJk
	 R0hNeRGqRiGhAjAlIeg4jvyjKokWbrnznTWHoAOBk8IsynHQO5P2BXhZFYoKURkjOo
	 9bhsvtl9cPeBzlie4kBoFtlibC1bf3lrRMdDvPmRIrMC6zrrP3LBeamMiIxHxron1Y
	 HsUoIlSMI3w0WX9QPTal0E2lg0U9cG9Zf3658WiQiA3K21SekMWNCzJAbV2FA2niPY
	 BJOajVTWbFx0eAVgrVGpJQSsOMqR/B05jPE0MoKTMf3aOwrTDvp1qK8uHnQfeYX1tF
	 EKW7gv4SSb69g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so2307072e87.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 00:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8Srt52rJhL96hxNPXxgo+B0XOhtB0AxhxX6y1r2P0COo/DN5RP+pxfZfKULrPyFRHfa+Qi0e7xQQp7g==@vger.kernel.org
X-Gm-Message-State: AFuF++lwCZzJ9gj0tKCRhFlG6L4kdBlkfFr4ckxe960yI3kPTfFjG2yQ
	IrSDV7x/fr2Mu/M7k/gzQZFSgOz9ryagVQWgfl8dbbaIeBz1LwgwWH1L/FPp2fbZzcSecPGG3D6
	bYOcbMz0WPMI/G1Aoiwv1hguKc4ivrE0=
X-Received: by 2002:a05:6512:a87:b0:5b6:1783:e2c2 with SMTP id
 2adb3069b0e04-5b8df049eeamr470391e87.13.1790233241891; Thu, 24 Sep 2026
 00:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com> <20260924065449.GN3864833@google.com>
In-Reply-To: <20260924065449.GN3864833@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
X-Gm-Features: AclHuK8gBS36DLYKHu3jmsHYMRk4tYeVzSqWdkiCjihTyWef4X6vqS1VxUHzHWM
Message-ID: <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:54=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:

> On Wed, 23 Sep 2026, Linus Walleij wrote:
> > On Fri, Sep 18, 2026 at 12:51=E2=80=AFAM Linus Walleij <linusw@kernel.o=
rg> wrote:
> >
> > > Describe each MSP as a single-DAI provider and the AB8500 codec as a
> > > two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> > > and select the codec playback or capture interface by port number.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> >
> > Assuming Lee will apply the ACKed binding patch so I applied this and
> > the rest of the DTS patches to the ux500 DTS branch for v7.4.
>
> Right, but it's not Acked yet, is it?  Or did I miss something?

It was ACKed under a different Subject: so I resent the patch
for clarity, sorry for the mess.

Yours,
Linus Walleij
