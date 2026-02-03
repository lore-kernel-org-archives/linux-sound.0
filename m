Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE03ACF19
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131801; cv=none; b=A3iGGeuRxa6ol8B6qlDQfG3ppmZqKYC11ignUr1+QOQq+vXifTjmBIbHKZfZFTp1xWBRKqUC+d3gyTiWQ+rmFc8hEnU+b7CRN8xN/KqYdhCfysEp6a3KMz/+W47ZZeHHhVTs45BL4BJVOP3UZrOSgWDw7atq6QDcc6JHuw51L10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131801; c=relaxed/simple;
	bh=Miw1cdRwg9bYgS52Ibxs0BJf2kd9m1gr7PbW1u0ep7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bf+x5HGBIw+dV+YxyyXyJOUBQrWaR4hElJPE4v0AA+2xyXyV+C5fHS469Qx5+NCCMFEUShyaKTAGr1euB1ESLltz7QAA5aHow9MgOP0HbKm7T3c9zkse8ml7nMOjl3lo2n5QOWoBonoTHKYlZchb3RplV1DX3jdz5KYINyfRgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pD0yC2MF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pD0yC2MF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66461C116D0;
	Tue,  3 Feb 2026 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770131800;
	bh=Miw1cdRwg9bYgS52Ibxs0BJf2kd9m1gr7PbW1u0ep7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD0yC2MF70AixM+ZcyMOXqHUuormrwPeTxaGv/YF35T2tup7n7PRcfv3vPaWOH35/
	 JyJOdVLNFRdaEzQSJtZI6gB+Z0TaBj68jqjc+ORd/toBKZ6jor1f4XydzTfyRokwUF
	 pCViL4p9PcM4TMExgaKmeMpcQSYVo6uIHnOcw+j+QSf6ZGymRQEgNA+x/wu22QC528
	 8a2xrOwmgYUFU6Hm6twC9EOFV2fBSO4OAuRpU17zF+8JWqDE1e3rHZXeubgaagKvC2
	 1J3vD7G3N1O4d1evN3TfmxbR/GvQjJ82G6ZCDM3GcfSAVaMG/eK6RirvqZNCF67scY
	 CzvzZZPqvqVrQ==
Date: Tue, 3 Feb 2026 15:16:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <cbe68c20-1a06-472b-ad18-0dda301e42c9@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
 <505b8820-9ced-4554-80f9-de0409859dde@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfxe+VQjQfIQ56H2"
Content-Disposition: inline
In-Reply-To: <505b8820-9ced-4554-80f9-de0409859dde@linux.dev>
X-Cookie: Do you know Montana?


--rfxe+VQjQfIQ56H2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 02:34:36PM +0100, Pierre-Louis Bossart wrote:
> On 2/3/26 07:27, Kuninori Morimoto wrote:
> > So I will not care about detail things first (= sampling rate, channels,
> > etc,...), but focus about graph / routing thinks. I think this is the
> > main part for it.

> If we truly want to support digital routing, then this information is
> very much needed.

Right, it'll be needed for production use.  I do think it might be
viable to work out the managing the connections and then go back later
and propagate the parameters, that's how I understand the above.

> I personally really liked Lars' notion of 'domain' to define
> strict/well-defined boundaries connecting subgraphs.

Me too - I'd come up with something that was extremely similar at about
the same time, IIRC there were some small differences round the edges
but nothing major.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--rfxe+VQjQfIQ56H2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCEVMACgkQJNaLcl1U
h9AGQgf+P19Wap9o/FnIrgFJUdWtG2TO44cyMUdGHrfqsNU2wst9hVBCsg7//48H
z/F3hYnr+pOP4HjAgPGnXHOsd6OuU/YPpOhlaDYWNF2YTG08MiTY5t7qrZButRQQ
nwygkNL7qZGuBfT8BpXPhAl+UI1/zsNCR+86Tiy6UBH8T7iDRP+gP/hl5wQ1lunm
thBocMK6VR1IB1ireJzAuZ1P6bGb/BovRDf449B6dqr7aP1fJI0vEsgbdzzXdM7R
5ZIDrJfSXAWQWBIbbREDFk32UHutv5oscrMKyPwfXwHGs8+gDdtIwpJeWjxXfrNc
cKejScNhhVCKwot3k00+rMlUbVGERA==
=zkPB
-----END PGP SIGNATURE-----

--rfxe+VQjQfIQ56H2--
