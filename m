Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BB825A2DD;
	Fri, 27 Mar 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645603; cv=none; b=C0HqWDAGBshaM5DO6KwO4wM0LtnDSHOpss9fDh6v0+6HigKW9LUJSrZbDuZXsdXeaQg9z6Y/L3EeGQcXAK7Qf16D1k6QbuTd9Mjou6g7ZRT1pOitTTJDRrWXaGUjIYeDhLFPqolY7xYHpAGuh43yDtw5SzTp1zqXoYZuEpuFXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645603; c=relaxed/simple;
	bh=p6D3FOIVmDhVaKrf3LFAwQZNZKyDeaGYtUn4mhSiqGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeJ67wu7WUL5JtdMO+yPIjIwdTRMgcvyiPJF0jIF12tfkxc97jAX9SP2dDlJ1RkOd3TeI67AZvdXlBMzA5JGLo3E8VH9zrgDYbnkcDlZM5JH7SHp0ZcdhG/8K+hF0pITeTCysahxJJP90cdxToSFsR087FHGPyj6gCA+2JoUTSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfSw147S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfSw147S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E3AC19423;
	Fri, 27 Mar 2026 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645602;
	bh=p6D3FOIVmDhVaKrf3LFAwQZNZKyDeaGYtUn4mhSiqGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfSw147S8nkyP2kz3Wnm9wvvZ4bYhtEzzJnsjV1pl9wH1s34AutFhOObca5S1720y
	 HmcKkoXZDvI5j5rO0N1/DSoFUQckDMT/LCaPmnlyjpevYVmPgOXVcoNj8V2GNhTYtZ
	 2CQ7JyDAN+VMspA+MXV0YVxymPDiyAXYYi+gRPMqrhCjUsDwOV3092g7l+Bw/XdW/I
	 P7CJ3fyqZZ8Juv7is+9wRu7bF8pJRUh7JEhb0W4QqcvZ87FhxaLAm+rrTa3AP6NaVg
	 usMRDrQirS17xpUvGSQRbAyzNoUAlvuzIcGwFaX26QBwSZjeqGLjCjRQvRcJLqrtFc
	 +hPgBOilno7XQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 081781AC589B; Fri, 27 Mar 2026 21:06:39 +0000 (GMT)
Date: Fri, 27 Mar 2026 21:06:39 +0000
From: Mark Brown <broonie@kernel.org>
To: aravindanilraj0702@gmail.com
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ASoC: Intel: Fix MCLK leaks in
 platform_clock_control
Message-ID: <acbxX-8PPcXg5y1C@sirena.co.uk>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327210408.430908-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZxRMNiFebQkkcJJ"
Content-Disposition: inline
In-Reply-To: <20260327210408.430908-1-aravindanilraj0702@gmail.com>
X-Cookie: Identify your visitor.


--7ZxRMNiFebQkkcJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 05:04:05PM -0400, aravindanilraj0702@gmail.com wrot=
e:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
>=20
> In three Intel ASoC board drivers, the EVENT_ON path in
> platform_clock_control() enables MCLK using clk_prepare_enable(), but
> error paths fail to call clk_disable_unprepare(), leaking a clock
> reference.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--7ZxRMNiFebQkkcJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG8V8ACgkQJNaLcl1U
h9BD6Af9FZSlo+mNfukjttGMmb2kQdub3mJ1Xz1FnuTUXC1IrK0TJlPqIi2dN45X
tL/tN9nyeTzSwuVKjxU/uzavbmnMRX3zGzFYmmbCJERbKnTDRBJepBJ0qnm5V7JU
jrk5CiP9IN9L0AivMsWVpKHDHyPLn8Nj/RqnM8iwv3yGvxKISetoUjqAUkOcap0R
qteQ+6XYaJoCsLgFIwJADVYMzZG9WPmbyXgWkvfCtRA0t6d00UgE5xoY2RG1Ykln
epqS7jsXs+5gmdLkTvFs9ZnJBy4Swit1fL9iHQ+CFAe4fKDvzaBAJoF92txjW2wE
meSF2o/sYr6wNeXRFMRzjUEkldAMzQ==
=GQXX
-----END PGP SIGNATURE-----

--7ZxRMNiFebQkkcJJ--
