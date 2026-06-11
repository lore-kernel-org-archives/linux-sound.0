Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2D366836
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208154; cv=none; b=a5N7z4+bgmCDr/STQf2R43ddUpsnskXdGJvSrGbRAhzdO6NWSu8S1sYa6XNsZpb/HIaQMkkN5Pv4luCmjhfsEZEIJkoUOJym6fwXeOmBFxt5hgbTmNJ2rQMgRVLaBIXK7iZLU37AtJyCV3qmGrIpuHuWPhwgzuT9mxIjZWEnid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208154; c=relaxed/simple;
	bh=lAzUJfIdOt9bhfvnU95m5GUBaNA9SBWERhT1IFZLf4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVhf/lZo9QH+bN+jFcCRjthgcbDuw3eIW3CCj747s9hKoqL1o/UZaO9DZ0UnkYLirzjGYtww3wUdBZ0OYhJ+3V0AZqSK5SzEdjIoqFxHMYdj/Ntf+wNL4h+VAUw49aND/SUfQy3coyY7+3Wzaso4Syxvxh5bkbnee+j4ctiHkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHqLnyUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHqLnyUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132431F000E9;
	Thu, 11 Jun 2026 20:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781208153;
	bh=IcqwKmxQgbnljUt1NQrrVFqk6cS987Q4a3CKrVc/JV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHqLnyUVlKyjeRQvF2JLusEFzzsYKTdV4gIW+IzcyP56mofNFOIVBDe4yODHKu8k/
	 aaln919NNoRbbbfcPxC+uMquEmLX/TUaNDA3gXUXolsvhm2XtcfSzvucKJc71d73TR
	 PgHbcUdz+Qw+HpzDDIwyytD59afXhCsoZphTALjGKbgPVXCWtGClZSsihbR8klM2/Z
	 VvoF/l46FpvWfIiLLvoRNday8OUuAO25TPteK79bz6Es/asaSOZ025Y6GLVwlZ+ABs
	 ew201OjtoCLn6mmhkCpUzytEToQjSi1dOnN6TbFBvYmIeOGIoZaLLTyko7xgqxYsjZ
	 D+HrM6GsldOhA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DA2D81AC56CB; Thu, 11 Jun 2026 20:53:11 +0100 (BST)
Date: Thu, 11 Jun 2026 20:53:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from
 soc_ops_test_priv
Message-ID: <aisSJw1RJTXmC3jl@sirena.co.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
 <ailKjsngVh4q91C0@sirena.co.uk>
 <87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QyC4XWqQG5mtB6R0"
Content-Disposition: inline
In-Reply-To: <87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Leave no stone unturned.


--QyC4XWqQG5mtB6R0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 07:01:53AM +0000, Kuninori Morimoto wrote:

> In the first place, these xxx-test.c are using Card/Component
> without registering it to the system.
> It is a very hack, and is not the correct way, but is working for now.

> It is OK for now, because Card/Component are *not* yet capsuled,
> but will be problem if these were capsuled.

> As a workaround, we can create "special function" for them for hack,
> but I don't want to...   but hmm... maybe it is the only way
> to keep xxx-test.c...

This is (or should be) a common problem, I'm fairly sure there's some
stuff in KUnit to help with creating mock devices for it - I see there's
include/kunit/device.h which looks like what I was thinking off?

--QyC4XWqQG5mtB6R0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorEicACgkQJNaLcl1U
h9Cidwf/UE8sZZ03dlOapata8hv2bstLEk65biLecoM097GcC/kmL3IEPbvnfh2I
nEC7T/nMmn9cH5iTGSKaLhejTwjn2ifKZCEarFVM/S4diPF11TRC1wAjIhd8zunY
/gBTeoeulc31dqA4/tV/MZpoZn7TXei4F0wrNMrNbxPpByd0769RBYxlgB1KnzRl
AIXoxD3sgshq+nEmFM3jv3Pwz9SghkKPbA8LcEUQGQIen/t4ggb6JwTpjNTMNDAH
YvEZK7N8KcNpqJcvYBveI6q4svaNjGfveLCFRxWkgmrEMYkT+AnkWiD7Cs8ew7aN
9avUnbKvLwoSG27N0SgIWGPRmtsaVw==
=GBFy
-----END PGP SIGNATURE-----

--QyC4XWqQG5mtB6R0--
