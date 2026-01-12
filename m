Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5732D45B
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248496; cv=none; b=jK77FId/MByY41K7egERB2a4nfUCYpzDderHowimFCgqeEIt323R2WwiqNgsbCcsBhyLjyjQfEwEkwTJmvnzmq/Z4yyqZibSlay/IfX2a5DnvCvYBYgYzmxSNdaiNuIIcm9Mmxx9kK0O+FRNVRWaq2uTL/+p9tUrA8ARc3ij96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248496; c=relaxed/simple;
	bh=Bh7d/zdwXpmwXITXhyeVoeECx68s1pjgRXnqahNXttU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ne6Z30KvFDu0ChsIMsqIw5ZRn6XkbEZDBKy5aEzKh33GbC7e6vkz2pThbjriHW+04lCiksviKYdxfh52vrFiA4zLAI/RPdTvG9C5qiDKWeOQF0NEzGoWr1T4JbvP2i7dlmBNs0MJbCmjUBW7OjC3Q6nLBQV1uXrTM5imv8Qovs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgIjJDPd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgIjJDPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D21C116D0;
	Mon, 12 Jan 2026 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768248496;
	bh=Bh7d/zdwXpmwXITXhyeVoeECx68s1pjgRXnqahNXttU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hgIjJDPdOidNt28xwTkU4ksUBXF5wpQXgCDNGGrGPadIj/Mk7vvf9az5hY8zu+SEj
	 uiPQFrjC7Y2U8tMOO4NSGFzyHdfhgjspu+Mg/3ZX/lPLqR5E2UDGk67945R3Wvalko
	 0+fSyWVOhEgd6397u7DeNc2xbgwOsF9GuTzpvBwDnVw2yNo7Q19MdO/CipHHbSiVdG
	 +8IjITsA3jQ9KnIf/ruuRZ+dsUb9WxiLS/L1Rkz92tJH+/mCuwFdWaLGXAfY+ZaN0a
	 v9jn5KIhB7SlUKKAv5kIbGlnUiyYKdLvuT9XNDozBIu9xPzAPMUVK90Z+jlL+mh95u
	 BWtKs4BzfqyzQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87344f3bko.wl-kuninori.morimoto.gx@renesas.com>
References: <87344f3bko.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: rt1320-sdw: convert to
 snd_soc_dapm_xxx()
Message-Id: <176824849533.206448.7632064572233461164.b4-ty@kernel.org>
Date: Mon, 12 Jan 2026 20:08:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 23:54:15 +0000, Kuninori Morimoto wrote:
> This patch converts below functions.
> 
> snd_soc_component_get_bias_level() -> snd_soc_dapm_get_bias_level()
> snd_soc_component_get_dapm()       -> snd_soc_component_to_dapm()
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt1320-sdw: convert to snd_soc_dapm_xxx()
      commit: 77157cb45c66bd652a08a360693fcced558c5ef9

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

