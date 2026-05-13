Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B55366562;
	Wed, 13 May 2026 01:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636069; cv=none; b=MTlSL0l4e59PDe1qeKw7xM8njmD7dXm/zjy8yw0x0ZC7nsGmR1X3rd2E1eg6t7KUE4TLAcLwKbr988kgIuSxmsyE3crs8qqZfRzPCo2N2uFe5l7K8nW7btT4rfFhAXIodt55oS0Bft4aZAVavtR0J4OG1hATYfoKH8VBXpYPCNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636069; c=relaxed/simple;
	bh=1ECTqqMQZF2fXy56N6WYJ1c69Wgyfb9nS7ZpyROi7YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYSdInNc14EEadjLczTq+suJ0favGBEtp1QWopXSFUnXhASgJyRiw6Lw3ktswWgBbtqFGco3dfmMBe5LMnDV9J4pA+GnmsnCjDgKp9IY2L7+/QtRiKsPixhZwRi5sVezcDyas8tl3pR3PC4otF/JTi0ELa15wJPxRUMvyegtihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6yUUAxz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6yUUAxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71B6C2BCB0;
	Wed, 13 May 2026 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636068;
	bh=1ECTqqMQZF2fXy56N6WYJ1c69Wgyfb9nS7ZpyROi7YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6yUUAxzcvFFLA8CeYEGcquAmAtnUiSJnVfI8K6gNRjlKDR88WppdaC0t4ILTfbwP
	 UhgfmrXupzAcXnF18ucqCwpk1eYGKxfL/BBy+VDdaagi96mZmwNgetqPWdc2EsUK1Q
	 DvvGhRSkt90Ckbmoq5Iw+xJDJtNRgaX+wpCRXsNmisBEfUcPvkEm9D4PUbjkrKrlgM
	 GUV4HmOGH0WY7+G6m9NY0d3Nr2Go/K+TrC58B3LhiWf1Kw0te1ThFJwYZwhgrU1Vm6
	 wiFX//8WO4boUun+CLWpyU7PMlxadYTKAO+ONIu44ZsWwxjQrp0S9ZqFosyWLVfHd2
	 3SjlENn4ByN8A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 295EC1AC58CB; Wed, 13 May 2026 02:34:26 +0100 (BST)
Date: Wed, 13 May 2026 10:34:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Yi Yang <yangyi@moonshot.ai>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: tas2781: reject too-short writes to
 acoustic_ctl debugfs
Message-ID: <agPVIu-EaB6eRjk6@sirena.co.uk>
References: <97bd47532c39bf4406842528adc5883ce43bdb25.f794da3d.54fd.4990.b799.199289b112b8@feishu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Z8l4KqqSe5QhvkC"
Content-Disposition: inline
In-Reply-To: <97bd47532c39bf4406842528adc5883ce43bdb25.f794da3d.54fd.4990.b799.199289b112b8@feishu.cn>
X-Cookie: Truckers welcome.


--4Z8l4KqqSe5QhvkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 11:55:35PM +0800, Yi Yang wrote:
> The acoustic_ctl_write debugfs handler allocates a buffer via
> memdup_user(from, count) but only validates that count is not too
> large. It then accesses src[0] through src[6] without ensuring
> count >= 7.

This doesn't apply against current code, please check and resend.

--4Z8l4KqqSe5QhvkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoD1SEACgkQJNaLcl1U
h9ACoQf/VCcSjxVj4HotEi86+R+0MiOASGuRdpWSLcN3AWfbUZNPhQ8aiG+m6hpi
ikz7+E1FMnILlAYFLHfWlIt9cQWYFH4TahmxzD2O8K+WFAaXEuCCs9BBGIZEmwwm
2oGN4a5J1PgdrqHYAldVs//dwdlnLTHoWEbYf5iSHiy22dekP3rj2CKLRTE4p3tW
38lcfxEMGQbsvEHHrOSDlpgrsRYErb8+RZrl6whkF6Q5bAQtRRkkw94Q8eRNRhan
ZBjmO99+mB0QHPjxdFKfY/TaoTmF6nFH3IseehGi7Waa7JtEtyP32U/wqzF3jzJC
4aE5II8QONkvqsWm/LGXVN/TULIslQ==
=ghl6
-----END PGP SIGNATURE-----

--4Z8l4KqqSe5QhvkC--
