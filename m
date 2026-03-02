Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232FD35DA5A
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449179; cv=pass; b=MeFO0Sy7Zyw48Fgoi+gPmb0WRLEr96uBRSTCXZF5jg5qhn3c5dKwkuHI/LlJjfH8kUBXTKeZPElYyX66GRELdlYzwdhqRA8lrskERmBcB8PBVExhrO0L2/thJXBwuIrB0dX6ubnM6Hvk/HHWQ79+QCc82PYKsy+H7JicnqxpgK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449179; c=relaxed/simple;
	bh=DOlMsHbMVLndF4FYMYvBm7QWT7c+r+O4d0gh3fB6Nu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SigQ5Ew+w4jxbZHcZdb2sMyFRfEit9RvMHik7rDxXuB8Jd+e8m8jECV33t/jA5FjWFkLA2J4BkBmLAbq0vTkhHKhfSYpJZ4YlscIglm4GTO5F15P3GM4KRBxgwfx2SvOU4vDzXYm4UUwsZm3GKLnr0PjJfMlya7MAn1hDJN7jhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxtoyy6J; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxtoyy6J"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4c1d2123dso5383018a34.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 02:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449177; cv=none;
        d=google.com; s=arc-20240605;
        b=VMjbII7oSgHu6HRARdelpMCqex+w46GjWhJ9jQR6HuX0ZMlFVi4OGmWdvlrH+bfRAT
         3jHIs/e0BfQvcP0Jg4KAu9M4zuWSKEISkVlhVnfB3vepw1SepDlL8NDlqC8c9sBvVMx+
         Z1diDZj/jRiA8N0C2Uq0ylqdFreMCG7HLjWD6362lFWsT/P5QgRbND1W4kRLPmhyMQ+x
         qEi4QCSfR2s4jW3yOUjhmczKwCGX3j89/Y0p4vaeoKpma8JMxpl6dKrtNDZU+frjS2ar
         6RgiYF121cIreB9xUC6VoHJeCXGzQNw/1rkQiPa6TvXq71GnBEhRkgFr06dA843kYKL9
         WsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        fh=xCJmSKM5CRhiyXvUogrYOf9NYs2V4uHGmcY1GevG8/o=;
        b=j5JM8u38O9hfYMCvVulFaV5PsdFjqHdCaDuOsYc+0pQMJs5VFbJtSKrB27N4/Sd37F
         UlZ6uzVzMzNfwNHkpQ3Bx+QXdV4qen1XR007dNPDPzu43nHk1nC75wYnF5lrmaxYxSwl
         zmrJtkNGzer/7VRKaGgQkcNE/o6heIaM3bVAeZDXE0FXERctQu66ldYEeuCdu9n0uax4
         ocGAJHgz7FgQWpaLKzrMm3SNWJU1bQQCNlki8Y24T6OwJHqpkCbcNRuccJqIQZwn1Vmr
         QYlBRJeglLx0kvxBsmB7eG7vceX2Gu0rY9Ap2DDPt7wCXO4VwG7PfKfplZXmCiCfCQM6
         08kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449177; x=1773053977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=Zxtoyy6JwMN5kYDszE+N6pvLZvnY25i0Ly46fy/Hap5GsNmsIVLeSz8VjmrfLDPaLX
         QzeOzFZhrjGenyvgpbeXv8F2eyiilQBtdWIY7DRG0c7BI0D0b+Z57gh7tbGZC8hRAhu8
         H3PALdg37i4yUpjRh1OtE+kPNtFBXCYEuCWlFRqflIje2iVlGlvfBYomu6yGJlvzs3/N
         2jwPrhmRkQrdfnTtTVzBARR4Vx/F6ZQVuwFEYHYMlQ4bV0LVCL0/zNtjQ7RAji5EuX66
         ecqA24GWTUnzCOAQzLV3xVZJdg3MeATec5Y4b1XoXjQuKCOr13rYbAcQtADrCHj2Bb0Y
         ugTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449177; x=1773053977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=qBBOFxPrViGtZO/82ehPJeA3zepQYwRF/X3SgGfVU164T3gTB8i3oEHDD64/VY8v3B
         Se69GB8QGVix/YIHAi2CHInxQKczXgjJbLHVJEoed8AAzwfBSyZMp/PuBsbDRJMaxaLT
         YfCpFzA0S+f/8NWQfubjxEsPcxq8Csjpviw2SRpAF+ctZdUnjbf8Xzv2h8tn3oN/lBFe
         iZIYa5HmjlCvp5r+rUdN+W/NhQJHpnDkaK7I2KQZuGLPJVyUma6HUs64z9MHPMO+Dps5
         QnNdYpcjfW+W5LN+1tJtq5jN9gQtA3J5FpgtfArGUfLI/zvNBDG1H7+A+xdBpLplNBaT
         xZPg==
X-Forwarded-Encrypted: i=1; AJvYcCXntgHDYlq6j8j6yHq+09UZj+Q77MIld1vnr59E6xPmw4CBGHVBgEMqtMUiFV3NBXDVCq5sUDL2kzRd0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtI6csl/GB4uVFCEGy3B2h2CWDn1zFGx1k1cbUZNFQLX/8q0a6
	6WXzMP3/LRsGSLcbhWmIjlPGOykp0IlukXSvMth7KEQv1KQcmvIzjQQ8FjREN0MYYkb5JLn5/N5
	Ebw6LxSrXOyVHVWxy3Aig64V7EXVDPME=
X-Gm-Gg: ATEYQzxUls2RYuUe5V06RH0duOX/pI1B4EFVtt9H7D3qB+iyV+sMRXbxvbtHcXVw3tu
	Z8KZtr0m1PDojcwrvrnmYJxX91e8DADbtIJPC8X0Bip7I331SbUYsMkz/cpahGHGVb4lcj55nqH
	W1k72ijO7hYcMXALtyRIF+zAJePIosA7ohioD0VqS+Hm5YEeCGZnK5UsaA8Cm44O1/TNifdi9O6
	iKwCdxWdrti40NqUROWhhQfCtcCNjhNNn3ueNnsXKfK16sk6d7VB0jVFcHA4isSkpiq+nmimehJ
	ksgDF1dfedr+YS/ja2KADYSB+joGu7DdwbOOcRR1qHs5lWGMyITtKXD8YLH1NnlCyuNDHwuWtvs
	=
X-Received: by 2002:a05:6870:3234:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-41626d6496dmr5836181fac.9.1772449176906; Mon, 02 Mar 2026
 02:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
 <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
In-Reply-To: <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 18:59:26 +0800
X-Gm-Features: AaiRm50vW8aIhDL5VGmJOu5lxfmc5lcpsegRPt5hsmjpSbqi9ltnncK92dntUuc
Message-ID: <CALbr=LYMgWXcj0QkQYv-68gX2mkzyKrE2BJFeXbnoVXKW=F85g@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 10:41 AM CET, Gui-Dong Han wrote:
> >> Danilo Krummrich (3):
> >>   driver core: generalize driver_override in struct device
> >>   hwmon: axi-fan: don't use driver_override as IRQ name
> >>   driver core: platform: use generic driver_override infrastructure
> >
> > Hi Danilo,
> >
> > It looks like some usages of platform_device->driver_override were
> > missed. I found them here:
> > - drivers/bus/simple-pm-bus.c
> > - drivers/clk/imx/clk-scu.c
> > - drivers/slimbus/qcom-ngd-ctrl.c
> > - sound/soc/samsung/i2s.c
>
> They should all be covered by patch 3, no?

My apologies, I got a bit confused here.

>
> > The good news is these can be easily updated to use the new APIs. This
> > is required to avoid breaking the build, since the field is removed
> > from struct platform_device. The previous build likely passed because
> > these weren't enabled. I will use allyesconfig for testing going
> > forward.
> >
> > I scanned for similar cases and most fit the new APIs perfectly. One
> > exception is drivers/xen/xen-pciback/pci_stub.c. It does
> > strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
> > drv->name. We might want to change device_match_driver_override() to
> > take a const char * instead to handle this.
>
> xen_pcibk_pci_driver should use the exact same define, so we can just con=
vert
> this to:
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf0591..301207b4a30dac 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -609,9 +609,9 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> -           match) {
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
> +                                        match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
>                     && dev->hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
>
> I.e. no separate API needed.

Thanks for the explanation, you are absolutely right.

>
> > Besides axi-fan, I didn't find any other drivers that need to read
> > driver_override. This is great, as it means we hopefully won't need to
> > expose a read API at all.
>
> Great, thanks for checking.
