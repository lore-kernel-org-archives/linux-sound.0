Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A072C21EB;
	Tue,  6 Jan 2026 19:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728555; cv=none; b=Dbc303PJoIVB8ypNCrJM2Miyk/GToe4dKUzEOOPhc0JNv+95sOjQk3QASyUMulmC3nRwmrhiL8jGn0SCcLc6L1jXAUoWfQE3fvZ0CYyAUJFFXVx0ITGoRF/HZhiMVAm4Z+ehUPmsDH86MCdUdWduNMbeBDcp14r2L7oabWzWahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728555; c=relaxed/simple;
	bh=jWF3m6daFoYmqFeFTzfMLsBLzmOCVcH/zwRjAtfY4ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dcBGeAsExZNUnggo9dKStCMyug+u0B8RHCAhkUGNto8XAKHL0HfIc5HkIOSmDgqvDTehKuNLR4FZbuyE2COTazMEV36NevZpYYmyTxlW3WXyfZPJWXnJ7fcEl83KYm4Y/0LFHWHkDrMabqZopuPWnUin5SLkQjfJK6wrPVsELQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAfoSjqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAfoSjqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6690C116C6;
	Tue,  6 Jan 2026 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728554;
	bh=jWF3m6daFoYmqFeFTzfMLsBLzmOCVcH/zwRjAtfY4ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AAfoSjqhhi2pRUpHYPF23HdQ7e80qcKRx4kaHXQOGRgqGUqeJtI6ND7KKSb/Q/B/5
	 /JShcWrqB7SO2D0UEdbmAlJkrYAdPg+d9dCUQ0v+vGOD5o+QaLGUCszBqcqI90k5XV
	 o6a0ocKCaAEuZTzugxKztxU2Uzcpyu8sEwnMKyiT17n+gsUXoQgQ27NDne1auoII+T
	 hAG+PQUv4hA6kZvuxwGkEv7hQLaNEkhXbqlnTQSg//3st7pz/7pptUfujLjuBqzWiW
	 GDwNClkwJkbcIXfyYfydZlwrX/UL3Jp4m9SZrA2YrF8eQYZsevaPwowwudOef8Qvax
	 2HtdlF3XxMsEA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/8] firmware: cirrus: cs_dsp: Add long-offset WMDR
 blocks
Message-Id: <176772855363.328192.192529625158196380.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 31 Dec 2025 17:27:03 +0000, Richard Fitzgerald wrote:
> Version 3 of the WMDR file format introduces a new block type that has a
> 32-bit address offset.
> 
> The first patch of this series adds the support to the cs_dsp driver.
> 
> The rest of the series is adding KUnit tests for this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] firmware: cs_dsp: Handle long-offset data blocks
      commit: bc0305cb294c693b2762cf863324defb9e5175e5
[2/8] firmware: cs_dsp: test_bin: Run test cases with v3 file format
      commit: afcbb0460e0a9f0e971512c66619fc649bdb86a6
[3/8] firmware: cs_dsp: test_bin: Make patch function a test parameter
      commit: a01816edf11fc9e6c8216bc03870311ce2add5a2
[4/8] firmware: cs_dsp: mock_bin: Pass offset32 to cs_dsp_mock_bin_add_raw_block()
      commit: 9e6f4c5b2d3af58390cf554ada9591935c5ac774
[5/8] firmware: cs_dsp: mock_bin: Add function to create long-offset patches
      commit: 880f1eb5b95ccf250f567927462a7d3fa8f2a727
[6/8] firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
      commit: 6e60c6aa1e4b929f6fbb04dc9fa786aeaedf3693
[7/8] firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
      commit: 7fecf0bf1202599920d929704a3787291fc068db
[8/8] firmware: cs_dsp: test_bin: Add tests for offsets > 0xffff
      commit: 211243b69533e968cc6f0259fb80ffee02fbe0ca

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

