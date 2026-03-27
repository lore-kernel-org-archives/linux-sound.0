Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA337757C;
	Fri, 27 Mar 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631754; cv=none; b=qnxrxgu6uIpS4q+W6YP2CG3NgX8uASyTcVALXdiwazwMX57fK9AIn14ApyC8/Tbras6Ut/ML00XcqEy5ekmwcO5h4RTy7jESU0Tr359RLi2rszJPK7S6F9rwKYyJL+pYOmFFGko9Vazl0Zgm+W6cKYRm+iQgoZ482T0m39GJ/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631754; c=relaxed/simple;
	bh=rQL4KnZ+zSwucHgLfZ9TG2UzaVxilQ9pNZ6w2Zkp1NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJRYOIJ3Rq8qHHm2Q06iJP6yd0FXxVpnNvkra58flHSni4KWV5Vc4QY7k9u3mu4/ouQStFqMRjFMlAP6CSx1tPu88G6boIk1ov53LrvAYBu6z6PSbAe/1CdfHTzX0Bp7IZeg75qRJDkMQfZ1t6SMdM0fMidiwzbjqtNzOnnLsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1AhteVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1AhteVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A017C19423;
	Fri, 27 Mar 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774631754;
	bh=rQL4KnZ+zSwucHgLfZ9TG2UzaVxilQ9pNZ6w2Zkp1NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1AhteVjNtSYA0uQVgwkrhazguXP6spTw6U0JV++044AYz6baHHkSzhXEKDJXqmlF
	 sQ9dfPPb3IcBPFkuD32jLcL2exaobH5dZo1Reu6BVjSzpGEZWfbJ6aGlgcScGcL/2V
	 KBv16Vf4FSDUkJNEkBYvQhaLq77kW96TAZLf0ceUsSjs3auYUawA2Rep3sq72WsYUO
	 kBdx7mwamqt2vFFZHXbjITYnmYBAyuUH9K5qWNyXRJLEjeqSF6oZmQr77GtZf7wwW1
	 wlZbaS3V2Rv4zkZr6y4hEzjGmWHULBcI6CtYJIwGJvWEE79qpXdoe2NQPtp7pSlDe9
	 ht0kVBg6eJTlw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 90C541AC5845; Fri, 27 Mar 2026 17:15:51 +0000 (GMT)
Date: Fri, 27 Mar 2026 17:15:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: k.marinushkin@gmail.com, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
Message-ID: <aca7R6I5zUeyqB3D@sirena.co.uk>
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FVA5mmK2NARH2wGv"
Content-Disposition: inline
In-Reply-To: <20260327121919.603768-1-padmashreess2006@gmail.com>
X-Cookie: Identify your visitor.


--FVA5mmK2NARH2wGv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2026 at 05:49:18PM +0530, Padmashree S S wrote:
> Convert pcm3060 to DT Schema

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--FVA5mmK2NARH2wGv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGu0YACgkQJNaLcl1U
h9CDXQf/bIDM4uNV63FJ8kfrjc9077rDpHahAB26KpMnZ9AHo+KzXF8dIM5fbJD/
xNgCLywxEEqaRtBJtOUfpJLwbZKIogC9X0E9VsOLU5S3YoqLCbBZVodWHeAmORbR
YWo4Jz54/ES3GxXjbVi3cv0Gz7DxVn7PkbH1QqvLXg+y2w5xM/0XUapl1yogPXjs
L15+yAwygZbCGOIAfmpqWYZFcm/LYuvnvy1oQVp2HNJvtck4S8IJlM6YG7HQhSN/
Yd9HkmV4BQ9TldvDCvr98he4SLCTLwOS/kOBS5MOGhofXWwJobKUQBxn2O2+gcFU
zvz4FunacmbIlVZ8r73AGdp8JQ4Hyw==
=FA50
-----END PGP SIGNATURE-----

--FVA5mmK2NARH2wGv--
