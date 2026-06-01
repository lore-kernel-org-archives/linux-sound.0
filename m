Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D81B29CE1;
	Mon,  1 Jun 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335774; cv=none; b=BfjByWopNgHD3TORCBNSv4iYQE+cN9QtZq6VzkXnt5B/oBen725Xn9Wl0FMaJdIXAbYkmAFfwBnt/YR+c3DQ63WJFZoArnbo5E4+XnDCURX/BaPvridAUwXYctaf93ppJHrJEQ/2RolFQcbZRZNeYEsICmksqWVLezMphVkLND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335774; c=relaxed/simple;
	bh=YKq1Wkvtl8T6KgU/IVHfFlS1mJnIX+yxPnxXtN3Qsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3BJ8qNvXY5DsM3xpl/UWbAAH6eV1Q4E0VjGSUCAqO8+a0deWyU/n6cvp+LM7P+6uoFYJ8s1Jga8sAjGx6RiYzsu0Dq/x7rtQllhOW0PZ8YrWLR7NdZKjIedx1WA7acZig4B4VTfsTJjxR1iMCirSkBpj+ZHx5nQB5oePUNJMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb/WQ9/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb/WQ9/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EF31F00893;
	Mon,  1 Jun 2026 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780335772;
	bh=93BgDiOrb8XN4p4uvh0Ctu7QUWqlwoz4GHtTc8dGf7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sb/WQ9/vD5A39BH210hn8lsVytO4oGSORX0dbQwLgOEhCJNxXjCjq0SzM/lbIlVA1
	 8b7YLk1S9Uy8K5Gy13H3QW8Jj5ucd+xT95LxpKQlvxea6zR/STlCxWSkGNZ/2eIDGN
	 arw0hEjRjO69RkLodXZW3lLQP6PolILCdDGbHrA1LeT5PipzP0tu7g290k+X+0epWr
	 0wlrmBl5G6n4UWIOIVqHasavSHtp0HLwAq8eoSgsoMW7A2g3W3iSpvpPXLpwFeXIZG
	 SV9M66P3kacWVJeH+uuXUYqCB334OOl6B7H8WcK8XuTFHuKnLCYy1DePvJxgWOo4KN
	 deDxIHXVC/2og==
Date: Mon, 1 Jun 2026 18:42:48 +0100
From: Mark Brown <broonie@kernel.org>
To: wangdich9700@163.com
Cc: tiwai@suse.com, wangweidong.a@awinic.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: codecs: Use sizeof(struct) for aw_container
 allocation
Message-ID: <27239f86-ccf5-4823-a6a2-5d18edf7393d@sirena.org.uk>
References: <20260601072553.150487-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rX/XlxdrtDo1Q6F7"
Content-Disposition: inline
In-Reply-To: <20260601072553.150487-1-wangdich9700@163.com>
X-Cookie: Have a nice day!


--rX/XlxdrtDo1Q6F7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 03:25:53PM +0800, wangdich9700@163.com wrote:

> -	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
> +	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev,
> +				       sizeof(struct aw_container) + cont->size,
> +				       GFP_KERNEL);

We have a bunch of helper macros like struct_size() for this stuff.

--rX/XlxdrtDo1Q6F7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodxJcACgkQJNaLcl1U
h9DJ9Af9EGAMRoEX+j/ye4eHzEDyXa+yBULPYcQuBNQU6fb8ecPIaQ6eLFU5P8gb
FQQeIjoRB9xfi73MFAyX59T0TfI4/3AweZOwWWemLDxtjmDnFRQ7UUxB7s419BST
pQ2p830shQWsJn8nQNJ0Fs/CNU8Uh4GO0TszAjbueP7Vb9pIn147FHYvNIBdzhCD
nhTJye9BipXvnHvhHTYgMvZ2l6QKonGErAoCMRceYFTx/GYmOCykviG5dQL8xfr+
goespdM+rLtmfu2/IXhaCeb+uOvOnMJIM7GKqJjVs5jLedn50jQH0PXcv8VwQvO1
Ny7scpEd3Jfvr5G97D48K5cyyRjGSg==
=GQWH
-----END PGP SIGNATURE-----

--rX/XlxdrtDo1Q6F7--
