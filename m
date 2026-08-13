Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B83644B3;
	Thu, 13 Aug 2026 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659593; cv=none; b=E0MfJhr4NrfT/E2V8q9y2g24deVIHOW7Y4QxRP3+dlU4z9kfmMqZcwT3mlNUl06Cp63GIY0T1jHi4l0eSk8dcFxNvAzeIR3jvpsLrmBkb0A5JzWAIVhYiVO8EB7icZpffpZDsQTfsHvtSoM4apfPT6sXf4eowQo7Z5awUsVw2EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659593; c=relaxed/simple;
	bh=h/cZz00/1/SlrZT7qQD3nro5SmE1NcuKx9YBM7GyRIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz4VGPxfddtKA2C53YhlkNXVtmbyBmNYJqGHWb3vmNHNN8XYvErFZ5k9b17iBloI6LETmoxMDJzR5WCGGkdPxZuJOvWPrIpaJC1NHJgRCpLElcKmI9mLyDj4Z+g5PZqk9PqseaqIWJPI8WUS1xDhHJKhGuvYh1BiLfp+O+Q2LLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sgho7mni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sgho7mni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2221F000E9;
	Thu, 13 Aug 2026 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786659592;
	bh=092Pna56QuSDIlIXeHtlF7qEbhj6KCNEOQrzLk7UiGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sgho7mni3TBN17WC6KkkhThtoxNoeBPs2p7X8EiJ3h8Q1DqA+Pdo7he7ATtQ20fo3
	 RpX4XiCWWdyAbvaSBJHKBiqpIYZOCjCO8IEzaKZc1G3HPehDNCk5r9/a3imQG3oIvT
	 wrR+160dVc8wjc/FFLX1vB9j/dL0YLyH4PJrV6+qdPdliU8JPWQRYlacRDAp6P18km
	 ehWfbpbgfOn205gPZ92qBdn+FXj/cV6/eIhVdzcJtpuzD/KluHmmAO3dnHFzUunz22
	 1o1Crn61PyzcWi41hUN8IH6G2HvpeYKeHeuStRl+U4RGoVblqxsXEno5yfpHJk1lqx
	 qkquWzIihW8vQ==
Date: Thu, 13 Aug 2026 23:19:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v2] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <0799cd9d-a0ef-41da-80ea-3fb9b1ef0f7f@sirena.org.uk>
References: <20260813021450.1897-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KzoVrVZXOpkAwgp5"
Content-Disposition: inline
In-Reply-To: <20260813021450.1897-1-baojun.xu@ti.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--KzoVrVZXOpkAwgp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 10:14:50AM +0800, Baojun Xu wrote:
> Currently, the firmware download is unnecessarily triggered on every
> system resume from suspend, causing significant wake-up latency. However,
> this step is redundant if the AMP remains powered on. Furthermore, certain
> memory pages (addresses > 0xc60000) are skipped even after an AMP reset.

> +		if (!tas_dev->first_hw_init || file->dest_addr < 0xc60000) {
> +			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
> +					       file->dest_addr,
> +					       file->length,
> +					       file->fw_data);

What happens if the amplifier uses power (eg, over a system suspend)?
Though since nothing clears first_hw_init I guess there might be issues
there anyway...

--KzoVrVZXOpkAwgp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+QwIACgkQJNaLcl1U
h9ANegf+JK0QxQwgfNUpmn4rEGyfPdGNwOIGZnhXTPQ1YQw0Z1HGeeGH/Xf7DHxX
0g8LX84V5NA3QMrDjlBCcJZSaFbBXNDzk1dQAp8ssgnOewMD7NyMp5UY1qs+/NpH
RtlfGxbEZdgj//sJhYLocDrKObOkKoXO1R59TM+A+1Ua0KK8exlfeCtBJMyL2uEl
PYlNslBO5GcB0yK8WCImKyFhM6Ijinhcds6fTgzbaNlUP6r1CeiYR697sK/HxjZp
nx0ACestXtzHlPNUYKNjGmQEN1fqijp5N7nLm1Wf7W3wIYSVY9O1Y0b0ObrPzYTu
AmcRVLekfBsYJvXw+Ql6Z1esLHPsnw==
=BSuN
-----END PGP SIGNATURE-----

--KzoVrVZXOpkAwgp5--
