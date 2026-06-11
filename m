Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE54409622;
	Thu, 11 Jun 2026 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201553; cv=none; b=UqINP9jjCO6X9QGI8Zehty210ZLn5sraRikLX9TkcROp4w8Xh+1cfXTWBqLyFXLNodvSL9XmHaYRrre4v1H+7Sn+e2X9zFBSGMHLyDXjU6vEdf7SfWZNg8HUnrG3DhP/yOks7s7Hvja6fNdn2UYtmdn7SclypNrVgGEPS3btfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201553; c=relaxed/simple;
	bh=simiBEUK4cJWIY6oqpvV0RrvSlxJfQR7iVdIKJEyIHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs06Mjm87Ue7IFFGFV4gNjDpb+8/uVScG9Qtm81mccEz6pPrb9yMaFAlZHIscCpYN09b6fsKKcSZpZkprjd/9X45RhpcODy9sekI6dq85sZSKexZk9Ry17v0S9VMsb1l4ObMIDe7qiV6gW4isUYAReCW76lcWo0DZYB1amN0RgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CATY+iU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CATY+iU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A471F000E9;
	Thu, 11 Jun 2026 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201551;
	bh=simiBEUK4cJWIY6oqpvV0RrvSlxJfQR7iVdIKJEyIHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CATY+iU9aKAoEhZ4+UZzL8o5G7pE8TWyL8d9zg+q73bE2+Ns66rp0qLHzyrOpo6jq
	 PwX52dOzNVTv9nMskKWc9wGL+3sobJU7ZPwy53x01mxztelA7OJOrPsakSwuBsLOJc
	 q8i/Hk8s0MYkBNwVtAlNsGuHmqqGri16ehEA/wIMB6W3oruf7Da/tbZzPYJjlvqdaI
	 SMuOhxJ3jEuZ7ckKJyo5zniAJ6uFIITF37lkPvZ2to9mJ6jPWOrvQHkSipKtQYmM7B
	 60oaRmmLUvT6a64D+i0T4R9uysp5xGhdGfdogiOphyp6AFJumIygYHaA7uy7sIVYlJ
	 ZyN5DfUmUNV+g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4DC541AC56C9; Thu, 11 Jun 2026 19:12:14 +0100 (BST)
Date: Thu, 11 Jun 2026 19:12:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v3 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Message-ID: <air6foCE_Zvm7JaN@sirena.co.uk>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
 <airB2kIl_R_CH4vO@sirena.co.uk>
 <air4BYZvl5Gl_bsP@jekhomev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rocmuhdBh/TN5HTf"
Content-Disposition: inline
In-Reply-To: <air4BYZvl5Gl_bsP@jekhomev>
X-Cookie: Leave no stone unturned.


--rocmuhdBh/TN5HTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 09:05:41PM +0300, Yauhen Kharuzhy wrote:

> Sorry, but your email is present in To: header of every patch in the
> series, could you explain what do you mean?

There seems to have been some delay in delivering the rest.

--rocmuhdBh/TN5HTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoq+n0ACgkQJNaLcl1U
h9C8pQf+KDxd52+WX6L4g7/fG4lTnDkRJMdZehZ3UCPJdSm0vffYqe5sNqGAj1hy
HX+AgvoloHzyjHGjILLW3V2L75x5xhlfg1cdg8KYXt6huMtDcTaDPGAe/77xne2B
6vsuDGuwpG4hoVFMeJkkO+bzTlQXf04hVlOa51ifFRZmKg023O7YYxQLA5J9/LjF
OwAfOj8j1SKuAVZtMwhBB1cCnI/Ia7Yu8icFfl/OwKR5KTun9daeY5Ewxl82Hfd4
UN6rVUslND1FS5wS+KRgQp02tcDKGYZHQN3fsZVYWd13HBPTl7UEljgMnZYjbEDW
2L77k0S5jM+czlGIvy+F59Hn/QTkgA==
=ijGv
-----END PGP SIGNATURE-----

--rocmuhdBh/TN5HTf--
