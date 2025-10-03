Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E86FBF
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759519090; cv=none; b=GueSmGiWuJbKHRv+LCgeKGxi4WYhlv7+6Xk2vZR+HVMXybRZl7aefue+Zig0eWRZnrG4d2UDG1AM83lJ+Uap/JoAW8U+Egx01eDbWtKNXCpOKLgw1l+rLTWeebyk7gmeB1kzNVRuKXkGvmrFcjIzpLC9Vup9FAYrt5Um0AnE1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759519090; c=relaxed/simple;
	bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+xRTqE1cRos5x9v4kDSm2tJcpjkKcW10DlKJurx0zpn/fcEh2FyvmDMJsft74XxW/dhGgZ/48cH0gBAZ5gmKLds0VCwKWwHSY6N+GBqEDIyIiDf00zPi8GwppmiYh/jMb+uDSV1HBW3QgIZ9FEu/aZUe1uv2AzOVzt2CrdiQ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrXw1QX9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrXw1QX9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d50882cc2so517531666b.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 12:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759519087; x=1760123887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
        b=HrXw1QX9y5WtjOVPCwalJ9v2ZSCup9hyL/tX0vRAc4rxmXMMRX8F8d55ILTk/8eFoQ
         HHeE6ra670E4Q+ibCmJQtmrCE5lNCGrTVMW6lkN2MD1uPact9aXrnyVwkjys1MNLUyRk
         3rhvCX+ka3bGN4X/2FFEXd/Vw6jCv0KiXGLGnylXRUwufiDjLUV/BXD7IwNOs/wRBAX+
         kCMhQWZ4aFFmfAqE/RhWKXsIOJv8QE5gxHEV4OljAXN8Ckd83U2SG2E0GAezVPoFHAdK
         xfye7EHkrOxffvcEZzEkhaoqr8CuLZxFZEAG9yZ91PsOMDgOiSl8FHZFBd4DHG8lkF00
         X5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759519087; x=1760123887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
        b=JsxZ3gyOE5lOmJ0uYZwPAMxI8F3mxN6qtllagS5cChwUcqL5bCy8c/MZvIf2cHTAqa
         f3+GEsYAeRIHLQrGcavfVeRfYhAs34EpS3ZY9uhiPsUK3QfFhs/5yJmgs825B2TRa0Ef
         TWWmJQ7C1JSqZP5gByk5TM/7nENsZHBxlGFxsfYtGlwqUdD6mYe0hkzTEZaHj7rJnmcY
         WncHPFlgSb1wQC9ekbG0rdDNut6UC5a0Y+CXz9GDe2BjpCFciID7ijrBMro6bPd+GuVl
         L9HDjhhd4PGgg8YrYJ+8R5H1cePuTgzrglkYtoCw+TUwgIKbC1MjF71ZwMZm+jOa7+Wr
         X8RA==
X-Forwarded-Encrypted: i=1; AJvYcCVGUfIhI+Zsiu5xMWJ1Zm8yHPrwliU5TzAIMEqM5rGjmPrcQsYE/AgYn8MlROZ1DdcPPOjAmUIxbJIjRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4q7zA+YMOe+AZzxRavETVsXIuuQ82UDhS6gbwNxrbUqKvidBJ
	1eEe9MQ/tmYqh5g01idcZ86P6oCyevPpm7nOEVtHRZdhz7mT1C7gwcgfldcK+JrtSEtITdRPP+b
	Kx+cWQFQvWe3UvEBMgWWz1vBugbpqM0Q=
X-Gm-Gg: ASbGncu6pPBs0OXLgEvMTySbdzluWF4lTqlppgWOvAkxUgFfgua5EKJHAjk5FWnAlZf
	suYCMtv2gZw4XrjRKar78xlZNef4cryddHssjJRLO6ULcEQ5rUHuR7iYhprn4rRDBvgRBtM4MbM
	Vw2PSOm8+umvKbtDGe4T6/vEYri+xS9niAmAsXOvkl48t9DHtBjq/ZtXwDGothU09daNA7f0tZ8
	qdjRNW89lcJLgjhdD39AI8Fan00hbgXqOLl6oPt0yqhdCFl2DguTbz7bM8Cub/AqhYV4o3WBzB2
	CxRlL608/f36fIFfIMLKNQF9fQVjitMA2V0py+Ar4agLO2ORQ6s=
X-Google-Smtp-Source: AGHT+IGDOIEbBwI4RhDZzYph5tS6bdWRRfEmWKBJtyzJ/peaaAqFq5LRzC9YvYETAyKZMd/yrHiOroASHRIONgh2gxM=
X-Received: by 2002:a17:907:3ea1:b0:b41:297c:f7bb with SMTP id
 a640c23a62f3a-b49c3639c42mr483063966b.26.1759519087163; Fri, 03 Oct 2025
 12:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMBK1_QFuLQBp1apHD7=FnJo=RWE532=jMwfo=nkkGFSzJaD-A@mail.gmail.com>
 <2024011723-freeness-caviar-774c@gregkh> <CAMBK1_S2vwv-8PfFQ4rfChPiW7ut5LXgmUZRtyhN=AoG3g5NEg@mail.gmail.com>
 <bf07c1bc-b38e-4672-9bb0-24c16054569a@leemhuis.info> <CAMBK1_Sw8nVSN3Z7WtHYyJ2xWUNVYNcx26UKFx5hy+xQrO=bHA@mail.gmail.com>
 <265839123283304ede6b391bd92340adf77ad0f4.camel@tsoy.me> <8254efed415d6e7faee6b04b88993e7ff35ef8af.camel@tsoy.me>
In-Reply-To: <8254efed415d6e7faee6b04b88993e7ff35ef8af.camel@tsoy.me>
From: Serge SIMON <serge.simon@gmail.com>
Date: Fri, 3 Oct 2025 21:17:39 +0200
X-Gm-Features: AS18NWCe32Ldm4hs8tE1RbOVqIom7vBxOU-D-F2UlS9sWPDuO0-UdOCd5ilTOk4
Message-ID: <CAMBK1_SSkpDXUrs6LU3dCc5nYsyLC1rV2+X5=C4c75UtAmQB_Q@mail.gmail.com>
Subject: Re: S/PDIF not detected anymore / regression on recent kernel 6.7 ?
To: Alexander Tsoy <alexander@tsoy.me>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So i've just tested this, and ... you were definitely correct / on the
good track.

Once back with 6.10.16 + that "snd_hda_core.gpu_bind=3D0" kernel parameter =
:
- my S/PDIF output is detected again (and is working as before)
- surprisingly, it seems i'm not able to select the HDMI outputs (of
the monitors) under GNOME settings (i now only have the S/PDIF entry)
... however a "cat /proc/asound/pcm" is correct, and is showing
everything ... but to be honest, i just don't care (the point was to
not use the (crappy) monitor sound outputs)

Extra information :
- indeed i was bypassing the iGPU (also activated at BIOS level) to some VM
- by the way, i also had the "intel_iommu=3Don" parameter at kernel level
- latest dmesg from today (for reference / just in case) :
https://gist.github.com/SR-G/ef22e46e96bfb300c3689cf8ea073098#file-dmesg-6-=
10-16-log
- current "cat /proc/asounc/pcm" is back to :
00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
00-01: ALC1220 Digital : ALC1220 Digital : playback 1
00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
01-03: HDMI 0 : HDMI 0 : playback 1
01-07: HDMI 1 : HDMI 1 : playback 1
01-08: HDMI 2 : HDMI 2 : playback 1
01-09: HDMI 3 : HDMI 3 : playback 1

So a big thank you for your analysis and for having taken the time to
investigate into this !

--=20
Serge.

On Fri, Oct 3, 2025 at 8:32=E2=80=AFPM Alexander Tsoy <alexander@tsoy.me> w=
rote:
>
> =D0=92 =D0=9F=D1=82, 03/10/2025 =D0=B2 17:57 +0300, Alexander Tsoy =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > =D0=92 =D0=9F=D1=82, 03/10/2025 =D0=B2 15:20 +0200, Serge SIMON =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > > Hello,
> > >
> > > I still encounter this issue (and every month i test the latest
> > > kernel, each time with the same results) :
> > > - i do have an ASUS B560-I WIFI (ITX) motherboard with a S/PDIF
> > > output
> > > - everything was working flawlessly until (and including) kernel
> > > 6.6.10, and that S/PDIF output was perfectly detected (under GNOME
> > > SHELL, etc.)
> > > - starting from kernel 6.7.0 (and newest ones, including 6.16.10
> > > tested today) the S/PDIF output it NOT detected anymore at boot
> > > time
> > > by the kernel (so is not selectable any more under GNOME SHELL or
> > > COSMIC, etc.)
> > >
> > > With old kernel (example :
> > > https://gist.github.com/SR-G/0e86d917716acff0d31cad0365f0b500#file-gi=
stfile1-txt
> > > )
> > > :
> > >
> > > % cat /proc/asound/pcm
> > >
> > > 00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
> > > 00-01: ALC1220 Digital : ALC1220 Digital : playback 1
> > > 00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
> > > 01-03: HDMI 0 : HDMI 0 : playback 1
> > > 01-07: HDMI 1 : HDMI 1 : playback 1
> > > 01-08: HDMI 2 : HDMI 2 : playback 1
> > > 01-09: HDMI 3 : HDMI 3 : playback 1
> > >
> > >
> > > With kernels >=3D 6.7.0 (example :
> > > https://gist.github.com/SR-G/0e86d917716acff0d31cad0365f0b500#file-dm=
esg-6-12-6-log
> > > )
> > > :
> >
> > Did you disable intel iGPU somehow? Try to add
> > snd_hda_core.gpu_bind=3D0
> > to the kernel cmdline.
> >
>
> Ah, I see:
> ...
> vfio_pci: add [8086:4c8a[ffffffff:ffffffff]] class 0x000000/00000000
> ...
>
> You probably passthrough the GPU to VM so the i915 driver is not loaded
> on the host. Thus you really need snd_hda_core.gpu_bind=3D0 kernel
> option. This is a consequence of the following series:
> https://lore.kernel.org/all/20231009115437.99976-1-maarten.lankhorst@linu=
x.intel.com/
