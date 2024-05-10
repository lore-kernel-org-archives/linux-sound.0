Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFF152790
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715334070; cv=none; b=RcWgZF0Xm6uOJoHSPuwtFadTncv1AsSrunWW7PSpvos18hinzgNY7b/d5v6KqRX+rCEwQM4Ut0gNWrYSm1R04igcB+uPnKsJMPeVJ/UIPrHwe4P8mDrVFHS3iN6YXKfMx0dXrHE4AOvf6LUuO2ayecbMSEiAPZv1421fR41zBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715334070; c=relaxed/simple;
	bh=YZDyPDoYwp2evd96TgCP6DJrbrwjATDoKr/htFbES+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fW396JQ/+mUv5A9jPtXlxHtaUNv9WUMsmwSVpjvAIc/7Mu6kbnV9N1Z7xX8tPc94+RnuBGJF9/6qLMqcJfJLblhfmtra2Fp7DIDKn1omxa8TdWrZj9exgMX8SlyKV7Ra59ZsAVoHrplNSqUFActwVVJRlJNAa8F6Tmhg46fRV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n47szgIW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n47szgIW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3772C32781;
	Fri, 10 May 2024 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715334069;
	bh=YZDyPDoYwp2evd96TgCP6DJrbrwjATDoKr/htFbES+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n47szgIWaTwDqZ51jqCh+1lrUi52oo82Qn0zDqwMPMV3pY2iOucL/4Y/sIOzaQ4Df
	 iNYM4l9xED2JIE+Ve76xMNEUt38DIQdpzai091c7xZM2wQsd6r3ag+9XSRipSvtgZi
	 A83mSop3hzTCvHu/D87uEnH6/y1JNraDQPtqcv+UmvgTx96wfTbBPLGzcoxyukxfgd
	 C9VM2Iz2hrpEHYpSYcOajfuWZPqsLsbFDQp6rvcn9agFj0VoG6aeHw49ucldRo6HDM
	 ymr4xMFze4yvXsuj3LZiZl7AW3Rgrs26n4W99GmxB29ALK3InUq/AQHTi9h+HHLvJo
	 Pm87UYPawU7gQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>, 
 Oder Chiou <oder_chiou@realtek.com>, 
 Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in
 rt715_dev_resume()
Message-Id: <171533406764.2055397.10613116905468386028.b4-ty@kernel.org>
Date: Fri, 10 May 2024 10:41:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 09 May 2024 11:36:58 -0500, Pierre-Louis Bossart wrote:
> enumeration_complete will be completed when a peripheral is attached.
> And initialization_complete will be completed when a peripheral is
> initialized. rt715_dev_resume() should wait for initialization_complete
> instead of enumeration_complete.
> 
> the issue exists since commit 20d17057f0a8 ("ASoC: rt715-sdca: Add RT715
> sdca vendor-specific driver"), but the commit can only apply to
> commit f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in rt715_dev_resume()
      commit: c8bdf9e727acb6e1b37febf422ef1751e5a2c7d1

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

