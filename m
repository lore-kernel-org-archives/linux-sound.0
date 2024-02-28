Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596215A495
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140959; cv=none; b=kFoIiqsIQaPJu2tvJGYaaeexRx4DPjz2FJwy6lU1aSYUt6VHwVEgD2tChNj+0bgny82PMVoBH7gt7ssnQH4RQINydGH92rjmd/B+6xOuus9vPP86x2Q3C9Q/bM9q+D1NeW8Cxpj90wKPSNbziAnrWiAI6LaKWBZOz8EH1jiSf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140959; c=relaxed/simple;
	bh=evNttuUon9tazsxXMKIkVG5dhOyYfZ8Y77/5OFQehaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHLmk4dlEJk88Ik73LbkzDbvkFcJbG2DEaluQ9DdqG0cyjtB//Coi5XrOpKF1alPwTY5XEdFCctfOAnbdJrDChw0HJUSG3SIymWDWT4kf1zDGJGSSuWG9qNP91k9qgMY0j8USUzB7abXOfOP7+QvD6leQUAxTm998J2FF/8fP8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s08hT55s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s08hT55s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED270C433F1;
	Wed, 28 Feb 2024 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140958;
	bh=evNttuUon9tazsxXMKIkVG5dhOyYfZ8Y77/5OFQehaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s08hT55saQcImzVbA/nOrLPJ81PDdmdEqxrRsCDnGEUqVZjp9wC+CjyzvQUEzAssl
	 MVIGIWukJrhTryxVC8yZZZFVWC3gLdtE/d0qD3z/QftuBbKPSDgua8LDsTK/rfRtsl
	 dUt/7M/K7/JQjpRysU6kmIcGWn3On3u5p+NFGOnineflpS8HL4Mi9iUB2+djrsbU8/
	 APcPiVMZPbcQJU4PRFP6dJHMp0958yP3u12xOcMaZrmKnH39ivNwGXo9wWDNTttsiH
	 emjT3VgOXN6qZkOozt/1/kKGx98I7clto+Kw+BPW7N80Hrz/98EqNgK+cvrrpJuK4K
	 2WXrxjOGTQkMw==
Date: Wed, 28 Feb 2024 17:22:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 3/5] ASoC: Intel: avs: Ignore codecs with no suppoting
 driver
Message-ID: <d7a5c567-b085-4eca-b12b-ff0626116b5f@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-4-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pfFywTWBH8wMNQLq"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-4-cezary.rojewski@intel.com>
X-Cookie: Function reject.


--pfFywTWBH8wMNQLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:30PM +0100, Cezary Rojewski wrote:
> HDMI codecs which are present and functional from audio perspective lack
> i915 support on drm side what results in -ENODEV during the probing
> sequence. There is no reason to perform recovery procedure e.g.: reset
> the HDAudio controller if this is the case.

Acked-by: Mark Brown <broonie@kernel.org>

--pfFywTWBH8wMNQLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa9gACgkQJNaLcl1U
h9AU/gf+I3nstWc8uH7TGRyZ4L+HznVtBLiaeJINkFfzFFNX6FdxdDY3JEMvitjj
IR/v0m9u2n94Z8SmE+T2dqKhdOD1ARfxIwHPZ5JoxCn0RBj/Lo+7M4qLTo2xzSzy
czj9qzLOAgIP4WNv+XVcZ8CVRfv/nSvx/ZIfM0K8+dz0aqjTLMMSTbZ+vxlkM42D
wLkMI3M2pp7J43ltS5ha7qvehHyQ/7P1/BC2TxQp6p4z+M4hGyTu6Glru1KE/nDz
QCJJ+z6FnX+Q13Fq17aD1lg2xbjixOcrDWgDgb16dhO4tpzXoP36zRIuorrl56og
9SxnRsI8090hDwXKMVXe5KIsO8bOGQ==
=KbLi
-----END PGP SIGNATURE-----

--pfFywTWBH8wMNQLq--
