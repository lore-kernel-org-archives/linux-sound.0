Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2AE2DAFDA;
	Wed, 11 Mar 2026 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249876; cv=none; b=DnBTO7QX+5IUmQ74Qg9CTwVyiSRB+A2SZJ5Ohgjc+fyoR4uy+NEgjaAA+kQfvHH/zdwpSOxNR53NWRJQHRDs4CEi5w2EcGsXFxCfNN2tBccI6P5HcC7RduOzIHiRTTLu8CGhktZwXD21t/f7geZtE9V9NleiDUhUn8HrKoPZKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249876; c=relaxed/simple;
	bh=Yu67YwadSmby9Y2YFf2gA95tlyBjYyK7Edc5E2e80og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGIw/nm8ST8yu17StJuINpqXz5iRNcROnjqG1+4UyW46P6+PNlt7aPwws2+baFsJWJ1M3R9dNkuQkaPkOUt0kbJ81PxwEoTkAXqbX2NkuokhIOpY5De5T/4fcjz/ZCpRWg8o2Z8nvYXPd03Fc3zlBkXuk2cwb8EUS14Ut83rzcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOayoqiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOayoqiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8545FC4CEF7;
	Wed, 11 Mar 2026 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249875;
	bh=Yu67YwadSmby9Y2YFf2gA95tlyBjYyK7Edc5E2e80og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOayoqiPcZQRgJ5cdKp2wJlzjDnToN/InvslNP2e2RN/xyMRQdCLq1VAwleKtbJU/
	 MycAHU+cH6FB27eqIYeHnib8TQ5q36DeZmA554mNdCIaRP70IF1iYYZ91ka5lba02z
	 hp9v2YsG16kufFFPJaQL0fkKgxmq6LEJi2CqvjUo3qDa2Uyv21p8fat9drFvoTPo/p
	 NKsng69QhXs0GbJHLhj9ynHtAgQuJzUXUd4Prl2WWsx38shzbxtCBF+YS2skNH0hbv
	 j9FpoDdsVZfkGp6p3ED7boY92Da7yhkgXjnatNu/5SpL7zBygzZj4feXlvQrksjlya
	 FYDl/kaaWuytg==
Date: Wed, 11 Mar 2026 17:24:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz, iwai@suse.com
Subject: Re: [PATCH] ASoC: soc-topology: fix __le32 conversion in printed
 values
Message-ID: <5b438b95-0dc6-42d0-9be2-6b8cf9869a02@sirena.org.uk>
References: <20260310094948.62023-1-ben.dooks@codethink.co.uk>
 <e535797b-2a15-4996-90e4-33d13bf5d689@sirena.org.uk>
 <661af6a3-f5aa-42cf-bd20-6881ace426d1@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yd+EtasYFcG15bRd"
Content-Disposition: inline
In-Reply-To: <661af6a3-f5aa-42cf-bd20-6881ace426d1@codethink.co.uk>
X-Cookie: When all else fails, EAT!!!


--Yd+EtasYFcG15bRd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 05:17:29PM +0000, Ben Dooks wrote:
> On 11/03/2026 17:11, Mark Brown wrote:
> > On Tue, Mar 10, 2026 at 09:49:48AM +0000, Ben Dooks wrote:

> > >   {
> > >   	dev_err(tplg->dev,
> > >   		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
> > > -		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
> > > +		name,
> > > +		le32_to_cpu(hdr->ops.get),
> > > +		le32_to_cpu(hdr->ops.put),
> > > +		le32_to_cpu(hdr->ops.info),

> > Shouldn't we also change the prints to %u given that le32_to_cpu() works
> > with unsigned data (IIRC)?

> Possibly. But given the data was already marked __le32 it was already
> unsigned.

> Do we want to go through changing these before committing this or
> delay it to another patch?

If we're going around shutting up warnings it seems better to do
everything properly.

--Yd+EtasYFcG15bRd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxpU8ACgkQJNaLcl1U
h9CkCwf/VyFCM6Wswke5v/acYRXkwAmDg/nA18ivhgpbWInjMElfSaZeR9oUMY9n
3b9a3FS/GobX2y3N0ADCYF1UIsATiVxIZ0qtYIfxGn+sxvv4pSXNhQctFkh+2fhU
xdMme79fTloFv2zpiy8K92tEkyn4OP4uQV4qpjVJIYZAn3pIDpsbSXpG7P7ZyIBY
ePllmREBxhTN6DNSuBjJUVSs4/TOB0uH0lTAr9JB4GG5+xGCMcToezpcNrpnP7I5
2sBirMPUtqAw6Jvl2MRZy6r6g0Ls8lb4IXVB1tu+X5TbybayC5QRRWXzeCPnLXKd
f3cfZE5j4NEJT4Fkfxff/Ds1o4BHVA==
=1ezv
-----END PGP SIGNATURE-----

--Yd+EtasYFcG15bRd--
