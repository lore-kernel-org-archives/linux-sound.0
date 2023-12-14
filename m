Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD97F249E0
	for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCto4tIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6ACC433C8;
	Thu, 14 Dec 2023 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702552323;
	bh=TZ1vRXqDptocYRDVGwkp62YEwPxCdg9ggzn/jKJtTkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCto4tIKs4RHUeT5DSunbTCDcENsTdfoLFS4ipfkZ6kOsekcz2jCh3YVVbaIaiJ9Y
	 /ARs6Ymr1+vbllJvvtj7ZHfRhhCY9rw33GUV0xZshRhPkz+bpOU8JMjqne68o33oug
	 EcsD4YcX2EYyAqV0pMZKEbkWgwGyIrNfG2Yp7SX6p7SPD1cIHtxhnYA0pWPVrtxdv7
	 H29UX8mp+FwOlnh8A2Qx+Jv+EtSdCphfFPbjmSrB/wwo2C0RAHjBWObPK8niZg7fNe
	 t6036iKGMjpmcI3NYQ212rs6FdvPUwmufO0yMzbhNK8fTAZP6UaCDJXRcju80iEi8O
	 Dw5eDnNMowzgg==
Date: Thu, 14 Dec 2023 11:11:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: Re: [PATCH 2/2] ASoC: SOF: ipc4-topology: support NHLT device type
Message-ID: <337560f8-94e3-447e-825a-6a3d916fcf16@sirena.org.uk>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
 <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8UjZ1pKW2iNdRUe1"
Content-Disposition: inline
In-Reply-To: <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
X-Cookie: Preserve the old, but know the new.


--8UjZ1pKW2iNdRUe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 02:06:57PM +0200, Peter Ujfalusi wrote:
> From: Brent Lu <brent.lu@intel.com>
>=20
> The endpoint in NHLT table for a SSP port could have the device type
> NHLT_DEVICE_BT or NHLT_DEVICE_I2S. Use intel_nhlt_ssp_device_type()
> function to retrieve the device type before querying the endpoint
> blob to make sure we are always using correct device type parameter.

Acked-by: Mark Brown <broonie@kernel.org>

--8UjZ1pKW2iNdRUe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV64v0ACgkQJNaLcl1U
h9DO1Qf+N+1u2arL1wwjXJMSutWkreFnWV4qGzay46WqEXsYk9m+NvqBfKIp9Qpa
ZktGdZoz9hzMRLbATzqBYME6YosPniWO/p04r2eeYSI0x8wO67LGVT13dnciW1eR
9Dk8F7Jk2rKfj1Or5y0yOej7CMgWXH+6T6zUmlOdzAHJTu9sENaTZlSlSDbscyIw
Ft/3ClozxWeKWo27yTLTHA2+ofuQCTc9pxbj4GCT/UvYpVxIDnH+tvY4roCQ1hak
cDk/VG+FWIrlfFdMiREh1aDEm2F99m/PZQ6ZvsKgJEfoX2Bc7P5snSWEP+0SOXdx
gnfwbTOPPCLxOmpVThFNIgHzcC9Vgg==
=07ia
-----END PGP SIGNATURE-----

--8UjZ1pKW2iNdRUe1--
