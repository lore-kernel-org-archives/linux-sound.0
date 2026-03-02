Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C34218B1
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470648; cv=pass; b=kUfvH4sF4CV4MFNTo2/UZ2jerrhKUWMzTkcVaXfL1e+nMoCBx8MHZdDw2xxJD4NHF51risj6qvF4KevdkoqDRY/K6TvMwowy6fdvlTgM9/CfYtI/qFsgbf6ka2QPZ6Cml+H6IULXql7EkYN6qBcBu2Rvol3y4oPar1DV2GFEREw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470648; c=relaxed/simple;
	bh=Knw2IMYoFBR3ZUaBxG29DH/IgaOgvJ9tb29DbOyMlOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTBDQ9tpjM8dYdaIlJd/XZKRVdTsw5aJBB7Y4L2RHSeGJNvZ+FDcMnvLCM8ex7pLM72WZ/QeUuNSl+zf8u2Npeznb0ihPh5+d16y6rZw3ZCaDxfodB35RtI72RP+lqQ/BJk52ERxyU8mnGr+Z2c44DHO3ts4h0MkGPjEmJpnxys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFuAeUp+; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFuAeUp+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso849610f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 08:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772470646; cv=none;
        d=google.com; s=arc-20240605;
        b=WMthI69NBjJr7fkPvhT4dXp4Xc9UEV1M/LxnlGP4GgHMUygp1yjhrmb77m5Q079MHA
         KCaNv9qoIHhOG3sXrtu461njkzSZxdPlbmJHbBENsrPU0vmRzvlmMI1TqacrvniRF5yl
         f+UBs4DZAlVxAgquv9aEo6Z3/6PrgFUdlSFbyjrHvCW1zFBB0K8MD0S9Rd1fYoOrSFrv
         ZtLLS+a2hXaSQErUSEu8we/DA+I4PpLSi84tw2C9D41yfMrCG4bzbedTtcz2mGnzsNUg
         D6eOuveq6PwH0SMjiR7M5nffwTSycZ2kl4uXtREOROFxHuv4GKVVUvffRNIrxF1x0arG
         4tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOzxrNZ/XPiCXB5gSO4OePuCcEyys3NhYqC2ct1Y9VI=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=Hlt6HjnnaEu2D/zFmJ3l+pIkHpD62Uu6tK75DuOhQGgkpJN4qGc0aTNemXvE+VbRbE
         oxbGl360Esvg2gKRN6yNHKWfPEjhO+5PqI1fSs2e5ekYV3UN+KYCIxhMj0IUEjvRM0S5
         AWA4ps7DAmip/cv1tA7YXS2WtDF9l0NC1n4YIqKBAeh3z1bZo49EtrbutkDI+pmpsg77
         PoKVB5uXHEoNeM2QWXDPTqjdBczmgdDJqYPg2/l0zR8yhiSaFlDQqSUmqDUOM38hYCZ2
         3BkBzBRJBl4PGBSpuiYwf4v7GhWKqF8w6HS8+vyOaIKuvsWTiXoMZxumGwbyzKAwQkIX
         odPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772470646; x=1773075446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOzxrNZ/XPiCXB5gSO4OePuCcEyys3NhYqC2ct1Y9VI=;
        b=HFuAeUp+FyNhLmIXRaxunDMJS/gymzqKBFJ7S1ru3HZ2u+FevElItw/yjYgPxQwM4X
         yzo3T7tMQt1kt1Yi+25Mo7WZqEdnDpjLbgi+rdlyG5x0NC450Vuhw9Bh9sTAG47mleTs
         /NpXk0SwV4WUTMXcfkpZvnINWisQsTMJrGtHyrRzUvfn8cdXoTzwsECrAbStEtCXuKqE
         ldcizIhXcp14YShIaYwDUOV4OiR5rvfj6RZXHI4OehrbqQv3zPqDj8ADWqrluYs4O/oL
         0sINrIlKRf9rlf1LuYr3MaCwBWjAwRoOdxgMxfzQZ9sneh2Cpu1JaXa6oSR0fRiPn9mP
         nv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470646; x=1773075446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOzxrNZ/XPiCXB5gSO4OePuCcEyys3NhYqC2ct1Y9VI=;
        b=X7IXHF7oJDi+pwXYW6Rk8uJFOx+HnBNlkzQ8qKReAHATO8JyNzzqeoSlwXv02+cy4o
         NH7tsfXw5hS9p4p3kqYXKJmSi7k0TYDUjvB2S2cE4qxDuiN5a/ssLm7w6VGJ6TcxQRCn
         2WPjWLcwWGBJOYe997wCia3ZIKuvX5f6s6V+ACagitAPyaCAETy+fpCVqZM3yELM9zaU
         Ynle5EY1bOezCVYhVX5NUD0aYGNwfKOgtwWYIoawQhicU3aqdjn2c6hk0TDk+Td4Wa6x
         6WudnkruYl/xbX60r+ehya90gwgEFmnXSjD579WDWoj3JqCqqBaNFQh4x2a85aoPsavI
         J1iw==
X-Gm-Message-State: AOJu0YwBz0KB/fmMBv+m/uMB0cfsRmK/y4/SH/yWULhGusUwj+GYkDir
	FMYe5vLL6nECbvh2aCMy9yGdywE1ItOlbiNM1kI4i+g9khMLaFbiFi3Y++PiGQOqgVLCclp2rt6
	gV4Nhx36zbDZRPQmH9vdkTWpaJkW51iM=
X-Gm-Gg: ATEYQzzBvNYnoUvV/5lTqqn1Te+XkLDZgREdx8fh2mixJye54tmZ+ipOnmeE4KpE2md
	oXyryyChiJYJETxK41STiOZmP66cU1m8DykYQsm2wbWLN8TcyvhgKbjNXxC35uO5zGCunNaxA5L
	wi7JCD0NCWO+fNCvLFYTgluGwRuJ3oPq62kiK/wSn8xERwTcR6ExjJ9ORFE6k4JZk0TRzoClJsp
	ZxgL9gd8kIw200zIMVXyVeR6lD/K/IKctG3Do+ltsRrEyIAI3HZzF3R//JHP9nK26ZO+FOHKLqb
	TRca4RPN9ft3nmHfr8A/d/vXDhI+PaKgbIilKiNp
X-Received: by 2002:a05:6000:420a:b0:439:b7b5:b1d1 with SMTP id
 ffacd0b85a97d-439b7b5b4e4mr6481922f8f.18.1772470645326; Mon, 02 Mar 2026
 08:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87qzq2kxrc.wl-tiwai@suse.de>
In-Reply-To: <87qzq2kxrc.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 2 Mar 2026 13:56:48 -0300
X-Gm-Features: AaiRm52aRnbKf6yFcHNaHMNnvvIahGCo5dfP89ZbAzJiCnJPRRgyguEsLXhDH3k
Message-ID: <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there...

When I boot with kernel 7 RC1/RC2, I see the Firefox playing and there
is audio activity, but no sound on TV speakers.
When I switch to the onboard card, it works fine.
When I boot with kernel 6.19.5, both cards work fine. In fact, it has
worked since 6.19-RC2.

This the output of the commands:

With kernel 7.0 RC2:

$ cat /proc/asound/cards
0 [Generic        ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfccc8000 irq 71
1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfccc0000 irq 72
$ aplay -i
ALSA lib pcm_dmix.c:1000:(snd_pcm_dmix_open) [error.pcm] unable to open sla=
ve
aplay: main:850: erro ao abrir =C3=A1udio: Arquivo ou diret=C3=B3rio inexis=
tente

I tried with kernel 6.19.X and got the same output.

This is the onboard sound card:

cat /proc/asound/Generic_1/codec#0  | more
Codec: Conexant CX11970
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x14f120d0
Subsystem Id: 0x278212c2
Revision Id: 0x100001

This is the HDMI port:

Codec: ATI R6xx HDMI
Address: 0
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x1002aa01
Subsystem Id: 0x00aa0100
Revision Id: 0x100700

I am using KDE Plasma Desktop 6.6.1 with alsa, pulseaudio, pipewire
and wireplumber installed.
But I don't think this is something to do because everything works
fine with the 6.19 series.

Best regards.




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram

Em seg., 2 de mar. de 2026 =C3=A0s 13:21, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Mon, 02 Mar 2026 15:30:31 +0100,
> Gilberto Ferreira wrote:
> >
> > Hi there.
> >
> > This is my first post here.
> > I have compiled both RC1 and RC2 for kernel 7 and after booting with
> > it, no HDMI sound at all.
> > This my laptop:
> >
> > Operating System: Kubuntu 26.04
> > KDE Plasma Version: 6.6.1
> > KDE Frameworks Version: 6.23.0
> > Qt Version: 6.10.2
> > Kernel Version: 6.19.5 (64-bit)
> > Graphics Platform: X11
> > Processors: 12 =C3=97 AMD Ryzen 5 5625U with Radeon Graphics
> > Memory: 64 GiB of RAM (47.0 GiB usable)
> > Graphics Processor: AMD Radeon Graphics
> > Manufacturer: Positivo Bahia - VAIO
> > Product Name: VJFE69F11X-B0411H
> >
> > With kernel 6.19, even the RC's works perfectly fine.
> > This is how I compiled the kernel:
> >
> > git clone from Linus github
> > cd linux
> > make mrproper
> > cp /boot/config-$(uname -r) .config
> > fakeroot make -j$(nproc) deb-pkg
> >
> >
> > Hope this can be fixed soon.
>
> Could you give a bit more details?  How it "doesn't work"?
> Is the device completely gone?  Or the playback breaks and doesn't
> proceed or error?  Or does it output only silence?
>
> You can check /proc/asound/cards and aplay -l output whether you can
> see the sound devices at least from both working and broken kernels.
>
> And, if they look different, compare the kernel logs (dmesg ouput)
> between them to figure out any relevant differences.
>
> And, beware that HDMI problems are often about the graphics drivers,
> not the sound drivers.
>
>
> Takashi
