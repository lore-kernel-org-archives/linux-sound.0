Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218C421A429
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574335; cv=none; b=DfZwQjA3sHrETSDM5otl4rp9rNlyz2spL87XwPS76H9XLBYL22nrCSOaQEZgMI4MAx5mKbI80T10Y9eVOSSclQFc/smpEsPhwoFyb+2zyF4XDU6q5Nsbmjmoe6qZLKy+qZUBI20Ym8lOKE4JwWwhlUi1lMG5XGIMWzuvyrvkPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574335; c=relaxed/simple;
	bh=JFG6+0bA6YKvd2aYjVb9QsYwre5Ei6m7qBE69KwGRSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjrUltCg8vmEyvhQlvONsS/mb5OySVl5IZfe/rlZ3Z2nHBWThEOqtnNBdS/qmsJ5VfBbIy3W8jdIeXo8nbXTkkitqxJ5xxJM13SgO+MfoeU2axYchIE4WU3Mh6Ww+OOWBAr/irgUtDm+HjdbcV2YIOxgIlx/cqBbERyJ8Tbb4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fToYRXkQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fToYRXkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50582C4CED6;
	Wed, 26 Feb 2025 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740574334;
	bh=JFG6+0bA6YKvd2aYjVb9QsYwre5Ei6m7qBE69KwGRSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fToYRXkQRibhLpNTEWb2fiMePKSbjeZmsUEL3z0Sw10q0kakKCviLglEcFiZRk2GG
	 MYhJc/Whepn5Fus3yzGQENWliDL6/p5DSsCJLMMwzu78+02kOhtpX3pEp9BFzoLUz1
	 Eh2PcwLvH3vKQhjrfyfjXN5h+42rpFS3eaV+oPZeLSKklucyZNe6zxdc+fm1lh0Rd6
	 Szx/a+q4J5M8DHui5nLEq6Fn3ojG2jB7ACuaDTVdDCH+MU+nlrWypbAR+NWksDs2Fv
	 +osacP8G1C7LwiYcNo1YtM25+AZf1HDA+vXQEJ3V2xb0PZ1TtG2x+jPsNgD7hBSHIa
	 QL4gEl9bz+yag==
Date: Wed, 26 Feb 2025 12:52:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: use DAI ID and Name for ELD entry
Message-ID: <742390ec-7272-4fc7-9fe9-865ff5247c79@sirena.org.uk>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
 <87bjup6wx3.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MwVdUuSOpFLMmUIG"
Content-Disposition: inline
In-Reply-To: <87bjup6wx3.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I represent a sardine!!


--MwVdUuSOpFLMmUIG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 06:29:44AM +0000, Kuninori Morimoto wrote:

> commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
> "eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
> have duplicate DAI ID on same Sound Card. In such case, we will get below
> error. To avoid duplicate entry name, use RTD ID instead of DAI ID.

Acked-by: Mark Brown <broonie@kernel.org>

Given that this doesn't depend on the first two patches it'd probably
have been better sent separately, especially since it needs to get
merged via a separate tree.

--MwVdUuSOpFLMmUIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme/DnkACgkQJNaLcl1U
h9BYpAf9HpA9ZNGt8nl3cgLbc9P32OlUzLhdkKa+Y/RDJlMtDwkSE3ZDo6C9GMSy
VUFLuQ0yw5qNn1iX7YH521Mtx9Z3VrbtQWrquYQhhGuplVGR1cgFXe1fIs98Utx+
hluQplh3tyvid284avmbobw/i9AgUfv8iX9WENbU7OWl2nzOhX2gaoDeir2unK59
HYv3f8JysJ679g9SlsryzFdIIjaOJu3MmUiFM8eKtr5pxGfMGV6yRZ0rNZyukapw
1JqccpV0F7kBX9H2pipTRpKBsPBOvlik47sJbHSO9DnbgkI8cjJd+eTqIGcvPf2W
NtmCl4A2Q7xwBLurtz5X7em1acFQsQ==
=1iBt
-----END PGP SIGNATURE-----

--MwVdUuSOpFLMmUIG--
