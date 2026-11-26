Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724259;
	b=c69etkw9m694G3QoeBIusGvEduaKZQP1ZKW1/vZyB/miCYlbkqZY3y8OMPS7Bt6amgCZ
	 Bxf5uOJygr15qJVEk7b2mSkoxgsvB7Jv86YH/ucYkNH11GkuRJDHBOYezvMYl5dO4yed0
	 MjwlHIo0/YGtwiGq+UdZd0p+Z6Ip5dWbTtjjeioS1iAD1Y9WEirYSpk/2NXUC2sV1RBAD
	 cZ+yvIzJLW6SOfksP4AJ4BijnttppWtTqfzMZav7Wn+jVaXaqEVpNOWUtKziQDYZMU61t
	 hIL26Y68WQUonKuCeJ4+cuSjJxrdeGhA+M+/DD0G08y3RNPuHzkww3wsdB8oo/xmY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724259;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IArda33oKK9jzC5lrjunhiZykEyYxIaG1c069Ld8ays=;
	b=5UyhE1zgSf7H/rqQCkfmuxd78xet2NvhbY3K/vaZEBzPcx1BsdAxWrWeX4zk5QJFe8WD
	 yZJ5qnNAZIFvkwCbLhxaJIrzVDP6mfOwRv2mc5eDR6wwGex4uv69RpnYsL3FsTdCQe+jP
	 h1SpsWeI7mLKWfyjR3O/fIQXhQo+sW4Mt2llibz4jXYfEpP0sM8SsI20iXmt5X0sqeuaS
	 jocmutLALjb+dbkMsCbupLSGTNNLuSqlKqfeGRkSNMSG/CYCiqZp9kQRUeV2M6hhcNzXG
	 KS86tUI7AGNXQgVhyEtWQlkqp2ts9VEU5wkw8YBktPr/ofrhPEYVBKJ5dTrM0NPMVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RH1kUG5y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCB606A327;
	Thu, 26 Nov 2026 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RH1kUG5y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD611F00925;
	Thu, 26 Nov 2026 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724258;
	bh=IArda33oKK9jzC5lrjunhiZykEyYxIaG1c069Ld8ays=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RH1kUG5yX3shcqyOGK4TtchOw3NWYW0uyI64mpDBc9hW646u6VA66yWHM/iUjUayo
	 RdZdi7En8FbImPmQlMC/F/JDCOhq5CmutCSLA90BZj1hxkyZHZwoac5xx6mBNh4Iku
	 ANeWJvWPWyg2aXDX4rlrdjiTjOL/EFoQDAhg52Uba3GpaQt8l6g0G2LGgy2KoSL92C
	 JjQmMiwfxJ4Qa4rjcYaJ7ab2wI7IgDNViyfs0KXRvMEs9w4SJHLG57mz84gMBFCh7w
	 0z4F/1TeZn6PRGjI37HtzWWLcv8vaQyKh9symu6HVZ6j2CXOBank2dz2sugFuXq5TF
	 I/C1cHv+JQYAg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261126154409.1665214-1-rf@opensource.cirrus.com>
References: <20261126154409.1665214-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Bugfixes to series "Prepare for
 SDCA Companion Amp"
Message-Id: <179571324600.142532.14550030212142381474.b4-ty@b4>
Date: Thu, 26 Nov 2026 17:14:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rbpKRy5BgCSpNymU9sljbz20rchsqQTuEgWi3XhJH1o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Jt8XTH/JYpj/4NReq1uzmS89MD8XyWkVFjfPsynFc
 Pf5T31uHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIyw5Ghs8+55YXhofwy2Ql
 p16YWsJ4eJJit5ukpvTMR8fvvFFbdpvhf41b6+2Dh8tueM+1jNKvVOGYtDK2y6rJQ2D9SlVWsUd
 7+AE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Nov 2026 15:44:07 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Bugfixes to series "Prepare for SDCA Companion Amp"
> 
> These two patches fix a couple of bugs in the previous series commit
> f5419389a940 ("ASoC: cs35l56: Prepare for SDCA Companion Amp")
> 
> Richard Fitzgerald (2):
>   ASoC: cs35l56: Make SoundWire DP3 mixer registers volatile
>   ASoC: cs35l56-test: Initialize DP3 mixer registers in mock regmap
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: cs35l56: Make SoundWire DP3 mixer registers volatile
      https://git.kernel.org/broonie/sound/c/1298a779a3ad
[2/2] ASoC: cs35l56-test: Initialize DP3 mixer registers in mock regmap
      https://git.kernel.org/broonie/sound/c/4c17de5c7713

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

