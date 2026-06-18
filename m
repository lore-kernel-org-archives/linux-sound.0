Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411751DDC1D;
	Thu, 18 Jun 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802519; cv=none; b=mrsFfxZkLxCs1TlxohcrkaO5wwU6LD1wePE7hgJuOUG/9IerLDsYwPsvdlsMKa6QY12pqr7o+lYgk2mckUItC+bDw4O/f2FZxVrOLP/RVdbCYwSI38zGhfKVSl8IJMjI5mM0qedKHd/4JntmhFbbXWInpdKi27gY1QTe1a4uiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802519; c=relaxed/simple;
	bh=EVU6bpqhVabSrV5+UZ8+JLzDwOlD3Bl85OauS8nSDFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8dtI3YcC8rDERKkxT59QpgTHNBxpa1XWV+RbLmygD0yuWOwnPDg3EYzOf/0AXsqUJEHmC1NgoGKKjFMOToa5hG/hvM6GzLMvATCSWYzTXEWfdN6vJXlGo36S+H68u9fsdNeQKj6WSitW8aG2YqfAmeO2RHeeBxoCZsQ8r93nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOQwBfD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOQwBfD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35101F000E9;
	Thu, 18 Jun 2026 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781802517;
	bh=iZNX6kpVS5q024HVT5sgWl6HEevHLseNsrQkGaAfUuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOQwBfD9JgH8mbd2fJEaoGfOo/GwBy0FV6yGK0tGMxp5u0moqApG41bPS+4wAqzVq
	 tql+09CFzP+rNUgNIX4DsH5Zu44iU0mQHqyv4mVndDvm3WZUq0OAGsNPTRVeXbnpLr
	 bhFXYVkIkvj2PhNCDOekSr4IOjKpDAhv+JwEEfl48cB0ZTHZeiiRh08kXuNe9iJZNo
	 qF6+SaRTGnhRrphR0A9niai1EaED/XfREaHLCi78z0eHQOCsejOlYMN9wA0qvfgNyj
	 sjYE948yctSyPswXjpmv16Z0zmLW5TsuAVCBtxgG7xytq+XlnHsTMshHW3gJ/rOyCx
	 yY4yvRjwKcf4w==
Date: Thu, 18 Jun 2026 18:08:32 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: Intel: avs: Use scoped_guard() for scoped
 locking
Message-ID: <a3aa032c-a106-47b5-a90f-62e99e788641@sirena.org.uk>
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
 <20260618110649.227062-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TRyUIblgKBltruib"
Content-Disposition: inline
In-Reply-To: <20260618110649.227062-3-phucduc.bui@gmail.com>
X-Cookie: This unit... must... survive.


--TRyUIblgKBltruib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 06:06:46PM +0700, phucduc.bui@gmail.com wrote:

> Clean up the code using scoped_guard() for mutex & spin locks.
> Merely code refactoring, and no behavior change.

> @@ -338,21 +338,18 @@ static int avs_ipc_wait_busy_completion(struct avs_=
ipc *ipc, int timeout)
>  	}
> =20
>  	/* Ongoing notification's bottom-half may cause early wakeup */
> -	spin_lock(&ipc->rx_lock);
> -	if (!ipc->rx_completed) {
> -		if (repeats_left) {
> +	scoped_guard(spinlock, &ipc->rx_lock) {
> +		if (!ipc->rx_completed) {
> +			if (!repeats_left)
> +				return -ETIMEDOUT;
> +
>  			/* Reply delayed due to notification. */
>  			repeats_left--;
>  			reinit_completion(&ipc->busy_completion);
> -			spin_unlock(&ipc->rx_lock);
>  			goto again;
>  		}
> -
> -		spin_unlock(&ipc->rx_lock);
> -		return -ETIMEDOUT;
>  	}

This has a goto from a scoped_guard().

--TRyUIblgKBltruib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0JhAACgkQJNaLcl1U
h9Cj/gf/fbHzqt61+KxZEtXZEjNx/7hYRt2RupvrL6Sh/mPy6Xv2N5VK9LWa4Vp0
ZZpa+45liRuVa7ZRvzWUVlcKl4dVq0LFdrsK+qAGY29bjOZD7n7gqVtTt/qd1T8w
jxVLY4XaWM2Nlv3loFRTYpyFzr+L/mVqA1jGzBOSiCA2fp3OGht0mBMfv7rv5Q11
WRv3nIQrmDFP4DYbK8h09tWm9kHUPQ577ZPqKvxrfY2wHR44FFvbvowCoIorOd9e
RyOy5pP/dmwe/agjD+1Of4CeqA7543sOCTLTNgHalEg1pKq6SKS06kWu4g8QGEnj
NOq14oumQSWM3jQgyZKZcZQIt6xQHQ==
=cni6
-----END PGP SIGNATURE-----

--TRyUIblgKBltruib--
