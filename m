Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9503AB277
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271060; cv=pass; b=JTZp4CXYrXHu7CntXcqOamjwjfwfT7OksJDeszo08yxV3WLFYBAh5EepazRN2/ikBtCPTN4v81FpS2o/dXrsUR+g/OS6P1yVvUDfhsueUZEwOv5WsSfFL6+a/X+yeZBfTeZ14TrvmnTaTfULWpWrcSwjJ1n/LUtnBa7l4y+wQjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271060; c=relaxed/simple;
	bh=Wh+2/Y6YUMQzF4fgYYKLS0YmAgdUeif4NZ7LqrU8mCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrSUEXpjO40T+o7PCePjbvxdIECA/BZrwsdneTO2D8lIfZcBLTEL+M7siBRdNaRmBvj/gSCpvb6DnQ7XkFZGKDpRz3E3Ku9wKadFyr77W6cKefVBWhOYCwTxN0s1cHkyKdHD5uOUTQ/xu2hESWk3a46RkZ7Tt0IA03YsjxhZtDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPmwS9Gl; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPmwS9Gl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b7c844b20so475567f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 06:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271057; cv=none;
        d=google.com; s=arc-20240605;
        b=FPHPXfLKVsG8LWfrqN4tIC6UzHZKrp1Ob1zOGJdzs+6q/BDO9tIw0WWD+Vpsu9aTOW
         zkrktyCa/942guBWgLLbPiFOt52UL2Yc7vkr158Y+GEYq1htDjiOpn45NnIX3xAPwY7P
         VpClRWBLNuu7nL5Y5sIb2LiDCRk/+v2kAmxdSWtK2OdwYfATXBSiYbEu//FU4n8V+izE
         htdwRbfBDppq/voh2ol88MvONImpaYYtoCXopHPmdpxwrriPrQiz9XhuzQQaJZo/tqMH
         AqHPuB4jz3KJdz8EymHRso1E6g4Zt1jaDVDvyrjUFBdZndmq9Wzo0o4oLs4l5aPR8Dsu
         txNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        fh=mtWE3xNfmfLuk5a9qRr4gA41FgawiGH7J4g4HeDCuuQ=;
        b=VCFdD2itDenxKyjHpGEQmgiGR6Dc24sOlStEhAQBj0m9oVyteW80kZPSNScuWkRVmC
         8jAsy7sdSlfdlV2iU4HGzkKEEmS97o3HA3TZu2p2xYn0JFVHdb9IZKvhMvL13+V72dqU
         TjjIvtY+qICLw67sa2QibKoMbYEcAMW9qVhRiSuMgddzOr2z5NhBcrzMGg1c+NOWlYAn
         yQRtLPNQVfsMFBWD197WkbISijOP397MhIdbL6wpsqkkyICI+oZRFetlydn6HPVL34Um
         d/MwoJ1lvMd40J5K8NgulQAjDFuMQRdRl0S2qerltbBgvTJWf+0zAiXekultHp/VApQl
         EvrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271057; x=1774875857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        b=IPmwS9Gl4NtSaU2E03/yiH8g0gLzES0+RHq1WEdvsDw+XkFT191Ga/r5BxsAc8eQYe
         9NiRWN1Wk5bxByLYdBVmh6k6xM/PlAArcezfs7NVKmILeoqTMPuJEuBv5VBPSJPV7MHg
         hIwCTa7nlhVflGtmKidccRIUtLQHFm/dyEFG+KZtuLlMIEsSRos/PzvjTQAscrm5i977
         cAbj7zspuTTrlmlme30+UYd2l9NLai4C6h5QJNNXVBRRkgfAQ8ZbimBlsLlP+uDnDkt/
         CfHnag/nreUSxk5ETjsA5yRnWJlIKoKSP3G6hwAYaIWFG3S+Cmg/FHkbrMRUy9/mHtTh
         qH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271057; x=1774875857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        b=g8lPHLEXUJL5WVQMiU0/b3ytXmT1YRR6uDnlB+NDAJ35q5Rrt+BTPGA4Hc6JBTlnAy
         CpnUHqeRZhK37Nbhws7a4pvgI5jNPhx0+i+78JxMLlG5RhZGw+wFBpuZ/jc4jLLwD6eA
         qZTECVdIpA66euA6Lvzoq5zYLS0LrJzbBsNJ0DE5G4wfAtIEMjlmZ3CboTwx6LKZeygz
         C+ChoRa+EXfRM/QJZOhvoJNEr1lvL+LqYB8re4iQXLz2vXlZEu39Dbi5Bdns3CRr1dM4
         ytpEcEwKSc+H7lydJttGrx4NfEOeqm/xMRZ8erNL/sq0v5kuJGrG0P26WJLeXhzPnMns
         YCfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZRbfb+Vod3vlai/dcSAo+N4LpB3eulJuzMQS7Xj5eWOOyPPleNsLb8GoycSW9bekFoWi8QOZ7bcmq3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoO9p+gOZPW4ttffi/eSI33RmNd9f9rSbv0zGaXm25tIAOojBh
	6zQHC4Cg5J7pqM0BB0iuxRdFhIpDgo6gYvXyPKIlX9P8peigYOQTrqV+roCxPBYqHsSKoNHhLLK
	snD9/FurtJtqyW1LKVFipY+LYQqIuJyo=
X-Gm-Gg: ATEYQzwbkEFxtjLP6Dy9aonNYudYGQvXJzE0BNGpLbgu5cEJvDvfcRcvIjGxHZ1QoXE
	3ZI+jxe2ZSEPxrYnSrVk5aWnzAiFPTlkDN9uEe7sjK8JeqGEBxE1ivFkhpxm9Q5tuAfV9qLC5RZ
	2P2S5FiWWrCtRZwe5zcVVgr5W0UYEQtuTaZ5SzJfjpc117IPiL+vdmq/ppaAQux5THBhOlbFkxV
	+YhVSR3BSMD6cxy7fSHZ3a+FXVV26mbXwfDFyDwsi4eQT1BXxd52E5z+uYOeA5MhiLr2GDAbcA0
	06/IYts7TYKnYv5iW207rRaZItlqVwdW5rlBiJMG
X-Received: by 2002:a5d:64c6:0:b0:439:bd26:3c63 with SMTP id
 ffacd0b85a97d-43b64262da5mr18158075f8f.28.1774271056717; Mon, 23 Mar 2026
 06:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
 <87h5qpm67n.wl-tiwai@suse.de> <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
 <CAOKSTBv4GHxQGOhK2NR6QsJERsWSoh6RMp+yv-cV7QBsSgx9iw@mail.gmail.com>
 <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info> <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
In-Reply-To: <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 23 Mar 2026 10:03:39 -0300
X-Gm-Features: AQROBzAicXglsUZT_sZ7BewYrI5CzKQ1gLep8oltTQ16pivfxdE_DJOTqwVmnnk
Message-ID: <CAOKSTBt+nKabJXav3diFoYAP0yFjD=Ld5HDO7J=z43bb0CA3pA@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there...

Some good soul with more skill than myself - obviously - did some
bisec in the kernel 7, and discovered the culprit why some HDMI cards
do not produce any sound.
Here we go:
https://gitlab.freedesktop.org/drm/amd/-/issues/5052

So, this morning I applied this patch to the kernel 7rc5, and it works
without any issues.


Just want you, guys, to know about that.

Thanks


---


Gilberto Nunes Ferreira




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em qui., 12 de mar. de 2026 =C3=A0s 10:35, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> Hi Thorsten
>
> I think this is exactly the same issue.
>
> Thank you...
>
> ---
>
>
> Gilberto Nunes Ferreira
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
> Em qui., 12 de mar. de 2026 =C3=A0s 10:24, Thorsten Leemhuis
> <regressions@leemhuis.info> escreveu:
> >
> > On 3/10/26 13:32, Gilberto Ferreira wrote:
> > > I am sorry to reach you again, guys, but now I noticed that dmesg sho=
ws me this:
> > >
> > > amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
> > > connector HDMI-A-1: -22
> > >
> > > This never appears in the 6.19 kernel series.
> >
> > FWIW, there is another report about broken HDMI auto with amdgpu here:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/5052
> >
> > Might or might not be the same issue.
> >
> > In the end the problem remains the same afaics: you likely need to
> > bisect this (or hope that someone else that has the same problem does).
> >
> > Ciao, Thorsten
> >
> > > Em seg., 9 de mar. de 2026 =C3=A0s 11:25, Gilberto Ferreira
> > > <gilberto.nunes32@gmail.com> escreveu:
> > >>
> > >> Oh! I see. Sorry about that.
> > >>
> > >> ---
> > >>
> > >> Gilberto Nunes Ferreira
> > >>
> > >>
> > >>
> > >>
> > >>
> > >> Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.d=
e> escreveu:
> > >>>
> > >>> On Mon, 09 Mar 2026 15:14:47 +0100,
> > >>> Gilberto Ferreira wrote:
> > >>>>
> > >>>>>> At best, please try git bisect.
> > >>>> Sorry! I am complete without any acknowledgment on how to proceed =
in this.
> > >>>>
> > >>>>>> Or if it can't work for you, ask your distro people who can help=
.
> > >>>> I have tried 3 different distros! I don't think this is some distr=
o
> > >>>> related problem.
> > >>>
> > >>> No, no, I meant you can ask distro people to build a test kernel, e=
tc,
> > >>> instead of you.  And, it'd better to ask distros whether you are th=
e
> > >>> only one in the world who hits the problem.  If it can be reproduce=
d
> > >>> by others, they can help debugging or bisection, too.  Pinging
> > >>> repeatedly here on the list doesn't help much, as you can't build a=
nd
> > >>> test a patch, unfortunately.
> > >>>
> > >>>
> > >>> Takashi
> > >
> >
