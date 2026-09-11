Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D045561A
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160513; cv=none; b=myh3iujk5DmC8ciWrmFjGSZebEnxxyv1CkDijlgSYsc7lGEIlaIrWF6hkAaeMBYJk3cDiI8admWoow7tx8CwL+jENVjXs4JnOEbagOX+XkmNKSL1c4Bx4sBmCSHnT7zDpbE7/rJLqeSvhW7kurzSf8JtKyLGMG7IFDz6auicq/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160513; c=relaxed/simple;
	bh=eX/Wm+NP2y8XJnxM9Bc0J9a3XNV9cT/RcCEERlpSDKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCbM9ZDNlOAeut3XspLC6XBzFzNjvGxi5mi64VD1hb85qL3T3qZxrYfUw8QLiNx4WRCKbC/2Y4EHkPALFVpszthKtJg/9FDDesA1xdNSBf2AaP+J4zTsH3QzM0HlhkN1wR7i6W1VVs7etLG/l+djMjgfK+2q3WXIIM7xHikcB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgTVnNZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgTVnNZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E908C1F000FF;
	Fri, 11 Sep 2026 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789160511;
	bh=VQuFCu7JyeRp3NVvUYd7/fu1UUZWwF5O7UXI/3DwdF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZgTVnNZ+t4F/vssff/45byFo9r35X8bVHzBw3nnjtRyUf4dPeOesRO6oHzZotSXYj
	 o/9usvSTC3MqsxWFbJCa44CHkAz0F8OxvXFvrBUYhCChTxb8gSTFaI9p9xzGhP+HYH
	 QNdyBI2ZIjbFjLE7K8XpJ0/nb/7EnqM/8mVFXFUXXC0em/AWUDPywf/ueyAwoJY/IT
	 ++YNg32uUDFYXs+70BfwUn+9eT0Jg2cJcCtkhHOk3plqrdzZVVrpFlaqoaAHXiIv93
	 QTeTtlSWrFuKRi7OC1hL5tt2ui+AHVZEIaEFPRf81OF/CrfBhSmM+rCKVlqlY4zxyj
	 l+csr72rHC70w==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 6B6D4DE429A; Fri, 11 Sep 2026 22:01:35 +0100 (BST)
Date: Fri, 11 Sep 2026 22:01:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v3 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and
 CODEC_INFO to fw_config_params
Message-ID: <aqRsL8fZercsabgU@sirena.org.uk>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wLGAwrfhWrntZgKz"
Content-Disposition: inline
In-Reply-To: <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
X-Cookie: Orders subject to approval.


--wLGAwrfhWrntZgKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 02:21:44PM +0300, Peter Ujfalusi wrote:

> +static int sof_ipc4_query_sof_info(struct snd_sof_dev *sdev,
> +				   void *sof_info_data, u32 sof_info_size)
> +{
> +	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
> +	struct sof_ipc4_tuple *tuple;
> +	size_t tuple_size;
> +	size_t offset = 0;
> +	int ret = 0;

> +	while (offset < sof_info_size) {

> +		tuple = (struct sof_ipc4_tuple *)((u8 *)sof_info_data + offset);
> +		tuple_size = sizeof(*tuple) + tuple->size;
> +		if (tuple_size < sizeof(*tuple) || tuple_size > sof_info_size - offset) {

tuple->size can be 0...

> +		switch (tuple->type) {
> +		case SOF_IPC4_SOF_CODEC_INFO:
> +			ipc4_data->codec_info = devm_kmemdup(sdev->dev, tuple->value,
> +							     tuple->size, GFP_KERNEL);

...and devm_kmemdup() of 0 returns ZERO_SIZE_PTR which crucially is not
NULL so things that later check that codec_info is set see that it is
and try to dereference it.  We should probably also check that the count
in the codec_info isn't oveflowing the buffer.

--wLGAwrfhWrntZgKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkbC4ACgkQJNaLcl1U
h9CzDgf/YFo20NITuu5z0hhmkVXqLszGHBqHNFe7Uix+9uEFvU6uI+3vXIVBsBm5
mW87WW/eFw7TcSnnds7zDwhmvU5/aJOdxY0nwl69CFH7cVOwf39K8uYEk45fc7v4
e0qAA6zMks6WLdiiMoVvMVZS6vAJF3SxcD6phJVcdqzXUFcMg85cQjUlLe45WHVb
Y/b06B/dZ8s/tx7qQaZtQa/E/8Hzn5FJeJCoDpEZbvjk7hVT1pr1KsJJN8xGmXhG
ShmI6kTGH+x6UwCRXmRsPuOdeZCCtZCELBQfAb6/26d/l2R9x5ZjDkNlpgGAELlq
WsQDbH5z/h8qMc5fev+qnfLOeCsqSw==
=mhDU
-----END PGP SIGNATURE-----

--wLGAwrfhWrntZgKz--
