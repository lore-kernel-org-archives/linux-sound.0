Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A503E715B
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173122; cv=none; b=Ttp0yp1cddGjnUCMis/TtY+HDQJ6Ow4LaRfzYJ4i8+INT+nC6xFqip9/yQbLIhnvTFRv0C7jkFOuOG136+atbnVCYwvLiL4g5+GgKhQNfKPji9u6QcGxsJ4pS/P0LRPKEzr1SqJmuF5n2i8o7V7jEiedHeo+3FO1qW6KNGCKqNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173122; c=relaxed/simple;
	bh=ZTedvpbKxRbo8k9/X01/qQdOnVBa0zUtpL7xoSc55Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5c+UDGJOBaU3VXQqrAk/pzOi6f9/NIieWzU6igFQtkujlAcDjcq7o5tqWUAsOJM6lX4CgWGxqv/BQcP1w+A+TDgVWo4Wt/ZbQUWjum06oZvO3DpOaYJmPtcjsLkZeoz9PdIUMAa1QLqdyC+BBPL9XC4vvXmy34fy2Y70X0Tyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYi/R/Ka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYi/R/Ka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F66DC2BCB8;
	Tue, 14 Apr 2026 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776173121;
	bh=ZTedvpbKxRbo8k9/X01/qQdOnVBa0zUtpL7xoSc55Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYi/R/Kayh/+xIqtsyZULeTmZ3K1Q1hyhIMOge8PjQGjCufqb5uWAzkLc189tEol7
	 pxjrKbCp26ExjyXjlRBsT8x5HA4J22A6h0wppj2QWkWs89JDlr+8IM2uxF/UCEhbQ0
	 GccIJ7z5n62qOH4gXQCNLmW9iBrVn3wmmQ9S8pK7LxuRxoLUGhZLUXoHRmn/zBBczF
	 N1oGJZQtoD3Ty5qSNXNVSpZEWsC/sCbcv7emZn94xjB5A6t2WmOWekDrTV8ZD+X5td
	 0QonOopwIdzqal1HCpY1vZ2oA6a9djp+UXDqjzOfizTT9BqZDNOMavL1hh2IWQ20Ku
	 bWo3DEoZctlew==
Date: Tue, 14 Apr 2026 14:25:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 2/2] ASoC: SOF: topology: allow user to add topologies
Message-ID: <8843a6e0-8e7b-4196-8834-4b8cda3c5826@sirena.org.uk>
References: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
 <20260414124443.3270016-3-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldHn+muE5N1PQ38c"
Content-Disposition: inline
In-Reply-To: <20260414124443.3270016-3-yung-chuan.liao@linux.intel.com>
X-Cookie: Academicians care, that's who.


--ldHn+muE5N1PQ38c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2026 at 08:44:43PM +0800, Bard Liao wrote:

> +#define MAX_FEATURE_TPLG_COUNT 16
> +
> +static char *feature_topologies[MAX_FEATURE_TPLG_COUNT];
> +static int feature_tplg_cnt;
> +module_param_array(feature_topologies, charp, &feature_tplg_cnt, 0444);
> +MODULE_PARM_DESC(index, "Topology list for virtual loop DAI link");

Should that MODULE_PARM_DESC() reference feature_topologies?

> +	/* Loading user defined topologies */
> +	for (i = 0; i < feature_tplg_cnt; i++) {
> +		const char *feature_topology = devm_kasprintf(scomp->dev, GFP_KERNEL, "%s/%s",
> +							   tplg_filename_prefix,
> +							   feature_topologies[i]);

Should really have a NULL check in case we OOM, though the chances of
that actually happening are rather low.

--ldHn+muE5N1PQ38c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneQDwACgkQJNaLcl1U
h9BQvgf/eVN7pj+kWq0fTAeQGHw6/pPBezplvTzUVzdT6KcwLNlp45/bZ/8+29bb
pjQNT0mNgiPSvlYljqC6VW9jx6yP7ZLB7MLPfFK2YaOJCCQeQogRdPocA3emZZEH
GbczWj2qZYGD1hNph+QIFshVw8LEcHybhxpLhn/dudDsBbxviFoMRUhu9m9vdVa4
YcbZJru+Tn05Uu2QwT6TKibHQNoCrIrDOVmf0pNcU6Jyzq+zROHRh2fTRs2uHrW1
N8X2QjUhXHLNrmzWIRvhOPxj5ocmmABmjQN6eugFUxoZ38SrSjpWMg92cE7rNhji
0kAficyj0sqA2adn1fYqS6msl99low==
=mJ9E
-----END PGP SIGNATURE-----

--ldHn+muE5N1PQ38c--
