Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9C366DD6;
	Tue, 20 Jan 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913527; cv=none; b=AKnK6AOGxBIp3OVin/MWoafqna9BiQyzU2XpPEZ5P5TwYh/ENPL/4zopQgdnw3BHC525VsVOoHcwR5TFNERP8I8GoxAOBpxnJFgp7n3tqIPBD0MsrDbJOFYjdaCdAiTFt3TVdK/PXAVYI7Xra+z0b7M3xQLkF5WFR3dopbmrICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913527; c=relaxed/simple;
	bh=RtCVkka9g6rxbZfjvJujwQvq9A/aICd0eyd3D27h3Fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bx3ok1QoiUJAos3VXEQ1DhB3lhoRZc5BBcQkgfKIEQIlDHTS7uXMOu/+3oCovKOjlNRRSm4N8NxamDyai1gzFrO7PJfjXN9354wyicZd4s5I6zf/kGSxcdQYnm/rn0/2bhCi4M/0NrdcYZmBNRi1pbpFrcrf/mhVxgBFah+JwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZfmSFNW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZfmSFNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AF5C16AAE;
	Tue, 20 Jan 2026 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913527;
	bh=RtCVkka9g6rxbZfjvJujwQvq9A/aICd0eyd3D27h3Fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZfmSFNWS3HF9v5dQwJl+Whl2I3wQjqXT0meiRs8hO8nrSiN+6KecR1BKGGO2nYRw
	 zMYcnpZ+vUCOYpLE+RFn9DCZYemK1WdnA91aTLp75KDgvLbgbEG5BnRX+b2gsIivnH
	 cCdoKJVyl3725M/3jvcajC6l7N3ARYebceDWw+j1Yw0rMM6xUXma4SBvpAWeHHjocr
	 BD+OCf5hPM+vKiENBLoyaAh3CGwTa73UZyRMqzQU8RnLBsskUN5y+TKxBSc+2bH4Oj
	 DQef2EWgj1N5xyDAo3WUodjy7I2rEzYCO/SC4JgxlY+uP1KXcfIPvX4a2RsIxJ43GQ
	 Nqf48755HNL+w==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20260115192523.1335742-2-rriveram@opensource.cirrus.com>
References: <20260115192523.1335742-2-rriveram@opensource.cirrus.com>
Subject: Re: [PATCH 1/1] ASoC: cs35l45: Corrects ASP_TX5 DAPM widget
 channel
Message-Id: <176891352542.86219.6504403047430487723.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 12:52:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 15 Jan 2026 19:25:10 +0000, Ricardo Rivera-Matos wrote:
> ASP_TX5 was incorrectly mapped to a channel value of 3 corrects,
> the channel value of 4.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
      commit: 6dd0fdc908c02318c28ec2c0979661846ee0a9f7

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

