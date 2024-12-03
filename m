Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460121FECD8
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733248266; cv=none; b=Ka9vTxGUFgdA7cusMX+6wVsSfXHR3PlnW1LRppxdUIEYkVvBCP6d6wEWP86wgxf3Z/2vUu/mlqvFM7KN65xF3vDMaG+DeMEz55tTUUqM3qJfFjqWQQRykSSZiTT86qe2BsIG9zPGeDvHFHue+cz/pmEnQTG6ynEvwArupK4tcdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733248266; c=relaxed/simple;
	bh=PsVfxifq4es7LcUzwm/j9cj9E5cSTTbVtPm5nzKLz6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eW0khuwiyglWgrDzoBfSZVot4jvQExYhb0nVRULqwnb2ROcD92DuTdgCN9siEs95Jg/wvOL+y3RS6lr3GrJfU/axwHKMr7SPAki2JULycmeSh2x56UIoBIOuM2RhjenNdvQI9ty5xuAx9PMwGUQJMMBie3ecM+2jumC+XPigleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyYdp2F2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyYdp2F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE10C4CED8;
	Tue,  3 Dec 2024 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733248266;
	bh=PsVfxifq4es7LcUzwm/j9cj9E5cSTTbVtPm5nzKLz6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OyYdp2F2gUwIfCP1uEIK1mUi3vkIsDjRS4ss/YrtTN/6WPmvSsleYgW6YDn+10guY
	 UYGpHn2gYTDxomzfELmVQ8ycCv/W/JYk6QSKsNt0dUWN5RdXU//t4vWje1Ka0SAr9Q
	 RoeYxTY37My6hlzJlsogX9/JXYrHGg7J4RthMwjAbwZmsgtMOF6isuec73bsrL4gRn
	 y7Phy/y9mc+xcfaNmFuzeUCmn3ig+uPP3Hyud9y6reaY0vw8P7m/RPhZZZqAcQsDny
	 zhLt0KEXP1PdarN5cvNwKwQweehZLf/UVcmuk/yNU3nUtqvuH9Evg6/k8uBK3diWrl
	 beFjnFmUo+yyg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20241203141823.22393-1-tiwai@suse.de>
References: <20241203141823.22393-1-tiwai@suse.de>
Subject: Re: [PATCH 0/5] ASoC: Correct *-objs usages
Message-Id: <173324826508.459040.8057272734579925904.b4-ty@kernel.org>
Date: Tue, 03 Dec 2024 17:51:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 03 Dec 2024 15:18:15 +0100, Takashi Iwai wrote:
> I stumbled upon the use of *-objs in Makefile in a few places in
> ASoC.  Here are trivial patches to correct those.
> 
> 
> Takashi
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs40l50: Use *-y for Makefile
      commit: 3f0b8d367db5b0c0a0096b1c2ff02ec7c5c893b6
[2/5] ASoC: mediatek: mt8365: Use *-y for Makefile
      commit: e9d2a2f49244d9737f0ec33f4b7f3580faecd805
[3/5] ASoC: SDCA: Use *-y for Makefile
      commit: f60646d9c3bd5b390728ed1a1caa9ded53d47afc
[4/5] ASoC: cs42l84: Use *-y for Makefile
      commit: 7916a8d8782d4e53fe0133c8dace20a925e0204e
[5/5] ASoC: wcd937x: Use *-y for Makefile
      commit: 582057d2233a5a38e1aec3f4a6d66b362b42076c

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

