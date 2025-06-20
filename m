Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632125F963
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414992; cv=none; b=AXmLru9LMTQNoGSeANq+NZsJAc3AN6NCNtsL9w4Q69zK6+UY99JzuSZiXXQP7i2qkfh9Pk6fGt6yKGPcrKcYywO2QC2XDXfvSyApU++cH0ChNTsv58ANu6FrOctLn/QRA0oTVOv02AmQ4WEAxvZIox3Ub9SGutpAx6ovB8w+z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414992; c=relaxed/simple;
	bh=X+0uPYqxO6tDgAnPth3qlni1yVfLd0mdfrzRO9l39+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C6YyPs7cB2Ly2nr3j0wmNeEKUgDZBe7TboH562BVqiKXE5atFhiImmvkEeNdFdSsDibV8flvfCpQZYsT/6piFULB2XXHNnsbggsCxFNsbQktjnJEP8lm7VXyEDQZUyhgkerI091K1sQ4A8WpKw1X5q9CvaESG6hmhheYmnulAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMAKPnz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMAKPnz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EEFC4CEE3;
	Fri, 20 Jun 2025 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414992;
	bh=X+0uPYqxO6tDgAnPth3qlni1yVfLd0mdfrzRO9l39+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GMAKPnz+9gn5Y8iKBk6hQ57EnxPFqhyvvWNJpkj7GxsSKuY0HFbHAOGgwwcFbTx7N
	 IeEzdbKGPi+QQECi5iw+dTANuCIfPVZ3UBLWmAif2B0JPTMZD1Q9fHMo+C2xKR083E
	 E3w4GyGknFpw7xI1Or754Nlq8x8y9bXU7NGNHq9XkeJ2foHU6dBufpF8Rn7HPuHJLk
	 ftMJm/1YNSnakurNsUymZn0HFS28KB2oiYrm2XiRYfgdfohQS9e1fOfDCskdFgR+FP
	 9DTY4qioSThvknqdp+NaTqCQBnSrzHLeYuTzMoMxjuUZmwtlVo43rX6kZ0Szl5GyUB
	 vOgqoaPHuKYOA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250619104551.25912-1-peter.ujfalusi@linux.intel.com>
References: <20250619104551.25912-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: pcm: Reverse check for prepared stream in
 sof_pcm_hw_params()
Message-Id: <175041499108.23264.12128043828220110460.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:45:51 +0300, Peter Ujfalusi wrote:
> Reduce the number of checks needed with the simple and most common audio
> sequence when the stream is started then stopped.
> 
> If the stream has not been prepared there is no need to check if we have
> pcm_ops and pcm_ops->hw_free() callback as it does not matter.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pcm: Reverse check for prepared stream in sof_pcm_hw_params()
      commit: 3d77763c9a6d94ebc258183583891fdf23599a18

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

