Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5838887C
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211150; cv=none; b=KjoVi9L1UeWn8gxblI3XumQH7XYEJkQ88alDb3u/Xg09iYgorZw87x8uNTgSUZiPP5pVUBIjzFdy1oEW1NtyyqkcDmxiUP8rjb+yw0au71juTPm/MuIw03J8YqNHKDlJAehd0RWSdDP2bynKSVmZ3wj1sHdBbluPPgebPNMWRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211150; c=relaxed/simple;
	bh=LqVfC8cf6moDq3zNM0IhVbZVtg1vWoD7JNS1iIklVfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ2Vp05Zi+Tex4yXC2MnUTSVengYNZBp0Tp1A6xQkSCYFzCGP3KTvKyUX3AzEnFL9nCHtxbb+Mi4TkbEizeTUPuuPN0dsf7WFkAm5XalHXP5aij20PzmOtwhhGNRRy4ejVbvnoz/uMfSegyQjoNdhILr+Ml1GN8Iucbpn9HzpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cnn9sjA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cnn9sjA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B5C1F000E9;
	Mon, 31 Aug 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211149;
	bh=LqVfC8cf6moDq3zNM0IhVbZVtg1vWoD7JNS1iIklVfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cnn9sjA3dZuMOHEYI1p3DhL/2Oocq6+oP4uhmZd6viGbYr7u0XqmI36H9/UmPfc6d
	 G/sG+y442NjlwPxAxjqyIpx5yxMAxqMnioO/g8Tf+JOXEORAEOwxBklK6Ktrkg/OLA
	 Vm8lcREQnUSC/ltdACTj6HkuphifWMVN7Vm1OmYK2vte6Oh8X6N8OCSQEGQ45lVh2I
	 XKeylJdUIGFgShbFdgFoQUc0EJjSVcHnhQ5ybER9gIDfjqimlzm/Uh//iHMWTI+5do
	 /hedvlnr7No336TcBQQ/7Yno/kPS5zkLtcdtWoSRB8yxO+EEgur9FUrL8JctlAj5OD
	 pqPQoU9F4V3Lg==
Date: Mon, 31 Aug 2026 22:19:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Message-ID: <c3eee22d-2337-408e-bdcf-cd93980a8ade@sirena.org.uk>
References: <cover.1787017592.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CtXu72Mr4aXZKsOo"
Content-Disposition: inline
In-Reply-To: <cover.1787017592.git.qianghua.wang@senarytech.com>
X-Cookie: It's later than you think.


--CtXu72Mr4aXZKsOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 10:08:43AM +0800, Qianghua Wang wrote:
> This series adds SoundWire SDCA support for Senary SN624x
> multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
> LNL, MTL, and PTL.

This doesn't apply against current code, please check and resend.

--CtXu72Mr4aXZKsOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqV78gACgkQJNaLcl1U
h9BwFgf+KyBjd8M1MPAitVSZmPU3/xkC7LyRj2+RYfQJCWx6IetQ/IOtCKWRwqKX
isgaTX3CXHff+h+E7YN1QcfwV0FOYmDziBdW5mI5wt7WeAEWq0semiSdxGdyrcZZ
jS7bAcaD1dT6mov4jIp8LkHqUVJwBZ75JFWdrWzSizca4fRwJdugiwFGBG2zFoj2
69q1V1BB+37qYSLKy5LpMYG7ear8rh950remN+O7/0WRvpp/x3nEchkqaO+M7hFG
ti6Nmg6wd++eHx20dQ43Xi4vxQe4sNkikgAcG5TMfG/1alz0NdeEhFM8JE0JZM8M
1NUcokKw5l+V85s/IeQ1cBwHgevNJA==
=3XPH
-----END PGP SIGNATURE-----

--CtXu72Mr4aXZKsOo--
