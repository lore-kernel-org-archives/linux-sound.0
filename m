Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02727BF79;
	Tue, 12 May 2026 02:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551653; cv=none; b=KgIfx6YDY1r8DUggQculuG+1/6em/IrY2Nw7S1bkZDGrA0c5+GfhFw/qiL9E/U2/ga/SCApZPPmuzy+oC2w7N2kzeQC32U9u7ueE4qvsT7tn3y/LzxZ5oWtREe8yT/i8FX6S8kDLsXcOB1LqQmTFNeoskEMkhE0EnrAMflMA2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551653; c=relaxed/simple;
	bh=EDOw3NmpYC++icqil2BhkDVR8ZmUiDSeXNvKDdJNynA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aWAiM48Tyhqf7BMfY3pNjkH/baIAm50IsPGLXgpVFiymUgiDQUj4cbqbwe07ItTxrLeCZgBD7GbpjdOmWFxqXfGNONA4yshgacj5rOl8/LDLJ16aDX1AlOgPvWqQa+DhhhIqIWEXw3fFmjwiDzF0n4yv6cEBy3a7hvBOmUtaccM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbsg7fRr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbsg7fRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FBCC2BCF5;
	Tue, 12 May 2026 02:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551653;
	bh=EDOw3NmpYC++icqil2BhkDVR8ZmUiDSeXNvKDdJNynA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Kbsg7fRr2ixGY3enULcWqbUGQzdAEEfd3RQf6+BfXob3z6HU+66caywBvXntEXLgb
	 ATIdsRayZ7X7/LzzPSGDeU0HMSagFSFN31Qmzpy16hYPaHXbeEEo0pVfNlgdN2CwN5
	 DP0MBPjhBmzi2zKHJ16bP309aroMUrW1SokuVe/JxLl17cqDTdx1o4bZULQIEvnyJ3
	 6YM8PNZkYMdx+AnLtjsAAjBoAVgj4y7l0HxgO9+H/ah08FENNQ13FaMGs/SJxvtOFd
	 jQC7WNcPJQG+mG4tc38X4wIwtKolSbzL412r/KC7PZelVOWFthFaPBYEfFz2h8IbwI
	 znYuAqQs2V8Vw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260511114239.44970-1-rf@opensource.cirrus.com>
References: <20260511114239.44970-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Check for successful runtime-resume in
 cs35l56_dsp_work()
Message-Id: <177854893920.988959.8407685509190053166.b4-ty@b4>
Date: Tue, 12 May 2026 10:22:19 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EDOw3NmpYC++icqil2BhkDVR8ZmUiDSeXNvKDdJNynA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAotj01Uy4fehtbm/m0YRC/rCLNeupkwpu/FG9
 gWgMmntkGKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagKLYwAKCRAk1otyXVSH
 0GJWB/4ltNRk9fNR65NYYFs6q3274uvehtT7Hm8D1Al6HMsUYN26zNwzgTKk41WuWkVdjDvrRsK
 xDl3ovr+dmFaF8qwBvj1CaydwH/XRiWuwLtooCU4NOODzKnSmYiNhlJwtGD1v5Rf+Qw7E9zPwQb
 3vQPa8/kYbQ1JIQXvgTParRGrCgb2u3fUK63d4dH+zMWhqWMhH0ZDqj6IsY0kvQFZPGZwgnmwW1
 294ZFwT4s/eZpRDftICyDbYRFJ+/Z2un0DkeUH5/2nGpz2u7l/hnSJHhtt63krmrhCb75QZPTJk
 lNN9wHKLzEh1rlLabAd4uoND6axAMcLrHlrJD3651Jr9dkHe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 11 May 2026 12:42:39 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Check for successful runtime-resume in cs35l56_dsp_work()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Check for successful runtime-resume in cs35l56_dsp_work()
      https://git.kernel.org/broonie/sound/c/8b7c5cc7f6e6

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

