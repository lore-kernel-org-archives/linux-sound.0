Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A553E3C4D
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276198; cv=none; b=inSwuzyM+InxnNXdncHsOcQBXgyTUeyq57tFzsD14bWZIdEaOI60pKnN7RhzukpZ4d359Xze5RjSGk5seeHiXEsiDRJiZJxF6+R3Owrai26kE2Us+XdNe0uSlc63nPXiYpekATF/7Pto97N9pmlf0bHX4U5N1Y9P5an1kAXOh2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276198; c=relaxed/simple;
	bh=+AIWOOGkYombMyWKyf1rhN43bTrjn3rP5EH7aCiNAYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oO4uRgfkqm/wl5uAesgQoGasNp2AaAmxy6TJmXtNySMrwpz6D2wUHyZPBVE0mApWd2w51I687eoMhuj5EjuQHct818MlRG96sqqlyuWuhhXFM2Lo066T8GbQXma03yPzfVWOKQ78/TACB1cykv6Mwub9t975WB2BI9lfTZKFZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQrvQUlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQrvQUlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BFD1F000FF;
	Tue,  6 Oct 2026 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791276194;
	bh=mpEeqKnTVA4XpmeAt1rMF0MddEli6BrffRVEq+eeAYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hQrvQUlp69HZj6WyZGE4f9UthIwXlJzjs5/5c2rGB6HIPFsrcP+N4pUqOn0mqdG1g
	 cunMV5uqrgtWPoKKgRFq7WINa3ZCBtXnS74QRWEBkgLL8GAToyIr+54uen2q8gbz9Y
	 D0KnVNSwPfXL4FQq7iLKviSGvcYKUPC030MZQu4qVx+PTnP7URwGV9BbZBV3Myrk01
	 QfsBxerDXDJB5zbDmrP9BRsakqZNRS3UrcbBhT53OuC9S5iLCJZLbaFFHMqJeg9+Ro
	 jhNNlU9RJVH32zdmn3TALlzNU2q8Vn47e50y6C5MMdbzMB/8KUK8F7deyCV10xy9si
	 VJkxjfp6EebiQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D58DA1AC57CE; Tue, 06 Oct 2026 09:43:10 +0100 (BST)
Date: Tue, 6 Oct 2026 10:43:10 +0200
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asS0nqKolXeaaDeX@sirena.co.uk>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
 <87ik3gs37v.wl-tiwai@suse.de>
 <asO_n_eKvS_Ns1hV@parshuram>
 <33fd064d-438d-4378-801f-2d9129fc9241@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CH/ZZM0sbCUBYztG"
Content-Disposition: inline
In-Reply-To: <33fd064d-438d-4378-801f-2d9129fc9241@perex.cz>
X-Cookie: You will forget that you ever knew me.


--CH/ZZM0sbCUBYztG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 08:02:24PM +0200, Jaroslav Kysela wrote:

> Mark, would be possible to reserve a club room on first floor for this? Or
> you may have a better idea where we can held this meeting. Thank you

We've got club D:

   https://lpc.events/event/20/contributions/2653/

--CH/ZZM0sbCUBYztG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasS0kwAKCRAv73Ows9A4
idc8AQCHzdnxEM18XUzD8guPpgxv5phky/L09zJ6iirQzUolrgD8D8XlkUpVxP1K
SRhsrwL9YQczK7z0vobGSeAVXuovuQo=
=uV34
-----END PGP SIGNATURE-----

--CH/ZZM0sbCUBYztG--
