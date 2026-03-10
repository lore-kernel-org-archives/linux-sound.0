Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD973D1714
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145992; cv=pass; b=nnpe1J5v7ZRu3B24+XmurBwhKKpZONyYW9TL/6nhVV8mP3TFc8zt2CXUQh23FtajaGhtoU7BL2w04YYBdOccviIuykr58gA0aKZAVV4zm6+fjJRg1I7sg1xAHEd5S0LX7zXu77QxagOOcJfojWgkH3m0hmzC95zXR3/LP19OOZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145992; c=relaxed/simple;
	bh=/Ny/2pHVbwmRnywUAf1UbJK+BJuhOIH8kATny7+LvPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTfi2tV+RKbzUY4TdoNgvNrlQdqRlEhNxcQOkeS+7UPuSaO3xFn702Ibc5GeWjFyYV4uDnxu23/EETu8KZv+n2Re15PSthnexfdMpzlMrB2h5VdKu1gDJzlm032ssrf3gTm+KauliCyghRYX9do1OjNortNJ155behfbQj21et0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeWxBgMB; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeWxBgMB"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso15578218c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 05:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773145990; cv=none;
        d=google.com; s=arc-20240605;
        b=e3TbQ8hiyQh1uH+1AA+3CneB6oYC7d4h2zwHdOszHCpmbE12uWJs31iQtt/Evamn1j
         CZIE00iGlTuM7iYweo0P1BgL1NhfjBPfvmZeJrl7H7porfi8O+67UndhICwYx+V8HAY8
         8W8TlWp7R1w5gN8hshW0xZtr2Y8L7HYdPv6tIROyZhlnbpLTtEF/3RS4WYA3ARPrIMsr
         Ca7U+VWbWIWO78bSVp98r6mtyDfUVyAwBvvkGJrCnHdhSsBcdx5Up6n2C03znAtPariG
         KjZyr+L6uUYd+9eShJuBZM0wPPuzozhy2fT3NBcQDdjOg0TJYHCD2BplI1CaP9Q4LvJs
         hGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNez6xRKrqWpV8nNjqKRy0PyfKwy8IyC9WwZhJ1ilto=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=MNzhGndWFUT2gTLB5CUjfd+RLt/662dxQMWqIDXVP4CRDgHbaH05S4mhr7oTCr7xIh
         AweNFLDcIo2QzGcYBcriE0to48mdcycSXOLGuGMYDjBUre2IlU1SvSz08MESWCuA/tYS
         /xETXgY0UX28qByk8RaeH8HjeR4GIYfV2CLuxdNkxjUki/ZAGc0ipBj+pGVbtrDmm/ko
         baIPwYmgjisEQPCme68eTp6XzFNTtzB1yY1XjlJBN4A61o7+lmKPHuRKdC1d1ws1bWf9
         FPP0vbL/v49X9RtQFYXG7RicpSFlsVWAXjxLpDEEf81e7Uu3YJ155GE2l2ySvS0+b/60
         XAHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145990; x=1773750790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNez6xRKrqWpV8nNjqKRy0PyfKwy8IyC9WwZhJ1ilto=;
        b=GeWxBgMBu46K4zT9gXPyZGBHI93qQQGQDadzmn1FvGncBc9YlmzQ+XIPO2copiuVF4
         CLBRAs61HEaXEHoxn1PvPy7EtS8t055lTiOjV8WiVh4YYMruHbqjPOghhwyA1LnHaOfm
         eplwe6ENt1ZvciSJWliSM9CK0DF9YBYGmJ137EzFv0z4ppF2cHRGEEYE6qDfR4wjk3FO
         MPx2rr1iPJlw2IbFwbQawqDUDV2IrFFVYo4+T1UIf4DEPyPE0GMJoWOrLy3tZtycznpu
         e5HX5MxtYhIWDmyrs1ru/ByF+WYBts0d1rZj2O1qnI7xLB0CDuUjO2wAVHELdOTwd0IR
         NVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145990; x=1773750790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNez6xRKrqWpV8nNjqKRy0PyfKwy8IyC9WwZhJ1ilto=;
        b=OEj6wfhRLsVudqtXoGyWiYdyuoSDtQ+8/nij+TSqpGc4KyTxyzo+a/vhU1qb7YZ7HU
         73Guis4WqtKxnbnu5Dwtd5J2pqBAWUAksjxV5znWGn9BDJwkoMVFp3gV+R829KbUP+J8
         yvw7KD2yY0fyXHOjIP8eyatxfKAneTTXvjXKjNzxaUDxaWcc/GbO0cOt0lElSAtTtBI8
         YcEdo0cUGaneX3GvNaJv2VG9dsFpAH++HZeu9pbze7PYlc7dXpZao/ewX8Gy1F/HEKUW
         rl7d8zlUIabDfhi54hvnwKDeViDP72Y2InxlEE3HG9xMxB/qXjDeCclK7owxOveI9G89
         OlIA==
X-Gm-Message-State: AOJu0Yy50MJmHuYKjGxvJF/KzxL4E+dMEC2znzgCEzCT5UJTmBgh5bOz
	wdf6lCKZHz7bEKjncYSlvpVCbCSKe3yXgYtN39iEV65DIdBWjCHttLmTAxY0cq1yh2u7dxOgieC
	Rn0HtNDdDsMWNDHjKoSsj8NTPAoUoIxl8vsIMDjaREAMi
X-Gm-Gg: ATEYQzwFy16NJBlIprZRD49emt0SnLv5zf+87EnCWBWCU+ujbO0fsoPZ8uWCprS313b
	Mw+Yu9sQ867FVCOIwYZF/i2UQm++d8fuKOhFULuMc5MA3CMNyxaDjA1j6kt4veM1+d8UwSoqZgq
	7IEdFAT+KpuY+Tq2tViw7WMtWxLK75XOYQI8e2qwxi5tCfcWv8zdAxc3Bg0MekrY7GVUhOPoC6O
	ChoPE66QZoHVQcQzrZVT6AOvw2ryXfcg7vRwf+YtBpL55ML83lNTZcJtODr/rqKRZnKERl9f+lM
	r6iltLxGIHwzS7YVwuef9Z3kxFCXr6mhUlbt+71F
X-Received: by 2002:a05:7022:2385:b0:128:ceac:6db1 with SMTP id
 a92af1059eb24-128ceac6f7dmr4578052c88.28.1773145990352; Tue, 10 Mar 2026
 05:33:10 -0700 (PDT)
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
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
 <87h5qpm67n.wl-tiwai@suse.de> <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
In-Reply-To: <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Tue, 10 Mar 2026 09:32:30 -0300
X-Gm-Features: AaiRm52nr-zURG9dQggPKGwRrZj21ye39ZaKBlmzw6h3oQu3JwznsVMswQnlQ-U
Message-ID: <CAOKSTBv4GHxQGOhK2NR6QsJERsWSoh6RMp+yv-cV7QBsSgx9iw@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am sorry to reach you again, guys, but now I noticed that dmesg shows me =
this:

amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
connector HDMI-A-1: -22

This never appears in the 6.19 kernel series.
---


Gilberto Nunes Ferreira




Em seg., 9 de mar. de 2026 =C3=A0s 11:25, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> Oh! I see. Sorry about that.
>
> ---
>
> Gilberto Nunes Ferreira
>
>
>
>
>
> Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.de> es=
creveu:
> >
> > On Mon, 09 Mar 2026 15:14:47 +0100,
> > Gilberto Ferreira wrote:
> > >
> > > >> At best, please try git bisect.
> > > Sorry! I am complete without any acknowledgment on how to proceed in =
this.
> > >
> > > >> Or if it can't work for you, ask your distro people who can help.
> > > I have tried 3 different distros! I don't think this is some distro
> > > related problem.
> >
> > No, no, I meant you can ask distro people to build a test kernel, etc,
> > instead of you.  And, it'd better to ask distros whether you are the
> > only one in the world who hits the problem.  If it can be reproduced
> > by others, they can help debugging or bisection, too.  Pinging
> > repeatedly here on the list doesn't help much, as you can't build and
> > test a patch, unfortunately.
> >
> >
> > Takashi
