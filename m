Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B112B60
	for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/VK41U6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81C1C433C7;
	Sun, 10 Dec 2023 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702216886;
	bh=vwsPeST9hIcjEZYqHc5Ghu/ipmiE95comqHSPct4YBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/VK41U6lamQs5PwYc88weGzfWfeVoVjYba6H6N7VAnI90XjgRdDjg4qoUC9XCGuz
	 x6gSkBS5hAPTdPErw5HH341qC0jpspyiHcLGJJwP6LuqSYY308lcIdXnViN1fe/TV4
	 eRPg/GR+BaN/XXvDCIawfIW5bCLk6J2IW44zIb1E+uKbLbiLqpRON85zzwDq+5SrKE
	 gjedt06RJ6iIL4V9uwEP1h6OyNOpbSaDhf8TAhWo/akR1IB//WZZWFSGSAMhQq0/hm
	 YPOPH/VdQOmi7hGrfQkBXtEtl86VPB9FghlftZF0SaYBboKxcyvoZa6pRQ3RaF2Zcn
	 VgpPCv3VejQaQ==
Date: Sun, 10 Dec 2023 14:01:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marian Postevca <posteuca@mutex.one>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 11/11] ASoC: SOF: topology: Add new DAI type entry for
 SOF_DAI_AMD_BT
Message-ID: <ZXXEsyBUCrBULNgk@finisterre.sirena.org.uk>
References: <20231209205351.880797-1-cristian.ciocaltea@collabora.com>
 <20231209205351.880797-12-cristian.ciocaltea@collabora.com>
 <fad8a055-eabb-4087-94d5-9e1de00933e4@amd.com>
 <aa830670-e544-43a2-9ba9-a64f1964a9f5@collabora.com>
 <318470ce-1631-4c46-b425-755c877dda65@amd.com>
 <421128f7-6a17-4be9-a72b-272ea4017fbd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oreos5sKtpBo0N/Z"
Content-Disposition: inline
In-Reply-To: <421128f7-6a17-4be9-a72b-272ea4017fbd@collabora.com>
X-Cookie: You might have mail.


--Oreos5sKtpBo0N/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 10, 2023 at 12:12:53PM +0200, Cristian Ciocaltea wrote:
> On 12/10/23 11:51, Venkata Prasad Potturu wrote:

> > This should send to SOF git repo for rewiew, once SOF reviewers approved
> > this, again need to send to broonie git.
> > All the changes in sound/soc/sof/ path should go to SOF git.

> Unfortunately I'm not familiar with the SOF dev workflow. So it's not
> enough to have this patch cc-ed to sound-open-firmware@alsa-project.org?

The SOF people basically do their own thing in github at

   https://github.com/thesofproject/linux

with a github workflow and submit their patches upstream in batches a
few times a release, however my understanding is that their workflow can
cope with things going in directly upstream as well.

--Oreos5sKtpBo0N/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV1xLIACgkQJNaLcl1U
h9CoTwf8Dwnj2+UjtYHJuIbJnCxMg7GhXck/1rPcY4inJ4bbew1s67PLh9CPuwrv
lsjre54uKUtGLt/7qlrfeZABNe0CnlAEKN/qQCMjzPe1uTqDnN8+NMb2uiUTezTd
IivcXTjRaV502TmPmiIXTIXSfPgk3OAmNFBn4J5Pkxb5wTMO+KGbLU+xfqRYlAJi
dzVC56UGPXpx2XHv9rbBx5/fhizsgEFrrVwnzJlr6376JDUd27yRP3Ew6n2hgJhk
vFkeFMinSViAB0VmBDgTqjTMTpURbt7TqYOLY1Pj23+JEM1YAt1y7AX81ILA0SEC
E8YS2bDRqva7ez7lA2Z8ktcmq+TstA==
=S5Ee
-----END PGP SIGNATURE-----

--Oreos5sKtpBo0N/Z--
