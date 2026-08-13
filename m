Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBCE4734F8
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634544; cv=none; b=TYLjHG8AhxWCtjtYjpc7c+fzxoMwXT4A92ae8DymiQfKXg+FgtfEvG7eqmrdYH4Di8mNvP0TBg81ms9OGQvfrPHBKHLmiqLpzPF9L+L7Q64dU0IG3CZz6r37MxJugTxm0/asNx2K//YbrK7pJt6Ah7aUTQU2B4rvxxjRB6aMaVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634544; c=relaxed/simple;
	bh=F1/5nZl47VWumbVz1LenlBelpmoq3Y9QymKhDfRXXUM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHIRZpgp6Cpt3Z4Crhy3mGGmCNDMhDgsY0XWqOH+skJvFLDQEPK/uhB+yCtRnof6sHNLjn9jZGprT6GjRJCRXZqkjADk56dgu/O4t3XtixOUXwOvT5y0Oaj0Bwd2g44qonzoxUpqWDe0AjYxG4MhHguBJq/SjcW5CRdcasL5GPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=U/oqwy7B; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="U/oqwy7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786634538; x=1786893738;
	bh=cS6F27q/XviLEuWFhnMzMtf2r3b4urtHwo5fyb1bqdE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U/oqwy7BTJgJUujAg1b/w+0uEuF4wy/XGWVK252yDfFH3QpQP7+a6qv4vr4eLJfZS
	 ptTJoTQGpye6yBOtAIGQ9gs1l/TJB+OKw4E8RKkZnb0ar9ZS6kmULd/ys9gG1dZiGw
	 EUS3kkeqsmr43gJs5Jt3JONAP1Bir2WDHmFicMoXZD6jlrhmhnPBC2YtrI+ePQg7vl
	 27g4srJmDsfMFH0AtkcEd+F4SvQM8nETikLV982uygD1KvYXW8L1sqkZ/UpF4fezfG
	 x7/kc9uzZmb3Bu6g1P+VNIj0POmkqQC8p8/U4IrvIo1YNT9EPazJclbiMFEWTApIu/
	 Hbc9Oj2Wo8CLQ==
Date: Thu, 13 Aug 2026 15:22:12 +0000
To: Andrey Golovko <andrey.golovko@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Robin Everaars <robineveraars@pm.me>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Antoine Monnet <antoine@montane.tech>, Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Message-ID: <20260813152208.103046-1-robineveraars@pm.me>
In-Reply-To: <20260813001500.9218-1-andrey.golovko@gmail.com>
References: <20260813001500.9218-1-andrey.golovko@gmail.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 8e4cc749e7da9a3a4d791f526d7e85105e0e45ba
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------00956fbac61fc8a6ecc68a2d07ca8e503742a68e6e62998ec4649ec1795bf5bb"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------00956fbac61fc8a6ecc68a2d07ca8e503742a68e6e62998ec4649ec1795bf5bb
Content-Type: multipart/mixed;
 boundary=fb4e594afab6bb4d4887a8f5925706516e42ef0f4c07881bc975d794e113
From: Robin Everaars <robineveraars@pm.me>
To: Andrey Golovko <andrey.golovko@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Antoine Monnet <antoine@montane.tech>,
	Ville Saarinen <wiza@saarinenkoti.fi>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Date: Thu, 13 Aug 2026 17:22:08 +0200
Message-ID: <20260813152208.103046-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813001500.9218-1-andrey.golovko@gmail.com>
References: <20260813001500.9218-1-andrey.golovko@gmail.com>
MIME-Version: 1.0

--fb4e594afab6bb4d4887a8f5925706516e42ef0f4c07881bc975d794e113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested the exact inline patch from this message against v7.1.7 on the ASUS
ProArt PX13 HN7306EAC. The normalized patch SHA-256 was:

  68e9ae1300b17a7ba129b38c89d650964a8049cb03797a5eaf762f2d3fa78b40

The bound snd_soc_tas2783_sdw module had SHA-256:

  ec9eef4eb83f81761127c39c5da13d4ddb741f111fe2dcb6b64a5c4e0db245c0

I disabled and masked my resume rebind service before the test. The separate
boot rebind stayed enabled because this machine still hits the unrelated
32 KiB firmware-write timeout during cold boot; it recovered both amplifiers
on its first attempt before the baseline measurement.

Before suspend, a controlled 2 kHz both-channel tone measured +58.7 dB over
baseline through the internal microphone:

  baseline combined       2.2
  tone combined        1799.4

The machine then completed an s2idle cycle from 16:41:19 to 17:13:44, about
32 minutes 25 seconds. The resume rebind remained masked and had no journal
entries.

After resume, playback opened 
and ran without a TAS2783 error and both amps
remained Attached and bound to slave-tas2783, but the speakers were silent. A
valid repeated acoustic capture measured:

  baseline combined       0.6
  tone combined           0.2
  tone relative to baseline  -10.8 dB

The first post-resume microphone capture produced an empty WAV due to the
separate first-open issue already reported in the ACP PDM thread. I discarded
that measurement, confirmed the DMIC could capture directly, then repeated the
speaker measurement above with 353280 captured frames.

So the PRE_PREP power-up patch does not fix the post-S0i3 speaker silence on
this board. I am withholding Tested-by. The result suggests that restoring
PDE23 is necessary for port preparation but is not sufficient for this
machine's full TAS2783 resume state.

One unrelated event occurred during the same resume: the RT721 jack-detect
worker hit a NULL dereference in snd_jack_report(). Its stack did not contain
TAS2783 or So
undWire port preparation, so I have not attributed the speaker
result to that Oops.

I can test a follow-up patch or collect specific TAS2783 registers around the
failed playback if useful.

Thanks,
Robin

--fb4e594afab6bb4d4887a8f5925706516e42ef0f4c07881bc975d794e113
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--fb4e594afab6bb4d4887a8f5925706516e42ef0f4c07881bc975d794e113--

--------00956fbac61fc8a6ecc68a2d07ca8e503742a68e6e62998ec4649ec1795bf5bb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp94SQJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdWWi0wsVZeVYs7Sa1LngrxFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAI4cAQDuZMLZdPqitEYjCl60TjpY5zfGejbe9uksn3SR
qy6tAAEA1Vt87ZbY8F3GDa+kSidfD9ZR2rYCYrPkK/q3k5T3hgk=
=nk6t
-----END PGP SIGNATURE-----


--------00956fbac61fc8a6ecc68a2d07ca8e503742a68e6e62998ec4649ec1795bf5bb--

