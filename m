Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992363F9F3B
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452575; cv=none; b=oK00iior4TYy//BZawe/2+f0AyLOufFcPzmGgjxGMeNSbVmwsEyU/BfCDbkybUSt4FQ83EvHrexy8HSVkeCG3rQF5DUpbWf9ziXBG6RbbdGJfNVLIlam6azHd8PgKcTGw13M/25jR0BLUkYM1gjSySIsc9g/qs2lpfsmnwBGAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452575; c=relaxed/simple;
	bh=9AwzxTV19bfDmJrYLyubcVndijb4WEiJ6vObodTT0w4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQeyiiSXPSXH6rW34aY4zZB2XclNSDSvPBKJShW+bnyJVpH3QTuA3V6pb/5xOBr01iTHQVKzRZsvZZpVNtaW33Bj2rnc82b3m6lCZ18Q3RKZFhcFrl7cLuqdonD1cfjGrIxpWl8/jYsTyasvxyor227Br2eWDpPjX7yLUihPNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HhsFYisD; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HhsFYisD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786452562; x=1786711762;
	bh=fQBpYbdmAtryXkM2EZV/4BMkamNp0uKxKAtmt4b6kOQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HhsFYisDbYMVwohMa1lWb6MLRSf1l5k04+MR1BmieOdxHl2s6H1EWytuK5tfx+iRj
	 dM7v+rH3BAgur0lPZnCaxjuvW+2ApSaM52qheGXhuPOkv8Wc3amGvYyrIK7mvUTHyt
	 zOiRQYgTC0q1fwVXqulpH+ZQVtmj5lBoMPf5fvS+lloicd9g/u3r2cSHS0zVdBsVTh
	 YijlsaCNt9JAOb7PkX8tOJx0uLsN0+L5fDI51wnK8utGpgZj67zm/4xfXQn3L9WUgc
	 QlA66IW/7A6Bo8vugstBQs+8PJTaWSDo/1Gj6FqSxYdmJzhi7bj4cZSlinCeyvoHgg
	 u/esgXtb5V+Fw==
Date: Tue, 11 Aug 2026 12:48:25 +0000
To: Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Niranjan H Y <niranjan.hy@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Antoine Monnet <antoine@montane.tech>, Andrey Golovko <andrey.golovko@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: tas2783: fix stereo split and resume on a two-amp pair
Message-ID: <20260811124822.205891-1-robineveraars@pm.me>
In-Reply-To: <20260809103634.20438-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi> <20260809103634.20438-1-wiza@saarinenkoti.fi>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 942054fb561a2bb468bc11be6c55a379de5d698d
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------005455528bf45396c4402d6b184ae42f5580b4fd29edc3f325621843246297b0"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------005455528bf45396c4402d6b184ae42f5580b4fd29edc3f325621843246297b0
Content-Type: multipart/mixed;
 boundary=febd132147736fb56e6fe8ec996e858446feeab0ea5137df4915bc3bc988
From: Robin Everaars <robineveraars@pm.me>
To: Ville Saarinen <wiza@saarinenkoti.fi>,
	linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Antoine Monnet <antoine@montane.tech>,
	Andrey Golovko <andrey.golovko@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: tas2783: fix stereo split and resume on a two-amp pair
Date: Tue, 11 Aug 2026 14:48:22 +0200
Message-ID: <20260811124822.205891-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260809103634.20438-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi> <20260809103634.20438-1-wiza@saarinenkoti.fi>
MIME-Version: 1.0

--febd132147736fb56e6fe8ec996e858446feeab0ea5137df4915bc3bc988
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Robin, Antoine, Andrey -- if you would like Reported-by: or Suggested-by:
> on any of this, say so and I will add it; I did not want to attach your
> names to a series you have not seen.

For patch 2, please add both:

  Reported-by: Robin Everaars <robineveraars@pm.me>
  Suggested-by: Robin Everaars <robineveraars@pm.me>

The report and the follow-up measurement established both the one-channel mask
approach and the positional behaviour in sdw_compute_slave_ports(), so those
tags fit. I have no basis for a tag on patches 1 or 3.

I also retested the machine today after booting kernel 7.1.7. The cold-boot path
still fails on the second amplifier:

  command timeout for Slave 2
  trf on Slave 2 failed:-110 write addr 8088 count 32632
  FW download failed: -110
  SDW1 manager is in bad state

The existing reprobe service recovered both amplifiers on its first attempt.
A fresh acoustic run after that recovery gave:

  LEFT only    +69.0 dB over baseline
  RIGHT 
only   +64.4 dB over baseline
  BOTH         +71.0 dB over baseline
  imbalance     +4.6 dB

Both channels reached the speakers.

That measurement only establishes the 7.1.7 baseline; I did not run your
series. My configured out-of-tree module still carries the local per-amp PPU21
write that Pierre correctly rejected as an upstream mechanism. I therefore am
not offering a Tested-by or Reviewed-by for patch 2 yet. I also have not
isolated the residual dev_resume() path for patch 3 on top of b627da430357.

The boot failure is why I am keeping both the boot and resume reprobe services
for now. I will remove them only after the unassisted paths work upstream.

Thanks for the careful follow-up and for separating the prior work from the new
parts of the series.

--febd132147736fb56e6fe8ec996e858446feeab0ea5137df4915bc3bc988
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
--febd132147736fb56e6fe8ec996e858446feeab0ea5137df4915bc3bc988--

--------005455528bf45396c4402d6b184ae42f5580b4fd29edc3f325621843246297b0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp7GhkJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmclLcVay0A9nErKERvPCwpnFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAOayAQCgSfzOjleAD57mHM8kw+ax1yQuYobbPLpuGhmo
2f8qOQD+PM8r6gdXfOonFkiX9PCT2OPRPNE0fy+8/cOF7TiXmQ4=
=5Dv3
-----END PGP SIGNATURE-----


--------005455528bf45396c4402d6b184ae42f5580b4fd29edc3f325621843246297b0--

