Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F33126B3
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568631; cv=none; b=ScgGbqjQTnGygtU87l/F4E82spggRzoPFS+m+jvmxwHEeoXYtdJe2QfLVGDjUR4ihqloTKnAqXsFwv39wyAvosE8p9lwGkOXPqMiT49bfscWbNVHh/a7NVSw3OdBjtZufZ1CUCis80WJruXhRRJnpDucH+3McmrB2BCQ0/UGN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568631; c=relaxed/simple;
	bh=DmyXo4reufHcXOM1HP8igp00nyEpMKb/q5b+hiFFl1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oq7n5WFfMubJHxSyVmasStg+4EHDuUB6pg3eMucy5KKGgK+f5FVwFAxpQS1CuCxJhzhA8crmaY7LQ/BMmRQUfKZlEefZEsrqjylMoxNmuFHHth4UaJLpR41FOmQwvnwQ8gfgmwBTxAM8/EaC/tT1IE2oqzA5NtcCLXuZR+mC7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pl7r2qoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pl7r2qoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796DFC4CEFF;
	Mon, 27 Oct 2025 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761568630;
	bh=DmyXo4reufHcXOM1HP8igp00nyEpMKb/q5b+hiFFl1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pl7r2qocvQ0AjDVeRX7UD4L85bsXr8d12S79Z4juNq+GYA3+G0G1MUib9OwRDD2bP
	 freq6AgLYN0FwaMcMuq0o9f/WV0xpdFVPMZrHFVmBzuyWdSsrxRwG21fL6BzdluDjt
	 PHuZuk3jh6WvUwryny0HBGorhjHdIWHsIe4wjhZEqcrWlSYGr8Yut0dQek/Ob4WYHF
	 NlG+Oi1V+A1vXXVadj8LNpWZSiN/9bu25x3Uzl4tCJg8jP/4tGsvBC3sM31PhY+7rs
	 9LlMrV5jVvbV+f12s3u+TETIdhiyWVQFBKr654GcpvEjYqTQDxpolLTQMcPzk5TFfr
	 xSryHLQWgheKg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeusz.slawinski@gmail.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251027110106.3157415-1-cezary.rojewski@intel.com>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: Intel: avs: Set of streaming fixes
Message-Id: <176156862921.24382.10865893750835280630.b4-ty@kernel.org>
Date: Mon, 27 Oct 2025 12:37:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 27 Oct 2025 12:01:03 +0100, Cezary Rojewski wrote:
> Small set of patches two of which fix problems observed during shutdown
> and XRUN scenarios for PCM streaming. These ensure HDAudio HOST stream
> is reset and re-setup during XRUNs and synchronize avs_dai_fe_shutdown()
> and period-elapsed work (thread) so that no slab-use-after-free panics
> occur.
> 
> The last change makes the 'format' parameter provided by a
> compress-application taken into account - currently its ignored. Such
> approach helps us increase the coverage of data probing (debug)
> functionality.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: avs: Unprepare a stream when XRUN occurs
      commit: cfca1637bc2b6b1e4f191d2f0b25f12402fbbb26
[2/3] ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
      commit: 845f716dc5f354c719f6fda35048b6c2eca99331
[3/3] ASoC: Intel: avs: Use snd_codec format when initializing probe
      commit: 64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33

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

