Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21B327C18
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776059302; cv=pass; b=g/AnvFVrxGBttk/DjZXtOPmBDuTU4WhMmafqPbv3wwxAQIoxeZxSN2E7iX2q1tybCqjP7mzCykh/lGrt9zDvH8exehnF6ZO0bAqT+rrxdEG4lSPWCG/rsSTWCGTeEx9aRYLsfYGF+a4zwQMioXdMbICNTpWIz08xkk8jcEt2BlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776059302; c=relaxed/simple;
	bh=igt2Es3IqJum7K3P9h4iERQJBtAxhpKyYYTdHjquAUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM+E5K7yFtqbRUyXt/AvTq57i2ysNrx6cnEy8aZCXufdqJJMPcDR+b/rAEeUyVniyeRKM0QgPyQ68cwWa5THrnMWK2hyzwYYXVBllCaASeiH1N0dt+3ZdgHf9XDfnzT5o7VGgnxOzHYtGwxFXDiKOwbpHaJ1f+8DWZ/wkeoQ4BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1kbALBW; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1kbALBW"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501d242e2fso3817752d50.3
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 22:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776059295; cv=none;
        d=google.com; s=arc-20240605;
        b=Fwlf8owUGEg+O+NCk5r6Mh2sS06IpU19WqYX3so8lJgadzZicCH36Mgrgs+ef1yhFL
         VR2nFR4JE7kM7kaNrkesjeLJrRnSU8wXWnKPFIFVKDJQ6mdba8sf8/kn+2+JpLGv0nMH
         ASOJhxrW887XsMWrrBKY600FJ3uuvPVHrzcmixCuT+63ClyR42XxoChaQ/99DUjOBdG/
         N0zBAosqykaCXOJZ+SHP1Ez/BPnA8WGtEczDdC44dxCQWI5Rdxclh9aba4Aj7tKuwDeg
         6MrfDbMnlVFRYkRzty+e4CPw/Su0LE+UtTDVP7tvNVd9qV75WCcVVKE6YQdKgS9xlJam
         Zu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=igt2Es3IqJum7K3P9h4iERQJBtAxhpKyYYTdHjquAUA=;
        fh=/R8YEBbudUxusg0ApgrgnpJUE2oTtx0QMxCoGPVmHgE=;
        b=eyZ/t2XMyv3SFaNXLn63F0KCmwKTSWNJ58GaCyAkqmTql2elHLWKRycJDM9BBpNYlO
         0htNku0nh7Xq0EcFcWER79DgUM17vitMfCHu13kDNBC0Bfj+tzky+T2veYHo5EKm6c/P
         70N9DPL/uD1DYpzD3XaN/Qu18RpD0La0r2GUYMdDrxjgc8eYZq2QcT7sDkiYuXqEWPC6
         tZLgrYJ2aLiachFqTF/id0LxudYem+ckXJVSrJ9JJ11mNTs32dg6u261Gesl8+CQEg4H
         CrM0MTDJj7kUNqrz0zHVYZsdi1hDhKb/APLLh6eMa5Tc8X1goA36U8vnlYU2VKinMSyI
         DnWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776059295; x=1776664095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igt2Es3IqJum7K3P9h4iERQJBtAxhpKyYYTdHjquAUA=;
        b=D1kbALBWISUXixtTGiAn1YtHLaD1vci/HrAEznoIqZRakKRz7y4Wtat9sCmbmCqPpv
         bxsr3Ug/HeANneENKvEzR/3cKGzc5zKoqje0MXlB/92k6MTt9zMF4dPe/WiW6/IejkMF
         1dMyvlZ75NfUMWIt3CcSS6saPCc8PdSyAhpZJtIZQWqyKoQAUTHOgQH5EBsVZMFqJYxW
         0uqLwSA45tYjf2BvBCn/tewW/fTqv7OzFoVaadhNkHRA73bGxMNNfUD0xUlIKXknaNzT
         nDsffdvNzXKptLcWtHPAfK9S+R/eaD6PqyUQd65r4VthuYKR5Ks+yX4ursgY479kjDKJ
         FOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059295; x=1776664095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=igt2Es3IqJum7K3P9h4iERQJBtAxhpKyYYTdHjquAUA=;
        b=SHx7frQ4C2fV67n4FxskGNjVkZScSGKv1ZJnYNX3mJgoJ5ngWEtv7/TbgCEpyllN/c
         DVU1Z0GMnq04PQ3XyCz63aqV0F8+pjtD4404uiiCgB1Isx0oeoEJqoUDTvMv7iF4OdSf
         2FdqWEGpkVfHmlaROUh5HQOc5MGhH3HRZNLn+yM6ZVlxS7QK/8joMBtww7YUao6dJl61
         4P6q76sWcTyBXeEOzKbK9vhZfftwjXtc2Xon9VVKpr/LbxRyA6D1OmUZO/8PdTu+c2md
         1Cqi4CGkidII4ZZnFkIwQR6wRGAjpKhtiiRzk82d9ucyBzELKkrGPQLXmTRGkYJku5Z0
         832g==
X-Forwarded-Encrypted: i=1; AFNElJ+m9q6kw1la78DtFHnQC9BPAYbj8/NbAWgmC+e9kreQJTh5mBEvra218kHor4tzfMVxzfrDdWtHfdcAtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkopzib1vuh5ek0DPHsEAIpO9bGrRbh5aDCApIIUyro3E+kY9P
	4SrkldP5oPOtGu2tokpFp6WR/xpQuUzmMSBdTM9HwniXvDo1iJptUPSmnfzXhfO6uPXl7QROoEL
	mii3KpBqZlwxdazy9nuNNm5dZeM0vWDY=
X-Gm-Gg: AeBDieue7pg6iIiHmaDbVpbIAh26a53NPyQKXYN3MYXQ8Jp+L+vSelEc/MVM/pBv/fr
	Rn8MWOZMcKpHQxF9KMOippawBzXXDAPtyTm0+PabhDoonqkkLDKzl1h+DTfgz+98fSodqveTnCP
	5B6p6SyD5YccsGTItvSPo2f2V7D17AMAD6ByTjKlZ2PsZJSEUa6zgly2RrvE9roF8Izr1ZIJ4RE
	7MbUsrysQVFGSXA0XSnId9+KTHBM1i0004wZkoDHr/SC7LvlrU3mt5ymcIbPMuFS9Uk7GBgiM71
	9BPsjLmdE+nr680zzg==
X-Received: by 2002:a05:690e:e85:b0:651:c732:f13f with SMTP id
 956f58d0204a3-651c732f2d2mr2879385d50.27.1776059295016; Sun, 12 Apr 2026
 22:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412174529.2597250-1-lgs201920130244@gmail.com> <87qzojwi1m.wl-tiwai@suse.de>
In-Reply-To: <87qzojwi1m.wl-tiwai@suse.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Apr 2026 13:48:05 +0800
X-Gm-Features: AQROBzBBMm9HXnAJg2gaO5NfrkSceM-v1coDuu3HdhTg1kiFqwZxvg2otGHIv_s
Message-ID: <CANUHTR_1s1aoE7SfYH7NNcaoM2VWcc6wAoN_Xh=7y6D__Pe8tA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hwdep: fix NULL dereference on error path
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Curtis Malainey <cujomalainey@chromium.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for the correction.

I overlooked the NULL check in put_device(), so the reported NULL
dereference on this error path is not valid.

Sorry for the noise. Please disregard this patch.

Thanks,
Guangshuo

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B44=E6=9C=8813=E6=97=A5=E5=
=91=A8=E4=B8=80 13:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 12 Apr 2026 19:45:29 +0200,
> Guangshuo Li wrote:
> >
> > snd_hwdep_new() allocates a hwdep instance first and then allocates
> > hwdep->dev via snd_device_alloc().
> >
> > When snd_device_alloc() fails, hwdep->dev remains NULL, because
> > snd_device_alloc() clears *dev_p before attempting to allocate the
> > device object. The error path then calls snd_hwdep_free(), which
> > unconditionally invokes put_device(hwdep->dev).
> >
> > This may lead to a NULL pointer dereference in put_device().
>
> put_device() has a NULL check by itself, so it's safe to pass NULL
> there.
>
>
> thanks,
>
> Takashi
