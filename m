Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946126;
	b=tU2Q1nBoZ7RPHPVHRIiW/kOPMub73w10iUT6sjPEyeaPT+/ldNc5gAPBAaX/9G8MCxeN
	 xoRTFa1y4Fg9mqPyX11hA2m1mDYJzBubTFeskrD/4+dvFc9vzVjjLO4OlmdTC7vXl6dvk
	 R9zG46QYTF5X0vjqcA9PgRyihaTUe+0f/jXt3YpkfEjOI4nKnrrwSRTizjVrKRrLBSGtn
	 oxqc+3Z3nVNWyfxuZhitdefcAjOCw4rmUrqQaxSgPGw0fYFn0YEnHlyXZmBeSYRSIx+pL
	 oqK2EzfW5y6UaT/kqFr7Iu6JxvI24KFgnL2gKKyv0HoN4EzpmJofxArk3qFjI7HVqVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
	b=q51tYS6ZT0PhGFiZ8qN08qTY3fTYCQrFkykLiAP850oHL0D2Uq1+oZ4m2bjscPmlcV3/
	 QcPQwv5XtPRehLA597iyEo3YIgduI+TXUdnYaEmNR3vHEa9rpD7ElVuJErXbugcTvrC7u
	 44U38ArUasZ0AO4LEr/sg2SqqqwAh0JPjog2jNEM84db8ocfp6Uu34MDMloKOHqUw5cTG
	 NNv7IdCP2/7c8r3vVIRmg/j91hXcNrQBZcoIrflsoILA6xrfUT8Y0+eccYHqjzLEyY9nZ
	 imyEsXgmosKXB2ESg9RoLT8YJjg599CTkaLymwRsoBPuM2l+8m6TDdBujFJg1z2fOQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FYt/cNDo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C1606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 20:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYt/cNDo
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so485704c88.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 12:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946125; cv=none;
        d=google.com; s=arc-20260327;
        b=RDwN6QD+t0TY8ZY23pm5W5S8p1Esua7SiCBik6TBt+I6IysjdJYK9taSegVUcf2gq3
         cQ4XRoRX8OFCGSvDp7W0LD87Y6eI7h0/enoWXOL5tUA1BAFdd7cAORZY7D2KmtP2jJ8h
         XrtzM/P6HM1lgMF/btW9bPGf0Hx0OAW3yPpsAeYoPBeOx2T0YEbON7OsRRwjoj7GErm4
         PKAOAMdzh+NCSU8JkhrnaDWcXvkkKbiC7UsVnmjRZi2/L4aWVvbVGim1FvSun6q1ZX+K
         76sFte7HH8ZMc3aEMGwTgR9qc8BmdsppI56HfyX8RMWaY4Br0M5EknlslQHho0fH3lbk
         CARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        fh=gpN34ZgZRCrJHkjz7Clynmi1EabggrEmE+k7GZUacQc=;
        b=lE42VUSfKQxpra25rGvb79UVTOjnOnEGf1SbhsvPrhqHhXpSApLiZ7yZVjLeKZIzct
         uxNuyjVasWC7PZfPWgIvbNKN8XVmTmNjDQ3z7JD/XkDP23CpsKIxqQtAqEE7RyqS2Fo3
         wfMGw7+UGe6QMO/aqD4CTrFxRsoxoOEmO7oEU/yUTWzaSYeAlqveryCpeToK2LjOF7rJ
         FYbyyK6xezrGXXfNa62oQe3MtywYcZUz3IjMyhVuvto60tAMhNHHMiQmaJfDvHS3jGL+
         Yl3/kkAuosSoeA2M2F2jYsuj9XAcLeKheiVI47gkrsR4ObWREpROWH/z17FcPDsmnMps
         87Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946125; x=1795550925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        b=FYt/cNDooL1obgAVhais9kt8KjQr0e5IUnAFHvoaXplLu7GJAqMecHnlFaXBR2Rk38
         r/n0RuLlAAAZPcFQwv//QrvQ89zsYHwN83N6qq1g89mKNLGyTIu7xiRBeM6FVNZBTcYk
         L/QdeRzNu8Xot6/RjF+12DbNNrf0asXWwSphbwBCZDgbniPhJy2XLWkR1XpJ9EkgoEkb
         H4MQUagt4N+zI5+VlSK+wIbAz9+DhwhcyuVb6qvRaV/8Lsszkx4qlGCP3+Wnzjv9iP8s
         zYlH3xu5vDotH+y0euXIORe6gqEd/Z27cN5iYrbPXDGTGEruSH8CuyYm4utDSGv8FVeQ
         kUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946125; x=1795550925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        b=V1lLz2XndhIpnpyJ19BJBBSEbqnaSSU5BoMmwqhdNtOwIqUsuHMg0lvH4xjUUA2VB3
         yav3t2lg6ld6QlMRDEsm9fYe/NVLzMfE5Qny2p871P2WQ9V1oPMScHxO+g0TRLk8iCbi
         pxWaxW9iqWSmQsm26i4ki1HjZSvm6+ygMuIJ1L48VzYFy+WK2wT2NOqrFrvnHgqFcNLs
         iWDpiUWNZAltScWFZH+nY3/lRg03rpwq6PDktWvcr80AeUIOubgplNHE+73uZUgrEX6G
         2/57VCVVeiFMDIpX378jV2L959Xz9FWQb/LMdOBBt2pPlfmU2t1MdBtD/lQn5NvOClou
         MDLA==
X-Forwarded-Encrypted: i=1; AL+hErETYKwlNptMPy2OXKq1ykh+tBkruVJHS/38i/067vIJzxxQdxPDg57Ek/tap0GhAVdSZzE18xfS970Btw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97UXZhmNszdupzleVrFCSWwEApAbzdk6vt/5YV2PmSn3BPXv8P
	u5ZLPS54tII0V9qoOqTZ+icSqoxSgnFdgWFC0weyxE2rkts8T8T/2drdZwjxktxzzEhVfMRyIR5
	QpTxZe1naJG4ebde97djGFQSzNjlCmCs=
X-Gm-Gg: AYBFou2NiYDiji0wO76HPA3dRgn1Ip2+nQn13maiprqFUxZPqEyhmfaUUwCAcxLJUtS
	YHRqgsWOuQMe4qt3540b6YaG/uPY0MGZmkTnVOV9IKu0VdCd2sIvYSjsc3t/HanbzHxbdruUMds
	kTKWEDX3Geg5xUI7osgTaCCvqhJqR7FLNiJqStM8LV6w6gG5zeyodmqv2bm7EL15m6QlTxAgY8N
	zGCAq9jNTMJFPW22mAYOwhf1JVH43/H3y8gW+rvAUdHjnpk4GKeQEKx0me7AL9Eex+N+Y6sIBVN
	PEmkWltVbWnfd+WoU/iThxs2VeSq3XYnPhMWpPLS23sGHknWYXsGQmla+JJrKh056EHluL+uYDu
	UiWe4+u5l6hbxqpfsklfMS4YmZyjN6Aw0Kmrk
X-Received: by 2002:a05:7023:a8b:b0:151:2e62:fe5b with SMTP id
 a92af1059eb24-1b543c12c96mr654633c88.22.1794946125077; Tue, 17 Nov 2026
 12:08:45 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com> <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
In-Reply-To: <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Tue, 17 Nov 2026 22:08:32 +0200
X-Gm-Features: AclHuK9zM_Ls3MCzLaCDnl8n-_yZmMi5OFpkqnXIKOSPNu4QJjDT3wDoWJvAC1U
Message-ID: <CAKWEGV5XEncchpzBJWjjYh+cXE4ZSSiBvEDUdN-3nLw8tA4W5w@mail.gmail.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: johannes.goede@oss.qualcomm.com, Ted Vera <tedvera@gmail.com>, 
	linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Cc: Maurizio who continues my YogaBook porting work.

=D0=B2=D1=82, 17 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 19:3=
4, Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev>:
>
> On 11/17/26 11:54, johannes.goede@oss.qualcomm.com wrote:
> > Hi,
> >
> > Note adding Yauhen the author of the troublesome commit to the To: list
> > (why was this not done in the first place ?).
> >
> >
> > On 16-Nov-26 22:24, Ted Vera wrote:
> >> Summary:
> >> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> >> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> >> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> >> appears in devices_deferred, no RT5677 ALSA card is registered, and
> >> only HDMI audio is available.
> >>
> >> The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b ma=
ps GPIO
> >> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> >> device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jac=
k detect
> >> and mic-present), not Yoga Book-style external reset and power GPIOs.
> >> The driver requests the mapped GPIOs before registering the codec=E2=
=80=99s
> >> GPIO chip, which appears to cause the deferred-probe loop.
> >>
> >> Test and result:
> >> I built a temporary module against the matching Fedora kernel source
> >> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> >> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> >> card appeared, and laptop-speaker audio worked. Secure Boot remained
> >> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> >>
> >> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> >> resource layout matches the Yoga Book, rather than applying it to
> >> every RT5677 ACPI device.
> >
> > Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
> > a DMI match of the yogabook sounds good to me.
> >
> > DMI strings can be taken from:
> >
> > drivers/platform/x86/x86-android-tablets/dmi.c
> >
> > Note there are both a X90F/L models which ship with Android and
> > use a different BIOS, as well as X91F/L models which ship with
> > Windows (same hw, different BIOS).
> >
> > Yauhen, I guess the ACPI mappings where for the Windows X91 model,
> > since on Android I expect the GPIO's to be hardcoded in the driver?

For Android tablet (X90) I used x86-android-tablets module to create a
ACPI-independent mapping via GPIO properties, see
https://github.com/jekhor/yogabook-linux-kernel/commit/4e3c2f5f7c74305d4825=
bd1c031fdb3bd16edefa
,
was submitted as
https://lore.kernel.org/platform-driver-x86/20260611-x86-tablets-yogabook-v=
3-0-de407672e4df@gmail.com/


If GPIO mapping in the ACPI entry for RT5677 is not generic actually, then =
we
can use the similar approach for Yoga Book X91 also and don't use ACPI
mapping et al.

> But the open is whether those GPIO mappings belong in the codec driver?
> Back in 2017 (!) Andy moved the Samus mappings to the machine driver
> bdw-rt5677, why not add those YogaBook mappings to the cht_rt5677
> machine driver?

I actually cannot remember why. Intel's SoC subsystem has so many similar t=
hings
made in different ways... AFAIR, I didn't find any mention about other real
devices with ACPI and RT5677 so tried to apply these mappings as generic
and belonging to the rt5677 driver instead of tricky management in the
machine driver.

>
> Looks like the addition of those mappings for the YogaBook didn't follow
> the Samus precedent, now we have two different ways of doing the same
> thing even though the codec is the same...



--=20
Yauhen Kharuzhy
