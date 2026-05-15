Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFCB3321A2;
	Fri, 15 May 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863186; cv=none; b=UFBmGJya2Z9bydbTYlnhhHOltgd9TMtJvOCEh9UiS3DbfWU0CaVWJdygZy2BvUo0HyOFHFiUneyct4PtqZv2J0m4jOz5LixpYnKUa2PKWOVF/AQHR6JYZDUvMq03m/HkFGcKylnesOppVIn8zgO3z0Sy+H8kNaf4aJog1uGKxZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863186; c=relaxed/simple;
	bh=kJCR9qnaDwkH/ENg9s8vMrIC6qNd+wrSVq6Yhi+eFH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SNLvkRHT5Azb+1a2NxriTDEBJDx5Y8teuM5V/R9WvRiVmwKvq0SPcEke9LYDt+0VDYRtQfCsk+7mnQa1djUnZG0yy0G2vAFBnNPY2pm56Vd6l0f94yz113PDmvjVY/IpemlmoVXogkK//Ch3uRTlOD6DAWmKgz3LRuSdniy7KFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BntBaI0p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BntBaI0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111DCC2BCB0;
	Fri, 15 May 2026 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863186;
	bh=kJCR9qnaDwkH/ENg9s8vMrIC6qNd+wrSVq6Yhi+eFH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BntBaI0pIaMcA8gtpl7yPg6G7TR3SyOAVEX4Pgxu/Fa5G/1fpD9WkOWJN8Sw8vDc3
	 H4Hmgvo3/fR84lDrRJVZuPrdCVcRu/Te4ruFZAVrJGNPsN/w4qrC2U42otb7y1N58Q
	 undnelxya4QATFyEIsqZIoUozo0BIYJ4RNt2g66WMEj1/+EZJSoQb0P3XFiGsVhFVo
	 HPns0X2eRXkpfRSYvvkmku7L1ILUYVy8nE6spvZgTTrD5XuEKo4Wk+cH6Ko+0WEKId
	 32qAv0y/DFaO9YCeuZwxUS1hrEO4eNnH2TkV6F1fYhM5bPPJyXJrBvpPMi2EDHllRC
	 N6zGopWVSnpqw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260514151854.695145-1-rf@opensource.cirrus.com>
References: <20260514151854.695145-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Log SoundWire status updates only on
 changes
Message-Id: <177881022891.1136679.17036002198603972454.b4-ty@b4>
Date: Fri, 15 May 2026 10:57:08 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kJCR9qnaDwkH/ENg9s8vMrIC6qNd+wrSVq6Yhi+eFH0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0xPxGue/VORwvBbgVn6EDe0XEEy5Y13G+7Mi
 SU88FfnExaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMTwAKCRAk1otyXVSH
 0EhjB/9Ke8ANzC5ghXZiAfXtB/LHM+yw/+CfYdIMx+uVwwQICnbmeuU+EqJrf8ycRb1gPHf5yzm
 dPm8y7wOx1CEJtzz2UnkZzLu2cVgk15ksGtD1xxBYdRt7JgcYKEW17x40f7Cf1Ejw+vJlBZIC0g
 4irfuw6XZml3W7m93Ged8XVOP2+yuHk2nrC7hN++x7e6Ypqz6mOwoPisi5WVl6M6RHuVKfYuBf/
 3ZCGhFglq+Dcz6picoT+YB9RWd5Qe+uM7SSnFLUuziqkdMTiQ3ic0w/uGXTUcKseK0TfZ3c1cb9
 G7I2KABTmQeOC62Re58vZr6IeZQLh47Xl347wAxbV9kI1UT9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 16:18:54 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Log SoundWire status updates only on changes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Log SoundWire status updates only on changes
      https://git.kernel.org/broonie/sound/c/9c0f5bbff146

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

