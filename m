Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0254A7C5
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086003; cv=none; b=nZg924T3ICj8RL7amYbacCezFDk7AEL14XHYxwmLgeyImWnlHb28SmISYyl5nwy+O1ebsvlw07Yx5I5vo9rod3ji0DkjkSrHQbRl344oDD7vcxrqz+y9moEmgZg2n7466GVP2j6pkKl2Dkskp+X/rphd0NOplDURLrh6zl7qnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086003; c=relaxed/simple;
	bh=MEvmLg0B/TKuwty+geU1n4C0dN6WhmmOEmihuMS0gq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg7r623Xs2eAH5tbDMIsQFsxGkw/+DuRuiJDtY4MciE3rb5yntiqQO6Jxhu25dLeRXoXkAM74O/ZBYzU5LXIVCnAdBcnTInZ0el+w3HcdlzYY/gIYDLvCZSAQclRnkc9Q9j/svPmhqHknPJOms0VHsAOiSuifKXg+1lJeDK3bhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUamkZNS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUamkZNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365491F00893;
	Tue, 22 Sep 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086002;
	bh=j5nbf2dLqB9PBp/pKTrQDMXH7Xg0UG2+jZ0dQrr+rIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IUamkZNS2R9umNpSIp7ROpbUgGruDzq+GxIqak8vRLGlxqhWQCo4baxj5DgZExPjz
	 RUSZ5YvuPbAPjeFzU+nrMHgLv37kKDEVZgCiQEt4Kk74VD+MWgKkEUW1ACpsKmRHMQ
	 buQ5LKVvcuuwdSnilFhS6weNlmxLMVCRflJT0iNnVNB3lrxMmwkldgivtEdlfADRd8
	 daD/Se8PuqlOgzpQDaoXHvS1iNlM7WiYsbrC02iLHy567We4OtBnCH0k7nHmqHEg2x
	 6GZKDBHLjzaV4CJiJE5JIB3t0nWYu6NE5juHscLcd6L+CVKrPtJ/t79iY7BIogORRW
	 k1RDU/KxspLwg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 438521AC56C6; Tue, 22 Sep 2026 15:06:38 +0100 (BST)
Date: Tue, 22 Sep 2026 16:06:38 +0200
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S
 support for sof_sdw_get_tplg_files
Message-ID: <arKLbjUW-YimJFjQ@sirena.co.uk>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
 <20260922092316.2296039-6-yung-chuan.liao@linux.intel.com>
 <arKAIIkESvrODYQ3@sirena.co.uk>
 <SJ2PR11MB8424EC28B029E80E31C33B15FF832@SJ2PR11MB8424.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kekZEUHd5N6aKWLE"
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB8424EC28B029E80E31C33B15FF832@SJ2PR11MB8424.namprd11.prod.outlook.com>
X-Cookie: Too clever is dumb.


--kekZEUHd5N6aKWLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 01:58:15PM +0000, Liao, Bard wrote:

> > > +	if (sscanf(dai_link->name, "SSP%d", &ssp_port) != 1) {

> > Should be %u for unsigned, or a regular int for %d.

> Will change to %u

Thanks.  I threw this into CI so please send an incremental commit.

--kekZEUHd5N6aKWLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyi20ACgkQJNaLcl1U
h9BpUQf9EtIiWFQv6TKlGLcU2GLi3E6WiW50CmdbchlqRJkcpx8eOaojC3VMR2Yc
v/cl/kAqMpg+hqPAY8Kz/ogv9Hcpghl7XNeMXR5MCyjZVu+qDGGZcQBIgkxPMJKM
ECrkgktW2qTeULDvYMBxQyZzeKdEiJ6eOz3TM5gWws4IWuH2ShgB3MHZ6shNLKDs
MDonVTIPdzywfaynKDaLqmRo3ycp5FjhTig0dZG+d/U7bdHtMzCGySs9IZuErXLA
2808bkiExoobjS/hwuEmv/o/S0gTJUq0q2bvrtvx6mpCrEHqGUgqXn5PdLLA5Ul3
ksP2MAmIuUSKO5JbOOB7MYbwWPW6yg==
=CLqb
-----END PGP SIGNATURE-----

--kekZEUHd5N6aKWLE--
