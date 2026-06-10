Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0EB3F824A
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098075; cv=none; b=GBch4JuyLom6ehaIYxtbsHe9eyJ3t6krwT0sosGHh3VZ2k7Pm9O+vPAsT0wfYViVVnLRNdPl73ZuDuiHNeIa7JNTa2K0p8AgNVhtd9kWmCC36fHJ0NDRNqMDgF/gYmvuouqyw8uRVb8AeMUdb4qHXzrGWmEBrJlDS4sfopIYT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098075; c=relaxed/simple;
	bh=w6qUDwgiUTdJg+8WZOlXabbkRvKEFVx+rr1JfxifkpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LpoQtkygomGNsluAj+bLV1coTDYvHc+1Q93HHmWR2yR4ZU9sQkq0FHXEc62qQcN8fhjdzTRnGYPvAHu4uWqq7caFhsphSP92rSHZ/OxIIKNXMj6hK9xB8MoDgNtPI3FzwO6qb0l5YnsvjOmsUHEnWU4af/nfuir7Y4wzKYehS7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iEAKdSFJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iEAKdSFJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef1198766so3916952f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781098071; x=1781702871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=iEAKdSFJsRsZz7vL4JtJjfRoHrB1TOyV9xZzkrg6qaxgm+5Zof8Uz+Hnu34XSA3Oi/
         P/+zubztU1UeilSU4/L/zuyp69pJ1xodFLGDxY0bXCfgfXjmLrWGtYtPuc6hfXHXBVwi
         82uA5pKtXa++iSX4X7wIcNnU+kXGMgXhfGtae0IcW23zWhWlZ/ey5HCV4UtSGyq+e9S2
         lVptJpjdUpCV4NmcMopbhDsYVu1omSp3pqLOcTyZjbsdCn5YU/pEDaFPI3sKSjS2+sbh
         HMmsgWU2jsqAkG3agH/0P+Jm8X89KGqxVvly4nZ/g4PbCEFwzFDjI6wYxKYstAeVK2s9
         U5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098071; x=1781702871;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=Z3vrtNiq3oxd0+htIkDWpNuEUIGBGYL4tsTDB57+8NyHe/Z76YcLyaku6uBHuPUf9c
         nOpGQ2eBUe52i4xj17Mpqc9LteyQ0xf6phoTntOI/mLLRSwoXZgqhFYizOZwBFh+O79v
         cdvxqlWbg5KwulEl2oRysMhL5Njo4zo0VwmvO5SV9DripQRRcLaJcwYB6vDZ17nwC+br
         xbegZ+erRvUIv2z7bNGMlmtj+WnM1ir1xE6G5bTNSiitWhuCI48u7nnqNuTmAkAXv+g2
         /dsZyg5XC+oNqCr0z8nmXcYQdxZrGUpV1Mmv5+2lNhfgDvPmNWT7S7P+JjnfypFb3YoX
         /SyA==
X-Forwarded-Encrypted: i=1; AFNElJ91T6CssUbmbNHhbxdrvA0bhE8be5PACdPJP9RtJWK6NpNH3XoKEtQICEEHP1JaNfH32qxX+trn+J4g0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrn3LPokZAm1s3EU4z+GTuguvkPRq486r9uakZG/Tr3uk+Bbl0
	VtW1HI0KpXphxBGEpwD9eT8ts/dx7CAlovIdghKrPh8NtjJLDnH1MxPAbHmeIEGmLnI=
X-Gm-Gg: Acq92OEV7VLhVMsR3aTkCDWrT5R0eOQTTZdS/C97apJxkuwAensZqBYSEfTU3jI2BHn
	IKo9jPuGuLPoiu2NUGBKbPdtv3pjI4NhOy2JrAhNmfeZuYKryjsSsm8YvbaqZ0utskHjxkm0PDW
	OxPlqfWCp5isobtIcjH9p+UhGwGCHNBO+JoOZ5KOaF0F69eMd7TJb1gzb3fGePZuJ0ilN1il2e9
	QjA3emYILw8kxyqFwYvuGu7a9QKq4llwlOJryiLshWd4Ts61eV7eFECl8GgFh2jvorveS4lL9wZ
	hoN9ny7AyPFlQCYydXJI6nfFOpKyC7yCqIc2P8ulsl3ZMoyDVynZBIXbGbxEZfVWnNqPmq1lcRh
	M8FCgEe5Rja52GFcPIxDsuLCV7V1V8k2rz57RQV2pVqJNjuQZOOF2Mw/jZ81WXfQUD/s+uTfUmR
	JwrTCMEPrE2xkt7sIOb3DQK9rv7WzqgGdQ
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id ffacd0b85a97d-46032dabbc0mr33050153f8f.15.1781098071144;
        Wed, 10 Jun 2026 06:27:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2eadefsm74272179f8f.11.2026.06.10.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
In-Reply-To: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com> (Valerio
	Setti's message of "Thu, 28 May 2026 17:01:59 +0200")
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
	<20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
	<758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
	<891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
	<a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 15:27:48 +0200
Message-ID: <1jtsraed9n.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 28 mai 2026 at 17:01, Valerio Setti <vsetti@baylibre.com> wrote:

> On 5/22/26 18:24, Valerio Setti wrote:
>> On 5/22/26 01:15, Mark Brown wrote:
>>> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>>>> Create a new DAPM widget for "I2S formatter" and place it on the path
>>>> between FIFO and output DAI interface. Remove I2S output formatting co=
de
>>>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
>>>
>>> This series, it looks like this specific patch, is breaking pcm-test on
>>> my libretech Le Potato board, the clocking looks to be seriously messed
>>> up.=C2=A0 I'm getting:
>>>
>>> [...]
>>>
>>> Full log:
>>>
>>> =C2=A0=C2=A0=C2=A0 https://lava.sirena.org.uk/scheduler/job/2786342#L19=
34
>>>
>>> The prior patches seem to test fine, it's this one that seems to
>>> introduce the issue.
>> Thanks a lot for the heads up and please apologize for the problem.
>> I wasn't aware of these testing tools so I based my testing on playing
>> with userspace alsa tools on the physical board that I have.
>> I will take a look at it ASAP and send a properly tested v2.
>>=20
>
> Hi!
>
> I investigated a bit on the issue caused by my v1 patch series and I think
> I've found the root cause. I suspect my patch series helped discovering a
> misbehavior that was already present, so I'm seeking for suggestions on t=
he
> proper way to proceed.
>
> # First: the background
>
> By default on OdroidC2/LePotato boards the only available audio playback =
is
> through HDMI. From DAI point of view the flow is as follows:
>
> "I2S FIFO" -> "I2S Encoder Playback" -> "CODEC CTRL HDMI I2S IN" -> "HDMI
> CTRL SRC" (mixer) -> "CODEC CTRL HDMI OUT Capture"
>
> In this chain the mixer "HDMI CTRL SRC" by default starts as "DISABLED" so
> it should prevent "CODEC CTRL HDMI OUT Capture" from receiving data.

Yes, leaving registers to their default state (even if it is not a
working configuration) and relying on mixer path to be setup was done on
purpose.

There is not a single configuration that would work/please everyone,
especially on AXG but the same could be said about the GX
series.

Not hardcoding any such configuration in the driver was the only sane
choice, even if it may seem to weird to have pipelines that do not work
by default.

>
> # What changed before/after the last commit of my patch series?
>
> - Before: "aiu-encoder-i2s.c" was calling "aiu_encoder_i2s_setup_desc()" =
in
>   "hw_params()". Audio playback shouldn't work in this condition because =
as
>   I mentioned "HDMI CTRL SRC"=3D"DISABLED" by default, but apparently
>   configuring the AIU_I2S_SOURCE_DESC register is enough to make the
>  playback to work properly.

Nice :'(

>
> - After: those configurations are only set when "aiu_formatter_i2s_prepar=
e"
>   is called which happens if "I2S Formatter" widget is enabled. Since "HD=
MI
>   CTRL SRC"=3D"DISABLED" then "I2S Formatter" is not powered up and there=
fore
>   its callbacks are not called and the playback fails.
>
> Simply issuing the following command:
> $ amixer sset 'AIU HDMI CTRL SRC' 'I2S'
>
> resolves the problem and all pcm-tests pass.
> This also explains why I didn't catch this issue before sending the v1
> series: I tested with NXP SGTL5000 codec, not the HDMI one.
>
> # Final question
>
> I have 2 alternative proposals for this:
>
> - Change the default value of "HDMI CTRL SRC" so that at boot it's set to
>   some working configuration (ex: "I2S"). This should be done somewhere in
>  "aiu-codec-ctrl" I think.
> - Run the 'amixer' command above before running ALSA tests.
>
> Any suggestion on what's the best approach?

As Mark suggested, let be nice on the user and poke the register on
probe. Just add a big fat comment around it so it is clear why you are
doing it (and why it is not something to be copied)

>
> Thanks a lot.

--=20
Jerome
