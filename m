Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511B29D273
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 03:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773717080; cv=pass; b=Vkl1r6YukoFx6P3g4LPApWBihNmV9UQmKrPJKT2iHLXsGS8ccyJoXUOQ4QelmD5BLHsP7XHiBB20HggZ3u7JBbE7VGcImvBono1InyQFJ7vptlVtF9wR1V5WkPF3CEL1KPBMk0CTP8nYXug9x/tBQPExXv6we9C+8nIRYU/DV9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773717080; c=relaxed/simple;
	bh=IXtJjcMCUGsxTdsTtNEMOGtM8szV5Eyo8OBXr2FmvLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JA16ZERQ8KT3VYM3lgmp/GNwhWJxUjetRs305SKRTQUm2rrPaVmA6fsKUEnaS5WGod7ZyGJygz0NagBfpOfDt+K8zfzoSGnxfIX/PC9N0EEQ3b3DJNSGHvz59Gx6mH8qTT0RCUcRCer7S0/TqmQk+mGDJVFNd7iAcfdoGJ1o3hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnlcRUbM; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnlcRUbM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso3508547a91.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 20:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773717078; cv=none;
        d=google.com; s=arc-20240605;
        b=WCGvtwRx+++2IsfmPwzIA/gXjMpaArRSkVFLJVWt6BKg/FX1BSL30KJg4wJUauCgvm
         WwawCbkyOuLrdHM/elYBuGHzEx6dNncBaVA3CnFG2zyfzN8emN/5+gm5FOGdoJ5cvujD
         KuCfIi8SHE2Rnb+FlPLCjfNLqmPqvSiHzhYCuFOTiVGjpfeTymlas9DEOujPyEe5oEc0
         TXA6+AA3DT7DsVj6/6uHemWPGwR8zy25AGDvGvZoIFgRP89T+d7zFR2wcH3iWdEYlG3E
         q1GKntu0OUOKwcTBOBt/oigOuoGNejSMWb7cXpU596u8g9sPeGVlbdzziRteylJycXZm
         vzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iTVEet7T/oPc2R0m6I6laVS1eIs6Exre9TNHfgqxOZ4=;
        fh=SKYYWZ2bnHlRPKasS26aFHH0/FuPRnzZqrEMwbNw5hc=;
        b=aWS8k8vZy1kzOJISOwPo9ytjlp5xzMx9GbuLWMIiEy+RmpLOq1HyMTKfVkfqBMkyCd
         Ndw5IhsP588j7KX8vXliROCOFoG+ZsDSgtxAUKOVCkRYtGmj00z8s8d3e5+0oO52w+OF
         1lTK7gk2s1L/0A6mhGT+zP1sFex1BB82chwEQrWyN5PRaaC65AzQvMo9psBqNe9w/Bok
         JPS/0HKRwKRI9K4loxAY1hwXhrjSMjiq///T23WNcGVEHSuWZBLGrV6Ye35Wy+XH/dyk
         9fsUB+TODpIZ8LCn6gRc/D58gOOKyPer5f9ecbo1OLwRpL7DnP2xkHR+eqON4YP0QA61
         RGcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773717078; x=1774321878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTVEet7T/oPc2R0m6I6laVS1eIs6Exre9TNHfgqxOZ4=;
        b=gnlcRUbMwcqgG6nTT+23qef0Pd4z7Y1JGLprRynXhru5tK3YaovHZDAt6jLBGpaJU1
         UpRhCMf7fEJtc+pXvAJReY6CFQtAi0abNt6S0910QkfVsWxMU5aSPZpvhI04INFMP7ma
         P/LLTQOgruHtawTHlZgNUTw/efz4PrumbRIraRfKQrQ7EXFRizIOzmuvK+hAXlpjUK5j
         yKrs/+YWMchl9XTB+yRVRboQECfy0XXO13iaxNj0oq4vK0ETYY3rePXvBaW/x+HnFCsS
         cOEgrqyZRtzjvcEmSivOiVbor8oyvT7lfDOMoHr+cMMugzTRBs8gzO1W5Kxoh/WdXXqA
         DwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773717078; x=1774321878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iTVEet7T/oPc2R0m6I6laVS1eIs6Exre9TNHfgqxOZ4=;
        b=QdX+pBMwpzq+bA3oJRx+z3mKPHoQyPnmsq9QTUmXVIfM4tLKsNbVteHO7HIJCUmiA0
         8ZwsWnEEZjgAk/dieEutkuPalif4RZujfDwCxQw7a6+jf4CrCXCecQsNdx6QtY4i0S7p
         pHicSiwMNk8BEaJctIkEwJa5cZGfueeUhIPA+n6jGcI34OMYrrzKozbyTJI6Q9FOwPzY
         iw+dnQGlO0eMcbE/CKZHRJe6hJS0KuJfk3jJTZwf/ujyNlhZzPKtFyth/tqoSjOTbYrM
         m8KQGG7kIj06xlgKZsLx3RP6LZmU5wdfgTcmj7TpysuYJR/DlIH7WIAJScqINhtRz2aN
         DOHg==
X-Forwarded-Encrypted: i=1; AJvYcCXVqSmvJXcou2UXkQ7hdKFXqR3ZR1GYYJ1cmsBb8tAJfydN6qqgYs3aLmMigavpvR8Cypw4O4DzTCv2AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkynm+vMeGcV81w/eqkrSKs0Dl2BIqEBmfMLHJNut003HiV5On
	58OU1y/7m6GS7E0kO2XqMzaV7cGRDw8JBF1AfW0w0OhnyHKbU4GsGigdDEsCz2gTy53idqMWad1
	HSg3ppuhCiOpYs5qMPbeDBpEC3c33Go8=
X-Gm-Gg: ATEYQzya2ZExORM9tqlcJCkZz98KfyWgz0DCJu57X5bv8/0GitCmlOx6yqFtgFNHPvk
	FqUz9RyszojkoCA2BPk4hb7DW8x+rQjfPtcc4nelBDSQjqowVy0GYrfgQkzcg90vBjF5/r77akT
	XdB+PsbwF+iMNTqn+QThU3O/9m14NG3I8sB31IpBkWiIlEhPFOBBrg5DnYh3sBFMahM1YcKaoab
	ZpiZbLdEXb2eXgK4wZ4SNm8Uvmljz6EJjCl1svevfSPUioq9d/fJfukXcMJCYbSNtQCTXdwLoi3
	gfrdDIVCpWvaD30f1Q==
X-Received: by 2002:a17:90a:da90:b0:35b:91e1:e110 with SMTP id
 98e67ed59e1d1-35b91e1e214mr7794198a91.20.1773717077797; Mon, 16 Mar 2026
 20:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316095156.3913910-1-shengjiu.wang@nxp.com> <87tsuficas.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tsuficas.wl-kuninori.morimoto.gx@renesas.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 17 Mar 2026 11:11:03 +0800
X-Gm-Features: AaiRm52kaDxY8sxQLIjJACCCjLihZdX1dCELj276x5k2nrf5_8wfd5cDAtWhbkU
Message-ID: <CAA+D8AMkEGHR-EY1zpEpwgsMFpxT2fAXFWbLE4u-6H4sYN3cJA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Check playback-only and
 capture-only input value
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, broonie@kernel.org, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 7:29=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Shengjiu
>
> > The audio-graph-card2 gets the value of 'playback-only' and
> > 'capture_only' property in below sequence, if there is 'playback_only' =
or
> > 'capture_only' property in port_cpu and port_codec nodes, but no these
> > properties in ep_cpu and ep_codec nodes, the value of playback_only and
> > capture_only will be flushed to zero in the end.
> >
> > graph_util_parse_link_direction(lnk,            &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(ports_cpu,      &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(ports_codec,    &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(port_cpu,       &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(port_codec,     &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(ep_cpu,         &playback_only, &captur=
e_only);
> > graph_util_parse_link_direction(ep_codec,       &playback_only, &captur=
e_only);
> >
> > So check the input value of playback_only and capture_only in
> > graph_util_parse_link_direction() function, if they are true, then won'=
t
> > rewrite the values.
> >
> > Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before=
 overwrite direction")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/generic/simple-card-utils.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/=
simple-card-utils.c
> > index 3115e1f37c0c..e1564c1f7d8d 100644
> > --- a/sound/soc/generic/simple-card-utils.c
> > +++ b/sound/soc/generic/simple-card-utils.c
> > @@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct devic=
e_node *np,
> >       bool is_playback_only =3D of_property_read_bool(np, "playback-onl=
y");
> >       bool is_capture_only  =3D of_property_read_bool(np, "capture-only=
");
> >
> > -     if (np && playback_only)
> > +     if (np && playback_only && !(*playback_only))
> >               *playback_only =3D is_playback_only;
> > -     if (np && capture_only)
> > +     if (np && capture_only && !(*capture_only))
> >               *capture_only =3D is_capture_only;
> >  }
>
> Hmm... It become complex more and more...
>
> I think it should check "is_playback_only" instead of "playback_only" ?
> Oops, this patch changed the behavior, and it is the reason why you
> got issue many times.
>
>         3cc393d2232ec770b5f79bf0673d67702a3536c3
>         ("ASoC: simple-card-utils: Fix pointer check in graph_util_parse
>          _link_direction")
>
> *playback_only pointer check is indeed needed, but *np pointer check is
> not needed because of_property_read_bool() will ignore if it was NULL.
> So maybe we want to have is
>
>         if (playback_only && is_playback_only)
>             (A)              (B)
>
>         (A) pointer check
>         (B) value   check

Thanks, I will update according to your suggestion.

best regards
shengjiu wang
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
>
