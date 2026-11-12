Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469277;
	b=CMi+m620ZwTbonFd4MaG8fJr6fmNn21NOuZLfsQTQVgzpaHdf913QCIon7KCKAdIqC2z
	 N7bTSPhIy/g1EWbTrQ0FxnTGsD1zrVXZBbnahTBhWcK6k/2HClMPsDVU35wDbd36dd5bU
	 kE3UJWsmlk+VF0tzfFdeA58hUkVXmcAZHMPb6Bh46PZCxhXfIdiTBHimRVa2QFpnXIGPn
	 cUrl456qHDdvCXYw/p3x06GWgH2RA4dvHMVq13M1U0bVEhOP5AavomGivndnZK0eUPbb6
	 fP2MNhvRahchZ+UFICV08DzGAbJ8E/8NvVH6ZEHBI6w2UoXaOLLGTaX/XEQ8GNfnInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469277;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9kcaNxBuXKMB2/FWVOgu3JlF7/n0YnSyWdKA89RNXEY=;
	b=YOfXTEYoOqcjXosppu/EJS1UrMavzAtoIXk9oemFQOSlZV6KxUTRy6LzKmR2c176S+6z
	 e5vEcEXQLPGVdu/lBiZu1Ip0kZ8eyAEL77ey41YM5dmcExtoifM0el+hPX2qoAc0gkqEz
	 S5l5kB/RIcdpWc8XNwZElfNnjxuMFDyHCw1QPXqthKkKILDWfxVsunokepXwVEbaXKeQj
	 dXf519QH8ZBhJOfZiKUYmkKCSeL33VxC7Vp6OF88zQn9RxvLkXxpiK1md8dIZDazagjbV
	 hyo8c4xz6LLtQA/Qj+uzS20CjRVTAb/4koYgnJe57RgD7mOeL5N69edqRqm+MKVEOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5LOFiuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA6606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5LOFiuB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620041F00A05;
	Thu, 12 Nov 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469277;
	bh=9kcaNxBuXKMB2/FWVOgu3JlF7/n0YnSyWdKA89RNXEY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=l5LOFiuBszXWCEv45fvI5ge0Rm0FE3qRbArvLHwudqJpS3M/0cXCeXyvUvp0P4ZNs
	 tnTn8D2KdZUdxSVg3OB8s889ENA88FJz/HlY8l7f0vxRaeFK78yD74Er45pQtnsCH5
	 mtGvYkoshskoBcP9ED2fYJJ/l82NPffUexJdBbzQrhZ3Q9SgnNTGcM/bECNTcJxCjN
	 y5UCMQOPgIXfbrdSFIxXr7F3H4UBmLy282h/5zXPiCETzG91KtU4R6kzf7MczA81IA
	 FUBisFP8i1Nh+bYchHBe0Hzyp22MimYSEGOY0+dt7AVzRsIO4cVsPEWuXF3Ub5uedC
	 CbYjVfMnaGuPQ==
Message-ID: <sashiko-outbox-210624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] soundwire: Select the correct runtime for lane
 allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bard Liao" <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261112072105.1296515-4-yung-chuan.liao@linux.intel.com>
References: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
 <20261112072105.1296515-4-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:41:15 +0000
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
- [Low] soundwire: missing Fixes trailer for sdw_compute_bus_params()
  lane fix
--

commit b1efaa73284b1d94c7492050c9026885c088a497
Author: Bard Liao <yung-chuan.liao@linux.intel.com>

> soundwire: Select the correct runtime for lane allocation
>
> When multiple master runtimes exist on the same bus,
> sdw_compute_bus_params() selects the first runtime for which an
> additional lane is available. This can select an already running stream
> instead of the stream being prepared.
>
> Changing that runtime's port lanes accounts for its bandwidth again.
> If preparing the new stream fails, restoring the bus parameters leaves
> the active stream's lanes inconsistent with its bandwidth reservation.
> Depreparing the active stream can then underflow the lane bandwidth and
> leave lane 0 bandwidth reserved.
>
> Pass the current stream and prepare context to sdw_compute_bus_params()
> and restrict lane allocation to that stream's runtime during prepare.
> Skip lane allocation during deprepare, when its bandwidth reservation
> has already been released. Keep clock recomputation and the existing
> group and port filtering unchanged.
>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>

[Severity: Low]
This fixes the unqualified bus->m_rt_list loop in sdw_compute_bus_params().
Should this include a Fixes tag:

  Fixes: 7a30292ffa2a ("soundwire: generic_bandwidth_allocation: select dat=
a lane")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072105.1296=
515-1-yung-chuan.liao@linux.intel.com?part=3D3
