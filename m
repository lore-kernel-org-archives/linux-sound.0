Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5321F218580
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549939; cv=none; b=g3x92p4+Uloz1ltdv07cVdVdGTyEaVdlzNngfcW6lP/Z4dv2NKGOTn8ywRlnz6st7py7Z8ZN8wYAR76+xjBzq5qx8hqarXqvLmFOccCQQtvaWKAUUXX8ZNE/tu/kXVd5FeimG/GYV/8Y9uEUoZ3BWQ1xblGOBVX9fQFA+e2Ufe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549939; c=relaxed/simple;
	bh=mLIGPD/BqTssP8zVey+qDEfPFt/XBkcSAWO2uznvars=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RCmUT2Pdh8rwlowDpaqIzYkII2L+j5NeHpJZ7ooCjuu6aL4QoXKuviou6NmkRjYd1BFocmAvsIvxrWOp7jBeXzb2z2BU32EmvH26davtE21jIu1SLJbMMhqgfb0WFXyGjZg8OhtN0kAKaUL6Q6mXDrr46gtqkJeOHtH9MhPnkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff6GYl17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff6GYl17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95154C4CEEB;
	Sat, 30 Aug 2025 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756549938;
	bh=mLIGPD/BqTssP8zVey+qDEfPFt/XBkcSAWO2uznvars=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ff6GYl179nBrCwpH2/NWrjAOCCje8PTJ1sOPtvEMog8P5bg/ojLp5RXA1WtbqZ9dR
	 JoRh6JOFy6mG+i2SJcJXpAv9r/d13D9XKaXTtoc0nhEx41N49kfwMNtXLsitBfToZu
	 yHZekA3BiqSH8MWupEvlCrIYucrsqj9YxjOacNG0PkLaqX2T749aCuptmwNGPI8i0z
	 R9VauIrD+tceGXFdgeFw985BnkOyVUvQOQWA1yL1M3hF2H7G06KrzONDkoKyb60Fvg
	 4uBlTuH9wzS1K5IhM3lMGWi63BZNORsi1PJN+ZkMQICieL8U9vcu8RPmEgZwD1/kZJ
	 6pz1xOA9b+f6g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com, 
 liam.r.girdwood@intel.com
In-Reply-To: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
References: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4: Add support for 8-bit and float
 formats
Message-Id: <175654993490.400773.1133643631062943827.b4-ty@kernel.org>
Date: Sat, 30 Aug 2025 11:32:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 29 Aug 2025 13:53:02 +0300, Peter Ujfalusi wrote:
> This series will add support for various 8-bit and float formats.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc4-pcm: Add fixup for channels
      commit: 6ad299a9b968e1c63988e2a327295e522cf6bbf5
[2/3] ASoC: SOF: ipc4-topology: Add support for 8-bit formats
      commit: c04c2e829649ab8fe5f1cfe5d7cbb34ab0463231
[3/3] ASoC: SOF: ipc4-topology: Add support for float sample type
      commit: f7c41911ad744177d8289820f01009dc93d8f91c

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

