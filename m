Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1D2F8BED
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015828; cv=none; b=FQs5Sl9l8om9SpkEyWQLp1AjUVb5SWMNEHct4HfE1IUIpsAAU0z3ozWNee3I2DoQ0b/c+DWzTfk+PVM5MP7OuMdtL71fMc1m2TgLnafiOLXanjWr8vz9UIZ/LJZSB8RlMmYQUBSkSD8gzYyBCoetiN9QiT8wjnBzNSUZBeYrINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015828; c=relaxed/simple;
	bh=AThvXH4wpe8fbx1Yt4tLGd0MNKOZRPsi0dr8rOFEmS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J4sBgEkpma06gojL74c1lMAmFVPvVTJK0sXnXHAIutUTQuk9A+02nOzIVcQOzoCAk7Aw/qvbbU+SsqqLLQCgUbW45P7rvSwAe8+vN5RPSYO1K2fkmy1tXVyvtWhpZy+iyCJDy2vta9iPBw31wk7iRogamzfB4FZn+JXBTd/9tNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoQnlXpl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoQnlXpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A227C4CEF6;
	Tue, 12 Aug 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015827;
	bh=AThvXH4wpe8fbx1Yt4tLGd0MNKOZRPsi0dr8rOFEmS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QoQnlXplKk0zGHqRdx1/AKrXJz4cD0M2EK0r24IYN1wTxlUmuqxhQ8WvhMoj7IdFh
	 ZrvaPSDrpe9rP79bXLlLGcbLGomNC5gOrmyIrMCUfEsqelDBr7XaWnbivsyniyRaOs
	 57T2QbnPsZSps/U63BuhXMUBx9ceYRUpDs/U2hE6nF7gkV24zCYAHFnbWIcOf0p+DM
	 E/bPmHpLx//DqgGyeDJOAfoDJDfAwxZo9GhWlzvWJKtK487/k9OyWHOOfFUDXXasvW
	 vhM4PIMnXaN+YWi23u+3nSkUcem970sJZMGN9/v79vXldixQdJV1PnMERrZ9GfTCcU
	 OQC6QTX1QriWg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: unpack snd_soc_component_xxx_bias_level()
Message-Id: <175501582685.192378.5865199182599690756.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 17:23:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 06 Aug 2025 04:41:25 +0000, Kuninori Morimoto wrote:
> Because struct snd_soc_dapm_context is soc-dapm framework specific, user
> driver don't need to access its member directly, we would like to hide
> them. struct snd_soc_dapm_context will be removed from header in the
> future.
> 
> This is prepare patch for it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-dapm: move snd_soc_dapm_get_bias_level() to soc-dpcm
      commit: 40229ea9fa437d6a1feb86be9dd419e843ec754c
[2/5] ASoC: soc-dapm: move snd_soc_dapm_init_bias_level() to soc-dpcm
      commit: e93703687cd75a0c7d330e15a3d9ff20b12f3d1d
[3/5] ASoC: soc-component: unpack snd_soc_component_force_bias_level()
      commit: 7b900b5878a910d60ecfa67448bbe81e4e2bb8b7
[4/5] ASoC: soc-component: unpack snd_soc_component_get_bias_level()
      commit: 7509e7e4288976e3028a6e8482d979ca77f584a7
[5/5] ASoC: soc-component: unpack snd_soc_component_init_bias_level()
      commit: cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34

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

