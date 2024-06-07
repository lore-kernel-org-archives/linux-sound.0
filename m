Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BF43AA1
	for <linux-sound@vger.kernel.org>; Fri,  7 Jun 2024 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781339; cv=none; b=W4QjXj3dMGPNrYAApaZYJpS0+G0ZBL/81LsKBjeGQwW7Tnx2FC7AQUj7jywZJoT5DUhVJWU0jkFyLrrzx3ET4WwGxj33xTn8fcPdCv5J89D/2jy460ReMHfI83S3yihsa5KDC51G8fLmWq2zA8fxNvcM83M9ZLLP2S/YYl62CoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781339; c=relaxed/simple;
	bh=rkvw7nx6OR72DV3Y81gGnZmzSns77dINzFFRdZJ+2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMD5eSqvNp1QoKstKDJ4MhumzQ4QnJCtNPJai+MgrNE7szgwHj7S3SAhGfM5r1i9PDD/j9IVyx6eq/Q4AOxteNrtwmHMvDenhqASclrE+l2g0Fgq4aoXp4AloF63sCwjVa8dyJnPEK8Trgn2RfjGdI/jDutOeyOUN4NiBOttO2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tpk4XTJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tpk4XTJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B793C2BBFC;
	Fri,  7 Jun 2024 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717781339;
	bh=rkvw7nx6OR72DV3Y81gGnZmzSns77dINzFFRdZJ+2uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tpk4XTJOq6Nr0e322g9iMjdmCDBqeJKXnh5nuPt7hO5LDYvnvPn1rp4KfbrCVuzul
	 DOZ54CDxcpUoq/y1EVcN9u0kC7YSmitEb8paZpMXMz6KCv9hrgKiu3/dq4gapH3e+w
	 EK8iQOh1/Bjv2uO5xiKFi/4yVXzTopZDIVbbmQ9IbYCTtKTVF0w1pFlWh3c2M/QAdr
	 N6fUle/OP13YkDi7DpwFEYVue48Wll/Jlgd/58OrmY5yKEwV+Ddd/5ZEx1xGatD+iB
	 5UvYzrSixxUpF/CbwK+bq/Whq/Nwh0R3wAZ5TdBYkR6RCWR/aeUSOQdw8qO0spngPY
	 tFPZMlxDb00hg==
Date: Fri, 7 Jun 2024 18:28:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: About snd_soc_dai_set_fmt()
Message-ID: <ZmNDV7-L-EFjf6vt@finisterre.sirena.org.uk>
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
 <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk>
 <CAA+D8APemxqMXdDsS5JVbWXfZPRPF8=eobw33WEhchF418TLPw@mail.gmail.com>
 <a9b8ba84-3f10-42e2-83e4-2c8549bb43d3@sirena.org.uk>
 <CAA+D8AMckXsESj=+vZqRqr_FkkEMsN3NDKqt9AgnNgXSin5RZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qg4K2d0FugrzbpEP"
Content-Disposition: inline
In-Reply-To: <CAA+D8AMckXsESj=+vZqRqr_FkkEMsN3NDKqt9AgnNgXSin5RZQ@mail.gmail.com>
X-Cookie: Your love life will be... interesting.


--Qg4K2d0FugrzbpEP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2024 at 10:09:52PM +0800, Shengjiu Wang wrote:

> With multi-DAI,  there will be three devices,  hw:0,0 for SAI1 TX,  hw:0,1
> for SAI2 TX,  hw:0,2 for SAI1 RX. Which means the SAI1 TX and SAI1 RX
> are in different devices.  Can we let SAI1 TX and SAI RX in the same hw
> device?

It should be possible to arrange.  How complicated that is and if it's
worth the effort is a separate question though - I've not looked into
it.

--Qg4K2d0FugrzbpEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjQ1UACgkQJNaLcl1U
h9CkMQf+PRXtcl50FgDzxefxD/AoBjFfAStw9U140R1OohIwrvlnbqV3LIU9D2rm
muVQKcMY1FJOHWG578Wp9u3jT9KKlc6Xs9EVFVmx2grkB5Ir3Nm+W7wt5zoFwAzz
voK16hRKCKafuV/0ub9G44n+N3beHwoThWjH1ybpC5Mi3C3MGn1NOIpAf9LSgVGb
raaJt01CHqYdUJ6K9+H+Q2ny3KkDzgYqVcod40rdGlXOWWlofYB8RsYY8AfPJe1e
0obZX0DSEAtgqRN9p86woSPMvnRA2nhSMtdJMVwZ9WpHugao4dg70138sViRoUIM
M37aI1dDD/3s0C/WD+lyWBFUusLfQw==
=1Inh
-----END PGP SIGNATURE-----

--Qg4K2d0FugrzbpEP--
