Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E953DFC92
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967244; cv=none; b=p6AvrqK7kbA3bULE61khfhYiPSZt9Hob8k/6BDK4mRcHJbJ0mjax2Pf7w9HLTcks1Kedo0Up2dymQIpXXaOIVmlglo0lYFcplCV+oH9iIeKQo2AoO8R9BVxGasNA3ihw0pKQulR3nclXVVhaPviSNSjYy6a//T89A1yVhWqilTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967244; c=relaxed/simple;
	bh=O1Ec3k4adL4IrDCvCOd+y76d/GdsJQqtv5PJyEUWn+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR18JxYoRO2PT8BtsKf7F5pFcjufKbPxDc+HzaAVz1I0PZPFN+XHrIOCqz8HPzLSNuA2DV4YoS0CtejE+aehDC0EtcjB9MCCxVfj9LvK7lXNRYNUWG+AgQWKf8pkjzXlCF1x4e2R6I/7wo6gNkR3OAZ3xFgvIBbXdGF3pRlcmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+uTo4Lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+uTo4Lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E523F1F000E9;
	Mon, 17 Aug 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786967242;
	bh=O1Ec3k4adL4IrDCvCOd+y76d/GdsJQqtv5PJyEUWn+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+uTo4LrXE9Bc1meh4GGBCBft+R9+VaGU5mjdmXYW9QMAtkCL6KAsgs7wPgJ5Gcy/
	 K30Pd7WvykZ7LT0Ll534EEchgaBzeBC0rI5z1b31Dz3jH/yToZSSWSSwDLfVh11Zei
	 8DhPu6Y3DvYne5zijXD2i3LTL+khGFkOysiIk0jxM2eIdfCeUo0inksVsdL/u3VwQS
	 jSAcJKImCPcqzOy5+U+jL3+Id4XxndhbkU2waAiTznuHRHFhD32B5BfBlHOHZv8qcp
	 aZX6i/RrEjwiizJeCYxgSBYaxiLGrb79y4LUA9E6QN8KakJaJtnkpxVB8Nm8JiC2/f
	 CaI8fOstrafmg==
Date: Mon, 17 Aug 2026 12:47:10 +0100
From: Mark Brown <broonie@kernel.org>
To: qianghua.wang@senarytech.com
Cc: linux-sound@vger.kernel.org,
	'Pierre-Louis Bossart' <pierre-louis.bossart@linux.dev>,
	'Bard Liao' <yung-chuan.liao@linux.intel.com>,
	'Liam Girdwood' <liam.r.girdwood@linux.intel.com>,
	'Peter Ujfalusi' <peter.ujfalusi@linux.intel.com>,
	'Kai Vehmanen' <kai.vehmanen@linux.intel.com>,
	'Cezary Rojewski' <cezary.rojewski@intel.com>,
	'bo liu' <bo.liu@senarytech.com>
Subject: Re: reply [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire
 driver
Message-ID: <c4edd65c-d0eb-4b4b-9dc9-3fafee2146aa@sirena.org.uk>
References: <20260814025653.5484-1-qianghua.wang@senarytech.com>
 <20260814025653.5484-2-qianghua.wang@senarytech.com>
 <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
 <00e501dd2df5$f12bf450$d383dcf0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXzXZvRc2rjDaYJk"
Content-Disposition: inline
In-Reply-To: <00e501dd2df5$f12bf450$d383dcf0$@senarytech.com>
X-Cookie: Obey all traffic laws.


--KXzXZvRc2rjDaYJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 11:10:22AM +0800, qianghua.wang@senarytech.com wrote:

> Incremental patches shortly.

Please send a new version, due to the build break I dropped the patches
before they made it to my tree.

--KXzXZvRc2rjDaYJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqC9L4ACgkQJNaLcl1U
h9BbFQf/cl3tBHdwjzDg0mZRuoa6RhYjjiUL0/kIVE5BDQtoPEXiRiCloCuGZZAg
LM+W75uFYSfB5rSY+y0A+SOLkrGAAW/mJe2+jiZSPgSDH42XLvVyJwN7ILIZJnBY
g3glFTzFWWEOk3qVSkfwzZBOcnYeUFwfMmx2No1AVjeVEFgzOAgim53H2P+ePvyT
DvT6d71jdzr2tH7LB8HtIgo+oLDzplNrJrRxTW98c20jDS3u9PtyiYW1I9QMV/4m
IsJ8Gr4v5EQBosAbXrTe+ube1ub2MJgB1LPol5JBEZVRSWWfpw17ouZBQ9JgviFz
Gp/pvIgXZTIX6RVv2UeZ049NgQEtAw==
=atDg
-----END PGP SIGNATURE-----

--KXzXZvRc2rjDaYJk--
