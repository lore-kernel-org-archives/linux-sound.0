Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700BC20C479
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730925611; cv=none; b=SoKAAROS+2ExuHSnp5W24pcvFBaSzXmOAN4OWnnhXhp/sNkmDAyQinn6PGh0tefr0GBHcXF8jTpPDgKFaJFIIJIxNCm6KGvxkCFyoTChHShpRxNVG4FpmAl9mY/tKuglDmnZOrT6BlNEk1eiWz85mXdmNG/gTO+DyhgyZ2664Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730925611; c=relaxed/simple;
	bh=TcnRxXQ5NQRhQsO1tbGpdpmzM23GzKVClfoPsT02fIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AUb3g7MnllLddf7KWGUgEF5o6S6vda9GAoJF9j30P4QXZ0psqJy2Fp0lcbdpvCOEQylEFdR7pfrodo7YyhbTgz22XeQfqlAiuPAhiFwmedSEAKjAWm4g1xgHAv5m2x6mkIr3cuKqBXW/YjT+TXEZZv2Fjj2VjZl2S3hjhW507E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4R4rt8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4R4rt8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C36C4CEC6;
	Wed,  6 Nov 2024 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730925611;
	bh=TcnRxXQ5NQRhQsO1tbGpdpmzM23GzKVClfoPsT02fIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y4R4rt8e5aq4GodDFJQAnC7fWmJFsTai36Q61wsuoeoEgwnI+8NuQm9DuBcOZSFcP
	 NT0kobFYUhoGcUENt52gvDE0l0iuBYb4WMGdbxdp3nQzwhZ499gaWv9W/H3eCXdOg3
	 mqurXw47IqB0VN1f2LxI1HFSbKihyhqjq4ZycGlcNdxD0aX3u04+H6sg5LZgA+WGrV
	 w9AwA7bEBcS4BBbxCsQ6gqRnANK1KGnp8SP93sQwmQjaFlVV/VoCNqXIW6ajUi2gXI
	 qoogCBiPCsSJkmmCDluS4kKwrVYO50ALgh6oABwSg/B1fg+fzsUAarsX+9ZJm+GRfa
	 jaKEoQJLXtFsA==
From: Mark Brown <broonie@kernel.org>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: mario.limonciello@amd.com, linux-sound@vger.kernel.org
In-Reply-To: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
References: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
Subject: Re: [PATCH] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14
 2022
Message-Id: <173092561015.197490.5206296760497866669.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 20:40:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 01 Nov 2024 12:35:35 +0800, Mingcong Bai wrote:
> Xiaomi Book Pro 14 2022 (MIA2210-AD) requires a quirk entry for its
> internal microphone to be enabled.
> 
> This is likely due to similar reasons as seen previously on Redmi Book
> 14/15 Pro 2022 models (since they likely came with similar firmware):
> 
> - dcff8b7ca92d724bdaf474a3fa37a7748377813a (ASoC: amd: yc: Add Xiaomi
>    Redmi Book Pro 15 2022 into DMI table)
> - c1dd6bf6199752890d8c59d895dd45094da51d1f (ASoC: amd: yc: Add Xiaomi
>    Redmi Book Pro 14 2022 into DMI table)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022
      commit: de156f3cf70e17dc6ff4c3c364bb97a6db961ffd

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

