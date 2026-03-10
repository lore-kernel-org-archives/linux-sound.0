Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75556286409;
	Tue, 10 Mar 2026 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166618; cv=none; b=eGPF8J2l0Rx744q8fZG3mWWUyVEveO2u1SxNaN3bZztv35w1yHwpl6jHFSoEBcYQd6GrEGQ7LwNwG2PJQjGDGl4RiJuNmkv3BMmWosLUpteLD+AG/yIFOgyjvImn3dxsuDdtzZhd+Whsrn7A74XtTbf1viP4RdsLBmbyQSUJe/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166618; c=relaxed/simple;
	bh=8awRLsXynWiGFgRb8VB66XPRttd9hE2wsR72UFXb1vA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O2H41zvKnkMPfb4T+PeDOdb+J8Xl2gYcR9DzjMM35HyuQD/NBic2v0rbns+WlhJXWTe9aOzThrAemaIB6Uszkp7R7KnolWLSBprtBmmLhQ1PKdXm8JM1Dv9+MmgnYv6EKVXVsJ724o2eQB9npMCGOwky+acTj9YWd1YDFJ/xVIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsppD59m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsppD59m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2CCC2BCB0;
	Tue, 10 Mar 2026 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166618;
	bh=8awRLsXynWiGFgRb8VB66XPRttd9hE2wsR72UFXb1vA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hsppD59m7+A999xEt6W569MZVyoPWBzlfyUas2SD8zEYfKQHdC89FhFawHHfm77sw
	 uksA3Kmor0xdcOrymlWW4F4S/wcyTtTqNmzbYs0GksXYOl1ivr2QYfC89InMGh5Q8w
	 gBWn1tSwVu8Hj+p5L+78jMnu8NUM/bppXxu8R/k1BWaWpBSdmofgCUDynhsNIb4lHJ
	 4KMQN0sPKm39fGNJdMN3xwoYcetPzit3Wo+9bmKazB3RLE/NkGjp9DXA0jMXEVndW/
	 SyEyCe8MKZ6YFJeLxPwk0emCL012C+FHfd+NaX3HdTRuNQBeqBLYx6Q/DHR0IGqnfV
	 w/Ex0tGDxm63g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260310130343.1791951-1-rf@opensource.cirrus.com>
References: <20260310130343.1791951-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Simplify suppressing log messages
 during KUnit testing
Message-Id: <177316661731.442708.18227201739492605208.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 18:16:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9189f

On Tue, 10 Mar 2026 13:03:43 +0000, Richard Fitzgerald wrote:
> Rework the way that kernel log messages are rate-limited or suppressed
> while running the cs_dsp KUnit tests.
> 
> Under normal conditions cs_dsp doesn't produce an unreasonable number of
> log messages, and state changes are relatively infrequent. But the KUnit
> tests run through a very large number of test cases, especially error
> cases, and this produces an unusually large amount of log output from
> cs_dsp.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Simplify suppressing log messages during KUnit testing
      commit: 9be71d462c33b1a00acfa4ab8f0f5332ed592817

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

