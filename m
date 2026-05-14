Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F278826F293;
	Thu, 14 May 2026 01:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721951; cv=none; b=pc3KqVsyKkby1j0+4lDq+Fl3F1FOg7BE9thZ4bxGkFlDjfU8zJA6Yjrdw7ZkaVpEk4yD5wG9dXGIad0mosXZYNURwURzT/LXPo0h/5ViYHWdwEweh8kLXbcqbVKwtYlMdKMph3Ft9Tz4zK9dmwhKqcLVopZYxDz+RH5iNkMpnG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721951; c=relaxed/simple;
	bh=AxoTvoWNfZ0N/+JEAYdEeXDvJlySu93nmK/tcGEpdCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPIimjN8L41dlvcO3Iv9/XGTzRh/9thOmRk6XrMj6n1NPyKFP7A/CYncnplkekndLauQXbRgP229EQINlpmAjHUbSIYtIRhIzZvXDprjv8aRaAvPMvmysHKhDN8KZ1CNCiOxmtajaAxlg7icABKYNfUmTzKD7xLvCbwgrB3AxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohp60svg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohp60svg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76109C19425;
	Thu, 14 May 2026 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721950;
	bh=AxoTvoWNfZ0N/+JEAYdEeXDvJlySu93nmK/tcGEpdCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohp60svguPn9VJ91KLcWrSF309vSbtyAuPSAL/QkJnoEjZsQVEyEMjMZoEvMvI3TL
	 giBT5kNy12kDo2kCnhG8yE8Sxxs6IR0gbe5Q/a7+zI4c7xEOJVCIszHw7JqPEQdSgE
	 Ce30DVL+fmagRlxvsjmqvbXA25aJfxU6DBNV60oNjHXah78uM9Ud6OUub/8adLTlh5
	 tpjHAByxUD4IRBBmcnmxbgaXFU6uZYnGyEZqRRQ+JZP3kRGfRIlM6LCFXZqtZlt04I
	 Y2VbaX/vQmU3ulRzk5eqFsZ4M3ELZttB7npVcd1LbBNUxSs6fGrjGkd8em84cxxsAM
	 xtbO+hdClC7JA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 31A781AC58CE; Thu, 14 May 2026 02:25:48 +0100 (BST)
Date: Thu, 14 May 2026 10:25:48 +0900
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agUknFcDIfwrOCld@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNeucMHgTrsFwFqi"
Content-Disposition: inline
In-Reply-To: <20260513104329.81592-3-phucduc.bui@gmail.com>
X-Cookie: Truckers welcome.


--jNeucMHgTrsFwFqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 05:43:27PM +0700, phucduc.bui@gmail.com wrote:

> @@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_subst=
ream *substream, int cmd,
>  					   I2S_IER_OVRIE,
>  					   (unsigned int)~I2S_IER_OVRIE);
> =20
> -		spin_lock(&i2s->lock_fd);
> -		i2s->refcount--;
> -		if (i2s->refcount) {
> -			spin_unlock(&i2s->lock_fd);
> -			break;
> -		}
> +		scoped_guard(spinlock, &i2s->lock_fd) {
> +			i2s->refcount--;
> +			if (i2s->refcount)
> +				break;

How does scoped_guard interact with break statements - does this still
apply to the switch?  I've not looked at how they're implemented...

--jNeucMHgTrsFwFqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFJJsACgkQJNaLcl1U
h9A0LQgAgCudCBnqt8GRh9fItnTaswFb1n89iM98BFvGsp0OcKXQzs4y9LipC6PM
AYYBv9nS0EwFC/llo3irahgb3HBMCiNaWybxgB+ugoYvpRxyruZbvRrGv2GD+s+d
TWhA5K2IS4pa3QnN92xa6C8qizSVO0cQaiGN29KUnc76fe6xLAMJRmnBjeuzREIP
kWTBPp1TTcckQAMbsfYGNPXxk2E4na8lc4vCkqTeDyMFtou6rjBnDUVMYL7/Fgcj
4RtoQjoWnhpMDWwEAi1eTmfiIZu/8lEhC4BERarbLebL9OONQuU/ivc9JAJUclZH
211Q9ZSJGs83gx3iA3gE40STi52s/w==
=x6Dg
-----END PGP SIGNATURE-----

--jNeucMHgTrsFwFqi--
