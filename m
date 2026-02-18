Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09122D0C63
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422021; cv=none; b=hQ6y9l9bow96Rn+741CWahuW+od0npRKU3Hm1dgfzHfNNfsXabS1b8p3ss4mg2pkf+KkWiSlng3JSy8w7rqtNNQ4o6WTcvcI5X1lWUa+1fqZ0MB8j7N9R31UOBz+JQWUv77nYxS78/GSvQSumDe6G9azZt7EZAIoJFEhpZ9No74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422021; c=relaxed/simple;
	bh=ikKD/oPGiP+tBVci40Tg8NqGDqByIxgmY8EiEtqE2TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwAfwCJLR6S80ZYaF6HCjKUroRF5C7oqC8pOasCTYH3ac+vNunpSmstiHTwlNBVGsgt5i5DAhmviD3ef3LT3MPZmQe6KaoLMOvpMkw0gG3+UDNpdWhp+whY61X6Zghx2mo+PDsqZSgF3zcZgFOP76zJHavLwiM4/42e9oxFFU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDGZBpLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDGZBpLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E83C19421;
	Wed, 18 Feb 2026 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422020;
	bh=ikKD/oPGiP+tBVci40Tg8NqGDqByIxgmY8EiEtqE2TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDGZBpLKZ71ktq4k1/CrbMKdjvRl0sbsnxAhEJuPcSgHAU2VBV8qW8nlTTauqIIur
	 P6JBS/iNnW+o6+N2TCJRq42Wjb4Tf4haovQjdXORnSYwyh++NYXNXJFQ41yT3F2O9K
	 mBIyX6FVwte9t1I9MRS29XZXPTbjxF7oTC5JYUFGg6QEyiZa5n6vGUsRgwS091Errz
	 7GoF7i4utDucjXvdxiVAKgRIbSixUmVU9Ozr+aUQov1Aoa0wTaF4Og53jDjP1fj0/k
	 geMHnDKF+HkNHuGKg+YQZ/LpMRgtgjwN/9O8AT2BbGYY02qdZ8SAXLYCMCU36cqxY0
	 4vaVpwYOGpMmA==
Date: Wed, 18 Feb 2026 13:40:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
Message-ID: <d48daf72-89fe-4ed0-add2-717dcc5d03fe@sirena.org.uk>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
 <8d133f5f-dee1-46cb-b0b2-48a50b747d8b@sirena.org.uk>
 <29563f08-a478-40db-8c86-23977508205e@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a8/1UNuSo5ijlAH2"
Content-Disposition: inline
In-Reply-To: <29563f08-a478-40db-8c86-23977508205e@intel.com>
X-Cookie: They just buzzed and buzzed...buzzed.


--a8/1UNuSo5ijlAH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 02:32:34PM +0100, Cezary Rojewski wrote:
> On 2026-02-18 2:20 PM, Mark Brown wrote:

> > > +	trace_snd_ctl_put_success(card, kctl, iname, ret, retcmp);
> > > +	trace_snd_ctl_put_fail(card, kctl, iname, ret, retcmp);

> > It feels weird that we have two events here - given the result of one
> > you know the value of the other.  It seems like it'd be more idiomatic
> > to just log the result of the comparison, the output is structured so
> > it's easy to parse.

> I don't mind either form.  Typically, I filter just for the fails (here:
> trace_snd_ctl_put_fail) but greping for the 'fail' in the output is fine
> too.

I'm not super bothered either way - it is a conditional event so only
one will actually be generated for a given put but it looks odd in the
code.  Possibly worth a comment?

--a8/1UNuSo5ijlAH2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVwT8ACgkQJNaLcl1U
h9AUUAf/RQU5AL+LT6MWxDiSNmiSVtHhrLaLCS3hHmc9txK4bOmBKCWl10OGSSOi
XOMO5GKWS3Pyo85uM2FT8SucxhM3lxzaht8TpUlYzbtnXPc76gMSsVnNz+r6/bL9
S4zS77DkK8NGbwG4l9gkLITMSP+ReydNNb2TyF8gGCEgXP/gLTIGr2LhU23TGPdu
k0EADo/eN0McXxDKVEgcolWbxeUApCF1FS7weKONMlZdkEjQXqzr7qHEb5iP6RU9
Jgm6qGhb4izI0z1cXaFbBakVKOk+LuURLSq9/vw9IqLv+czNChf1ZYwv5r/gVeWB
/vKPQ55wbPPe0qV4FfTeSgjWJyVVMQ==
=6t1A
-----END PGP SIGNATURE-----

--a8/1UNuSo5ijlAH2--
