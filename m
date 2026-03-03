Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDF372663
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564212; cv=none; b=sZlXzbdTLhDDz/HAblQlgqTG83iXG/HVvcjqfjMK+EcieiSqIRVMAaKCOYtVwik35LMA0JrwaRfxxtZ1Oym3UJ0K9s9xyfy3bGLWonvqwLRjf8krrXN1Jlkt9JdbndxtndUginaVOG1A7zyNf0fO/z4VuAi0gCvn+nBDhjf+Tk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564212; c=relaxed/simple;
	bh=46PB+32RhKyiI6BQSppb/+s1jk7hiQ3bCMpII+GLcu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nT2oqHwP5qyXUzUtkLfPWEi0vO344XqtZZHn/R/cFTwwuHvrIflOHLb0xvdpRthp1oxi6bXBP81DIMn7hf4LbbywjkgKMUohN4T+bRqef95NdsPUjfBIt3vOZlGN6zEtiEeZ97NgeoskGRfXOYnxFEi2dJDCk+te+eS6SCq5JI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3/lUiTg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3/lUiTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F06C116C6;
	Tue,  3 Mar 2026 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772564212;
	bh=46PB+32RhKyiI6BQSppb/+s1jk7hiQ3bCMpII+GLcu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q3/lUiTgdkyBAXmBY5G+bKzJ0FLPtmBLREbw2S04/+xvnn1UqtBpPDGjOIEkxQVEX
	 lZHKTS3MQutQZqn08Bs0vvRXCVLWysOCAYKMwRuX5WmBA5FiUOAAX9SFBwy5e8lNcA
	 mlUkZQLSWcoESPW+p2QjMrh+8QwhFt81kNXGnyleKaj1nk6QicG+9BpB3tEZ7nyf8S
	 vfDuhvToO8ND6PyUCTmb0zD6ssD5tYAQeFk2MOuuxavOVx0it/XZmuirkLzPeauYDk
	 Pl/1VW+TUXCmebDQiaJWKsqHUR6HHcWN9YEuWMoNq0SfkmziwlQFmVfBwpH5GQ8E5G
	 LT/JW1wCryZXw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875x7dac26.wl-kuninori.morimoto.gx@renesas.com>
References: <875x7dac26.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: Use guard()/scoped_guard() for mutex
 lock
Message-Id: <177256421123.550348.9716098578086481028.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 18:56:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Tue, 03 Mar 2026 02:20:33 +0000, Kuninori Morimoto wrote:
> Replace the manual mutex lock/unlock pairs with guard()/scoped_guard().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Use guard()/scoped_guard() for mutex lock
      commit: f48e7a246a567e3764112e2463274c479d95cd96

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

