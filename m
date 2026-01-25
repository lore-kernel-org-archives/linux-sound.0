Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6B313E2C
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769337375; cv=pass; b=jLDZFNodWzC35Xkt8DREWiWlI3gkDEn9V367BqMnD8qS3EDJn9WiqQ3M1oMFK4ugwJRj4ZGsCbTLI/UR/mVVPtcpHgoR1Xu3l9dslloh+c14HJ5KaxJ7Ez6ADspP2WIWaxogvgwXgKT482rOBeuOUp7+zd5V9lK1l7PI5fsbPXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769337375; c=relaxed/simple;
	bh=6S7oUeykDAeqoXg6ZqFzCAIani+BK3MGS36fQXwry5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEM0AZjfZat3UngVheiy5fsPtQlAul6kVV1CtDDyMi4I5Q+BTF8sYodgoqI81nhnqAFjdn4Y3zGjcRRyihMkrsoPPYgolT5dxrQUfWLqXPvev/YWfUvSyCeGaYdy5eCOKQS/Ezib0FAfKKAZuLxs8xRTQEfFRIFii/n2L2HGY08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxeTt6ih; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxeTt6ih"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so6815823a12.3
        for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 02:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769337372; cv=none;
        d=google.com; s=arc-20240605;
        b=PlrRx/yK/zwdwFZ74yoPOa0qG27rcf0gMFObwbSMhYW+J40auicXU8WqUVZj65iai1
         AL5PCVn2/3nJtC9jBYczXAlCZr+m6WRIOklIOlk0gpwZbf08rDmmn7oTlUJq5xQ9YFij
         7vXCqo7j+wm1c5UjVWVDZcaMGCaFAyoo3am+aFZoJcKBIFavJQL+VH7BRwlPBWfCaV+R
         Gxmob3qFI2fqCArKZgmqSYDg6ge3Bk7snHLFJImzyikhMBqYYGjogUGYhqMwNTXq3Btp
         knQDNQ9GtHlOr7FBs3p2ohLPfgoeZ7leb7EwuBs4I7/exDc2vJansih+uemcGDiDGBo/
         ZK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cp+lfqQmlyVUPtGZ0KOyiQV1hb8j/ieCy3TjkM8EWN4=;
        fh=xZlJ0F8kjZemUAjzOXliqv0R6YRJhIoLCh8sbglPT5w=;
        b=Uzr50j7YRtShn4TAwzFR3FKTuv4uwOGFz8Rl+qlKeANDrMXvGBtzRKjtPydYcnmkYp
         j+gMVmqA81eucw2JJWbjYGYFkwqyKBieBqgVUhTYa6sV1tnPtzHMYB+j0VLYLK9GITPi
         GDC1h1v19UQe2Z19QB2QNuu67nFVUyHJ5BF1PIKUw1fNKcqTTbWWSONkvcsPUMy93H6B
         9RWEe5/iQXDNJfVdao+i+wdNrZbEBu655evGrAmIIttcQY96j3cKGYxNjNHJQdHvXC4h
         DH9uQoAtZw/NI3bsHQbXFPGTS2Xnbc7+XaVb1xIEec547oNS15F4KYV5DklMBQkU+gZ0
         2HrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769337372; x=1769942172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp+lfqQmlyVUPtGZ0KOyiQV1hb8j/ieCy3TjkM8EWN4=;
        b=gxeTt6ihDgAXo16keP62cdhBmcWVsGzKKvk5pcZZZtakCu0BAB6HukjWfqlhtSadlb
         tE0Xtw8Wh7WYkFCL7qOR6qUbqqFkHXeeSi8liUgFzfx40crRcna+T0WQDMNWZXr6SQxC
         5OV07nzTBE9ehc7c7hrDrluR/uWGrbzaXOkSjdGS9m9pTwko4wuzxgX833znUg3ETpXy
         tRrNPsch1GlwYvrqJ6zeLBUtu0MFG8pprjPLS3S/mF+q4lNPbJ/puSYfv3p6lgrajOan
         voWkhcLYQEUjjYkJ/LLjlQG9PLLRREOZHPlHnYqhKRk69j5vDlP2BBfLu5vw8HNwmyTm
         eYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769337372; x=1769942172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp+lfqQmlyVUPtGZ0KOyiQV1hb8j/ieCy3TjkM8EWN4=;
        b=qE2rZjE2pCZVKjmyIQZYemO5wPy1ERWGHXU2bkkeo2vRTCHDCE8niDNY2kuNXm+QZr
         xIyTaj3ZSyfsXlpoF1HohnO+3xYYTcP61BedztlC5/I/BmCPJcBNEoN8SbsYqXpUaR14
         Np6MAu5wohs9J8KazbMjs5jh7biUQhDXuFqLB1qyUESV2doNyoSAGG+WnM/rbgmkYuwn
         xhARBbKT0C0QWXN0Z1PPtvHATPvacAVYZmOssR/GCbVe9nYLv7laIfGtXtM1NYDQh6hO
         q2Z1VAbPUzL02SgV0FeZAi25xmKOpwZSS+swpu41790/GgavmLxUFRl5bcTU2Cj9hvfw
         z8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL2U8RsV1iiFMQJWQSc2ykq87dC/wf01rnAnDag85Zl94ZUdhT81pSVXc2Jeuw9B8X6p8q3zK3VXMMtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXI/dhGbTR3zhCVHYMt1EVZ9lk1y3WrOFfKp+CRzPAIKAJvAY
	5JUao7iaZOF/znL6T8gZYPi0z9e/Dsvvj7ksxqjCiJowVV0G5uLfCc/KbdMacSMtw6Tft+z+78G
	XP3iZAbDaDoo+LO2JrpK+erNQmJn+JfVtDelzfHM=
X-Gm-Gg: AZuq6aLHbGscl6DTsi8CV55NtQKUi43LqVU7aEcCPJzR07BDgDTcrBvVHYYYzTUQZhV
	eLlimRa8raHLHqG1qWovL/LU1YD94yOZos4DnlBCrSxbMmnUaZhtYvMUToMnSaFNDOv62UnYfC3
	iJ/rXJGBZ4YLsMZk78bspqRQaBzlc6ANO7mP8bSZG27esq+2RoFGQHNNAbZXZ//40KPw+FlEPme
	GRFbKb6vreSu5B4fr8rChL6FqcTOz9rYCY2c1Fqbu3n+k1/3OKQoKq4CrWG8iZYe49GPBjwCQ==
X-Received: by 2002:a17:907:968d:b0:b87:1eaf:377c with SMTP id
 a640c23a62f3a-b8d20e48303mr86092666b.38.1769337371858; Sun, 25 Jan 2026
 02:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAF7epbtx7YDwa2NBDZY+9NuxCEirY90jNonY58KgWfx8pq6QyQ@mail.gmail.com>
 <aXTyJ10uiFoKJ5Tr@m.b4.vu> <87a4y2cc90.wl-tiwai@suse.de> <CAF7epbs1+q9YVtW9TorTTNj-hWc4EDrrHss09q1Y5jhP4ifqZA@mail.gmail.com>
 <877bt6cb7a.wl-tiwai@suse.de>
In-Reply-To: <877bt6cb7a.wl-tiwai@suse.de>
From: Ruslan Garynin <ufurifkf@gmail.com>
Date: Sun, 25 Jan 2026 15:36:00 +0500
X-Gm-Features: AZwV_QiR-pVinmZDlmmYkcTvtUyJJpufZUdGET_VCAVqYHr_pIX2mYUYPlFGkNA
Message-ID: <CAF7epbsxDd71KUe2gNyjsB3pbGONaXYz0Lp4dMxBzbX9jef+kg@mail.gmail.com>
Subject: Re: Scarlett 16i16 4th Gen: I/O error on kernel 6.19-rc6 (works on 6.18)
To: Takashi Iwai <tiwai@suse.de>
Cc: "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I can confirm the fix works!

I applied commit 70b4db7d258118a7464f039112a74ddb49a95b06
("ALSA: usb-audio: Use the right limit for PCM OOB check")
on top of 6.19-rc6 and rebuilt the kernel.

Test result:
- Before patch: "Write error: -5, Input/output error" on first channel
- After patch: All 18 channels play successfully

Thank you for the quick fix!

Tested-by: Ruslan Garynin <ufurifkf@gmail.com>

Regards,
Ruslan Garynin

Regards,
Ruslan.


On Sun, Jan 25, 2026 at 2:07=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 25 Jan 2026 09:59:00 +0100,
> Ruslan Garynin wrote:
> >
> >
> > Hi Takashi,
> >
> > I checked my pacman logs and found that:
> >
> > - Working version: 6.19-rc3
> > - Broken version: 6.19-rc6
> >
> > The upgrade from rc3 to rc6 happened on 2026-01-23.
> >
> > I will try to rebuild and test rc4 and rc5 to narrow down
> > exactly which version introduced the regression.
> >
> > Will report back with the results.
>
> If it worked, it might be the recent fix that landed in rc6, and this
> was corrected in Linus tree for the upcoming rc7 via commit
> 70b4db7d258118a7464f039112a74ddb49a95b06
>     ALSA: usb-audio: Use the right limit for PCM OOB check
>
> So please check the Linus tree or cherry-pick the commit above.
>
>
> thanks,
>
> Takashi
>
> >
> > Regards,
> > Ruslan Garynin
> >
> > On Sun, Jan 25, 2026 at 1:44=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wr=
ote:
> >
> >     On Sat, 24 Jan 2026 17:24:07 +0100,
> >     Geoffrey D. Bennett wrote:
> >     >
> >     > Hi Ruslan,
> >     >
> >     > Audio playback for Focusrite USB interfaces is handled by the gen=
eric
> >     > USB audio driver (snd-usb-audio); the FCP driver I maintain only
> >     > handles the control protocol (mixer, routing, etc.) over a separa=
te
> >     > USB endpoint =E2=80=94 it's not involved in the actual audio data=
 transfer.
> >     >
> >     > I've CC'd the ALSA maintainers and linux-sound list to continue t=
he
> >     > discussion there.
> >     >
> >     > Regards,
> >     > Geoffrey.
> >     >
> >     > On Sat, Jan 24, 2026 at 08:56:38PM +0500, Ruslan Garynin wrote:
> >     > >    Hi Geoffrey,
> >     > >
> >     > >    I found a regression affecting Scarlett 16i16 4th Gen playba=
ck on
> >     kernel
> >     > >    6.19-rc6.
> >     > >
> >     > >    Summary:
> >     > >    - Working: 6.18.6-zen1-1-zen
> >     > >    - Broken: 6.19.0-rc6-1-mainline
> >     > >    - Issue: I/O error on USB audio playback
> >     > >    - HDA/HDMI audio works fine on 6.19-rc6, so it's USB audio s=
pecific
> >     > >
> >     > >    Test:
> >     > >      systemctl --user stop pipewire pipewire-pulse wireplumber
> >     > >      speaker-test -D hw:3 -c 18 -t sine -F S32_LE
> >     > >
> >     > >    On 6.18 (works):
> >     > >      0 - Front Left
> >     > >      1 - Front Right
> >     > >      ...
> >     > >      15 - Channel 16
> >     > >      (sound plays)
> >     > >
> >     > >    On 6.19-rc6 (fails):
> >     > >      0 - Front Left
> >     > >      Write error: -5,Input/output error
> >     > >
> >     > >    Device info:
> >     > >      USB ID: 1235:821b
> >     > >      FCP driver loads OK: "Focusrite Control Protocol Driver re=
ady"
> >     > >      Implicit Feedback Mode: Yes
> >     > >      No errors in dmesg
> >     > >
> >     > >    /proc/asound/card3/stream0:
> >     > >      Format: S32_LE
> >     > >      Channels: 18
> >     > >      Endpoint: 0x01 (1 OUT) (ASYNC)
> >     > >      Rates: 44100, 48000
> >     > >      Sync Endpoint: 0x81 (1 IN)
> >     > >      Implicit Feedback Mode: Yes
> >     > >
> >     > >    Note: This might get fixed on its own when mainline is updat=
ed
> >     further
> >     > >    before
> >     > >    the stable 6.19 release. I'm just reporting this in case it
> >     doesn't, so
> >     > >    you're
> >     > >    aware of a potential issue that could affect users when 6.19
> >     changes
> >     > >    eventually
> >     > >    land in stable kernels.
> >     > >
> >     > >    Let me know if you need any additional info or testing.
> >     > >
> >     > >    Thanks for maintaining the Scarlett driver!
> >     > >
> >     > >    Best regards,
> >     > >    Ruslan Garynin
> >
> >     Could you check whether the earlier 6.19-rc shows the same problem?
> >     Also check the very latest Linus tree, too.
> >
> >     Takashi
> >
