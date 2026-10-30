Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359603;
	b=lWHnwVGRM8Q639KbgERVWsGKVYKEgtUQMcPnw2nUsiUSD/PKLrG78Gdvl0nFS1/p9vdT
	 wrbUxODK3a5FgUI7JIvWbGmEPUWm436Lkq1CIiCmEZTCKNFl7LhmKXRMM2soCMExD6zIR
	 6UQZaagPoYq9jsvwu+D8gqYLbw1+CmTke4uDYhOWg+RW6crpfBPtOr5jW4oxdjRibNVKw
	 S4NQJOkJ8Hyf9znblNKL03+RJcnwJ0cAoy69d0/kEZZbhDyiPTGFUQbfLFx8Sy8n4JZLc
	 Ch/jeB2EKm1TXf9NU+dEBSubrwxm1vZ/zDGMm0RwXR2iG9x7xRbs93Qk8+c3TdAbI1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xP0xsRMQMydwqUKpdDytHtAPCQPENgOAJoe9Lcl4pGA=;
	b=GSIjm3gi3Eu4Nl2sz5m517nHWJCl2RvosLJpGH18v3cWiAJ6Vlj+/nBRV6CbF/Kg4+fP
	 TS2Ta+XyUl95NxkCOnfXdcF53I/3/nlX2H3CHJZcdjWDYpPK6ASs8IDrhgOn3+4sE3vVj
	 NuRu+a21Fh8ItWP2RtHjiCs8Iig4kQDa7cfkBvDYUiwmkPjHyLqD9shkMMjNlXukZl/l0
	 BdtB8WDIr2Fu+KUCoFHezhFiXy2/W4fCcB0rLcueLAANKLSuxiTaEyUUCzIZWD6orm6zJ
	 Xd9I31RzMw84fdf4lvL8x6wjXHMd0DxgO88J+WSWUyoNFv2HZ8K6ShOFUJZ42p69Piw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dsf5qJgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69718606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dsf5qJgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53B91F000C1;
	Fri, 30 Oct 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359603;
	bh=xP0xsRMQMydwqUKpdDytHtAPCQPENgOAJoe9Lcl4pGA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Dsf5qJguFT++qmVhN2ndjTyH/5P7w2M6hNI06Admo+4BBG0PdnauFnw0rUsG4ids+
	 ePQZ0IU0lEOS7cGOy2eDmqGtcfU29q/2L/HExWwX1MtfDABNK14b2TtmHXhYGmPX8s
	 t35JkHxY2xpk7vF5w5sW+kogYvfMFfY95MalKJlUthORL2FQk/fc+ARJrtdxKiJ6Jo
	 iCw8xuHbFZ/hh+J+vT5wqWOFsoq1O7Dq/ZZYlBBToHwE2+cPgYIldP+TJaqSYuaG21
	 QaV5eY5ewVNaY/w/R4MHyfCRFqh9ZCH7pf7HYfO7vqFP0Yv6yIGc1KIQ2kTngys7T+
	 ayF8qptMLZHNQ==
Message-ID: <sashiko-outbox-190937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/21] soundwire: intel_ace2x: Protect bus.bpt_stream
 with bus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261030104840.3361217-7-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
 <20261030104840.3361217-7-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 11:26:42 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] soundwire: mix goto and scoped_guard() in intel_ace2x_bpt_open_stre=
am()
--

commit c2ba69ef3a3456c129416a89de7531b53eb520ca
Author: Lee Jones <lee@kernel.org>

soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock

This commit protects checks, assignments, and clearing of cdns->bus.bpt_str=
eam
with cdns->bus.bus_lock in intel_ace2x_bpt_open_stream() and
intel_ace2x_bpt_close_stream(), and ensures both master and slave stream
runtimes are removed on open failure.

> diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ac=
e2x.c
> index 642b33ab55260..3623fc9f4451f 100644
> --- a/drivers/soundwire/intel_ace2x.c
> +++ b/drivers/soundwire/intel_ace2x.c
> @@ -83,16 +83,18 @@ static int intel_ace2x_bpt_open_stream(struct sdw_int=
el *sdw, struct sdw_slave *
>  	int len;
>  	int i;
> =20
> -	if (cdns->bus.bpt_stream) {
> -		dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
> -		return -EAGAIN;
> -	}
> +	scoped_guard(mutex, &cdns->bus.bus_lock) {
> +		if (cdns->bus.bpt_stream) {
> +			dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
> +			return -EAGAIN;
> +		}
> =20
> -	stream =3D sdw_alloc_stream("BPT", SDW_STREAM_BPT);
> -	if (!stream)
> -		return -ENOMEM;
> +		stream =3D sdw_alloc_stream("BPT", SDW_STREAM_BPT);
> +		if (!stream)
> +			return -ENOMEM;
> =20
> -	cdns->bus.bpt_stream =3D stream;
> +		cdns->bus.bpt_stream =3D stream;
> +	}
> =20
>  	ret =3D sdw_slave_bpt_stream_add(slave, stream);
>  	if (ret < 0)

[ ... ]

> @@ -293,15 +295,16 @@ static int intel_ace2x_bpt_open_stream(struct sdw_i=
ntel *sdw, struct sdw_slave *
>  		dev_err(cdns->dev, "%s: remove master failed: %d\n",
>  			__func__, ret1);
> =20
> -remove_slave:
>  	ret1 =3D sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
>  	if (ret1 < 0)
>  		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
>  			__func__, ret1);
> =20
>  release_stream:
> -	sdw_release_stream(cdns->bus.bpt_stream);
> -	cdns->bus.bpt_stream =3D NULL;
> +	scoped_guard(mutex, &cdns->bus.bus_lock) {
> +		sdw_release_stream(cdns->bus.bpt_stream);
> +		cdns->bus.bpt_stream =3D NULL;
> +	}

[Severity: Low]
This isn't a bug, but intel_ace2x_bpt_open_stream() relies on multi-label g=
oto
error unwinding (goto release_stream, goto remove_master, and goto
deprepare_stream) while this patch introduces scoped_guard(mutex,
&cdns->bus.bus_lock) blocks at the start of the function and under the
release_stream label.

Since kernel cleanup API conventions documented in include/linux/cleanup.h
discourage mixing goto-based error handling with scope-based cleanup helpers
in the same function, would it be better to use explicit mutex_lock() and
mutex_unlock() on cdns->bus.bus_lock here instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030104840.3361=
217-1-lee@kernel.org?part=3D6
