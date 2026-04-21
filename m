Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3536E478;
	Tue, 21 Apr 2026 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788830; cv=none; b=O36y6688AEsnFULn5K+eDHD/he94Fv65WyouQtt68DpKTgpx6iy/aA2gXLG+SiEkvg/L+5QaypusTmStT34vJsRJUzm9l2rEkH+BFKGmZoneYtRFbdCSCGY4+RDqjnCI3fjuS01HYItimPt7J+af/P5Lc9rYsv/9d+5k99uPgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788830; c=relaxed/simple;
	bh=B69zmWQHIepMwQSqG2SX4A7XjLJZOD2Oua8tmHLVQn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP7pWwy42e2c7vX0c6bD2T7D5f8/1+l1nMYahgWA8pANZYyij2w0T36DVyjSUq4SRMquW7d4/r5sbCD6hVh66+J389gA79QYEf6PUgRnDjkEKmkeQneU+/zsScpGeJFnm9o0f4g9GjFvLKkG/b57ywL4GsnZ7vK6Q7Nlb+ob84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWRoAJmr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWRoAJmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A43AC2BCB0;
	Tue, 21 Apr 2026 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776788830;
	bh=B69zmWQHIepMwQSqG2SX4A7XjLJZOD2Oua8tmHLVQn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWRoAJmr3DwTCdJGdXnv/m7Dgck1R4doPhvKlzze81WLpWX5gVz4ATqTbREEs6wRN
	 L8Fs7TVWS/n768yWN1kX2tt/LB4/7fOl3YHKxQ6vNqiLmbqsDvjNuIYkrrE27O6hFw
	 6KR+hTOM1dAfiHmcEG6+j9a+tcNuUMpaZwiBHpaKJVCU/O/npHlZqqjEi766eBrJBB
	 EWbk7vkQpX68MYMx9KWjxVCeQpi5E7TEfDyISPoleBR9XFLjYsjfQzItbD54MhWxDA
	 rchI3j3M3Fji/HsaeoszjWvWCqDRvbp6u8EmtMIpXEU19SMlLbT5e2vroYJffFQu/z
	 h7/DAp970a0Vw==
Date: Tue, 21 Apr 2026 17:27:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Message-ID: <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BYr1yepwL98j6uqS"
Content-Disposition: inline
In-Reply-To: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
X-Cookie: Jenkinson's Law:


--BYr1yepwL98j6uqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:
> Limit the digital gain and PA volumes to a combined -3 dB in the machine
> driver to reduce the risk of speaker damage until we have active speaker
> protection in place (or higher safe levels have been established).

> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);

Do these actually match?  The hamoa WSA devices look like they've got
sound-name-prefix specified so the actual controls will have WSA and
WSA2 prefixes but snd_soc_limit_volume() uses snd_soc_card_get_kcontrol()
which just does a snd_ctl_find_id_mixer(), that doesn't understand
prefixes.

Probably something in that chain of operations should log an error since
typos really aren't going to be discoverable here...

--BYr1yepwL98j6uqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnpVgACgkQJNaLcl1U
h9BZ0gf/Rhc8NzkpFdex8iSUOrT7Sl5FV/BU970FnrpSyaqgONyzd3HqxtSonvRy
/zZlDAkJRWGFNNcKORUkXVzRw3ueNfwg7LBMzGDeYoN6tIKnP44QsVdTJJoPZ3Lj
gTfu9fTBOVVlUOVbtsaJw03SrQ2pdmQpbuucoWu+P9a9eZV0HVYkNHozE/r3ahup
MdJvTSKJG4QIHnB8qnshdd2iaVn6RLIBEiEdcS73fPYXP21twCUm4PsUYPUIadPM
0i9du0lEek+8HrK9s5w0KLw7Iiugm0sw9Z2TqdA+n/eeRX7B7mD+jHb8ukxptGoR
F30VWpl3bbnnw1B8tChqBVzDctiDcg==
=qylC
-----END PGP SIGNATURE-----

--BYr1yepwL98j6uqS--
