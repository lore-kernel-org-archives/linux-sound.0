Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226D2DECA8;
	Fri,  7 Aug 2026 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786138570; cv=none; b=D4A6o3W+N27+3+lyS9VS3cgOoM7ThFNEjFuPE0fqw06HrT3mdCoJq5Iz1UyuDoq1O/mZWRZpgLr2ThlqR6p+MzrC3kNcXBedrpPjGuFQ01ANCCL257MRXQ3rxmS1ZNkAsTbH/X5eEz7nU1Mn6HJJuH2T9V93YMCOzo2XXNWI4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786138570; c=relaxed/simple;
	bh=YLVOegJUe44ocWVoIsKeNn7FaDMxCFnSonuDhFyCrYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/C5uIR/Tl9pm87EE/KdDYehIYn096rWqg+oPicN2zNnZqTfYRxTQOsdbfNnXvnY4ZkKNZLzhb388GdT2VCoHYKV8oFPy7iU8quSn1el91qtWexh9X1RKsYTR5WSUphZhsQt2bpwwbQ2COkrXt0ooKvhmlJ927h/HkV4yftECfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHbWTCE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHbWTCE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF7E1F000E9;
	Fri,  7 Aug 2026 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786138568;
	bh=YLVOegJUe44ocWVoIsKeNn7FaDMxCFnSonuDhFyCrYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHbWTCE/5JDm16G3zejavsVHNYCd+WkZCZRWk/Smpyhj5McURnBpgSG2iby0Gmhu/
	 t4phfFOU0EasyKY6GGHd2MN7VjTIkQvIILOj61UUXR2TPVHYfNG1q6aluyZhyDrNhn
	 9hr1huoQlrCppeGPAqjDll0eBCU12tT4tsSucYFaXIJ96fu9+bdQjSvA6rJd7TMriF
	 IhHZyD87cz/3t3n/l/MRXvTC7anhQ5YyGTVlGiQHS6F1o5fwJ6llp7PphnUlufgYWZ
	 4uPr8NWke4db8uxys88nvgx21SyphKTqygg9nSaqntTbLqA3SUxkN/Ly1unW7dF8+g
	 HNKdKF0Zs8eog==
Date: Fri, 7 Aug 2026 22:36:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
Message-ID: <b2fd858b-b6f4-43f1-befd-142ea4db1ed1@sirena.org.uk>
References: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/8DBddp88Mwcbgx"
Content-Disposition: inline
In-Reply-To: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
X-Cookie: 1 + 1 = 3, for large values of 1.


--z/8DBddp88Mwcbgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2026 at 09:24:50AM +0800, Le Qi wrote:
> Continuous high-amplitude noise could occur in the DA7213 microphone
> capture path after a Bluetooth out-of-range/reset event followed by
> reconnection. The noise was present in both the raw ALSA capture and
> PipeWire input, confirming that it originated before Bluetooth
> encoding.

This doesn't apply against current code, please check and resend.

--z/8DBddp88Mwcbgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2T8MACgkQJNaLcl1U
h9CgAAf/RWmiivrcQQU/+bkhkY8pE13XkQ330dE6d6rz2MIp8NhfmGHsX18ZSZvP
vgsazPClw6iCoK1XPvn79sJvVfwuGiXt/jDszqWnM9VILjxg5nV98n0Ie+5RM59x
nIcm+itsbqaMfDMfEjk2rn6b+VpAUOtets1BwekwcHbRwPYiTwJvxvXC4wtSlV8C
aGFws0N+Cn9kK1qyGZdTkhFnxGCckEyPNxoS0YTRPedXyZ+dNggNTjcVW/QjgFLx
5nIG5Blwry6faOmw/SJ8n+jWFqGh0awJNi5YHM+RNkU2PgS2RZLDepfMo3JUYuzc
8XeYpvmM3jqbYG9ljwTqDkmDLmV0+Q==
=Z5B4
-----END PGP SIGNATURE-----

--z/8DBddp88Mwcbgx--
