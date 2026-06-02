Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C0C3E5A21;
	Tue,  2 Jun 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407082; cv=none; b=DN/YIgvCm4MCtS0Por69PobyCCosOGZiLr0/8V78YOINF7MI+BRiW7qXHXIg7uMDJpmPMQn+zFYRF0KOHh+auOgwhBKQ+e13dsTh12WYqZybaprHi609CEHZkQqEJyJYNzh4KwF1YKj4Ve+1J+pbzKNtO712isiu0lUt4wobudI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407082; c=relaxed/simple;
	bh=RWZiV/GCUGAe+FmL8gSo2dAl9m9xe8uTi5J7m7ExJK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsIXdQdGq4wlkWjCRPbk/Enql0Nsqn3inZMaJjehT43WrhlGoVxoGPiPMr5uHzJa0gEuVwJMSrhjISdAIFnfxvnbH8xFT8KxD9tYqR5XQ4cdit8I4SUBCIV3+Ke7XCuTDxHbYhtyApJVXDUudoKJhOJ1zILeDnTVCU5uzbD4hbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ+gCUdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ+gCUdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0521F00898;
	Tue,  2 Jun 2026 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407080;
	bh=ufBTTOsMsFtyA9QAj/SePVS6NvpfD9utL3LosUv4qNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZ+gCUdtLgkDgKPA3xVaImr5eHJc58mJJgOitOQfXxiU/rZELiJspNDL5CMqs1ilY
	 FUhbXTlu/KQDrvM2c6UE37VPz+RL7vJEnAJ9lzFLAghMKdOznIAbvicSoBQcaqra0p
	 9FXYxykPcGyEez3kcn5cz7NihMD6FD5FUsVEEdLgYlI1M8dVHuIqUUpw6B1Ib+FdY9
	 o0WcyE5dQElvhMKceBbzGcruUKN7yqLpJcESdcBJDD2+fQnrEAaWd3KQWEQMAPYJCR
	 5BPXo5duYbLEq2Nv+JovEZUxS4CrCkvBaNKLGbi0umTyJ0Oe8BssXQWa9GQ6uPiO9S
	 wMNNwIVFMrmMw==
Date: Tue, 2 Jun 2026 14:31:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Sdn/e5MANtPjvqZ"
Content-Disposition: inline
In-Reply-To: <20260601142835.282301-1-rf@opensource.cirrus.com>
X-Cookie: The wages of sin are unreported.


--5Sdn/e5MANtPjvqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 03:28:35PM +0100, Richard Fitzgerald wrote:

> +	for_each_card_components(card, component) {
> +		if (!device_link_add(card->dev, component->dev,
> +				     DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +			dev_warn(card->dev, "Failed to create device link to %s\n",
> +				 dev_name(component->dev));
> +			ret = -EINVAL;
> +			goto probe_end;

Do we still have devices registering separate components with the same
device for DMA and DAI operations?  They'd end up duplicating the links
here.

--5Sdn/e5MANtPjvqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe2yQACgkQJNaLcl1U
h9C1jAf8DOdD9+VZ03V1h+uS7yHNtsQCbwCp7kFWGcK7lv4anWv/xJpoGwfL336G
bDP6ERc9Lo7ztR1KMmedef/kF/A9cwfSsTwV0uqMBM+7AjaX3nLiLGO8VGXeeLTX
/97BrfBP2avWx5frlGyZixbvQ5+kltAmfvY52+NUBw3rD5hmN5WZmBonTO5mDLqQ
Q2H5lmhhJ6OcEIN/0G2EBpECbqs91sKWHul96fLZ5LFocIkLJE6xFX2cmPdKw8Qx
dcCu9zou5opEu4IOGD7rTZ727o5qDAeFsPr+LAHOqWwaYfGJa4F/fDcZaV3sYPjR
g5ozeDQNI2ee70JpXP4fwSs8XZ71GA==
=4OIJ
-----END PGP SIGNATURE-----

--5Sdn/e5MANtPjvqZ--
