Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA6033F597
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683561; cv=none; b=bhLgojEP4Aj8hqJ6rybph/2A+NeuxeeL4Ftx8PWCI73NE7d9WR1vLo1nrl3U8/CVUyig5WbV1yqLv/WneFPTSNe2LjnUn4XGWIEHnLqJzrjXBmFlRLH/ZeEfA4KvcjWsxj2XUGsMLtF2dMMwfFw5WUWarD2MW3VV72rhwoC1wsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683561; c=relaxed/simple;
	bh=sjtTspAlz11gOYMbA/JnnLhezcgZn1IDrH+FambaXPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D4bDb+RzHgJrp9FRsTzpbwSKSeBrTwrIrKqQ1aWEF1OnCmgaBZv5/IkNh6ZRZCAesSrBZ96HwD5VQ0crOVSoiFUjm/158w1Fnnz8ty1I0XT4MtTG4kQc4PNYWpV2tzEX7L24FyzS2bMIM4cbTwj83I9C37JP/Zdh1D7nlNmgRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSnKa3bS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSnKa3bS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D3C19421;
	Mon, 16 Mar 2026 17:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683560;
	bh=sjtTspAlz11gOYMbA/JnnLhezcgZn1IDrH+FambaXPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QSnKa3bSzugL1anHGG1QF83LrMt0uMijApLilGZBWqbFzfxAFy43/LTLih1GEYcso
	 lq3NHXFNE8frnQXDzxLpe7bdJcJQzhy5WoQqcoRtOEYfDyxlI7Yg+0KpS07r1Bo224
	 jS9DDV+3Q9QX/tQdsrhHyk+LiFiNUapoaE29+sdDmjleMWlSTxdxfB5ML/l3oPs9EO
	 TggOLqwjkkfYwOYcDDJdq5k6xaEyaz/fM/njo/k5cImVmpym3h3PMrWWzMZqnUg/yz
	 PnR//TDSJj4CYmaJ6lo8b8jnSrlBkaU1Bp1hD7fpNRAbmEmN6s2WnzzDdqFTGDrCKn
	 Jse4HDV+nzCRw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
References: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Add SDCA support for the cs42l49
Message-Id: <177368355917.146755.3658826617002440027.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c

On Fri, 13 Mar 2026 16:08:56 +0000, Charles Keepax wrote:
> Add support to the class driver (just adding the driver match) and to
> the Intel machine driver for cs42l49. This part is very similar to
> cs42l45 so for now it will just be supported using the same UCM, hence
> reuses the name prefix in the machine driver.
> 
> Charles Keepax (2):
>   ASoC: SDCA: Add support for the Cirrus Logic cs42l49
>   ASoC: sdw_utils: Add codec_info for cs42l49
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SDCA: Add support for the Cirrus Logic cs42l49
      https://git.kernel.org/broonie/misc/c/7699b12a32b9
[2/2] ASoC: sdw_utils: Add codec_info for cs42l49
      https://git.kernel.org/broonie/misc/c/5e2f19ce90d5

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

