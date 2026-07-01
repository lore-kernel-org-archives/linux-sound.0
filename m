Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665A3CEBA6;
	Fri,  3 Jul 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079862; cv=none; b=nCQqTQPwGtht2Z260bYbW8/AUcokmN3qIbiZ7waJ0GyN7QED899gJPJNhhla640iADgDfqqpHUje6nWGOUqWEyulr6qBT3/H2DqkaDGJG8GumOVPWTfcl3D1bEJl2mEbIiJIQ80LaL6NhMTVOS+7Pq0MjADjFOKrP8wcjyIAQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079862; c=relaxed/simple;
	bh=Q8VX4gL7tUfrx/Ruca3pWM2OJwDsf5LGcRxJxTL1RwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NC2V4+oe02F22+e9xszXXpBECfjDcrsFYZAb+4fh3uO4fDE376KwXK6IMCMXlL082QxLN1xf+BD4XYRBSQPTCvax7WGRc3OnWJ7a1ShMkKW5yCKsNDgT0xbsCmnSSR0vjZeFuYK05fsOtttfie2V/7JtR2FCoeahJ/jKyD5DtSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7cqWby9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7cqWby9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF871F00A3A;
	Fri,  3 Jul 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079860;
	bh=YOUSlNKRgdCYStVEI73MID89Dqi+KHQE/qAuANN7Lpg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H7cqWby9Xpepc3sLfcSbwuJ72IM4ChheC7EGq1tW/eezkCUPH+I97BKBH23rDPHWU
	 n+3rkjvpFcl1yoxjnatpL8K6oSX3cYeGbH2NTNdFVBurxlDIb3NLMccVihUwkzo4hq
	 rmb8Bxh53hNrFuAuQ6P2noC9k/UZIu3ehRUqDxxuqcGrbS6keAsSynWw864i3HNwPF
	 nWHZssTSprWcV77CRKPLWz3pmHTngo53llXyS9vYp/eoFIXwHJ+M3UmjdA8zXe/Tk+
	 RvxWsX7xYuhUol8ACzAycUEvVt1BsRpiZ2UiWJFS1IBbY0yBaXdZw7a9B/laj18fx5
	 AMUdI+18fz3VA==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sen Wang <sen@ti.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20260701041310.230725-1-phucduc.bui@gmail.com>
References: <20260701041310.230725-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: Fix mixed goto and guard() usage
Message-Id: <178292055282.38925.1990247953891624479.b4-ty@b4>
Date: Wed, 01 Jul 2026 16:42:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q8VX4gL7tUfrx/Ruca3pWM2OJwDsf5LGcRxJxTL1RwY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6Oxx41RzeejTpmWC1fPV7dFWIGfRVSMOQXIN
 GL1Mt5Vh7yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejsQAKCRAk1otyXVSH
 0NvKB/wNumQFJo7xpgKcUqjItpdXIm2e01zpCI4k6Ms9t7vS++MEbNV7lfquz5goq4IDCwbRxOZ
 Zj/1+MS6wofwbqL3Dj16AbiYCySop9VaZSR/cN8P3O9rCSRt5cG8KuVxnoc74ijJITfHWE0FC5D
 QEw1xtKmYW+7PZ7HBEnj+BSxXSM/cftnaHIdSCd+jMQVX4sehgumr+m2gUPYCiJjUtY3vGMTPD6
 prxhaGp4cu9ALwGp7mqWwhKw6O/NrTUpv8MvR9icgyFxoq5r0S5ACOkCrlBICwH1tEiBgw6OZx5
 hq6+sTDzwZbjKeLp+GZy6v4QFE/InOPWApSGPjdmmdrrNb3O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 11:13:08 +0700, phucduc.bui@gmail.com wrote:
> ASoC: Fix mixed goto and guard() usage
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> These two patches fix the remaining cases of mixed goto-based error
> handling and cleanup helpers introduced by the recent guard() conversion
> patches that have already been merged for the 7.2 development cycle.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: samsung: i2s: Avoid mixing goto with guard()
      https://git.kernel.org/broonie/sound/c/02fd694e60a7
[2/2] ASoC: ti: j721e-evm: Avoid mixing goto with guard()
      https://git.kernel.org/broonie/sound/c/47a0dde9a3bd

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

