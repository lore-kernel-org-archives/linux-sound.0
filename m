Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1493B0AF1;
	Mon, 23 Mar 2026 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275304; cv=none; b=fNrteehHJP5fZK2EtUTcKH5zfEmObdGYJrel3PcoJf+PYGKL0TG4XyrkTxrlRICXf5T8BG4h9qT45mEYKqW4Otf3HgYAU2rtzLEmu0qogIcLJ0M7aUK72ydtESFObqfnoIP5ABdSvws+JW1Mt14ehANwsG4npIhmGsLnE/o8kYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275304; c=relaxed/simple;
	bh=D3C/ICDRZOtFVJGEx69xNaT7dIHz1ptguI+UdUQOtTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfMl4uTEJs70l5bljG43BerKFrqlCzG1rOZEApZvTdS/wOIHUhtWdN5fJXF2N5cItwzxAn1pB1FUawtYRCi+MPJiwEGRUjFVhOilAYRSbMDCXQ54SbO+DApeb7R3cK1fBa1HImEisSq2oQ/swFmm0h7Yk0twH5oCymDi4UZP+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i15VhEeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i15VhEeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7406C4AF09;
	Mon, 23 Mar 2026 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275304;
	bh=D3C/ICDRZOtFVJGEx69xNaT7dIHz1ptguI+UdUQOtTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i15VhEebdppTpCqDEr89cd1A2LCdgaEgzD2wFrbaMsoYvQixW6c4P9FP3W0YsSIWf
	 w3XFfQYy32Ee+uJqx+ltq9uJDVQJaLkCAufXxbudFHJ9Zk4cgzm3XHu4FgED5nG5Sc
	 6K6vBza9DLaZNeZ1+UfQ1mWDEXpaVdzQAL051OR8NSUmy7tmapcieZbVcJkLIv97Hh
	 vkwVVl5Ngg0agOYNfoEQ5oSmHfv5HnL5FVJm5jQNpu49vAxmJgUJEXi4v4UuZ/sjJm
	 /ukNlNvvDAM7V1LjIp9TelIuDlaNiSwP+07GZBdMHVwvGIrCc+pau+ZYLYPBJeXg+w
	 URXm+LAcNB9SA==
Date: Mon, 23 Mar 2026 14:14:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: SOF: sof-audio: pcm_id is __le32
Message-ID: <ea12791c-02ed-4373-af0a-5072b14255b9@sirena.org.uk>
References: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
 <3a2272ae-97d2-4f62-bb06-900a8831e544@sirena.org.uk>
 <16290af2-4431-4cc6-9325-94492638d334@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uEunIsJalsjtbtVv"
Content-Disposition: inline
In-Reply-To: <16290af2-4431-4cc6-9325-94492638d334@codethink.co.uk>
X-Cookie: Avoid gunfire in the bathroom tonight.


--uEunIsJalsjtbtVv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 12:29:48PM +0000, Ben Dooks wrote:
> On 18/03/2026 17:38, Mark Brown wrote:

> > It looks like this needs a rebase against -next.

> At this point is it worth waiting until after the next major release?

If you like I guess, but it should be quick enough to rebase I'd have
thought?

--uEunIsJalsjtbtVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBSuIACgkQJNaLcl1U
h9BSXwf+NZVfu02B8kHE5p+Tj1UjtpKfZKWF5htV+5UUpBn5dOSJWn8WaJ+qXJDk
zK+2q8Y/Yu5b+1gxOw675tspPjBV4miOGqaU4gjkk/ZvUAn+G50J/APUS89r+WGh
KTmRPzSgB/M9Lfv5/WhVkr/jCeldxnHF4QS4ZA0934VasHClji0tCZi3OyKsJuGl
lE6J2m5M4GRaJ3VlDz4v3SCyzk19Jy/JWX3KV3i32rZseNOPLi6pefZxycvpzlkW
8i+OIVYWtheLn8SGy321Vt/qk477VTQS3LRtP26E4S7P2grIdwAsGwG40JvmXapG
RHmEIq2v4vUqOJPgeX2XG6it/dVu6w==
=mn0x
-----END PGP SIGNATURE-----

--uEunIsJalsjtbtVv--
