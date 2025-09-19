Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAE1C862E
	for <linux-sound@vger.kernel.org>; Fri, 19 Sep 2025 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293863; cv=none; b=bTIpRCyU9UsZpg7VXHN1X+o0OsY+fXKLbLlT/FcavnWhi58lQmav3lf+LOhtSbFyf6RTGxCpQFfLLGmT2qnT3xuvoPEuWjtZZH5FcMVD8HKckUCEOndIqz7BKpqIO4+BC5v9DiaiO6dxpaU7vZsZpWsnYxuAq5Ugrdpgv5hMHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293863; c=relaxed/simple;
	bh=s3dSOY7rip7KR+x7xb5em/+na/aJOJbFcK/ERoFYrY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ifKMpz+GX/gp0Z6cI2QisTtU77Xz7pkExKscS8N0Btub5ZeBabwJvIjQ+GchhbEnbMaIcWo4noGC1eaXRmeNmaZ0pdVYP2gnIyczZR7Ts2p7j99bjYrAg+J2hfG1fTBan72qR/PeSUpuWwyxpDxs8gGeTe260omRBX/BQ8gIB6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWJcVwBC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWJcVwBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62084C4CEF0;
	Fri, 19 Sep 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293863;
	bh=s3dSOY7rip7KR+x7xb5em/+na/aJOJbFcK/ERoFYrY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DWJcVwBCjXbzMUCHJ0P9ZXAzgtantd2RT1f2K1iw8f7d3NVabjUQTj0IBCEAhC1ve
	 lI7spYLgAfukpMQut0MReSnLMFQvg7xMiN2CRtF8UeHf6daC4nuJPJAYQlFycxk74c
	 S2jhX2ZH6kGU7JfznncQ2qj8VadT8Qf/+mEw9tNDgb481pgPJG7J4k27/XiK3+K1Mc
	 RhqIH97pALPq3D1ZZVKP3hhbqqT83X0i48yhDKbPq8QVdw5tG38RwwX0TD9mgI04UU
	 aZQW7EvQXY36tbuAUuXHmjZHKmy5JHH+71U4sVzB7EUxm++w8maMOCzcWiQLjSclN2
	 IhGvoRj7HGopg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/10] ASoC: soc-dapm: prepare for hiding struct
 snd_soc_dapm_context
Message-Id: <175829386207.143827.8330888905000957922.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 15:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Thu, 04 Sep 2025 05:20:45 +0000, Kuninori Morimoto wrote:
> We would like to hide struct snd_soc_dapm_context from driver. So we need
> cleanup code  first. These are preparation for it.
> 
> Kuninori Morimoto (10):
>   ASoC: soc-dapm: add snd_soc_dapm_to_dev()
>   ASoC: soc-dapm: add snd_soc_dapm_to_card()
>   ASoC: soc-dapm: use dapm->component instead of container_of()
>   ASoC: soc-component: add snd_soc_component_to_dapm()
>   ASoC: soc-card: add snd_soc_card_to_dapm()
>   ASoC: soc-dapm: remove suspend_bias_off from snd_soc_dapm_context
>   ASoC: soc-dapm: tidyup idle_bias handling - step1
>   ASoC: soc-dapm: tidyup idle_bias handling - step2
>   ASoC: soc-dapm: add snd_soc_dapm_get_bias_level()
>   ASoC: soc-dapm: add snd_soc_dapm_set_idle_bias()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: soc-dapm: add snd_soc_dapm_to_dev()
        commit: 6b8ba0db92cd01450acaf375caf4c126aa913d72
[02/10] ASoC: soc-dapm: add snd_soc_dapm_to_card()
        commit: c8df096bca84c9eb04b656015c8430d0b87ebbcf
[03/10] ASoC: soc-dapm: use dapm->component instead of container_of()
        commit: 96e311b561a2d393a786a2aeb50cd5e02d06afb3
[04/10] ASoC: soc-component: add snd_soc_component_to_dapm()
        commit: a1c99b6097afe64ed493c05b522ee4d6f9b0094d
[05/10] ASoC: soc-card: add snd_soc_card_to_dapm()
        commit: e38a80c5c24f3058bd5da6f2910e2b672493f4f2
[06/10] ASoC: soc-dapm: remove suspend_bias_off from snd_soc_dapm_context
        commit: 3bc0a92cb2062fce54ddd97ad68ad6fe358c3ff0
[07/10] ASoC: soc-dapm: tidyup idle_bias handling - step1
        commit: 889dd56f8c03586e5489050e7457a405fae6a420
[08/10] ASoC: soc-dapm: tidyup idle_bias handling - step2
        commit: 4b4fdc8b75a902eeb7441dff1876c2bb31c7715f
[09/10] ASoC: soc-dapm: add snd_soc_dapm_get_bias_level()
        commit: 2e7f0a86123d54a94fa3d309efdfbac02f2999b8
[10/10] ASoC: soc-dapm: add snd_soc_dapm_set_idle_bias()
        commit: cb3c715d89607f8896c0f20fe528a08e7ebffea9

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

