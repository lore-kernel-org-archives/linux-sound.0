Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA02145A0B
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277423; cv=none; b=ow6sZR+iDNTHdAv0JVM9tyibe2yW9Zd39VP6sqcgup1W4tMAZIDXuIX3K8CQ4khp+QEl5ol5MD6GKsN1LhvmMkgEQmxRa4Ynq7SjAzOIDu6gMBrfXxklfJt/Kl2DbtC/mrY11yXpnxNwITlAl4oBvDwCUjKlIeBikaAuLDujq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277423; c=relaxed/simple;
	bh=yUNr6keoG2qbqBdDfk20g0ZxkRRh8XECEcBXMAYLWCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sy1sbkQt/FLoJXxdCmu8FzFc1MWZps63sisJRs+vErNKOMV61EhdT5Jt6oAzs08r8ljgmL9aKOWLvz7smOm3x8VyljCPyyYSQl1ilFrhli2ZgJCBlTmvMeFvj5yrDiRTM514x/MC9Y6L3guZ9BzUWWdC3DfGvJdOP0Gcdt18WdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbDHHkco; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbDHHkco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB10C4CEE8;
	Thu,  6 Mar 2025 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741277422;
	bh=yUNr6keoG2qbqBdDfk20g0ZxkRRh8XECEcBXMAYLWCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RbDHHkcop+jGqQi3KHn6NgJj8TZdudju9UsSlaoVqylDh24ubY2M6Uia1d5WhorPP
	 GlmqNsZMEHwvaRLsdwRYFgOM1nnas+9nBFH/GmpNtcv0qSdBNCaQ/kmHmamUBfu5HJ
	 Nh/PSuEgLXGi+Rdk124LTSlMxKv1W9PGB0b9zdrwY/3MAF0YqSV+5CujrqYOtt9GLZ
	 8+Ri/eltLjTZiftwK+JJYYst/zwmCFKgDjQPzHPWnkFh1GlGxM7DPRIQBvJyIgP8D4
	 FMWJ7a+yYbETe3MxqEi3uvS5YCiPoyTWeBvdsvIbyR0r7ALMq8ss4C9i/Qgq6oCYcf
	 n8tQ/oBK8b4+g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250306133254.1861046-1-ckeepax@opensource.cirrus.com>
References: <20250306133254.1861046-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Fix maximum ADC Volume
Message-Id: <174127742149.138495.13978255706124433286.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 16:10:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Mar 2025 13:32:54 +0000, Charles Keepax wrote:
> The range of ADC volume is -1 -> 3 (-6 to 18dB) so the number of levels
> should actually be 4.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Fix maximum ADC Volume
      commit: e26f1cfeac6712516bfeed80890da664f4f2e88a

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

