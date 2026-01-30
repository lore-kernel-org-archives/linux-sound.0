Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582B256C8D
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786028; cv=none; b=fCodglUt2+ia5hbeCHnCXdE09EoI7Qz+hK7n5Yuq4ZTJSTdScnbxew4miGLIgz3oWwMJkcJMdFuYmhZB/1sxgoxtyNdKmfw0VskET3TnNyIoO7cN+izCDwSTcIao6ESECC2HpvztWBCwxcC0Vh0/BH6rzR3BEzgTfPc+Z80CwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786028; c=relaxed/simple;
	bh=tgLKHXym8uVB5/luv/mED/IK8493vR9J6W+yIMhhbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhivanxS/CrA2MmX6tW70BQh06O83IFKfITh2gllTnrYOUclmZdX+2xAFRSOSSK7ZwDHtWPkL+7x6U5rdMqU8DmifctWLqiEgPEmWJf/AkausGz7lK1TJABARLQ38SFnkE0Vo+d0Uz3yNcAF43L6O7OWW9nPYf/Ef8c2FLLe0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw4qwahU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw4qwahU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B23C4CEF7;
	Fri, 30 Jan 2026 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769786028;
	bh=tgLKHXym8uVB5/luv/mED/IK8493vR9J6W+yIMhhbjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jw4qwahUqba7raemerTv7cvgVNwCWnHK3imKD8mXL1WjyGM0q5DFfdgPm8HSO1FT4
	 h/j2d5jUQurOmuZmGV8vOWopQA2WUu99s9D8ikvsft9waIhJpdtcOuQdgwbAcuGPXz
	 w2ypUopa4j3NNNqi84AgxiVB/ax43JqAuu0dKJmOZbbw6mJ1+MAkAqlVEpl3nRRQwk
	 BqRy3qEB5KfCIlRbMjzdqDJX6DN+06+6ZZTdc4L2mkGJLyZMrEs+XRipUeZbuZRwOp
	 4pIrpgpy4ikRMCpGV08MbyKDL+aS5K2MOXEwoqSMgCPWDaqUZATW3xCq9GU50uwKB3
	 tFY0CKjOB4erw==
Date: Fri, 30 Jan 2026 15:13:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, perex@perex.cz,
	amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
Message-ID: <245c0bad-9040-43c7-9c12-08919eb3640f@sirena.org.uk>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
 <87ikcjxjgr.wl-tiwai@suse.de>
 <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5kwjIdxOLzHF0Njc"
Content-Disposition: inline
In-Reply-To: <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
X-Cookie: War is an equal opportunity destroyer.


--5kwjIdxOLzHF0Njc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 04:00:10PM +0100, Cezary Rojewski wrote:
> On 2026-01-30 3:29 PM, Takashi Iwai wrote:

> > > > +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
> > > > +			sizeof(original.value.bytes.data[0]));

> > > original was just allocated from the stack so who knows what values it
> > > had originally, and the get() is only going to write the part of the
> > > value that has data since the normal get() path has a memset() in the
> > > core.  Similarly with the new value coming in from userspace there's no
> > > requirement for userspace to set anything that isn't part of the value
> > > being written to any particular value.  This means we're liable to get
> > > spurious mismatches.

> > Yes, and if I understand correctly, the above memcmpy() just compare
> > the single byte from original and the result?  Then it'll lead to
> > false-positive outputs.

> > We'll need to query the control info and check the relevant values
> > for each info->type and count.

> Wouldn't memset(0) as a preparation-step solve the issue? That is, each
> element - instance of struct snd_ctl_elem_value - has up to 512 bytes of
> data, regardless of type. Not seeing usefulness of ->info() here. Perhaps
> I'm missing something.

A memset() on the original value before reading would get it into a
known state but wouldn't solve the problem that userpace can pass any
old junk in the unused parts of the new value it passes into put().

--5kwjIdxOLzHF0Njc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8yqcACgkQJNaLcl1U
h9AT7Af+IHo9EeyrPHE5RBMbH0bqYmL7NV0F9kXl6ZcbsouVA9flJuNxFsZd8g4b
XyOmrrsgvweuGxecYzY+v3IYBTab2ajz0FpemR0O0Ry4wynnVsAgmwdgK68zNUXi
FY3mJWTYFMNSkWTPkDZJHF2eB9eKN65oVJaI3cGhWrDD+ajYiF2fYsD2H7mhqFSI
6cH7vTgXcs5CSUWf8cx0HS7Zo8KgouhQ6fXys+yDWXu1gFOKNrqhiqI1jd3uOhDp
bJ3w9sblsmOcpMyKPIom2HngNCKuAcB/0fnMMLeNSLXHzmB95GBA+nyrTq1K7Lzu
BYdadSvraKx0JBBrQ4wYyrxvx9g5Zw==
=EJqN
-----END PGP SIGNATURE-----

--5kwjIdxOLzHF0Njc--
