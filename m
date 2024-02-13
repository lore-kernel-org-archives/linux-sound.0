Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB510A1F
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849099; cv=none; b=HJNwHjiV0Vt3ZrK4PUNI2mg/j08Z5RUw7Q3DMAcTgXu8LMGy1jnp8A3XfdltP/gRxSMUJ3ppFG71zJnRUsnjKvrx7mfXPLrc+fOHncIHpJVukbVQF06j2+LNZfgdGci9nzT8aHl2QgseTdp3lZJVZM6a2rb0J/dyuvKwK6OaDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849099; c=relaxed/simple;
	bh=8Ujm7pBOmLNG8NFh+tGCFiwQgnkKWMXG15sGYBA7Tnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ciWF5SXU361nnHhEa/H6bZZGbY0ibYIHLOogWK8As2OgO4nbf3K5eJWwz9kJC0YIfPf61NHeOiU2CqFfcJsGTG8YfBZZSbmKGg/dJpWPM6EDxC035G+r9VVen3Gu0nPmx0RBY04/2zGIFCBu7S2T1Mns8xaBGfej/2mTBs/nsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHyZHlxr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHyZHlxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E3EC433C7;
	Tue, 13 Feb 2024 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707849099;
	bh=8Ujm7pBOmLNG8NFh+tGCFiwQgnkKWMXG15sGYBA7Tnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DHyZHlxrIsRK+Y5RhEiF76KmCJIcJ2BjdLh4Pu/SPvRE1fiEFWY6rJOgmwkVgEk1P
	 aBF0+QjDlv3hink46LBTe7d7IkJnaYy1hNSyqvH6bq7RD1cDHDpyXlbYMK9VxXP9q8
	 jnJtnVVpaRa6IbTgPV0sDQJzfoNL6WqEO0d3n6quiUQAU2zrH5bDdKgOUOKC4hmd18
	 2J2eLfinMLnEr8opxV/04CyFCoFCHKQbCCO2RhxVlRNDIviMvBEDbQmH6hxIFnLCVM
	 hAJib4mFu0VB8M3eBKa1+3IrZz/BKs4+HzoIoWZR5Cpnxw9TOyUG4xlyqNoMX1WxSq
	 NFuw+BSdOEbmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
In-Reply-To: <20240213114729.7055-1-peter.ujfalusi@linux.intel.com>
References: <20240213114729.7055-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix runtime pm usage counter balance after
 fw exception
Message-Id: <170784909787.647645.7620637770716706286.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 18:31:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 13:47:29 +0200, Peter Ujfalusi wrote:
> If the retain context is enabled we will unconditionally increment the
> device's pm use count on each exception and when the drivers are unloaded
> we do not correct this (as we don't know how many times we 'prevented
> d3 entry').
> Introduce a flag to make sure that we do not increment the use count more
> than once and on module unload decrement the use count if needed to
> balance it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix runtime pm usage counter balance after fw exception
      commit: b30289e7fa927f921bfb4d0d04727461706ae822

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

