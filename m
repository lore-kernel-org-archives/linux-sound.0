Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA51917FB;
	Fri, 31 Jul 2026 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539700; cv=none; b=C1y4gRU/cNUCXmjbUwASmsxlQcz41Houc3Oo6fmHMVxX0RGT2bHYrPEsrYlXlf9y1si5i1Mr2PVC0DOPSs6iYzG/vIAWmpRij57vWpsdDgSEVAWmHawwCcT6pMJDdXTQx0amhSx1aHOT6BOeDq3o/WzfYkCtLaDv9vw+69gqPUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539700; c=relaxed/simple;
	bh=MDfZ9qBtboCe6lN9z8woFOBItAhGdfquNHFSHAT2NIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV2B0sTE9LEsYkUTtTYbOg5JEL0uFuHMktA3Vmo/1ySrgSl3fdnGSQdSRq9GMCplmMSMZs2tkrIQq6UpX/1Np8PXrtndwvFQaLYdY1oMkVgAJ3u4mBOC81l9Det80pbzgPpR5XKMSp/FY31cgDoDEFqT0NpHyEaLAlJRBLw5Jys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5zXUbes; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5zXUbes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7EF1F00AC4;
	Fri, 31 Jul 2026 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539698;
	bh=MDfZ9qBtboCe6lN9z8woFOBItAhGdfquNHFSHAT2NIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T5zXUbes6xTSwuN3uIncauszleI25G1WCGpBrzjZxiXz3yKCdwHZNN8oDjVD3dqRG
	 aVhYl1nvtgP7AGZT0NIcrmHkMCMzXXQXbi4k2J928Ztc13hsuIUv/4SIqbg9eb+l4B
	 cA/GjFzl/tk5IwrDu1RhS4VxzniYfrfhnTTK2lJpawXAIG84f33Nr9uEdJ327u7xrv
	 9lwZTLvQUql7Dibwk/ima27ZZxIBPzdsEtfDFuV6Bie3KCbC7tf/a1tG9vWCjzVgtw
	 TDDJQaICrXIPXCZN+76BbQ0+QWAKEEUL5STHgn+zWvH33WM2bVLVvx5Oq1odLrI6U9
	 vJExFfAsLgx9Q==
Date: Sat, 1 Aug 2026 00:14:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add MDSP carveout memory-region support for Q6 APM
 on Shikra
Message-ID: <97cab297-ef92-48dd-8331-71aac0b51538@sirena.org.uk>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x42DWl2VUrKQeSc1"
Content-Disposition: inline
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
X-Cookie: No shirt, no shoes, no service.


--x42DWl2VUrKQeSc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 05:05:07PM +0530, Ajay Kumar Nandam wrote:
> Unlike most Qualcomm targets where audio runs on the ADSP, the Shikra
> target runs its audio use cases on the MDSP. The MDSP operates in an S2
> (stage-2) protected/secured memory context, so any buffer shared with
> it must reside in a dedicated carveout that is SCM-assigned to the
> MDSP's VMID before use. Without this assignment the MDSP cannot access
> the buffers and APM communication between APSS and MDSP fails.

> Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
> Depends-on: https://lore.kernel.org/all/20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com/

Please resend when the dependencies have been applied, I'm spending far
too much time repeatedly checking if any of these things can be applied.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--x42DWl2VUrKQeSc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptLG0ACgkQJNaLcl1U
h9A3ogf8DQXX93sqkg38MBJw6oQNaYAgMMOmOedxMSBOQec841kbNJ+wgNC/v1IS
6r6ZSOTsD0JoKfpzB0r42dGCucGnKtY428tWtvQusQjG7nik52dzTIkZ+0/oJjbV
SsRGAUwfSdDmUH5bBEIh0zPRjsHagPQjh4+1WjJNCqpGiNjrgHN8Xy7OIqPxXVQC
GGpztK8xroqvUmWPmAG4si3jaao6yx3Gy4vkbYnPqxOdgRxcYEmTes6yC05ay5mk
n6I2N9L4q6LtakpLsxE+b01QYlnv7UAz128M83LShj41UR1YPNB2A2Mst+OiKQ/o
iSzg+ivDPZ31r+o8gicM5YENQwVE0A==
=gT9z
-----END PGP SIGNATURE-----

--x42DWl2VUrKQeSc1--
