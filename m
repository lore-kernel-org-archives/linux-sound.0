Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B330BB8C
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883154; cv=none; b=AT/+L3o+W3sLrjjPDSDLzvbp5ktgKVbiP40Su8QNWMForMPY/M1/SxkZ1OSjlurNlz5VIalrZlRHFSuEgABRo4KJVGjPrYZc+ONTkhBwvySVF0q3Zu3u/aes0IfRkS7BcchZR2UtTp5vSV6AVFzGLO974lNK9KgOkYkURnM/lwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883154; c=relaxed/simple;
	bh=wXGGNNk9zLzsK3zRjw2+KcoOTiVE6qjTeP5N0RBP+W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9ndRz/6qmpMixT/O4BtLFcpDke2sAcgtUZDajkT4W4FGrn1LzJINVZTdGGqlrnPJzrSU+TvaY48AFK9D3c/gQQ/k19eZf8vW3LO63YCOuP/4jXwNeuttVt9x0lnb+bViVTHNI5fAmQY1M6wtoJPJm0XRQ+V3ouAyoDXu3mw0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P462b7Uu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P462b7Uu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9351F000E9;
	Wed, 27 May 2026 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883152;
	bh=dK0nB6uBO5FjR2n6/5baEVfN+cVd2uExxpeqcAz3k4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P462b7UugJlkQVagDupk+OvGDlg9ms+7gHM8tAKFxMxRJq5GKxjZMmL5uAXPdIkKP
	 BKz+tB57xn9tbTqLHIjIlVKYBjDlEg9tc/Z1AZIqedtgWF+Jqkj8XECeRnMZDsxMFU
	 hUf7mFs7nbjUBvO1gF/cwO2n+mfdVTZ2fZPDpIXjlg1kMc9WRi0H0leqhbhm34Kkxn
	 KHJcZTllGU+9AoiGBp83v3ICCzFa6ER5U0yrzy3FuBgEz8GTrlwyurkTt+mjAIusPW
	 jKZehEnxHcQXwa366s9oecnz27IluVAEgjB9h49ys6nsZO/qweVEIkmSv4WZArIun8
	 WecQg4lnuVPDQ==
Date: Wed, 27 May 2026 12:59:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: Intel: catpt: Complete coredump handling
Message-ID: <b9ef2ced-b489-4804-b0ab-8f5e9e52336c@sirena.org.uk>
References: <20260527094707.1432195-1-cezary.rojewski@intel.com>
 <20260527094707.1432195-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbklu0QF/W5uLIlW"
Content-Disposition: inline
In-Reply-To: <20260527094707.1432195-2-cezary.rojewski@intel.com>
X-Cookie: You are fairminded, just and loving.


--cbklu0QF/W5uLIlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 11:47:05AM +0200, Cezary Rojewski wrote:
> An exception may occur during the firmware booting procedure.  In such
> case the firmware sends COREDYMP_REQUESTS and expects the driver to dump
> relevant information and finish with the COREDUMP_RELEASE write.

> To distinguish such situation from generic timeout, always signal
> fw_ready completion when a coredump request is received and translate
> it to -EREMOTEIO in catpt_boot_firmware().

> The "FW READY" print makes the success clearly visible even when
> the event-traces are not enabled.

> @@ -536,6 +536,11 @@ int catpt_coredump(struct catpt_dev *cdev)
>  		pos +=3D CATPT_DMA_REGS_SIZE;
>  	}
> =20
> +	if (catpt_readl_dram(cdev, COREDUMP) =3D=3D CATPT_COREDUMP_REQUEST) {
> +		dev_dbg(cdev->dev, "releasing firmware from the coredump state\n");
> +		catpt_writel_dram(cdev, COREDUMP, CATPT_COREDUMP_RELEASE);
> +	}
> +

Do we also need to do this if we fail to allocate the buffer for the
core dump?

--cbklu0QF/W5uLIlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW3IsACgkQJNaLcl1U
h9CEQAf/TQIxqW/5ikiX0A5Rbltaq6L4grZZhWRBg1urd+nfcGw4zONWAPIbxhJ5
xl33n3MR3HqSOet6FY96q8EKXalveZKHkxk3xJfup/KBLnKZivAdjtHVGha18+jE
pTcIZ0adiy3aOs0Dv1rQqSm3XVBRCIPpzRAqP6ej452aKFFcc7Lc7s4cvDMm+WUh
2z+njpGVdSE/2tTwxqWnr7UoqWHirM/9j4NYRK5Fb8r24TodGZ8fgYF/2O8upgOL
oZs+/KAzpBkVBur9kPXzQj1T05Uj2evR0jtrGZEibRhy+p749y7EOZyyjmqEZfYu
YNtUpQOoJQSC10vveugKzZhyubflRg==
=NJ8B
-----END PGP SIGNATURE-----

--cbklu0QF/W5uLIlW--
