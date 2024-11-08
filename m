Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019781EBA19;
	Fri,  8 Nov 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072871; cv=none; b=SWGSEtkHXFibWRQbKUIGrcqVb/AHuA3FkVqiQim4O+XiOfqk4uAkpKqHodeFlb4Q8CiYNB57cNgj+7JPBZFRSr7FUdYyRLcOaoFCXhAmeKZy2JOHZi+sO4lX0GNEtOsvciAvwvTzdtxCIc/JGb8pjRtv8BWN5aTHrDDrORsHFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072871; c=relaxed/simple;
	bh=AtxMtrEHHxcVFmFm9RI+3XLvH70jNaNHwS+z9N8IfLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiKOKoXg+TK93lYzwzDWQTZgmwHc82MsD+aKmXg4gHi40yXRqrQpeidFtxMHzF1gjgHfJPrDfJebWnDo6LSnRbKXwBPpdqsabqYUy0xzRB5r8YhlVhLPj3CQ7vPts3kr9JQMc2lIXxw3m4YoX4ModhzCsWJ5yLLvdOlPyTojUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeSE79hD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeSE79hD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D1BC4CECE;
	Fri,  8 Nov 2024 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072870;
	bh=AtxMtrEHHxcVFmFm9RI+3XLvH70jNaNHwS+z9N8IfLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeSE79hDcvAqptNjZPD7DMg6aXot9BeQtiyg7VIjrnyUn/noYrP/icMQWCMgTZTAR
	 hk55fgEzBdTec9gGTFvofpeRICyXqMl6xoqeOi17OZgYUE6/0pB0eX6nnE+ggCyDth
	 RQoLv9R1Uig5xAohT72K+GLo1tdtQcUGFkN6Z/w6dS0MBTwD83WcS5m9cJeFiR8a9W
	 ZsnSXBVgx1q6A4LvW2B1iW4F3JsAGHYdMVPUIfOdco0SeH0ILvKv8sJKmfxb212/kj
	 Ivn8G5J41VWEi1EeOmIzqvhUHJTg0GHPvFLeaOH08+VL6goAcpfrbdJwzUzTBEebL4
	 22Co6PqUMeIGA==
Date: Fri, 8 Nov 2024 13:34:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com, cujomalainey@chromium.org,
	daniel.baluta@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: SOF: stream-ipc: Check for cstream nullity
 in sof_ipc_msg_data()
Message-ID: <f3e486b6-8b33-4f68-a6b8-ab63edb5341b@sirena.org.uk>
References: <20241107134308.23844-1-peter.ujfalusi@linux.intel.com>
 <20241107134308.23844-2-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Y54nW98UoZ6e8Yr"
Content-Disposition: inline
In-Reply-To: <20241107134308.23844-2-peter.ujfalusi@linux.intel.com>
X-Cookie: Send some filthy mail.


--3Y54nW98UoZ6e8Yr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 03:43:07PM +0200, Peter Ujfalusi wrote:
> The nullity of sps->cstream should be checked similarly as it is done in
> sof_set_stream_data_offset() function.
> Assuming that it is not NULL if sps->stream is NULL is incorrect and can
> lead to NULL pointer dereference.
>=20
> Fixes: ef8ba9f79953 ("ASoC: SOF: Add support for compress API for stream =
data/offset")

This commit, also referenced in the second patch, doesn't exist.

--3Y54nW98UoZ6e8Yr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuE2AACgkQJNaLcl1U
h9COEAf+LJuaNjyluvIuC9HFzDpQsFqK6NwpFxXENAP9p0u9A5shTfa9LOWfVMtR
l6xETzyNJkLExh3lYmKBPuSvb2NlGUHqBe9xjWucM2jr3TpS5agFJr9s3Y1nvBh7
sz40P0OaLx9rzyzu+/SHjCa+29mtcPnKPIfPLhl2Plrco+Jn2cXIJLRiJAlpPkCN
3SWijMpxUrRXwRM3UoIZmgs2NFBCXR4/6F+ieC1hEpMOzHKJBk5fAYLSQ1OgSEGN
vCsOeaWpY19bhq759RG4D7eUtXG12kzaCFLGAOZFxhosI4gCHqrEACcRxGGtCJJC
LfiP67H3JIp0MfHv03PnYRjv38Hqxg==
=dPpx
-----END PGP SIGNATURE-----

--3Y54nW98UoZ6e8Yr--
