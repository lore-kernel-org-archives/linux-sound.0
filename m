Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F818328B69
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807947; cv=none; b=MGfxVzU+Lm9KCGX1M0AeFtWmq5XfbpmaiSp4zPclwbVXwZXDL0cwrPqQ/VfdmyaiDSg8UM9UG3EspH6eMwT0lFBrDudFABlC7aVsmdnY1Hug3yMpwDeP/Puij2KdBCAya88b8lV8R1+EHs/HuIGadPu8RoJOEz5RvadkMy6fZvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807947; c=relaxed/simple;
	bh=vVmDwOkL4pqDYn5aULTChABFzy4HsXp7HEpz1oo66m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA4xSKMkt/Lc/f1iISmQcjR97fUTWIW+Lhj8cd2kjsKXXgDqU+0nmHQlAhI0qOzyTU3jPFYZDWxFy/EW8r77nxiJ8FP7hO0WBMPzYH9XqpUza8zyp3f97bs/my4nmizUT4cl/4oi3wP9Q87GuCMU+y3wayjsBxULC12u/dWoMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2mq/shf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2mq/shf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FC0C4CEF5;
	Mon, 15 Dec 2025 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807946;
	bh=vVmDwOkL4pqDYn5aULTChABFzy4HsXp7HEpz1oo66m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2mq/shfbWsvNL7JEDlJDfDcTKUzZD9s8i+0WnjdvjQc/PiJxsvbMk/8x9GuBC30g
	 WqHfYYgXh7RmlHJIYVX5xRuUQsR9APPUOCqVvrCa09l1VgtGPcHf71zg/c/94EMcei
	 3fwaP8QvwdrBnrU/XvbEhMBdAAh0y2rA5dWbsosk8kDuLInTtgir+kTE0VPv1ure6x
	 5KMy8Yfm0TXkF7Yl62kfghMQAgr/duHa2V6WK5xLnGQs5MdoWUPTz4rd3Dr9nqiKqK
	 KpCeuGUiwipTA2RQ7uEZfSmSDkFRmSkvPADxXciZ+3+sZhguNmlu9itRL+orvIMD37
	 FfSMK/avKVd4w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4770E1AC568C; Mon, 15 Dec 2025 23:12:24 +0900 (JST)
Date: Mon, 15 Dec 2025 23:12:24 +0900
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH 2/8] ASoC: SOF: ipc4-topology: Correct the allocation
 size for bytes controls
Message-ID: <aUAXSIIn7-ds8TNB@sirena.co.uk>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
 <20251215112048.16331-3-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PrpiaXa9xGACyjv7"
Content-Disposition: inline
In-Reply-To: <20251215112048.16331-3-peter.ujfalusi@linux.intel.com>
X-Cookie: Heisenberg might have been here.


--PrpiaXa9xGACyjv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 01:20:42PM +0200, Peter Ujfalusi wrote:
> The size of the data behind of scontrol->ipc_control_data for bytes
> controls is:
> [1] sizeof(struct sof_ipc4_control_data) + // kernel only struct
> [2] sizeof(struct sof_abi_hdr)) + payload
>=20
> The max_size specifies the size of [2] and it is coming from topology.
>=20
> Change the function to take this into account and allocate adequate amount
> of memory behind scontrol->ipc_control_data.
>=20
> With the change we will allocate [1] amount more memory to be able to hold
> the full size of data.
>=20
> Fixes: 1bfde5818266 ("ASoC: SOF: ipc4-topology: add byte kcontrol support=
")

Commit: e368b2ba332c ("ASoC: SOF: ipc4-control: Use the correct size for sc=
ontrol->ipc_control_data")
	Fixes tag: Fixes: 03f537690f40 ("ASoC: sof: Improve sof_ipc4_bytes_ext_put=
 function")
	Has these problem(s):
		- Target SHA1 does not exist
Commit: 7f256787a08a ("ASoC: SOF: ipc4-topology: Correct the allocation siz=
e for bytes controls")
	Fixes tag: Fixes: 1bfde5818266 ("ASoC: SOF: ipc4-topology: add byte kcontr=
ol support")
	Has these problem(s):
		- Target SHA1 does not exist


--PrpiaXa9xGACyjv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlAF0UACgkQJNaLcl1U
h9BTTAf9FMgBxBOiwnN+jlpg85JYVqMUaQ6CHIFwdyhrJEWIrUxzfivM/fN2lgDZ
8A8o1TuCovKV/4dM017Qkko2+m/Z8mvm3gaLyUpsPWt0k2ORgl6+y8cb9hhVujC6
WNIapOlHaRUvkNS8VeaWKhIDyA5tf1cXd9mYyN2hBCUBfZ+SdLDLvyAtxqh0Se4l
CpMnUl8rBj8bPrLjybPMM/1LQa10R6TRicxUmpB73PSLbL0rjP3rT3XNfMnTECuH
S89EJPBe4xdZxEXg5QRO2yBokMEjD+3vKF1PXMC5ROT7QFhBHrQam48UunG+++4z
/I/xmutmmdlF2s/RXOqw1DILIkfUbQ==
=9ekq
-----END PGP SIGNATURE-----

--PrpiaXa9xGACyjv7--
