Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F333DD52E;
	Tue, 21 Apr 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802459; cv=none; b=WRwg0q4dNjXoP1gfC9rmpNo/Cm5I5M7tP3A958IQQm7q2eBluc7BdbjgYo7va9xjKfyt7gcKfp/D08DPgTseTon93NUdWHsCAlsdN+pPAh/PjoOjr1arjt7DFCM8KT/jgw+SzmhDJquwYsTs8ldg4G/n0XpR1e9Uf/zoM3ksXQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802459; c=relaxed/simple;
	bh=QdWIrXfFTOLvb+UpFIWcvUtiW/YTISh7wxAc2S4hSPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyVJvf/cXiQjKdiNaPES8jIWh8spkqfFxdbVo5Jj5ZMAmnFRx2t4ibeKxkM7gFJJIiR/W/6lKiJTbuKyTBrxrwa0KVcWUbh4mr0ijhpD61MuRWQT4cVZJE0GKa3Sqw6U89eLoVljN8zj3xA9l4pYjkfCGPqQikXIfxkPXzQNSb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0E/xsNn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0E/xsNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E318C2BCB0;
	Tue, 21 Apr 2026 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776802459;
	bh=QdWIrXfFTOLvb+UpFIWcvUtiW/YTISh7wxAc2S4hSPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0E/xsNn056qquscs6BQBWY5U8802vw8a/xCpil7ivu4O7gsT+Q2bc4V1EpmB0tSJ
	 IlyvUR1VhVmlocLi764/sPNN2WvC/lh1me0/9lYud4bokQu4iLL4Xngapjfu5CLoYE
	 Kb2tyvSPxmVVbcXjPQe7x8X4v5GXO6KoXv0su8RhfF1r5pfWW3GLZI02Yzq1WlZP7r
	 ea9XUPQaK0P9AtIWnfuA8CSibpBIzi1qlr5PvfXRR55GjVOrqAtUTd2GudKGGkxdW+
	 rPErIiGrJ8LRZDHdFKM3gQMd0riqi56ukIKbb71pEDbXiJ0iFhlbedLTDG4o8jWTuR
	 Q5LHusgX6E1lg==
Date: Tue, 21 Apr 2026 21:14:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Message-ID: <bfcf51e2-2b5f-407d-9d7f-06ea72165fb5@sirena.org.uk>
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
 <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
 <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQBy+HrW8vXcVQlw"
Content-Disposition: inline
In-Reply-To: <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
X-Cookie: Jenkinson's Law:


--LQBy+HrW8vXcVQlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:07:25PM +0200, Tobias Heider wrote:
> On Tue, Apr 21, 2026 at 6:27=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:

> > > +             snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81=
);
> > > +             snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81=
);

> > Do these actually match?  The hamoa WSA devices look like they've got
> > sound-name-prefix specified so the actual controls will have WSA and

> I think you might be right but I am not too experienced with alsa so I co=
uld use
> some help to figure out if what I'm doing makes sense.

> I ran `amixer -c0 controls` and that actually shows the prefixed names
> as you said.
> `amixer -c0 cget name=3D"WSA WSA_RX0 Digital Volume"` also confirms that =
they are
> still listing max=3D124, so it looks like it indeed didn't work.

Right.

> From what I understand the correct fix would be listing all four as in:
> snd_soc_limit_volume(card, "WSA WSA_RX0 Digital", 81);
> snd_soc_limit_volume(card, "WSA WSA_RX1 Digital", 81);
> snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital", 81);
> snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital", 81);

> Does that sound correct?

Yes, I think so.

> I'll run a few tests and send a fixed version once I have verified
> that works and amixer
> prints the correct max limit.

I sent a patch earlier this evening which adds an error message if the
control isn't matched, hopefully that's helpful.

--LQBy+HrW8vXcVQlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn2pUACgkQJNaLcl1U
h9D8AAf7BA9mQkrK9JoCQDMTHcgB/XZBaOkr8uVedHdVqwJdMwMDVlZORC4OgUMu
W+5GfgsMpkv24892yxm+ew95DTq1uzSDlp/I3TGt7Ubu0PI/pgBON5zZQL7qg1Ak
79oYhOlVg9AtX/p0R6K9gygDioiXmLpDwz3m4gHvsTpvnK7PwHTJQhA0M50Ww0C4
iHQWUCwXaMHa12MTDXNXa7BFdOeSLirC3EuaLFpkQbaa+nsUSLhtsaDDLRtoPOBs
dsUQxorQmU7SBSI6WNvqh4AjgSP7Ymh3t4sq/T1+xxNKUa8frcLPFWsjiaLACruh
jqGZpnLTSJl7l6OmBasozwbyMm8KVg==
=QtJD
-----END PGP SIGNATURE-----

--LQBy+HrW8vXcVQlw--
