Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F82F5A06
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 03:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579031; cv=pass; b=jO+l/3N+0FObrnPe5HFnCsg3xvJBGWyfYpsFTkqqn5ib2ha20omMl/k2LYwKIFr/JtKW5r28nLYFXXzTOZxc/6iQuFj+2TBWbEfn6tjzlddriPO5iQHEoDRP+g9Ft9GyQaYpFbp0oYCa/oT9eh7PKWy4FcYHZW/Gewb1jACAg48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579031; c=relaxed/simple;
	bh=73YgTfRY5PQ5ZLAadl5YBKFBHFoLXMnXGa/HgmJQYGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkXArnBdXUUllZr527g1kPjRBs5w/XSufY7+xuxqAZmmT1MOppq5JvldY7CXDYAS13+kn/BEDppRv1HccrTTvyVWsyaBY0u0njO7oOQRZI6nEFRJsi9TVRzEPITEdd3ihCBkfyUMjIz1mqyChWZ+NaDo0qeygWEW5y06bYz/RXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsfX8jAE; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsfX8jAE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so1569004e87.1
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 20:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788579026; cv=none;
        d=google.com; s=arc-20260327;
        b=M0JQAOuYmT2wkDjZ8EEdDy7FWN4vo86A/fSY/UoHo40vfB9DgHz4ZIjMhoB5YnLeSm
         68CttfF7lPNebS5KNUH1G2NnqfglGKcUXxnM/t+Wqk6axXUM9DCK9+yBqC4j92lZ18lD
         Mw90pypn4O99GT9G3yCo6comV5n7y0AAHUpSDUzm6O0Xi07Thf4EkMxT8FFv43snRWw0
         VYer41TZljaMj1H17duRANIy2N5DI80cftsbSEPOM9RReuIsb4W1TNNUXWWNGQBzldOX
         Xecn23Yb047BOTHllyuYfkyzbMfK8CA/rObXFGnMm+5mrW4/2oflvcWFKIklJpF/anIo
         7xWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        fh=C8TujwwXJqTAn6JuczB9GbxnV4PFQCExElfdWO9LjpI=;
        b=kwJbZrFTDB7LhcwA7JlkL1Q+duL0ZsroLobwkncqHQCyGOzggvCozeH7wbdnjDSDvx
         1iSd5PVjaJrCpUZgDafviTl7vx+Vj2KcJc13epLQjGtPe1lechEOsnvdtcfXlKZ1vzn1
         1ErSJKniX+HMx1GIMa0eTb44fiVtnaVNNfFtMHPEMzuU+kZxDhOzB6hVv5l5HVa3zbm0
         FCnaInUBeEpAFKIexTPGhV5YnkGShAz0G/xPGqSKJPKp7xTt2f9rhudqbi3rftIcXa7b
         Wym5oUp990UTpB6bOl4yXl6nhGPYkQStCXOtt5H6UWIMAwhm/yyh6+0dPYzL+cdyUcKU
         nghA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788579026; x=1789183826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        b=UsfX8jAEGfKfgg+Y9st6Z8Id5TJFRw41C5+ziZWlF9uqy2pY5UXtVIl+Lh97XSeyrt
         yVPRvaFL/uuZNzxjm4Tu7vM8escGzU3zyyveTlJNCGBGLDe24HrVuGUZPVKV21DC+0rH
         lnTUnKeChFcuIDlBaYLNDFIo2sKe4kQKVBuSCyFvSGVHhdLUDwmlEXjNZ+Cb7yS+yyJm
         kVrHMA7OGS1XfRa2UxDJlLTYmxqHIvxVi9emuxSJmW1Kxh7i5el8ndGZRtLsLQhbFwOP
         MWMFVdX318m2/AoNaz79yGGJojxr6KFKDOTBA/bQfUekN1mZ3yeT9f+1GGYvSABz3y3V
         KR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788579026; x=1789183826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        b=DKSMCl8z7thILKvcSr6vFjvnDvMAvk/3aJDcyz6M8TdEHfutTLooqlTQzj1ypWqJtx
         SMVtdFJbIoZ6VOoOg3D5JVqp3SmuaYY/hWW/Vog4xGanp5QIG5YOJ2QHsOcqdRG7KHib
         nOi+MBI88JVk2BY0UcEpHuDnyzmnZEit9hW0OWgf+a0tg9TNjjfO7brAzpN3YebHgDYP
         R/riAPnfYnYBojYv4rsANue/HZtVnCDMbbz48ltgGex8d9cqmTU8C6vavYFDzU89pNhP
         N257gal60F2BSkdpgPedADbxd6JpKWGqtmvwMXe4JbuTZjJohq20hpQwmaMW2Ja6iJnp
         9kSg==
X-Forwarded-Encrypted: i=1; AKwUvBzeome8HnFQXSwczMrSlzDdGCwwbnUN/S9Is6Tp3Zx2mvbVyoTxj/PfKx5i0Fb4cFmvbNSVzKDQOjDVdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kO30sn9zjANVJOi7Mfpw93A2RCnUib1gMVCol0b0PGqK+TckXs
	5VEJNOTq9PzitlWCLYi+yDYBV06C1AcPdNp/BhpgxJLRkkRNBExMyey4rCZKMdWNmYX5Zdtug8b
	/V50Aex7j1wVu4dFEwsTS43LivjnP7+zA7/soXKg=
X-Gm-Gg: AYBFou0ac2V5OOhMIZidtgoku5aORlWS4HXwOJ8ItuRCj++rYaAcOxBliGuyVeqaBVA
	ejEujeAVV+wyiPLKSBcJhKMvp6wUNQjICFNOlaFnrNsUjBeVOa2DBKyr9n5LmUra/V5TjII6dgk
	g+O7Eh8SIdQ1sDyrJe0npgCt1wzBpx8etiXr7bWizVecv66y7Nj1asViA+2wiccgd1zc+WYAQcw
	UyfbLo1fMXO0QYV6UoUCDf7nLkqLBzZFuER0leHgEADL5WOxdFQVtmG8x+GdTtVjESJgoljBMte
	a2pI51LrWzvPNRXTShgSeJkFYG0f+bopmCGE/DNNCRti1A==
X-Received: by 2002:a05:6512:3e08:b0:5b6:4b2:de81 with SMTP id
 2adb3069b0e04-5b617058c7emr1560231e87.31.1788579026068; Fri, 04 Sep 2026
 20:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
 <20260904182023.4486-1-hhkieu@gmail.com>
In-Reply-To: <20260904182023.4486-1-hhkieu@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 5 Sep 2026 00:30:13 -0300
X-Gm-Features: AcwNN1XqapVpSljR1RHwVb9QBxMZ9ZPENJ6iH6m31QN5659LjwkwMc11dhFfhzA
Message-ID: <CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hanh,

On Fri, Sep 4, 2026 at 3:20=E2=80=AFPM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> Geraldo Nascimento wrote:
> > Are you sure is_pioneer_implicit_fb() isn't returning false and you're
> > picking up on a generic sync ep instead?
> >
> > You should double-check that function is returning true or false becaus=
e
> > it will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
> > set on bmAttributes of a Isochronous IN EP.
>
> Good catch, thanks -- I checked against the real device rather than
> assuming.

Thanks.

>
> lsusb -v on the DDJ-SZ shows both endpoints (0x01 OUT, 0x82 IN) as
> Isochronous / Asynchronous with Usage Type =3D Data (bmAttributes =3D 0x0=
5).
> is_pioneer_implicit_fb() accepts the capture endpoint's usage being
> either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB, not
> IMPLICIT_FB exclusively, so Data usage does pass that check.

Thanks for this report.

The code snippet in question is in the body of is_pioneer_implicit_fb()
in sound/usb/implicit.c:

epd =3D get_endpoint(alts, 1);
if (!usb_endpoint_is_isoc_in(epd) ||
   (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=3D USB_ENDPOINT_SYNC_ASYNC=
 ||
   ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
    USB_ENDPOINT_USAGE_DATA &&
    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
    USB_ENDPOINT_USAGE_IMPLICIT_FB))
return false;

In my opinion the logical AND at the end of the if condition is short-circu=
ited
by doing that inequality comparison between USB_ENDPOINT_USAGE_DATA
and the result of the bitwise AND between bmAttributes and
USB_ENDPOINT_USAGE_MASK, because 0x05 & 0x30 =3D=3D 0x00.

When that first condition evaluates to false C never bothers to check the o=
ther
half of the logical AND, for logical and practical reasons.

What I'm not sure of is that's the kind of check we want for Pioneer implic=
it fb
matching... Takashi will have to be the judge here, but I think it is
not intended
behavior that this function picks up implicit fb without
USB_ENDPOINT_USAGE_IMPLICIT_FB being set. The fact is does so probably
means that code in implicit.c needs a bit of improvement.


>
> I also traced snd_usb_parse_implicit_fb_quirk()'s dispatch order for
> this device to make sure nothing generic intercepts first: no fixed or
> capture quirk-table entry matches 08e4:0191, it isn't UAC2
> (bInterfaceClass is vendor-spec, not USB_CLASS_AUDIO), and it isn't the
> Roland vendor ID. So is_pioneer_implicit_fb() is the function actually
> being reached and returning true for this device, not a coincidental
> generic fallback.

Again, thanks for your due dilligence, and for all your work, it's looking
good.

Thanks,
Geraldo Nascimento
