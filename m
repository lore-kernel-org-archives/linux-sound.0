Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73473FBBE
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140985; cv=none; b=V4L6GNCi0WwiQyvv6mZTuDcNTNyRswGEtFH1GINACZQzq9UbQQVwDnbIAq5zONM3OK4jeHLphO81atijzagoCWFZ6waAAFJJor8jAYZUl0d/cLU58j5PWAM87tL0QAoBQUkzVMJ1uVDlIUHu+DU+oTN+jwatp3SN53oTmyHWQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140985; c=relaxed/simple;
	bh=tMjIhEv+h3b2Ps+WQU7FV8OtoGXlbPLUgVjp/OLsuF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah2L1KaXdRCBoJ1Cedbw3zrWsMGBmTYUV5Wo9mcBDe/AJX3RvoRLLIPZ8ULF87xTNBeoo2P+8ytwr5mfbmfZ0cROluW37MT1WaL/q+xwgYsYmlPfjE5JZ2NZiWkTZDqIMI6JFAr5EXo0EwYhs4oIdcqwH23SVAo7hW0smmG8Up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBGKA6FY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBGKA6FY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E67C433C7;
	Wed, 28 Feb 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140984;
	bh=tMjIhEv+h3b2Ps+WQU7FV8OtoGXlbPLUgVjp/OLsuF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBGKA6FYaVSm3RnV9qMC9BLabmJ4All978c9MTGrsnDB+XCxY5qF3KHEiakEJIbWQ
	 Lwoz+w2xF82MxKbZf+upqEXxoVEm892h6YOTZUZqhLbzP/5mjw6QVVXGvPcqY1koIr
	 cZQuR7b+Nlhg9Mcf+nYf/Jt8mIZFopetxxtNTfYMbcjYBQwBu6V7tAHF7mOIUMEhch
	 A/S9XccJQOQsI9dBoqvMo49QQAOiTgDNTl/+qnOjDYqvPywp7W0TKQW+8JcvlUyDF8
	 zTYBHeDOMigUmry4U7c+lhnHDRVyZtOfF5R9Ec+vR2zqWcsPYNACufStwjFfRmTnhF
	 xFry5VCluJIRg==
Date: Wed, 28 Feb 2024 17:22:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 4/5] ASoC: codecs: hda: Cleanup error messages
Message-ID: <af0c782d-8625-46f7-a347-2d21df3f6ac0@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-5-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5d8EE8aWTInID7GB"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-5-cezary.rojewski@intel.com>
X-Cookie: Function reject.


--5d8EE8aWTInID7GB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:31PM +0100, Cezary Rojewski wrote:
> Be cohesive and use same pattern in each error message.

Acked-by: Mark Brown <broonie@kernel.org>

--5d8EE8aWTInID7GB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa/IACgkQJNaLcl1U
h9B3RQf/UdU0M9FMYbw47kPs/ZdpM9qN/4dwPDRM5n4ZnxN33cVWytfI7w60ysye
ziXIITDE6a7V/A587Q/TV5NO8Ie1z09zImkQ74gdR4DdbuFmMT39wQyXPRJJsUab
qrvH10h7bJ1hBz52wBw/mNeLV5/hydr5Qh5cmlR5BLc7VxXPHC2ebBPJQsqBENce
/Jr1A8+pRLg2ObR0px7sX7g5oAMorzTn/GCLYsKx3rUFxiXBHXAZjO0MPM7coK1x
HzteTCuC3mfZ8IwYgbyS5MyjCHn/oVGgruDzffetPVK2+JLdb5l4tTwcarowYx1U
xLPD46/pS22hTsY3n2jlct4koCrlIQ==
=WiEM
-----END PGP SIGNATURE-----

--5d8EE8aWTInID7GB--
