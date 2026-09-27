Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814C395266
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549447; cv=pass; b=VlNm1bINEWBfmrlLzm2OeZU8zqx9op9Z6l0oR7qxG//bSH+qwUhDwsDPKWg7VNdtk+nLLtHbo8LpseEUNN6lre0xZ0/a6k8Ekmiam5fAaW9QWRB5pVgOKEU+I6VoCnESjGubZ25elC+rJ9Edru42K7cfe/T8YVYGCh31Yx8khBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549447; c=relaxed/simple;
	bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUCiQdpdURoUg9Yi1RsQqYeg/+CM8azl3gmXBymN9JpUQ3+3t2sAlLna6zzzhXRtj9VSIB1BUhKdmBQ0SAcyneEIuJomOkXLw3XPr/imbt3IZLtcTrOB9AVeOJTz4ZIH45W13YACJfNcSjI6l3MJeJtmuhU+QE9RMOpxZyzYkoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=bUrQXHXj; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bUrQXHXj"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dcdc386ddso76540566b.3
        for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 15:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790549444; cv=none;
        d=google.com; s=arc-20260327;
        b=XEhblCFZOcqABu6JixpdGwY046rzEpO2ZwbuqUzp0xH04vaxwczsZ3twQrjR8bCDc+
         4sU8aWMWWwrYUoW5gqghwjl/c90NcuZHhQAMARc8Bm8voJ5abmZ9qomjhd6r8OQNv+la
         MaKORx2uVP1S0O9B4rIotNSDV6FJaXzzL8hSbojfETiacZ1CU1+bAUSQlWdmU1fNwGJk
         55SbUMtTJBDpUK7btVttTw7S2UiOOwsNkE/fLHc8IsMlS4Mq15iub6iSFr0UbSS68ftJ
         eGPP8BVHn6ZZAdafqQIix3fZK+x1IvBpI6ZRzNKvpQVU+emh72ym2WCQkKIZeVUdpNZf
         Kgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        fh=h/T4a5+rMpOZJxAZEyimaJ8J+CebshRbPUDpNzuQUkU=;
        b=R8qVhrnMYfJVUwufMDMLYTba6MEUOAfo/93Zgmj5XR9Oo4fyI/L7mirEBxGa0sHDYZ
         2OrSxg+vfuv5+ueGu5JZl8cLw95/upEB2BZLyhsq9u39zuAhzSzNpGU+9cC6PmS+ZtHk
         BUNeRCIt+PInNZxVKiYUa/NOxbGD9FKqX+FCrmfSz2noozyL/wXEmWDJDNd+lIihCMko
         HjvRU1HfXeWIIdnPTHnLQMM6yGR3O2XlAoxOMmeSIsFFC8LdccKAdQt5gHk3na+RaU6T
         ETtYn5cZ5q33VKbcWU2/hDjTGuvfwE/SdJhEwTkQww90Cw6mLScXpLJ+RnDIxLbrqojl
         Q8pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790549444; x=1791154244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        b=bUrQXHXjWd73HigefHpiexC1jDhP03WLbFjMridXHvWTWmWUq4jg+STaz5W/J6jRgD
         iJzTv+bKlgZg9sQeGD5ldyz3uLp0GRi+OCSQICKDX0Q2tDQc1kYXjt1ZGa4LWJDj46yu
         d1JdJrB8anLjre0KNJSLMH9PEC06zg7moNK0eSoiFDTZm0wR3MLmB3Zw3NDnBrOR9NXo
         arwgo8yPQa4ocep0nZBp+5c7T1V9LIMJKQpl/rFBly8CosDzVt5UdojkUHbM8A/VUxXr
         5TmR1obwcP0327NwkEEFumNUpZ7VIwT8xjv7qgrRIF1zbCUQ81u2pwcJJYiGWMBrSGWx
         kPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549444; x=1791154244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        b=ithvsEEgo5lRr1MK9FimTfGba+cIb6+0Mxrvh8ngwe/hFmGGujV5NMKq5529ai3flh
         ckDya4ZElEN43yFSywZCQGaoOlo5z1DT1C76bUjDUbn3LoO6RwYvUUHJyVF8VgVi4u91
         mmGyFeO1KqOQ4925nHqlLp/yKe+XgeOzjiswBfbQNEqC41f23rbPHZnawd1sIVJ/eU1O
         P97RPfX6qDuBdn6u6EpJZ/02AYdHoSB9XjkUqe61IrxrOmqeg2amFLASwR0KyF6R3j7A
         /yN+wCtIDVjnVoR4PzbezIHoPqgIk6JkcLnvOg/qSeEGkCIhjlOQb2cei0wuVUBmmUJ+
         4WXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT5n5yOOet2Etd62PjuyrBqkBvQXzHjxnvuW5b02hVY3c8qEEBLzydv3WvVezQjQCXnmCS7sE4rJUvQw==@vger.kernel.org
X-Gm-Message-State: AFuF++kiV5bxvqimuq1xRex58er0t/CJjh1EFotsiquOZHvijWKv+K0d
	Nzq1Wkkxqufg0sq+kXCehESEh4va6z2pmT/gFx9QWK3kPXsQr6Qt+kPNcexpfqfmxcE3ong6eXo
	CY3fyOSRkdwjC9UDpvJEbd2Te5osF9dA=
X-Gm-Gg: AYBFou2omy/z6iuYUyQDAUdUq0R2Rh86rydAvhG7RG1UsNCIRJnBS28t4f89KrsPq8Y
	1BwazmmF2oVavt7ZAIPRVxI8g/w/tSyMdfLqoCLMGkj3Xcb5xNYg9Q4EIUtf2RITohQV69FYK1O
	6rLTCg1/ybRxeTaDo/Lb38/hT/YP+0SU+vNfEqabjmaKGQCMFOdyJ+3psQJI+cYpS4pM40SaIXX
	RNdkdVE5/+IJZOOB1yqryeyHbdM2UxZ9Iq/BQHCn6DMHO1JbjnP5V+UG+czRKndHwv7Vj/aPgFu
	5OKfgBrmrhkwFbVBAwBzA3qOzy/JPcbV3FqRjisrknHcYJQFVwAVCIfb6mq6sb0kPE5JxQmX1iu
	T/DH3FtU96tOjPkJ/QAHZcHbcb+I+q+PlRrmpJCdmFIfLOOpuxfxjBIa/tRE4nDcCw54xhBgn+u
	ZpWUFF5h0hUo/RoxY=
X-Received: by 2002:a17:907:7b8c:b0:c2d:c33d:a9d4 with SMTP id
 a640c23a62f3a-c2dc33dada2mr233426266b.10.1790549444303; Sun, 27 Sep 2026
 15:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
 <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
In-Reply-To: <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
From: Faaris Ansari <faarisansari@googlemail.com>
Date: Sun, 27 Sep 2026 23:50:33 +0100
X-Gm-Features: AclHuK-yRwoG3EWnoCvNFcLc3JE7YWNDmy2zbYPYkBL_ZtPL-UpCyDcrqmqvJWY
Message-ID: <CANBVYRAr_ShKGmrt2NoqsDsDEbTXa5DWJbq2oP6wKLWJQpLRWw@mail.gmail.com>
Subject: Re: [REGRESSION] Audient EVO4 hardware volume control now requires quirk
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-sound@vger.kernel.org, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

It seems you're right. Reverting that change has fixed the volume
control with my interface - I made sure to remove the quirk flags
whilst testing.

What are the next steps here? Is there a problem with that patch, or
do we need to add a quirk for the EVO4 in the kernel?

Faaris

On Sun, 27 Sept 2026 at 15:27, Sasha Levin <sashal@kernel.org> wrote:
>
> > I was able to work around the issue by adding extra modprobe config to
> > my system, specifically the below:
> >
> > options snd_usb_audio quirk_flags=2708:0006:ignore_ctl_error
> >
> > Does this quirk need to be added to the snd_usb_audio module or is
> > there an underlying fix somewhere else?
>
> The likely cause is 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write errors
> in generic mixer put callbacks"). It is in 7.2 and was backported to 6.18.53
> and 6.12.111. Before it, a failed SET_CUR in the mixer put callbacks was
> ignored and userspace saw success. Now the error is returned unless
> ignore_ctl_error is set, which is exactly what your workaround does. It is
> the only functional change to sound/usb/mixer.c between 7.1.13 and 7.2.5.
>
> Could you confirm by reverting just that commit on 7.2.y or 6.18.y and
> testing without the quirk_flags option?
>
> --
> Thanks,
> Sasha
