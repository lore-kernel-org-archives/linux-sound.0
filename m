Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264812C470
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 04:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944590; cv=none; b=tMWW0I8hwEluT3gZ9SYbURLsFe5VnkllIa8cK8X6K9zY8teotz5Ju1Q5Q1HueblzgWS+fjee8aLB/0nu+fQU+vxJ87B4i1iM/7xmgw82xya8BbsJTqKMiEnDsYS+KmsU82uFizvykJPhXQ84aolbAP9RPfWLJOMQ5vqitNfhSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944590; c=relaxed/simple;
	bh=VqERxm63JwnNlY+A19AAgs+glp5ehyrfPGP8LDyD2e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tk2NQOwLDZHQPxuSr9CtadhuQgO4pjHyBEdETsR2zb8qpxDqYYy8I7KNVCLEcRlSFUenYPNvar4o5pDVYQnGvjqqDX9BTNtH0oIX2Ofnn2DqisxSn+QO6+NGsOvPXx6eUUwScC26v0wlOEtNeF+F3WwAggG8GT1gRA50Wv7o07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqnTEpHf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqnTEpHf"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so18567311fa.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 21:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718944587; x=1719549387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw9eqla+4WEFJzC5MXcYyWJHlS7ohQWFgUNHhet/5Oc=;
        b=PqnTEpHf5vsb2s+EeSebw3mACHRdiYynm0u+spLGj55Or5nPIQv3Rj4yYljJbD624K
         ga60DZ1r+IXO3PEPxBQGG5zARMhyUqtIH+xppiTKjdK9qt4/ZtZhES9+60mod5vj1UhL
         /Uh6wYi6klK8wmODC3QIKa1rb7OCF04gOG508=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718944587; x=1719549387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw9eqla+4WEFJzC5MXcYyWJHlS7ohQWFgUNHhet/5Oc=;
        b=aMwiae8iUqO9y8MFRDK2uJkAm0nKX47q23JkyFKpLtVBBLVerQROsVJZ3XwJRr+2ku
         jltaDy0hexJ58LNRt4CsMW+42jkJBD96kNiDYYwAR1hDzRzpC+0enVR3b+QDniAgDfrY
         NYJ+kfEbR5YvTQVugVrfXRh04KOWq052sUqxUd7YQplNvbu6GLQq2QzbW2QZ4zqdAAmL
         SlXa4pm+HyakXA5ztbVRwmfG1lsGka5DwQ9kq+etkoIBBFbTNRRA0kPmLeRZVHx5vYVT
         FlnE0+9eLHWFSbixkOl7Dr6upqKtUFQ31srk1sOnrVccrriVWY68+bQGQQRUYIAJyVWr
         Fxcw==
X-Forwarded-Encrypted: i=1; AJvYcCUNLro02dHV3VFXoYKuHC2HPGhZKV5i5RAaWTNxkSNY/PexG/9xr6mgFKpgyQGu4FzjKRxwkTjNwMF3zsNCJ1R32jtjt8uko+sNCz0=
X-Gm-Message-State: AOJu0YwdwvPjYzM0/ExkBujGW0LsGAGhuxEiwrHEYbc9Qdk0WboBeFcA
	7pN2ph5i9KUJOAUp5oHl/BOqS4693feXhlYb24mne4JxlgHB6ptFYltjxc7I1C0eCmfYvfuroC8
	Q4168ZZlOnb6ejfFSAZXmp/j2JzjPZbk8dKEr
X-Google-Smtp-Source: AGHT+IEPOx56mth/eoNVspclyTmtuDsKA4qruGwwFkV/Tvs4Ji2AC3El4RzP+9qwO2WHKD7XvJjJ5XQecwMBpwY/q40=
X-Received: by 2002:a05:6512:2087:b0:529:b632:ae4e with SMTP id
 2adb3069b0e04-52ccaa2a9b5mr3937318e87.2.1718944587158; Thu, 20 Jun 2024
 21:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620092526.2353537-1-wenst@chromium.org> <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
 <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
In-Reply-To: <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Jun 2024 12:36:16 +0800
Message-ID: <CAGXv+5E5io6NMvdkr7gX1rrVBk5OX+pocT4qgyArJ3aE+jGXUA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for
 ETDM1_OUT_BE dai link
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 12:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Thu, Jun 20, 2024 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 20/06/24 11:25, Chen-Yu Tsai ha scritto:
> > > This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29d=
a.
> > >
> > > Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
> > > some reason. This does not have the intended effect, as the remaining
> > > DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
> > > entry, and the platform entry is completely gone.
> > >
> > > This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_=
probe()
> > > in sound/soc/mediatek/common/mtk-soundcard-driver.c:
> > >
> > >       for_each_card_prelinks(card, i, dai_link) {
> > >               if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", st=
rlen("AFE_SOF")))
> > >                       dai_link->platforms->of_node =3D adsp_node;
> > >               else if (!dai_link->platforms->name && !dai_link->platf=
orms->of_node)
> > >                       dai_link->platforms->of_node =3D platform_node;
> > >       }
> > >
> > > where the code expects the platforms array to have space for at least=
 one entry.
> > >
> > > Re-add the entry so that dai_link->platforms has space.
> > >
> >
> > Ok, but wait a minute... the commit that you're pointing at in the Fixe=
s tag is
> > a commit that fixes a problem identified in commit
> >
> > 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY=
()")
> >
> > to keep it short, after that one, without removing the COMP_DUMMY(), th=
e audio
> > was broken in .. some way, I don't currently remember specifically what=
 was
> > happening, but I had no sound at all.

In a way, by removing COMP_DUMMY() completely, you effectively replaced it
with COMP_EMPTY() (from the platform entry), while the platform entry
effectively became COMP_DUMMY() (which is equal to a completely empty
entry).

> Right. But this adds back "COMP_EMPTY()", not COMP_DUMMY().
>
> I guess I shouldn't say this is a partial revert.
>
> After painstakingly messing with the mixer controls, I tested all three
> audio paths (speaker, headphone, DP) and they all work correctly.
>
> I'll send a v2 updating the commit message.
>
> ChenYu
>
> > If the problem is not showing up anymore, backporting this commit to th=
e kernels
> > kernels affected by the issue that I solved... will break sound!
> >
> > So... well.. that's the "some reason".... :-)
> >
> > Cheers,
> > Angelo
> >
> > > Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai componen=
t and rework codec link")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >   sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/me=
diatek/mt8195/mt8195-mt6359.c
> > > index ca8751190520..2832ef78eaed 100644
> > > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > > @@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
> > >
> > >   SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
> > >                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
> > > +                  DAILINK_COMP_ARRAY(COMP_EMPTY()),
> > >                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >
> > >   SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
> >
