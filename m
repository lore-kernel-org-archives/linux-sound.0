Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B178489
	for <linux-sound@vger.kernel.org>; Tue,  3 Sep 2024 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370773; cv=none; b=iWpD91iI1z9KNK4B7JoAG5kqiHL0UjNmfR/u3A0qPl6i5Oq7r49OvDQxbNBuCUF1pC3TFcE7xyGpoL5W56uBqQmZOy95ioQEiJ+X17/TWOgJOuqpAaIUxGEy9b2mu68PxlyZ+1yYZIDDnI6oY9VhS9q3ipZO8QAhT9wnK+/I8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370773; c=relaxed/simple;
	bh=6wKGcESs4ELxqLcVJ9byvIaiXpqLI+AnCeXt+C9u76Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0in2rRSSH+BOOLjlVrJjOARdW5RYDZOqaSvsykKzCkwmpay6f+xB/X7ilACmqnPU3AOcY3T+z8dJozrFQi7bWybUt2PKXXpdmej9/LXW/i6374Omz5keWVAvVqfwtmx7AoJvaLhgU2lWeFVrnW43s20ufLmhUdr2nlxYVur8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hh639DIj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hh639DIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7F1C4CEC4;
	Tue,  3 Sep 2024 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725370771;
	bh=6wKGcESs4ELxqLcVJ9byvIaiXpqLI+AnCeXt+C9u76Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hh639DIj7ufiJU3GNmaGh8EBGBHENatSjul0S6IVi69xNev9RP6YFn6HY5duNOd1A
	 8HFgPAfqd8iLU8ce54s5i5ZeRIpgzfIilnk/qYBhmX+ZKrG7qc7+hxg3wDKYWLjzpq
	 KYxqIEueYcDAEIxJk0I278aBhGvYga1M3Rf2HQDUfJpWNL4tLlf/9wEYVEUsV00PGA
	 CD6f3ZEC8Umw2CD0KqPxp7YPw3Ro+8rKqB1YCvb1ObCPP+7l51V6/zIGUj0DGGnYnh
	 VgClq6OCIAgT1V2Y9vjMmBFOVpKPPL+fS4QKmFX6tI0RYlX7zvb4Kwe54fPnwXicIK
	 zmIsFOLtNMAJA==
Date: Tue, 3 Sep 2024 14:39:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <e88be728-89bc-4942-8f5f-c86bab2b08a1@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F66tcKYI2c3SsViY"
Content-Disposition: inline
In-Reply-To: <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
X-Cookie: Words must be weighed, not counted.


--F66tcKYI2c3SsViY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 11:14:56AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2024 11:08, Ki-Seok Jo wrote:

> > I have no intention of opposing the content. I am asking again because I didn't receive any warnings when I did the following, and I suspect I might have done something wrong.

> > ./scripts/checkpatch.pl Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

> > I was under the impression that this only applied to patched files as described above. It turns out it can also be used with patch files. Thank you for the useful information!

> That's not how you run checkpatch. You run it on the patch. Please read
> submitting-patches document. It explains everything.

If you *do* want to run checkpatch on a file for some reason (eg, so you
can fix issues in existing code) you can use the --file option for that:

   ./scripts/checkpatch.pl --file Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

Also I don't know if you're aware of b4 but it's pretty handy for
automating a bunch of the procedural stuff around submitting patches,
one of the things it can help with is running checkpatch over your
series:

   https://b4.docs.kernel.org/en/latest/

--F66tcKYI2c3SsViY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXEY0ACgkQJNaLcl1U
h9AfJgf/dO36RsGNscAu36eVuYshHarchHV1XAK+Btdla/Qnmgc5jj5nnHAVIVul
wNuwy8W/lZ34vFt6Fpy1LuoKLWiZjqo5Tuv5GXUXkMfIne3gpNPOFVSQVuox3ujA
99QJq0dupIKod4NXiLn1ERfxgxSPpg6yzvX5q/4AuReafwXoPlEOdihUBiVWn4we
CpjJffWGg2K479irrER47SQEir4TUYvhjrdOe7uqS4YrRLhcElQ3K17hgvXZx+dO
ssRbJ1zR2NHPn2NdYSymSEHHNBn5tkEWUW9XzcqYqrylJGXE1vPPUh1qEnpAxiPo
1Y/WiHhPaSK4+6V1dRRXErZTE+oLUg==
=eFQf
-----END PGP SIGNATURE-----

--F66tcKYI2c3SsViY--
