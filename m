Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19203B4EB1;
	Thu, 30 Apr 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546533; cv=none; b=Wg4PMAz2rWwJ8jCnDy0TssRqr+cg/kcYKoAohjSafv2VZm49sRh+bxfSi4x3aQh2EpZ0fWSLozkq3BEat0XWX7k5CdToxWra4ixW75rC122gC91Ux7Z/ya3kn/Sxzus1zktAZIpGcfpMvgVgZSUYGIsetHLLtUfTVp1EJuPLD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546533; c=relaxed/simple;
	bh=1oO40JLRKxec4YkXCMkvg7w7tFWbMAVrhomR9Bf4kUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9uy3ey67kRz3gPKYBm0xvmEdBbnPMQCBV7czGY8VdNLq5n5kJo7teNPKq5BWv4FadJ1A9yC4/RlFz/go88Km6b9BMX1GyxYq7wyAucDYkcwa8JP8bSMBwjZn9e/dQaJw94e5eG0gbXxIBfqlyRK6Z14f+Pa7q4hJjNDokEPE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOLbwzNI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOLbwzNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91325C2BCB3;
	Thu, 30 Apr 2026 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777546533;
	bh=1oO40JLRKxec4YkXCMkvg7w7tFWbMAVrhomR9Bf4kUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOLbwzNISeZqhh4jyU+ZqDAAE45xaQhcS/RKaQ5A80sC5lquY8o3N1ZL3tkosnUnn
	 w8ZY5UnOzN/UPBleE1L4Cz7i87jKNR8kGSXBLM50JISgzLbLSN9LacBMrNy45wF3gC
	 8autyA5vry9p0gPHYNZbPJGosHkpz/74p0nI8Sxw27k9FbKa19d5YpBXrqZrJ4a8CJ
	 pWwKMql1Wz9yL/r1COXNmJtv5uaSRPQJ1J3d8Or1nbWpX+LQ9NXLKXUOqo7n/V4ZnF
	 aUxczWc2tKX9Jh5AfOOednoQruQEzgM26zdlywTGHSpHk2iV777uCDD5NwNgHfZnoI
	 Ns3tPwyRE8lyQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4CB2C1AC585E; Thu, 30 Apr 2026 11:55:30 +0100 (BST)
Date: Thu, 30 Apr 2026 19:55:30 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Message-ID: <afM1ImzBB5lsueUa@sirena.co.uk>
References: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
 <20260430102120.1283320-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7IdQpDZWcSvwOAt"
Content-Disposition: inline
In-Reply-To: <20260430102120.1283320-3-ckeepax@opensource.cirrus.com>
X-Cookie: 667:


--d7IdQpDZWcSvwOAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 11:21:19AM +0100, Charles Keepax wrote:

>  		/* Parse the function */
> -		ret = sdca_parse_function(dev, peripheral,
> -					  &peripheral->sdca_data.function[i],
> -					  function_data);
> +		ret = sdca_parse_function(dev, peripheral, function_data);

What sets up function_data->desc here?

--d7IdQpDZWcSvwOAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzNR0ACgkQJNaLcl1U
h9Ahrwf/TB5N5CvT31wAhrFARqZZ03kkv3fvhyzrzbIvMghT+h7DZ2FIze0lM2k/
jHuTEqFykKmvQ92D3F34c1zhb9fPNBWtCWBMNkpT0XWPUTpAPT4uWEWZ0P7foFgv
Sn9opthfy4oWCkb5982+/Gdcby7T3OIgm+1/bgI5wm1SNPyRIKx43gxxjBExoyPv
tfkt4GnSDIgGHGepjrBUIcdISp7TD2VLr0SYaeDMlaSJT5ef8CenP4qQ0E6NV8eZ
8ndzM0tMwNgGd6FzhfljUT64S17bZiB77ZvKCK25vwT0vaz9wrEhEU2YsAobifdG
pktzgQteYeohG9vcVlqyQUxEZidf4A==
=Pvax
-----END PGP SIGNATURE-----

--d7IdQpDZWcSvwOAt--
