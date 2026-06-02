Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87B2BEC2A;
	Tue,  2 Jun 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407236; cv=none; b=Afn9PyzBs1JQ56eGQnOx/hlFj1G5RaNYNXV2SgxcIii9iIQglg1NXM8zfmcU9UVLWa6RHO71mEg3SUpXwBzL7JC3OGUOGa/FACUaD8cUcdXN16TKwTGiZ/2YJckWFIjjtcMFrHo5HKz9O1F3/dSWtox9Y1p7mUyupeneIZlFE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407236; c=relaxed/simple;
	bh=rhdXLednkX3ONfL2hQGgxcNfqyaln2f1heeqacB+WDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIvDH8EEBjhnXWeSWFfnZBzZ5DxJiVS/NgWkTzeJXQBGe7CzrmAeMCdxgh91/fOHj21RqTaxoEip9hP3nc/EE9lJLBkohpj8NK45Md/cEJZZHRKuWamk6BAbsRp3CbO1NLxGBHyC7g+JCOnHugV2mVh1xQz2+6rGA6MvxPPN2fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg2nj4ny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg2nj4ny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB831F00893;
	Tue,  2 Jun 2026 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407235;
	bh=rhdXLednkX3ONfL2hQGgxcNfqyaln2f1heeqacB+WDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mg2nj4ny0aiZz4RtOFtIbtZ/JusBSru15sPXZH5thyX3tLD/bLPNs2uXMztY3hJsM
	 bi930m5Prp4pEhWDcaVYA7EqvMebwQ/+wzS9zU2FcS9kPB1KOPHTCNyNEAJ9I0cg6D
	 cwMhc4vUKKs5GPshtYvEcHXpoIHtirGSjVkTnGE4rYH4HWyY5oMaDhsJRL/lLkhMCz
	 v1X0tw81Kf2BhuorHmHINQl7mNsB64OIL41VkK8TMDCG6EDc4bNCbkdcv4r0a6DmwI
	 Ibckfo5H/JfKVZf8MhQMxNl3sgfl9WI1STlf5fHIIulyaOPeOrWlVK/EFTlYsVkR87
	 JIZy+Ww9MhTIA==
Date: Tue, 2 Jun 2026 14:33:50 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Miguel <jmiguel.ghp@gmail.com>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
Message-ID: <5aca8129-e930-444b-a0cd-200204c3657e@sirena.org.uk>
References: <20260601145158.4113-1-jmiguel.ghp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o2FCuLlfVno/05m5"
Content-Disposition: inline
In-Reply-To: <20260601145158.4113-1-jmiguel.ghp@gmail.com>
X-Cookie: The wages of sin are unreported.


--o2FCuLlfVno/05m5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 03:51:58PM +0100, Jo=E3o Miguel wrote:
> The MSI Bravo 17 C7VF routes its internal digital microphone through
> the ACP6x. The machine driver only enables the DMIC for boards present
> in the DMI quirk table, so on this model the internal mic is never
> detected and no capture device is created.

This doesn't apply against current code, please check and resend.

--o2FCuLlfVno/05m5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe274ACgkQJNaLcl1U
h9A8rAf7Bn2EdNSgm5MVlSSSrFG+1VPRz9kXToiXOJngAuX7vAOMNbWI1+xAdsaM
EC/wmphzcmeTXCzMVk7r0gMiJf6gFzJeRV+1gS4SBkDvQDhYtx4NYnIjIKsxfcIX
NBMZMYZ8upSr1ZXGnmwHn/Duq/shNQyBjJ+UFI02xCfz/ZNCMrxOCRxGdJpRQS0Q
WTzH+p06v/lNZeiZ/2pTMha1z2AUhgGaxN8zBAuns6PSJxjkdxYwtDwlWxDL1AFA
Be9UrNj3ofed62ma1H1GzkI7SF5bzUOrw68XOH05NNLVR+TDWXmgHYdnQ4HfWRJz
08CV35d/DYz7QEN8lDMN70TwBbLq1Q==
=Kn+4
-----END PGP SIGNATURE-----

--o2FCuLlfVno/05m5--
