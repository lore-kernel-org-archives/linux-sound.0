Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C2437112
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655969; cv=none; b=eWToSdg7LkuYgP5xM+8S7UtbWhE9p9DYY3dZyXUrdAE0+R+lk9mye0w8Guk4iTVRwkoNvCAcilRfbkneGQcwdhGRPGkXwUgFa3KxjBPtfkarMZanbX9oJWywnqVLB9FTaGy/cgsSJtZOZa+onYgswSmcYl3jpCTVCRWeMHkVWO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655969; c=relaxed/simple;
	bh=xH3gPrYDppt+MQrXmhlrMRygwbJaysyp4ket8pkDaJg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5axDNqsVuK4yh/Xt2CRhNe2waAr9ZEW5Dw8/TpNtuaWnbmtBdx0A2WJERFh/481aO3Hl2AWg0wIxrXhNEjRDtJjkNoqUteA8gUciSzWOvS5c9xoBnfy2wLvPFdR1iNR7cMz/0897ZvWzONYf/HcbWLyBWhKjA1a6fwqVt0Dseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gZuc6nAo; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gZuc6nAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786655950; x=1786915150;
	bh=+vZVQROOJ4Lf+QaUOHcsMONz/LGFoU22tAdh4Uplb34=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gZuc6nAovG2m/uiYcj/DZAO+g85LqNaVv3AbXG/Hkzw4O9cRuCneR9ycfi7FKW/jH
	 P+aHTJpIO4mZrsnAPO5PRywLBofHrvfclj8yBVevdTLBUV4uBH/js1uE+0VJYxbuuK
	 oJ6Plct4FJD1a4FF9Ci05S3OF6tdjUlUdh4A05h8WlJ22s4PTcMXFLH5gOEfIzadzu
	 f2qMvSexfuuUbt98/QUCZLJKN4zUPxmjf71UcfACaLh1c/o4KjeaF5euD1Qr0O8UIj
	 UTcpjJ3Xaw0NtHLoWw8Ugf2yqoHwUe878L4SXwCEYxV4NpVUJ6zMyEgFX/sEew/ai3
	 THJwN4DNwOW+A==
Date: Thu, 13 Aug 2026 21:19:02 +0000
To: Andrey Golovko <andrey.golovko@gmail.com>, Mark Brown <broonie@kernel.org>
From: Robin Everaars <robineveraars@pm.me>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Antoine Monnet <antoine@montane.tech>, Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Message-ID: <20260813211858.17509-1-robineveraars@pm.me>
In-Reply-To: <20260813194500.10598-1-andrey.golovko@gmail.com>
References: <20260813001500.9218-1-andrey.golovko@gmail.com> <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk> <20260813194500.10598-1-andrey.golovko@gmail.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: f7d2d258e9e716eb700eef1bcdd796bfd2610fab
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------cb0c3cfecc0bd92e335a0008fac9fa5f6d00d59c00e4d7fbf40f5b0e4987a2ab"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------cb0c3cfecc0bd92e335a0008fac9fa5f6d00d59c00e4d7fbf40f5b0e4987a2ab
Content-Type: multipart/mixed;
 boundary=8af598b9aa5a888213797b4ff59733ba7b0e3e4eb6ff11710eabf1d7a1a5
From: Robin Everaars <robineveraars@pm.me>
To: Andrey Golovko <andrey.golovko@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	Antoine Monnet <antoine@montane.tech>,
	Ville Saarinen <wiza@saarinenkoti.fi>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Date: Thu, 13 Aug 2026 23:18:58 +0200
Message-ID: <20260813211858.17509-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813194500.10598-1-andrey.golovko@gmail.com>
References: <20260813001500.9218-1-andrey.golovko@gmail.com> <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk> <20260813194500.10598-1-andrey.golovko@gmail.com>
MIME-Version: 1.0

--8af598b9aa5a888213797b4ff59733ba7b0e3e4eb6ff11710eabf1d7a1a5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrey,

thanks. One clarification about my negative v1 result: it was not an
active-playback resume test. The controlled pre-suspend tone had completed
before system suspend. The PipeWire sink was then idle for much longer than
WirePlumber's default five-second node-suspend timeout. After wake I started a
new pw-play process.

I did not trace the ALSA ioctls in that run, so I cannot prove exactly how
PipeWire reactivated the PCM. The test was not designed to call
snd_pcm_resume() on a running stream and should not be used as evidence for
that path.

That makes the missing b627da430357 on v7.1.7 the more relevant difference for
my result, although I have not proved that attribution yet. I agree that the
next useful test is the exact v2 series on broonie/sound for-next rather than
another cycle on v7.1.7.

I will keep the cases separate:

  - an active hw stream recovered only with snd_pcm_resume();
  - an idle PipeWire sink followed by fresh playback after resume;

  - a hw stream left PREPARED across suspend, then started without another
    prepare, to confirm the remaining gap described in the cover letter.

I will mask the resume rebind during each attributable cycle and keep the same
pre/post acoustic measurement.

Please send the register-readout module off-list. I can capture DP1
PrepareCtrl, PrepareStatus, ChannelEn and PDE23 around each path, especially if
one still fails on for-next.

Thanks,
Robin

--8af598b9aa5a888213797b4ff59733ba7b0e3e4eb6ff11710eabf1d7a1a5
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
--8af598b9aa5a888213797b4ff59733ba7b0e3e4eb6ff11710eabf1d7a1a5--

--------cb0c3cfecc0bd92e335a0008fac9fa5f6d00d59c00e4d7fbf40f5b0e4987a2ab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp+NMYJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdrQOBjmGen5IBy8SpvS9HqFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAHxHAQDERIPEYn0iypt6F2VhmplgAZQRvXDJgXuHnP+v
eZKSYQD/TE5ly/PHEUFHheuFCVXr0gGAqK9vyoUzDWMscZcNRQU=
=P9DI
-----END PGP SIGNATURE-----


--------cb0c3cfecc0bd92e335a0008fac9fa5f6d00d59c00e4d7fbf40f5b0e4987a2ab--

