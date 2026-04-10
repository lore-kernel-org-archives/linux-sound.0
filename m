Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3112430FF08
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828937; cv=none; b=Pi8AvgbMy4OqXinxB3yjMPJnecv5ryjqeXMqPkrc0VfEfW1SVDiNmj87U4+8HB/T9FixpghIWMJIZ1coaCMU+6Tl0jlDGv71GJX4ko03XQadAHmP+lSVxbVtnDG8R5qcoutJI5Q7xpH++/u45TQ1lBR6pLpD7ehcVDON5rQ8pUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828937; c=relaxed/simple;
	bh=cYe4GnfmiMXSc/aoZ5QBisjYMUMz+XIxbcTq0+wpZ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkdngcUUUD7/CqzkaiQr/ETHXM0qsyHze+76uP3MQaWAd6VFx1LIP8HAV6xcN2ZC2ePXJkRP187hQ//5AIsehybzNt43i/2SsljSV6usEwvSK8Md3j6gngH7qn1V8Pi7f5dGG+j34SOrq+bcq5y679DR9DnVCfx5fWuYubOYfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhYvmLDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhYvmLDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9695EC19421;
	Fri, 10 Apr 2026 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775828936;
	bh=cYe4GnfmiMXSc/aoZ5QBisjYMUMz+XIxbcTq0+wpZ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhYvmLDkjK1QvfxuiwD3xkp96SLAedfn9vbYkvtKSWJJHtX1H9lQG4fxinRBdx8IU
	 NsLrZMKcvJkuZDDVrJ7WlI6K5ftZ5M/zmU+/XzkmhZHLmD1WVNQEL69lobg2vnH4bu
	 w5p4IRVIWV6XmEny1/XGRCbfD2ezmzT/+n/h5Ml0lmoRdpl0fsEWwHyF2mjJJd6ERc
	 HoYhJjtxr/9lAy40r1Qz/9jFZwvEzx+H+IR6TzmPosHvu9ERjB7N1ZKx8REUuCjWUe
	 rO4gjlXW0L+tuYIyX11JKnTdP6pVm5J0v6Z2wRsWVX2YeYEUbBrwbZfeJfzC131AVv
	 OrcwtjZDGpn6Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 077C61AC58B5; Fri, 10 Apr 2026 14:48:53 +0100 (BST)
Date: Fri, 10 Apr 2026 14:48:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v7 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <adj_xa-nA4KZ5Kkx@sirena.co.uk>
References: <20260410072441.6111-1-zhangyi@everest-semi.com>
 <20260410072441.6111-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Ey7goyd58QWUOck"
Content-Disposition: inline
In-Reply-To: <20260410072441.6111-4-zhangyi@everest-semi.com>
X-Cookie: You will be divorced within a year.


--+Ey7goyd58QWUOck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2026 at 03:24:39PM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.

> +static int es9356_sdw_update_status(struct sdw_slave *slave,
> +				    enum sdw_slave_status status)


> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +
> +	if (status == SDW_SLAVE_UNATTACHED)
> +		es9356->hw_init = false;

Should this cancel the work associated with the jack, if the device
isn't on the bus any more we won't be able to update state?  Might also
make sense for the device to be cache only...

--+Ey7goyd58QWUOck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY/8UACgkQJNaLcl1U
h9DlKAf/fSdeqRYQgpYSK6+21REggkHmMGlgu1UWECMTGt+OO38vCDbGkdWaCKoK
voGXkeOLjI/NjuetiggucrzGDrgrJ10B5I18lLSbo5OYaz0XWc+A8XggDjKp88Wr
0TQoNhWyZkrBAZqCbCnasjXonhmEmyUSXqPW+0CUmk8rqkUDaVH6ZgFqY/SMVaeY
vhrwiP1MthMhEFa73vnwBnnT3iRVusJgBkDawBEQx4QaVnRnKPM1pAECgdidl9z6
tWw3ULeh/RL6WZkMhymZdIoTWtHBOi29MQ7+mU0bXstktV72WTIf8pn7YJvH+oLM
o8cEAuh6mRzc75HfE4LldT0c2kRk6g==
=JXZi
-----END PGP SIGNATURE-----

--+Ey7goyd58QWUOck--
