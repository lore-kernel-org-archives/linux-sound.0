Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988989;
	b=Tz+zFozC6N/q2EOslGd1CbYPb/qdzFujeSdTZCqRuuWJXIvXrhf0DXe5p/Dcl2OOg5t4
	 paHjUzJsovcU2CLnMxGIsP409AsHz9A5HKwh8qbJlZzBg7TXsDnuh5DTvA/vJQMKUFuyb
	 d0e6jB0605B2CSZGo3Td9RKQp/OamIXFyjf0Ozvcp0aT/NKneEvK0esOP+6WBZTKbNwpM
	 lU1p1MgOFIxczdbxQTlHZCCtWvlIZQVI9SbHh1nUAPb3//SxGiOmaCzHGoqNTi3QCZM4p
	 /cMDaj/Mqa6b3PPpqIA2ay3wPGPQIGwvTg5V7M5WUg0su14njs5vmEvUO3pyMDe8R+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988989;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NjRvdCDmmCIcqtFKftlFJVOaFb6Yvo74ALWk42EEniA=;
	b=kgrpEXGvlxaDwJmPMg0zxhXxwVl27yrklITUYsAnpqDFJ7LgDxYIOwy3pk92BSJTCzNi
	 veaxgHLMm8+089u6wESFUzoNXUxFZvejBXQhbet5m3W1vCrmMEjhdLF9xxevsnKvCr5vC
	 uLw1FJQ+nb+VpzIk22VATUffiZO2xm+XaeRk87/cvTHT6/kVyUK4Y3oILJV/12N1JpnfD
	 IrvP8v36Cq3KBzjd2G7IXb73Sp/IhGa6hLnqK4jc8ihZa0swmho16VTD2iBSJb0v7C1xz
	 bvg+EnLaiEKH5Y3NpHPUFQRkAoGDrsWSpzezem2nzCc0Rtb67V4meSvMnQ8nymi0eQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JEoh+3qo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F02606A33B
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JEoh+3qo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901821F008A2;
	Fri,  6 Nov 2026 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988988;
	bh=NjRvdCDmmCIcqtFKftlFJVOaFb6Yvo74ALWk42EEniA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEoh+3qofrRYl6hY1iwy1hWWtlljwHE/1YzzPtFXsgLgMlN36Q/I5mmKvyL/MW7NS
	 5lwfmzjTyR4FA5u+nRPQNVrI86lc1Jz8xPkgNLEVUp0ZclE1IJqr3DAUSwlYb2tW9g
	 jCpmlEhg2hC9b+WN33t2UGvd6tnFdrq+BwJOGhTUin6IC4AbDlKJyjyL7QL1dBa9y3
	 PNfIdAffUObZp0lITb9b8SAuLS8/OENsHX3ptK5ZyuvRKdM9H2K/oOZV41FWORA7fO
	 w7DrAWc54EWL8F8+otNa43DuTouByhj4wmHUSj4ePaT2H7siieYKqt6nvi2yhXGLLI
	 yNpKowFvpgGwg==
Message-ID: <sashiko-outbox-202004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: control: Synchronize LED mode accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
References: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:16:28 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ALSA: control: missing Fixes trailer for led->mode data race fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] ALSA: control_led: data race in snd_ctl_led_reset() [1]
--

commit 2868f72034945ef393b8a3a1a9c6b9d772455395
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: control: Synchronize LED mode accesses
>
> mode_store() updates led->mode while holding
> snd_ctl_led_mutex.
>
> However, snd_ctl_led_set_state() and mode_show() read this
> field without holding the same mutex.
>
> This can cause a data race when userspace changes the mode
> while another path reads it.
>
> Read the mode under snd_ctl_led_mutex in
> snd_ctl_led_set_state() and use the local value after
> releasing the mutex.
>
> Also protect the mode read in mode_show() with the mutex.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Since this fixes the unlocked reads of led->mode introduced when sysfs
support was added, should this include a Fixes tag?

  Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigge=
r module")

> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 501387287ae69..044430b2f1a22 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c

[ ... ]

> @@ -382,6 +384,8 @@ static ssize_t mode_show(struct device *dev,
>  	struct snd_ctl_led *led =3D container_of(dev, struct snd_ctl_led, dev);
>  	const char *str =3D NULL;
> =20
> +	guard(mutex)(&snd_ctl_led_mutex);

[Severity: Medium]
This problem wasn't introduced by this patch, but can snd_ctl_led_reset()
and snd_ctl_led_set_id() race on vd->access [1]?

Concurrent sysfs writes to the reset and attach or detach attributes
modify vd->access under different locks: snd_ctl_led_reset() holds only
snd_ctl_led_mutex, whereas snd_ctl_led_set_id() holds only
card->controls_rwsem.

CPU0                                  CPU1
snd_ctl_led_reset()                   snd_ctl_led_set_id()
  scoped_guard(mutex,
               &snd_ctl_led_mutex)
                                        guard(rwsem_write)(
                                          &card->controls_rwsem)
                                        new_access =3D vd->access & ~mask;
    vd->access &=3D ~group_to_access();
                                        vd->access =3D new_access;
                                          <-- overwrites reset

The lost update leaves the control's LED access flags out of sync with the
LED group's control list.

[1] https://sashiko.dev/#/bug/linux-55c9a300-c6f3-4df1-9060-c4bb4df43d19

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106180812.5097=
-1-sreekuttan2156239@gmail.com?part=3D1
