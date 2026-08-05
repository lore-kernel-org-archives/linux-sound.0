Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08136196A;
	Wed,  5 Aug 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948031; cv=none; b=FLC6C5ZIElKYh2GWMr/Z+itB8hcYihRVFGA24DGQSVCqZoCQCoI5URKKeTNjJetXCNyxVZ8nQiHYK9iCoHcZgX2Wu1t+pfBSNkY7OGKlajMJmYc4dPZDRAae6sSLa3soVr3f2jrKJK4H41yu1W/TQkFu20ZgC5qlcUEIVaSCM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948031; c=relaxed/simple;
	bh=oUN2QLBz82cMHTpI8OWZU19viYl8pbNhDpcfo3znYG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jwyb/vraBboUqNkmbbT2+wLvzbI2VRx1hq6ppyc87jqHP3DNELFyr4EhX+xnyS/ydDCyPsEPkq3NeapufmshH5bchr+JWwhbwL3q08PF+jkTMClxCy3VnfsLSsFNu4yksFtCsTpvesOCnYFS6Z0Nz5OWfN8bIVnaFviT1DNM7aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny1MeJg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny1MeJg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CEA1F000E9;
	Wed,  5 Aug 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785948029;
	bh=oUN2QLBz82cMHTpI8OWZU19viYl8pbNhDpcfo3znYG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ny1MeJg3ELotTDpM3GET9QsVLuAZ1LCNoxx1c42qF7TpdklTtr1LSZbzS/uE8o3uW
	 k4KrEm9SeO6RwjWvcBq21Lcg8n0FpYOTh8Huzj5/mfRLlSMi7qASlloJnJUnbQqkAf
	 0h943HvdadUyQeQb0AfnafvdobAt9yDPYBuHiP6JZTO7JMTeSqwvgpTG69insRzTcd
	 D8cnxSToTeJC/ywIpUoAfiLfk0Ncv+BXh+VozL0LFNhxv9W9d1dH92XdQ/66fOn9Wg
	 GvOVJKvMq7RxjFcXygaBzMwwxKvYjyE+YW1cDa8vsACCZw+9TQV/G2kCyIn2/F1VCY
	 Iansut0RHvsFQ==
Date: Wed, 5 Aug 2026 17:40:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Support INPUT and OUTPUT DAPM widgets in DT
Message-ID: <1cddd05b-804b-4d91-a5ff-7c5e07903610@sirena.org.uk>
References: <20260805145625.1290628-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egzyNC+mMPFJxdzF"
Content-Disposition: inline
In-Reply-To: <20260805145625.1290628-1-ivo.g.dimitrov.75@gmail.com>
X-Cookie: Stop ahead.


--egzyNC+mMPFJxdzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 05:56:25PM +0300, Ivaylo Dimitrov wrote:

> Allow the DT audio graph parser to instantiate INPUT and OUTPUT DAPM
> widgets.

> This extends the set of DAPM widgets that can be described in DT and
> allows modelling external audio endpoints as part of the DAPM graph.
> This is useful for more complex topologies, such as codec-to-codec links
> or multi-DAI audio paths, where routing through external endpoints needs
> to be expressed using standard DAPM routes.

What specific cases do you have where one of the more specific endpoint
types isn't suitable?

--egzyNC+mMPFJxdzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzZ3kACgkQJNaLcl1U
h9DCQgf/SDOoiwBjjTH6/TyCpjZLYzX0le/FJI1fr+l7wY1EwG4gJ8otDjF3vK5R
EoJLVhfN3zdKtMoBXBWUIwUZS1SVKBYFuYbxdjy9IMJXp/H5jPCoAr5KHpZL/FM5
ClRTE9f88vmnJNI4x6PDt0uQ9PP8aeEPeGdL2g8Q08J5lb2BbNMvk+ihiPHIm+k2
/wlPzq+tXmWmL7cnHxd+Lgb2y22sNqRKh8c4xujVAu/k/8fztQYrwqo25isJ0CLh
Cdk1PCwjhFoPZT4x7pfUFATV8FPqzk/ap7zSr++GvpdFH+T3+BUq2olH8Zo4zckX
uiTIdS+CR4f78qPnsA8ZmdSUjOOfhg==
=AHz9
-----END PGP SIGNATURE-----

--egzyNC+mMPFJxdzF--
