Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD12BD030
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771420806; cv=none; b=elk5OspXEojwk/SigxmhVvpt46nOgbp5YDy7YW6lprrgy96jg5MeYbnOX5B5uWRNlObL5xAVtTGxXi/le7GXKbEuaHEJm/qL+ubgXOzBzaD73nA2n2Xt0w8STkGOkUR3TiNb5ytG0fcr5vmPKVBhOQELsiAJ4oXjYXoHPhS3cKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771420806; c=relaxed/simple;
	bh=F8KNnIclTwic5N/n61X8DcAk2NMTfuj2kbtZ+Gn87f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1mWUZbbKz5K8UNdzTGKYnX6VEWZS8R5M2aeYTCUc17P2/hy0lSay53XT/6qmMhk1RrcbInflIuFEqLdIwYY52irYr/5r/8BTCdZIUV/y9c+F7onZLi2UJ39tNHpKeGWPGuBSzRx4ca0WEd13uLwTSEbLCOOXduxfop/bZuO3vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd15u4jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd15u4jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE11C19421;
	Wed, 18 Feb 2026 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771420805;
	bh=F8KNnIclTwic5N/n61X8DcAk2NMTfuj2kbtZ+Gn87f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fd15u4jUDRLgUtsmYHAVHc10mRRzw0OKZOdGt41c/bILA1dASR1NIHREA4sca7Sx6
	 N5BDvkiVb/dXB08hDU4zq4E7hF3snN5Ia0LKEWX1NYY2WnmHKmC3hKljT4CvsIZRMk
	 BreEz/digJadRchLhW0PU3X0i435VIZZO3EqxMMqrQdl7MHQIitnXnTgIEg2I7IkFH
	 GquZ8YHIri7YVsK8QCQzEzfeTwRQQDTVkzv5YAJMmhm8dnBJz/UgdGyirUaAumhepn
	 zZYon0I52mhL0qWOuyZKMw4/cSp3JukL/O671V68NG9WNXAdPwwA8NMHTIg0LZDsA0
	 0Al0gNxss1OBg==
Date: Wed, 18 Feb 2026 13:20:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
Message-ID: <8d133f5f-dee1-46cb-b0b2-48a50b747d8b@sirena.org.uk>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RLNyba7ybUlQKGtc"
Content-Disposition: inline
In-Reply-To: <20260210152737.347279-1-cezary.rojewski@intel.com>
X-Cookie: They just buzzed and buzzed...buzzed.


--RLNyba7ybUlQKGtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 04:27:37PM +0100, Cezary Rojewski wrote:

> +	/* With known state for both new and original, do the comparison. */
> +	retcmp = memcmp(&original->value, &control->value, sizeof(original->value));
> +	if (retcmp)
> +		retcmp = 1;
> +
> +	iname = snd_ctl_elem_iface_names[kctl->id.iface];
> +	trace_snd_ctl_put_success(card, kctl, iname, ret, retcmp);
> +	trace_snd_ctl_put_fail(card, kctl, iname, ret, retcmp);

It feels weird that we have two events here - given the result of one
you know the value of the other.  It seems like it'd be more idiomatic
to just log the result of the comparison, the output is structured so
it's easy to parse.

--RLNyba7ybUlQKGtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVvIAACgkQJNaLcl1U
h9CAHwf/evWh6KxvPFz3sGaYna0P6P66AuMPxhG3B3J5OsKD1AFkLvqJSSYjZVCz
tFlpgJLZ9Dwu+xnJ3+ii9OhalGz3wBHxArmvi6C5wG9wpJjnOxUGFoALoQe8ZbER
D1M25dMe6RNIp/uwOVtK3DgoIdlkegIdcMONuMoy+h60fHjVw/M8zSUPcWiUSptR
vDLmwhxyzf35H6nBATNuntCFA9V3e2qGERvyAxOzPCRFKq13Xl4qhriIPwnamvab
I94pIJ8kko3jHmcK1codpUC+XxuJfa4viO8JV9MNTZtBpjCr80fDOe/lSYiTSLLo
uwL7+brhe3VSTX0IOEv1eVlQ+UEmVw==
=bFC3
-----END PGP SIGNATURE-----

--RLNyba7ybUlQKGtc--
