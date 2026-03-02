Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C55280A5B
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476167; cv=pass; b=sEqyJDdiSbaekZc9oN8BHk2STbADyaybca3mgYSy0V8gPCuSwnxJ79hPxJ0w1EcjxSCGh2mDsTu1veDOM0VEyBZgbhKe07ZWRdg8/QfpiRkTRjjt+EOIy5IpjUGFZIADYIxbEaB/4TC34L9JStNRSHb1BBIRuqFHj2nCkkkck18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476167; c=relaxed/simple;
	bh=y3WK8zeRO6TcMtj7CoK/023Sh9ECFW39RWUhLLILIm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktIvm7FDA/8NQ0r6vSJl8+LbM9V3blwEj1o38igd8vnpatgqT6QrnT3+tvNezzzKOw6hojYDcAZPyetJPDPF8+Y4YXREKGNsvYbVAktEgVvHSVLNa6IWXW0zU4lFO2fa2TNhVwk6Eg5gOex+FeTafrFeWglTWECbzC17SOZXlYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HskM3376; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HskM3376"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1186423f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 10:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772476165; cv=none;
        d=google.com; s=arc-20240605;
        b=f6F8Ki9JMckkODp9Y6Q/7aw1UzVyqrPAj62f4uhrB9EA9t1Pxe/QPCiXT0BnykmTfX
         cVUVTatURa34pqXE8V3/ZE9zeqdLQFyFglBfJxXccIUok1nUndINmAuyF/uk5OoQuKEY
         S56/ehEBjelKS3W5WUnqvTlQcSouhuHKKxK0Kr+9wpN8SpcFd6oNPRL1LHIfPEHTz0qk
         DYhbXIcbnv1kGGMUVqbt+iCwZqxrFtYcMO41eSenokz1vMgr9Z/iI922b99umH8hcUHn
         tZIdiMKZhzcNesBCesgKyrXQGvVnt/g2SGW3nZCRKuRI44WKanwrXBodX5ir9L/Zrmyn
         8tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/+AAkZI607Efn+eT3lh8WG/Z7hupI4Dhr/CpIFAGIA=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=Z5VRuTfawdbjCAofxnSA64TP2xTYhtIEh+3v7hPDX9Y5dmn42Xz2EGwA5JuW8k5DHy
         hxwLRn90YuZ4LkoBz6fznazC/UBnEX7N4YroBiukVbfqDydDbL3q0TvKXrbyaeizWDi0
         A5fQ0U3X1xuko5J0DrEzr+2Mlzt1JsJlC1FgXnm+Nuu5oMEoyolsUPqQOf2C0TVhhXzb
         ENLGG2rYO0ubKC4tv7bVuggIvyUzm2PO7AB++K4RmsZb5Jw8sKZhQ5gEyZZZ7QRc3psI
         RrO1QIAQ3a3836oQVd4MO7xC+5vlrRzzRGArRfWCn2U34nPDdHSEo2Tom5QhG4dbPnkW
         Gy2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772476165; x=1773080965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/+AAkZI607Efn+eT3lh8WG/Z7hupI4Dhr/CpIFAGIA=;
        b=HskM3376g9i0iiRGufbyN0346SRW2TuXgg3FBn2ExtZowOpmlB5LVxb2MKqWbSXsYq
         F2QuK2kC8d6jxZWmpnBYIn1ugV+bqU5+Fg2Ju8GUQj9NJ5xGY3MwNz6K/GwB18UHomda
         i4dJC5NdzsfPr/OWrS02u/tbDrmmaRuB1yHGIPdut+d/wVzX8B45bynxklDovi1+Fatj
         vsk3LeoeNrfS029P0e1qRq/882Z9Cf8L9y9Q4MxJrlJfqJR/W1gCnByqokeDiVZbfGt+
         p50CTVyu2jiBzK+AJplwv0lv+7Suj9KM8z4uLpYxxKTQqzAYFt+Cq/q0SRzKST2rQXvg
         ch7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476165; x=1773080965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/+AAkZI607Efn+eT3lh8WG/Z7hupI4Dhr/CpIFAGIA=;
        b=SKA2sFKsr2y9++X+LmV/6T9G+tea6n0IawhbxQDorwF6ztJl3lkK632tshKetg48j7
         1Sy55I7kYzRf43+yHX99wbB2HFkVwpneh/oTw/93HLiByR/lySdfHLmcZzNTK+kzCRp/
         VGuSirzc7MEneGfD7mr0qpHlHL1DAvK8t5Y5gvXrpO+sAcQm7/2qFVyUZ3B+Ms6IctZK
         hcGRQ/Vk/KX+9hHj10m7i7aM6FxY2cdDcwDbxS2rv+hHumUChiSLUmg3MWSdqUJa2fW2
         Y+HUIjtsK2/rKqd2qiMynDwrpuAwi1uONq7Z2v9GCy96fjpUA/IZLuVVXNbO6yM+s8OA
         0n9w==
X-Gm-Message-State: AOJu0YxGggQe/GCxvpgk6V0NIjzE0qoWwzFagXoBS/juCjX/eKmCB2io
	L18Mih2iy93jS2CUL+eJeQiLBf2aq5CARKa4Jw1OEp9tzrhKZrAwYkGE2xoRGgdpC5uJfbk0mQk
	sKUdUJuG3SQBNemDDTS2cytZIv1NZZWo=
X-Gm-Gg: ATEYQzydn1IBiTrxT9qgm4rVQEOc8cdqeebZ6R+ZyKA8jo55HU9CmCaa2s4vIhHOAj+
	Qn9XMxeKv63zgSAoJ4Hjr6i29yRH0FPnTk8U2qhhJDW55d7Vu9KGlW9gkGzMJXBwLzhj6IjHnx+
	PZDeqrTCSXCQkXRyUDh0K3zMeIV1+KA5N2eqjSlEnHzY0s8m+hbeYR/qfbSFWI/rAWqUlDc3UgN
	imRJ3UiPqdKx0gBYpkpHeswVWMdzNoYmncACGJrduu3YdyMpnWZIWXyDbf9D2AnS5swwZ8CP7NT
	SpzSBrmdEBCtUTCuAL0aitmRFwIl2YaIkykRu6g=
X-Received: by 2002:a05:6000:2388:b0:439:9312:4b5d with SMTP id
 ffacd0b85a97d-4399de27bb1mr22748492f8f.39.1772476164444; Mon, 02 Mar 2026
 10:29:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87qzq2kxrc.wl-tiwai@suse.de> <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
In-Reply-To: <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 2 Mar 2026 15:28:48 -0300
X-Gm-Features: AaiRm51BppsqZ89A6CL1OZq0QXDNWDyghW1S6GWTg2KX7WJSNtFmR8v81wociFk
Message-ID: <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know this can help in some way, but I got this ops

dmesg | grep hda
[seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: enabling device
(0000 -> 0002)
[seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: Handle
vga_switcheroo audio client
[seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.6: enabling device
(0000 -> 0002)
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
CX11970: BIOS auto-probing.
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
autoconfig for CX11970: line_outs=3D1 (0x17/0x0/0x0/0x0/0x0)
type:speaker
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
hp_outs=3D1 (0x16/0x0/0x0/0x0/0x0)
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
mono: mono_out=3D0x0
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:    inputs:
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:      Mic=3D0=
x19
[seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
Internal Mic=3D0x1a
[seg mar  2 15:26:12 2026] snd_hda_intel 0000:04:00.1: bound
0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])


I really don't know what that means...




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram




Em seg., 2 de mar. de 2026 =C3=A0s 14:37, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> I'm sorry. Already found it.
> ---
>
>
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>
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
> Em seg., 2 de mar. de 2026 =C3=A0s 14:20, Gilberto Ferreira
> <gilberto.nunes32@gmail.com> escreveu:
> >
> > >>    ALSA: hda/intel: Make MSI address limit based on the device DMA l=
imit
> >
> > >> Please try to revert this and check whether it brings any difference=
.
> >
> > I am so sorry!
> > Can you tell me how can I do that?
> >
> > Thank you.
> >
> > ---
> >
> >
> > Gilberto Nunes Ferreira
> > +55 (47) 99676-7530 - Whatsapp / Telegram
> >
> >
> >
> > ---
> >
> >
> > Gilberto Nunes Ferreira
> > +55 (47) 99676-7530 - Whatsapp / Telegram
> >
> >
> >
> >
> >
> >
> > Em seg., 2 de mar. de 2026 =C3=A0s 14:04, Takashi Iwai <tiwai@suse.de> =
escreveu:
> > >
> > > On Mon, 02 Mar 2026 17:56:48 +0100,
> > > Gilberto Ferreira wrote:
> > > >
> > > > Hi there...
> > > >
> > > > When I boot with kernel 7 RC1/RC2, I see the Firefox playing and th=
ere
> > > > is audio activity, but no sound on TV speakers.
> > > > When I switch to the onboard card, it works fine.
> > > > When I boot with kernel 6.19.5, both cards work fine. In fact, it h=
as
> > > > worked since 6.19-RC2.
> > > >
> > > > This the output of the commands:
> > > >
> > > > With kernel 7.0 RC2:
> > > >
> > > > $ cat /proc/asound/cards
> > > > 0 [Generic        ]: HDA-Intel - HD-Audio Generic
> > > >                      HD-Audio Generic at 0xfccc8000 irq 71
> > > > 1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
> > > >                      HD-Audio Generic at 0xfccc0000 irq 72
> > > > $ aplay -i
> > >
> > > Not -i but -l.
> > >
> > > But this doesn't matter much now, as the HDMI audio devices seem
> > > enumerated.
> > >
> > > > ALSA lib pcm_dmix.c:1000:(snd_pcm_dmix_open) [error.pcm] unable to =
open slave
> > > > aplay: main:850: erro ao abrir =C3=A1udio: Arquivo ou diret=C3=B3ri=
o inexistente
> > > >
> > > > I tried with kernel 6.19.X and got the same output.
> > > >
> > > > This is the onboard sound card:
> > > >
> > > > cat /proc/asound/Generic_1/codec#0  | more
> > > > Codec: Conexant CX11970
> > > > Address: 0
> > > > AFG Function Id: 0x1 (unsol 1)
> > > > Vendor Id: 0x14f120d0
> > > > Subsystem Id: 0x278212c2
> > > > Revision Id: 0x100001
> > > >
> > > > This is the HDMI port:
> > > >
> > > > Codec: ATI R6xx HDMI
> > > > Address: 0
> > > > AFG Function Id: 0x1 (unsol 0)
> > > > Vendor Id: 0x1002aa01
> > > > Subsystem Id: 0x00aa0100
> > > > Revision Id: 0x100700
> > > >
> > > > I am using KDE Plasma Desktop 6.6.1 with alsa, pulseaudio, pipewire
> > > > and wireplumber installed.
> > > > But I don't think this is something to do because everything works
> > > > fine with the 6.19 series.
> > >
> > > So, have you compared kernel logs from both working and non-working
> > > cases?
> > >
> > > In anyway, there haven't been so many changes in HD-audio driver
> > > between 6.19 and 7.0 about HDMI audio.  Maybe the only relevant chang=
e
> > > would be the commit cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > >     ALSA: hda/intel: Make MSI address limit based on the device DMA l=
imit
> > >
> > > Please try to revert this and check whether it brings any difference.
> > >
> > > If not, most likely the regression is rather in the graphics driver.
> > > But, it'd be best to do git-bisect to figure out the culprit.
> > >
> > >
> > > Takashi
