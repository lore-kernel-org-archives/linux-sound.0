Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E23578F2B
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569331; cv=none; b=fir2vxTl2rf4AzAjdJUq9k8+OKeJjTJ9Hg52YvBEUv732FaOC+Awk6d9S2KEc9IwM+0Bcq1x4Hy71w5RMgE1DjFbLSFUzxQcHY0TMdCxK85BIVhAvtQzVku/5WBzxAQyTD2vFNQl3mKM7RR6p2OD8G3Rw6e/khsMeVoM7PTLQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569331; c=relaxed/simple;
	bh=wdYltJxWKus+bmi9o2i1JKOMPyFNJBLu/zFCDoU7FVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dQ89wDScTxAKWQ2QM94J+HcDWNRujUgk4a8OgEzwgCskr2KvzbXJ32mxhagL/6FEgkhZsLmJ11VPSEvdqNUEpdII77QTXwsXThWOY8wXVPFPKq/CVMMYsmf0e4XWea41gKUmJ+jCjD9rZSorNENc2JxZoj0Rt13Kad9KunI4C+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDgeNXiR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDgeNXiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56120C116C6;
	Wed, 28 Jan 2026 03:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569330;
	bh=wdYltJxWKus+bmi9o2i1JKOMPyFNJBLu/zFCDoU7FVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iDgeNXiRvAJK43neRA8gbp95QG0Rypy4MU6oL3UwksmWrHVSExLMkb/oBfJpr9jwb
	 ZC7St5gH8lb8I+Ts/r85Eu8XQRkkwRk92a458QOtmloSp8TgtlgncZ6kqIcQNA6zPX
	 GM2ayRlDbv1YyC/NkpA3hkAIhNglHriB2p1yVUnAL5vxforz4xJ1i7osmc+zrni+1n
	 RLvIk/fom+vWUqLbH8XWko6J7A66hAJTtXpOgrtaUaDvO2A8zz8lsZ78Q7SThFotzI
	 juZzS3UIBhQI5hg8jcyxLg8WuvEkRUnrTdQMabzxacmXWlVCJPRq73ZEw2YvVJG0oV
	 ROqAqjyX+7S7A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/8] ASoC: capsuling struct snd_soc_dapm_context
Message-Id: <176956933009.1515833.11036420546295839436.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 02:14:18 +0000, Kuninori Morimoto wrote:
> Now, all DAPM users are using function to handling it.
> We can capsuling it. This patchset moves struct snd_soc_dapm_context into
> soc-dapm.c, and remove un-used functions.
> 
> Kuninori Morimoto (8):
>   ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
>   ASoC: soc-component: remove snd_soc_component_xxx() wrapper
>   ASoC: soc-component: remove compatibility definition for component
>   ASoC: soc-dapm: remove compatibility definition for dapm
>   ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
>   ASoC: soc-dapm: add snd_soc_dapm_alloc()
>   ASoC: soc-dapm: move struct snd_soc_dapm_context
>   ASoC: soc-dapm: tidyup function naming
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
      (no commit info)
[2/8] ASoC: soc-component: remove snd_soc_component_xxx() wrapper
      commit: 19a412b66df7cddbc1fa87e049c56bacf00adb27
[3/8] ASoC: soc-component: remove compatibility definition for component
      commit: d8b795f65217dd033daac5147eba6acb73a9a489
[4/8] ASoC: soc-dapm: remove compatibility definition for dapm
      commit: 40ff409eacac686bda70ce7720d8b0e7c7401635
[5/8] ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
      commit: cf0e8c555b34b0ea3d2a41edf6dc214239a71c80
[6/8] ASoC: soc-dapm: add snd_soc_dapm_alloc()
      commit: 13c84b4c6f218c196c9c72286645247996800427
[7/8] ASoC: soc-dapm: move struct snd_soc_dapm_context
      commit: 5b517f1a5cace3cba9a48491706e330848ecef86
[8/8] ASoC: soc-dapm: tidyup function naming
      commit: af6d53db28e6448b1e0ce9aa314bc5da494d35ab

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

