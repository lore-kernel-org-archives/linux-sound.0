Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC034FF54
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473251; cv=none; b=fuyY+9IwsZwhR8KUUdf8MjPRMt8vxFxPxYmBYL4rVyA9VVgIZYrYEknHxZAdHYuJRBjWJvBLFYYZo9HeeRg4e1xT1DNfMgdBq5gBt3Nclyu8GBEvu4842PfBYpy2rjr0ptL1BlvMLt6cSW7tgyu3KefFYKEi3ThieTR1l5cJrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473251; c=relaxed/simple;
	bh=LZYWx84y2iIXePR6q8dOXCHkrpRJlqvFuFaOAX7yUCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lvDXqQDtTu4wD9vKDgqs4YTg7E+QimH9tux18bZh+d7SUpXtFfR6ad+wMbQAldyf1VBLYvmUPMJ80BIM9yOug115unhhMeh250rsIgQ3rP3t3udQ5kSfJRSA9pQqhDaHBLfCGhJHJ1hn6fgr9ryeIrDFepAkvDr03J1hxsWMHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkPZDxln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkPZDxln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA98C4CEF7;
	Thu,  6 Nov 2025 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473251;
	bh=LZYWx84y2iIXePR6q8dOXCHkrpRJlqvFuFaOAX7yUCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZkPZDxlnss7dHwDBGoikkocszaywLqv3XRXkm46MJ996eGLv1wEX7K6aa2T9R83lJ
	 qmr46Nf5pyHl/oOGpjFiERoJPwlcl9Gh+9oICsG59gPIvcY1KlgWbjX4botQsqdScK
	 SYkQcBgkr/4I+IzLm0mdwNDDR4QyvlRwRSQ/0rdPHv7zL0krUXW1jmGUOtJHea/6Cy
	 j862a1Oh+4yABNu9nrtEmfuj2Ieqx6bOfNn0gsq/ILyDTXZzceDtOHpbCDiCjXXG72
	 MaG5CUIq8mqSnJEzIbD72dPSPt4HiWTLQF0mdTMr7Y9Onmv2FXpE9QEBCWgoKt/x8l
	 NNS0HpoDdfjDQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20251106093335.1363237-1-shumingf@realtek.com>
References: <20251106093335.1363237-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: SDCA: support Q7.8 volume format
Message-Id: <176247324783.2482911.7498525569833264434.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Thu, 06 Nov 2025 17:33:35 +0800, shumingf@realtek.com wrote:
> The SDCA specification uses Q7.8 volume format.
> This patch adds a field to indicate whether it is SDCA volume control
> and supports the volume settings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: support Q7.8 volume format
      commit: 1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69

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

