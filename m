Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100311;
	b=fDUIKYpXJcPdwEov37nLD1RBedkx77l/1wUpRi/nQXcq4cmTriJJsGRoJ+ckpiBJJuzY
	 gyMaEWO6NJSqXej6pAc8wfUG5IzG+M0uvg/JgOJdzMPWxuSL9Ldv/pe/Fzi3QMg+zxzx/
	 ChjJyxh1fb7z6veNqrBEncCM036S1G3MWvW8WTCIsP3UkWNDtncn9HnBV0L2YsQ4NRqIR
	 bb0r/uuG0Pq5crXSHkWdPqpFRZ7oND7x5RjAVWSO9NpZ/U4NFotUrlkc35JEbk+ZeVvV4
	 6ZgxHA2RtbsNYiSCKCwEZG62UX9A5faEkx1sWWaMez8VYlUWkIfiPs21XMJghNZDNew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100311;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5P1cEV9NRGCXBtg5sM5QJHTOwJvuKGA/vU2pCVYdCu8=;
	b=OBTzcHmQ5hB1EMfS24iP8w/XgURF/rHNKKJDbmwVLLb28esVFz5exaLyqpkgzSZM3mkm
	 1Qz7kyjaz06FE0fiOlUt0CEfkwUZ3snraCE6GYDML7ygCozzpokldOGhAwn2P5ENhZPv+
	 d9snDmfHZdsPby09ZBzlK/As1qHEWVtt8n0uPW9xXmh4P/R2WhDuT0FNgqvsR6J8iKk95
	 Aw6C8CtxNsiPkiaffzJS06UPv+3CuohCoRs7brNm8Fh2eBDZhdcmWw5KBTAfsG3ca74M9
	 ScliLzppqLWYd6VJ17IcEU3Dseid7/Ke3jN1AzCwqicS3oKAXWSmDKx9EwlMTOuE6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQTWUVVn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE20D606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQTWUVVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8C21F031E0;
	Tue, 27 Oct 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100310;
	bh=5P1cEV9NRGCXBtg5sM5QJHTOwJvuKGA/vU2pCVYdCu8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MQTWUVVnGqYqX25jKoYSfAxMVHy+atUsSlccw2kJ31UQZZ6s2+Ub7bE0wYmYa8RMV
	 9w92Yptd8dVmhRZXGCM8CnazdkAp8UbyRi3Rz0t/GLMPGBHMdLW/ZoXC3RzpjL9qnr
	 VjV4p9JP1ZQmO+eirQBiFbQZc7MO2ngLA2x1UzoEZwUA82179mkCbiOGJec0trxpMz
	 Y1RFGWKnhyBmTwvBNhBz1jDoirbKZf1ixfctlZYusFZ8ibdtJlH8J8rfJvp6JsojCy
	 LrboEgoGlyclC4S0m70VTHm4kEJ+8TC5RKAiRug4NslmDQi9fyFMMeubO1JjTJSiqJ
	 2N6gfE+t0qxuA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DE59A1F4AB9E;
	Tue, 27 Oct 2026 11:25:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20261026064251.15017-1-zhangyi@everest-semi.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2 0/3] Modify the initialization and headphone-related
 settings
Message-Id: <179304576788.199157.7157888741242210309.b4-ty@b4>
Date: Mon, 26 Oct 2026 20:16:07 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=broonie@kernel.org;
 h=from:subject:message-id; bh=prRQn2zyb2wEbs8NFFpKfeDb1qv7xtOeC31GFGu4+6o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedAnLvT5fvPpWQpm5zerX1Sdvb+cR/SB6p/Piz8M1E
 nViyXw7OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARkfMM/5Ot9pYeDBIpLvq3
 e51KcNBTi9Itr39qTFnAKPt1j+aKYAVGhmcXSxJKwu3Lprh96kmxu5i0jmmuu/muvXXhQQX/N59
 04gAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 14:42:48 +0800, Zhang Yi wrote:
> Modify the initialization and headphone-related settings
> 
> To support different versions of the ES9356, the code reads the chip version
> and performs different initialization configurations based on the version number.
> To improve button performance, we've adjusted the timing and settings related to the headphones.
> 
> v2 -> v1:
> 	-The changes have been made as suggested.
> 	The incorrect path now first restores `regcache_cache_only(es9356->regmap, true)` before returning,
> 	preventing `regmap` from remaining in the direct-bus state while `hw_init` and `first_hw_init` are still false.
> 	At the same time, the return value has been changed from -EINVAL to ret,
> 	while retaining the original error code for es9356_register_init().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: es9356-sdca: Modify the timing and configuration of headphone events
      https://git.kernel.org/broonie/sound/c/5532cec20250
[2/3] ASoC: es9356-sdca: Add writeable_reg
      https://git.kernel.org/broonie/sound/c/ddc9472baf11
[3/3] ASoC: es9356-sdca: Modify the Initialization Configuration
      https://git.kernel.org/broonie/sound/c/6d7dbcb5f8e4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

