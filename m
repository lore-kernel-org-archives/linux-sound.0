Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959399;
	b=oOGBG6voyyGdBnyTujVBWZabU5XBgyGWLLwt/x+8XTn214wR+HfBsSHBBELuK3cXBxWl
	 EjuU05K5ZjW8rqJb3EFXdJirhIUnGD59v9K/YnHr816BugmpTF4SKFExn1SRDaQDCAxyd
	 M+ewnUUkWk1R5ly9SmJ8g/25uyLji0W7voLJr9AdQdtnNMCfyI7+Blp616LTpCx2n81mm
	 Vka6Cu4arwaDOFrNgMoFu3lRct1TuiKk9WkA1zVqUO3qWv3EMAhMN8wOMATyng6acW7Jy
	 4WPdTh7I9EEKMXDsCEsTKqw/d6HjJye55SZOjwRyv9kRzDPjkBW4IwgWizFuNRXavpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
	b=r6t7c8Vdjc5uTkOh89BIykws49tCvAthtCsbnWMah2CelpHlTsgOscrEm75Cd3dvaW/n
	 mUxPNTOQqHs91UnG/4x5/FbTK6i0WrscThYOqXLgDTsjg4yAp3ws+3yojoDyDxcoEogUt
	 5gyPxG8gmlDoz1FDAf48D2QOhA9opSt8QG40OmJgLAU7jI55aLi4KaZQRh6bP+lO78Q+q
	 Bzu3+gsKHAeYsY3QGSE4KTvKfWnzSJKykLtXPQBdv0Jyrd9xK431AZjmpxjUmq0ACCZVC
	 G5wwiE67aD/59jo1W3F5yVak+wRok1v9OcFPNfrOq9SPaYEerQu3S4G3dEzd5nUpxOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Rc3wq2T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D22606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 10:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Rc3wq2T
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so135314137.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 02:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793959397; cv=none;
        d=google.com; s=arc-20260327;
        b=ouwomC1xiDJzQzLPcZ3DjkTLW+CFINhZrbNFBGt++SKbfWhOGq+37cc5cg6I5RdOZr
         Y9jOiGKGpRvT6pxdiV7crSI5/chYYLEfJ8ccHg3R6+dLX7/peW0OH1awfZlZ41abn/Zi
         jK22gycEUuu2KwAdNQz57NvqlsizvPRRGHRQlzqLaEsbz273Ghj6SDflnB/CrEN9+zNc
         auR9XBtEKAzy+M9ZshsC1/IPvF8GCPuXcLw4+ePNsM7aJoNIx6OL2uVz7YffsgzaoEPp
         BWd7bEIYa3qAiNEknZQh8Crlriycr/pzO4ypFN7MruF/J+xEwk76yCXSs2WY2l0cvuKC
         LEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        fh=5bX3K85h70xS0ELUdHuMTFDNxrUO9mSimwexeSH+jRU=;
        b=GhZdQbn5fFGqfZdLZHf8ftV0v2UUlEPbSF0NB4oWbRbwjMUVQm7niieYlYLTtjDqO6
         hX6KAOoLJv7LKflwA8URNsGAsp8dpWAlJY64V65zUrAdvBjbaVErWjJ9m1PqtQZGpudj
         eLOLoRePnFHdfYcqTLeerG3It708Dd0FL/XU7pNI9cJR0DC84ZW/dMKFq6OaXm+8+I8N
         8va0TUi685P1PKsfvcMZFXVAvdvi9h4oFo1F6jsiXBMP11jFilnI+PwBWVhBrq8PLKLR
         6ELbbbyfYMwaCK0ftEKvruSaCQyPyy5bW94nqMXK6oRzYA+LAWM4MlircIHbvUYvb2Kf
         LMog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959397; x=1794564197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        b=0Rc3wq2ThXqhQz1gEtX+MWMdV62zG8Hqak6TsxJjEgiW2BQ4v1ZDbLbqlnZ5NqLnpP
         pY05lyQ5G6zEnwQSLRDodzi3af+rH/7nM6PyiLM1X34yT6X+6mCiQ/EhYhpgrYcnFMX4
         +IYF6pruJxGW9Ox23+znE/Crdfta7TEhff/IckYpMR0p148dimwRziw6Do4FORYYai5Y
         zDqCtrvq/FsUjT/UnOWJk8Or7u2KdvNRAMhRfxEAVIEw+SDgOHsQDrkbuBS+3W9vGjHD
         7EjELDOH406ZH1rUR5blirpOo81JpdA5eX68g18DfrCvdb/MGWZDO9oBCDV86rkHWGDL
         CEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959397; x=1794564197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        b=cPDRqD1kg7fRQWkBC4EoX9GfORJNljJqa9GbdZFEj3jcA6PlychBfX6gsCqEIP2T2V
         JnkWg/C8522MWepal4XlgnPrap5PjWE/yCvP+lXxG0VY1+k24XJ+d3g6USj9YSVR0rEO
         lG5op6rKFSYSaS+44J0Xr5lWrRv2DtfFPP9otcefb4VAnQpe14PdsqNxg1+HBAWitCta
         Nx2JjpA8IKrTc0R/cRNusQXlRO2hgm5kv6CihfLtVHMLIPJrzI9ww6zBzTFH/r00/KNV
         JIKhFPzvDehZa0ztEknqVrqpqoD0XGmoyraIrzqDG65Z9jJysmOObxJGypk986NrsXSm
         KJBg==
X-Forwarded-Encrypted: i=1; AKwUvBxR5rxSovhneFlbAd2c7NIHwS7hEtC4RamqEn47TWquJfIPDLKtKyCqJquAcDQJpSPuk8kqbBCFnSIbWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dQu0vUq6DSE8X0SUJgHTK9+GuVwT1v19Jyeug/nkEwcjUfqhW
	LlmHfdapRuRNi2tn1qNW2GK6WROL+0BBE/Nw1PRHK2CGohKCZCGi2g/HrZfH/Sq5YNMOYdb7+yS
	QhDgT0N2eJull0OzSpBHsArKTO3uvcFQ=
X-Gm-Gg: AYBFou29dUjBT9gqjyS6km4cVrV0Htyn+nA5lQUPzhdSNLM9scOt6P/JhowHk0nuDSD
	B3VnAdT40EJb7akmFZacGyDp7/Kl+9hXfF+yRvBPN7YEXiEwsd/tNFfm3PHBkkefrHMtbtuRGL9
	q/+czlJ4nB50K61I1ILYCcHcrg8dMzCzMO+Fd6oRHWTZMOlKK4SGHIFhvUmde7usTCEIOtAkHDJ
	6+GRW7NtIgTS6qL2PqrYsNmxupFhX9UxwGiCMUlLQNZnuyjohlFhYBwhZOcPWWyOQDXWjklqWHx
	3sGkwxir7ZEMGDRi4DWAKYZfIKx75DzvwtVuecF8SNiSlZZAmat38iFoU8asVjqmjkTcCKNVjoh
	nDfFgiLQk8dRoz0hjlhvTrv9vGGy+b64NeNBbA0IXcYnSBuUwAqKtXMfF1XpJedm2x+2X1BNAOW
	kS5TPjQG77hqTc
X-Received: by 2002:a05:6102:160c:b0:7cc:118e:7bfe with SMTP id
 ada2fe7eead31-7d2a15b09a8mr1034594137.19.1793959397444; Fri, 06 Nov 2026
 02:03:17 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
 <79bc006d-1c60-419b-a6f1-c4c4ce329168@leemhuis.info>
In-Reply-To: <79bc006d-1c60-419b-a6f1-c4c4ce329168@leemhuis.info>
From: Krzysztof Wasiucionek <kwasiek@gmail.com>
Date: Fri, 6 Nov 2026 11:03:04 +0100
X-Gm-Features: AclHuK9N5f5DzNykhnDvMUju9NTrbwfTrY_AKgKY7637i8vSoWcML1HoZeYqmYw
Message-ID: <CAMODhBLCdFXpkC1RCJdu5HBbW8TOFy4W7E1P0o5x8kwpPq_YMA@mail.gmail.com>
Subject: Re: [REGRESSION] rt721-sdca: PCM open fails with -ENODATA on 7.3 (AMD
 ACP SoundWire, ASUS ProArt PX13)
To: regressions@leemhuis.info, oder_chiou@realtek.com, 
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/5/26 16:52, Thorsten Leemhuis wrote:
> Not my area of expertise, but is this maybe the same problem that is
> discussed here:
> https://www.google.com/url?q=3Dhttps://lore.kernel.org/all/8a12a2d9-1b56-=
4e00-8ccc-cf31325f8366@crazyrussian.pro/&source=3Dgmail&ust=3D1794045716621=
000&sa=3DE
> [...]
> A fix for that is here:
> https://www.google.com/url?q=3Dhttps://lore.kernel.org/all/20261027-rt721=
fix-v1-1-42cd4b1711d2@realtek.com/&source=3Dgmail&ust=3D1794045716621000&sa=
=3DE

Thanks Thorsten, yes, that is the same problem.

The patch does not apply as-is to v7.3.1 (context differs in
rt721-sdca-sdw.c/.h), so I applied the same six line removals by hand
on top of v7.3.1 (PDE23 REQ_POWER_STATE default, MBQ defaults
0x2000046/0x6100006, 0x2000046 in the MBQ readable/volatile lists) and
built rt721-sdca as an out-of-tree module for a 7.3.1 kernel.

Result on the ASUS ProArt PX13 HN7306EAC:
- no more "ASoC error (-61) at snd_soc_pcm_component_pm_runtime_get()"
from rt721 after boot (count 0, previously on every PCM open)
- PipeWire/UCM HiFi profile is available and active again
- internal speakers work in normal desktop use

Tested-by: Krzysztof Wasiucionek <kwasiek@gmail.com>

It would be great to have this in 7.3.y stable as well, since the
Fixes: commit is in 7.3.

Thanks,
Krzysztof


czw., 5 lis 2026 o 16:52 Thorsten Leemhuis <regressions@leemhuis.info>
napisa=C5=82(a):
>
> On 11/5/26 16:17, Krzysztof Wasiucionek wrote:
> >
> > after updating from 7.2 to the 7.3 series, the rt721-sdca jack codec on
> > my laptop can no longer be opened at all. Speakers (TAS2783 on the same
> > link) keep working at the ALSA level, but userspace loses the UCM HiFi
> > profile because of the rt721 failure.
>
> Not my area of expertise, but is this maybe the same problem that is
> discussed here:
> https://lore.kernel.org/all/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrus=
sian.pro/
> See also the other two msgs linked near the bottom.
>
> A fix for that is here:
> https://lore.kernel.org/all/20261027-rt721fix-v1-1-42cd4b1711d2@realtek.c=
om/
>
> Ciao, Thorsten
> > Hardware
> > --------
> > Machine : ASUS ProArt PX13 HN7306EAC (Ryzen AI Max, "Strix Halo")
> > Card : 1 [amdsoundwire]: amd-soundwire
> > ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
> > Link 1 : rt721-sdca (sdw:0:1:025d:0721:01)
> > 2x TAS2783 (sdw:0:1:0102:0000:01:8 / :01:b)
> >
> > Kernels (CachyOS builds)
> > ------------------------
> > Good: 7.2.7 - UCM HiFi profile available, jack and speakers work,
> > no rt721 errors
> > Bad : 7.3.1 - see below (7.3.0 was installed in between, not tested
> > separately)
> >
> > Symptoms on 7.3.1
> > -----------------
> > From boot, every open of the rt721 PCMs (hw:1,0 SimpleJack playback,
> > hw:1,1 SimpleJack capture) fails:
> >
> > rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
> > snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
> > SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open()
> > on SDW1-PIN0-PLAYBACK-SimpleJack
> >
> > $ speaker-test -D hw:1,0 -c 2 -r 48000 -F S16_LE -t wav -l 1
> > Playback open error: -61,No data available
> >
> > The peripheral is enumerated and attached:
> >
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/status Attached
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/device_number 3
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status su=
spended
> >
> > Writing "on" to power/control does not help; open still returns -61.
> >
> > TAS2783 playback on hw:1,2 works on 7.3.1 (speaker-test plays both
> > channels).
> >
> > Userspace impact: PipeWire 1.6.10 / ACP rejects the whole UCM HiFi verb
> > ("Profile 'HiFi' mapping 'HiFi: Headphones: sink': output PCM open
> > failed"), leaving only the pro-audio profile, so the internal speakers
> > are not usable in a normal desktop setup. Same userspace on 7.2.7
> > gives a working HiFi profile.
> >
> > I can test patches or provide full dmesg / additional debug output.
> >
> > #regzbot introduced: v7.2..v7.3
> >
> > Thanks,
> > Krzysztof Wasiucionek
>
