Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494522;
	b=qbdYMKLCriYNJdKZqYm+n5Dkt2NHIxlpdDoVw3+Hifnwhm5Ld/5yoPb7GqVWRo+YccoU
	 ZLg9NDcN3ehYO2sCxky1RWXzbcTYy8PM1tX4ZSeihrpDRSfSUHAoeMqTufP1/Npf0TZA1
	 yZQJYtHFGPZqaIOs9CVOekNHuWJ9DSwJFktqwYcCROdDWxZODHvjJgfdrezUDwh4UtPKB
	 BaHw3dm0TWfj3tfapCrhONyZ9CIotv440L3V20GjX6COvFCjxhMsh8+vzknF2NfCNcHnF
	 hSy572PWJdfV7TOaoN718BmfwFy4v82MH4gENvskpwtbJ24Duy73s4B6lVclmQi8aTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494522;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R0CqHJ3E1M5zOPyZcc8y+C+cyk/oqXDvh7U3m6MEEkM=;
	b=TpjbcSBwHGxGkXoUZvobAageeL0+VzbRpfkvS3KIGTP5cpvZP176j1RsS5anNsTp9Qnh
	 V/2+su0dMaXukeKDjEjxC/5p8IJ7/ZndJ6qp1+4Pw2wG14AumaDx+gDT2wGDIGd/wB/ru
	 Q2P88Ssf6UF3/B2iSwL/COWeC5tjzFPyJjpmAXKdoo6WRdSw+aZkD0x+7pfI0613x9GTW
	 Yft2T7tj+MsM/YdR7hnm+rwD6imtp6aBUv5DOgzR6Nn/iov5K2J31k7EJdLVPs/bK9scQ
	 nGeyh7UDpv4AGLrl/cfZp0pgcl77MCbMb+AYZL9cgJswSsRbnSyOx5TjBf61wuVCYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNBeUwS7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24AB606A331
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNBeUwS7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1BE1F00A05;
	Thu, 12 Nov 2026 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494521;
	bh=R0CqHJ3E1M5zOPyZcc8y+C+cyk/oqXDvh7U3m6MEEkM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KNBeUwS7Ttu45F5Dq/wXM9kQhAo9EmmmnkmoVelGGHOqmNrJi+tttW9GgHp8UEtSg
	 VUwbj5pO18QuvRlFHm75zqxAhpvZF3ETWssfHbMJCgEF8a8bIGTK+ZYN18TTvqTjEK
	 JqnEwg1pvJaBiTQqo/ZAzjlZ/zkJy+uoLfHIkTM+pXwX/4Z7rB4lcmxRVg8/xnz2kx
	 o4AUn61DI+VXcgSgOrs2g3l1ry8VFLIKEbHqcVn70UQBDETDdTp+y/M2V5PfBIu7sL
	 1Mkf/h8NZL/eXTTgKZfoVOJ0Rty6s6HBX2MPZPjadSyxF6UYfdMg++x/JwJFCEA2ro
	 ldp2l/hkjQ1/A==
Message-ID: <sashiko-outbox-211366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] soundwire: Include the current stream when
 preparing again
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bard Liao" <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261112141905.1372770-5-yung-chuan.liao@linux.intel.com>
References: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
 <20261112141905.1372770-5-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:42:00 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] soundwire: missing Fixes trailers for DEPREPARED stream filter
  commits
--

commit 0e099f6ac5f748061c8ae06b3d0b581ba6e28f1f
Author: Bard Liao <yung-chuan.liao@linux.intel.com>

> soundwire: Include the current stream when preparing again
>
> sdw_prepare_stream() accepts a stream in the DEPREPARED state without
> changing its state before parameter computation. However, the generic
> allocator excludes DEPREPARED streams from rate groups and port
> computation, and only includes a CONFIGURED current stream in group
> payload calculations.
>
> Consequently, preparing an existing stream again can reserve bandwidth
> without computing the corresponding transport parameters. The filters
> need to distinguish preparing that stream again from depreparing it.
>
> Pass the prepare context through the group and port helpers. Include
> the current stream during prepare even when it is still DEPREPARED,
> while preserving the filtering of all other runtimes and the behavior
> during deprepare. This supports preparing again without temporarily
> changing stream state.
>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>

[Severity: Low]
This fixes a bug where re-preparing a DEPREPARED stream skips transport and
port parameter computation due to state filters introduced in earlier
commits.  Should this include Fixes tags for the commits that added those
checks:

  Fixes: fdd1faeeec14 ("soundwire: generic_bandwidth_allocation: skip DEPRE=
PARED streams")
  Fixes: 25befdf32aa4 ("soundwire: generic_bandwidth_allocation: count the =
bandwidth of active streams only")
  Fixes: 62ada17a6217 ("soundwire: only compute port params in specific str=
eam states")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112141905.1372=
770-1-yung-chuan.liao@linux.intel.com?part=3D4
