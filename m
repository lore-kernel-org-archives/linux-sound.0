Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D1426EB8
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473067; cv=pass; b=tSlspV3sBdbfFg3oBGqu2SB75I27+vIzeVNLpX1obF4jhMDnv+cwo09MwZjv6QQqcl8o2QIyWUwDaXIKGxQ2FyjyHKOBZWUVPV93TZo1VvWKaQAoGg7vGr8nePNFD6y2T6m+s8c6V5o5oZkea5VJL3XtkNDe6aeOlWdwYFRLp1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473067; c=relaxed/simple;
	bh=TPRbUgcm0QwORwRz3H3Hjd5yaDqyrV5+1+4rJyUnvuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orapKiHNiU4M4nIACEnLn1BL7aU9yHMpQsgXYiqYN5Xb4zJb+LvGTrw3w9VpDSlbUX7K2DLlCBG8bZCutJaqkNsRiIfcjOkUUfOC++s2/uNuwrmUK3bxIGUEsAvjKyjYk6NFAaTHeoFQ7O0VV9n3Vw7Uyx8GL+LUsw2ckpfNzMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGvYgRYv; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGvYgRYv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so1997455f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 09:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772473064; cv=none;
        d=google.com; s=arc-20240605;
        b=dDRfqjhmkNJad7tdpFTjH6eq1clre5rDcgP5PP8Vw5MNup+vdtEzyK4Kih+DJ3Oxk2
         5cxZFHI23V4ZHcIX11zTMKFg+0QamdZouLlsD0pUm10NzjVfU+7aOigsxx+YeUGP+sKj
         mlv9kDzSZMximp3hoKvOhGK5/5zmTZs7bywoqktC7+84IEmmhWy4M8H+9DptM0NhYD6h
         vn0Pn89ODV0WPBwKwlJi5fwgaBiz7WHzi9XF7Ul2G9cLNO5E1etOnqi87nJ9N5GdoSlG
         ZPy8n7PNMYeOQTrzSYn9Ac1mBUNbbUE/Sb3jOoEyuSLu7V/fFORfEFubtImfMMEvX7WC
         /50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2DJIq1pSYXBQD8oaiVpqg5v4rnGTHC0vjqi6t81ox8=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=REKrxfHPNla45dISnBE3TfjCmaxZt7S2wfF2Iko5T3hzoBPI8wPelcT8O7qktL2FS+
         Sh5v0R3U1MWymHAKrUaAiNqThzG3IV3E6ak9OvOCVXacOF1Bw7UCXwOg471555Rf8fFI
         qK34RyT0QeQ1ZxlUDcYY0EvPO8SZRhjn5YFms7EYXF1DFrLGNt4wifjba/yMPCXjGbar
         mErm3eDzTPKBDZlETauAxhzhuA26cAOSM49AOgufzAfPsPzPeQLfRiYRO0WhK44oX4uP
         f0zSIrEuHNbMfGyshmynGXfs5mLRHeseosrFjKHuxpKZj/xOhFLu32T3DYf7MYSJ8hPy
         RVaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772473064; x=1773077864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2DJIq1pSYXBQD8oaiVpqg5v4rnGTHC0vjqi6t81ox8=;
        b=PGvYgRYvqh8oY8wy1MaIK+jlv/iDOFdVJgMhjLlTp+1xm+ZwEcQpqoVpLAiCSgIQB8
         lQeWsi5CXHhdgkwdfEM3qJOPxBCR445Up+p5l5rZPe+anuKVW/7Z3Pqlsu2F3ThxXLWx
         HX+YD2PH/Fk54lFWcPrWVtPyYfnGL2IM6hMYB79xrKnR5vGGLFUmAcqo45ghPgV8jhok
         NSDPZTab0/atVVnTSSgG+dmCdnMZw9IjJQwIdwYDh9VUaK+Mkf0IMDs9Tdf7Gh6hMcE6
         gYuz65irDzgiOqvHM100uO8JOkRqUP5Lc0NTir3OvC5Yz/YZ/GUlWt5F2xRhLDuvA3QB
         zrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473064; x=1773077864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2DJIq1pSYXBQD8oaiVpqg5v4rnGTHC0vjqi6t81ox8=;
        b=U1iy4LqSc92NV0P7/2Fd983QgdNBogV2VB23By8pEc+A5bzg8YaIPwQW/q0IUTmFwe
         OLd5d4M4n9ka5BolvN8AJ+k5ExR4N0CmcivlBoarPSj5omgkQAjpLaGZOWZF+qnv7uau
         cYIhNIXHiF/f0fa2O5F+BhpzBy1wGEx2EAD0Ftw8wkt1i7Z03MGU37gzKzPgc/TJU5k7
         oWqELJEhj+YMtuDpvzMrZAzlZEeyxN0EY8ajQt6N58I46++fz5gKu/p/oNgQxPUffsU8
         uVfXpSD35yfGYybFypFMxr1NMcEgvFYffx1pyYLQYZF9atTviJN73aEB9DnUHMel0WKt
         Teeg==
X-Gm-Message-State: AOJu0Ywp510aMkq2d5Aqohoc+NEg3Zmlv2atp7t44oJIwp0kwjsl8KOT
	rrShuS7ZtV8O//7pjbVsN3h3/X8X+AHyQJ/+Bhm9/KTZU60SaXSCqCqOd2WR0q9VeHfFOrOFpb3
	mpNcEiHRxKfnUbJXXf8e6eQdweMuj1v8=
X-Gm-Gg: ATEYQzz2UrTNmL6IGptoug9NRVGi8qFdTgTFs3MeDgim6en46zauQcfwFC242gnK1Q4
	sjDagolYzxwmppgKHXd60OFSrAjTQkiuSAjmPCiC8PZR4PB+IPbVobWzkei+nkdHFonRZQ+OsD+
	zmmKKDGWifKwRLgi+9ez3y9NSr/Gz39P8WUlr3BzpMjhIgzsEWIFfstsXDUv0WEMwWsTEDwzRhE
	xffTXfPNmr/Q9SirT34ZPQk8ssMevkJmltH3g/i0Dpi0lCfAWBcP/9+x/XA5Aqzwp9AMkZqYJSO
	aEfeojGFuWFv/yKn2vG6ohgbH+DY1VUxGjS3da1z
X-Received: by 2002:a05:6000:310c:b0:439:8f6f:1b2a with SMTP id
 ffacd0b85a97d-4399de0b71amr24101652f8f.4.1772473064270; Mon, 02 Mar 2026
 09:37:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87qzq2kxrc.wl-tiwai@suse.de> <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
In-Reply-To: <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 2 Mar 2026 14:37:07 -0300
X-Gm-Features: AaiRm50qfB1727EwDobSPJQvAo70yP89wqaVtLsC5GXMif5FVRKoknQLANqCKA8
Message-ID: <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry. Already found it.
---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em seg., 2 de mar. de 2026 =C3=A0s 14:20, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> >>    ALSA: hda/intel: Make MSI address limit based on the device DMA lim=
it
>
> >> Please try to revert this and check whether it brings any difference.
>
> I am so sorry!
> Can you tell me how can I do that?
>
> Thank you.
>
> ---
>
>
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>
>
>
> ---
>
>
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>
>
>
>
>
>
> Em seg., 2 de mar. de 2026 =C3=A0s 14:04, Takashi Iwai <tiwai@suse.de> es=
creveu:
> >
> > On Mon, 02 Mar 2026 17:56:48 +0100,
> > Gilberto Ferreira wrote:
> > >
> > > Hi there...
> > >
> > > When I boot with kernel 7 RC1/RC2, I see the Firefox playing and ther=
e
> > > is audio activity, but no sound on TV speakers.
> > > When I switch to the onboard card, it works fine.
> > > When I boot with kernel 6.19.5, both cards work fine. In fact, it has
> > > worked since 6.19-RC2.
> > >
> > > This the output of the commands:
> > >
> > > With kernel 7.0 RC2:
> > >
> > > $ cat /proc/asound/cards
> > > 0 [Generic        ]: HDA-Intel - HD-Audio Generic
> > >                      HD-Audio Generic at 0xfccc8000 irq 71
> > > 1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
> > >                      HD-Audio Generic at 0xfccc0000 irq 72
> > > $ aplay -i
> >
> > Not -i but -l.
> >
> > But this doesn't matter much now, as the HDMI audio devices seem
> > enumerated.
> >
> > > ALSA lib pcm_dmix.c:1000:(snd_pcm_dmix_open) [error.pcm] unable to op=
en slave
> > > aplay: main:850: erro ao abrir =C3=A1udio: Arquivo ou diret=C3=B3rio =
inexistente
> > >
> > > I tried with kernel 6.19.X and got the same output.
> > >
> > > This is the onboard sound card:
> > >
> > > cat /proc/asound/Generic_1/codec#0  | more
> > > Codec: Conexant CX11970
> > > Address: 0
> > > AFG Function Id: 0x1 (unsol 1)
> > > Vendor Id: 0x14f120d0
> > > Subsystem Id: 0x278212c2
> > > Revision Id: 0x100001
> > >
> > > This is the HDMI port:
> > >
> > > Codec: ATI R6xx HDMI
> > > Address: 0
> > > AFG Function Id: 0x1 (unsol 0)
> > > Vendor Id: 0x1002aa01
> > > Subsystem Id: 0x00aa0100
> > > Revision Id: 0x100700
> > >
> > > I am using KDE Plasma Desktop 6.6.1 with alsa, pulseaudio, pipewire
> > > and wireplumber installed.
> > > But I don't think this is something to do because everything works
> > > fine with the 6.19 series.
> >
> > So, have you compared kernel logs from both working and non-working
> > cases?
> >
> > In anyway, there haven't been so many changes in HD-audio driver
> > between 6.19 and 7.0 about HDMI audio.  Maybe the only relevant change
> > would be the commit cb9b6f9d2be6bda1b0117b147df40f982ce06888
> >     ALSA: hda/intel: Make MSI address limit based on the device DMA lim=
it
> >
> > Please try to revert this and check whether it brings any difference.
> >
> > If not, most likely the regression is rather in the graphics driver.
> > But, it'd be best to do git-bisect to figure out the culprit.
> >
> >
> > Takashi
