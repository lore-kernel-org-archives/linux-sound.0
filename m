Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E11993BA
	for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721913622; cv=none; b=fsoaA6rIWzPz/iu85t7s4tdG9wOIOiR4m4GRy/+hPtmXKtziuCFt1tyG6nLeVHtPVmL4OY6m1q/un38BwXC5lnlAZMhULF4OeWdOQy6Rpa4LwLIPhHuucvy6V9DVQC9gLl/P9TqdaSAKn3jhPHxN87Kt0WlQac+S7dl/NOema8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721913622; c=relaxed/simple;
	bh=pUj9l5OBYZuZIwI3clNoSDp01uljHbgaGZpprOuvNnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mi+oKLxWhJN/r3K+ZhbtsUA3tfu7MHnyYLrCb7CZBpOnYpG1etg7HQHHVZjA01GYoH+NAaCU0bMr2N41WOr9A68xoHr/douGUZt7i2fJU60Y5mnjRzX7THP3wkjHULGSe4P48kmMUv9oMRqpvmcPMNK9OVrisWu8CPCt/u85uRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6TJEdTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6TJEdTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73053C32782;
	Thu, 25 Jul 2024 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913622;
	bh=pUj9l5OBYZuZIwI3clNoSDp01uljHbgaGZpprOuvNnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d6TJEdTmp5+nM0rtQEsBA/MTJLlQnPLhFa7iqn/NQgy/dKEsL94yDQpiTJFXtfBVo
	 GW9Io8dOb63H1BETDlWrzbhSe5T7/yWP08FPKjn4dD5y4TOIwYT+gwIzycpqA1FmZY
	 dJZx0M6EFVNUnOwOWF/gOEsvykWJ1SxHUP8EEa0Ylp4XRE/Yg//jzh3y8ioYnF5YeK
	 w94MN8pK7Jmob79g0AqgRZdL+TBWSfVLXuOkrbVa/J87cpFholWbio30t7exUWZ60Y
	 i+Sk0sdGoIPgD4Y813KYGN+1P/2z2C5+OHGXE5HybagxuTQWHq2eyJT04zL6iZITSP
	 yST9XUsSyhgHQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240725065442.9293-1-tiwai@suse.de>
References: <20240725065442.9293-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen
 2
Message-Id: <172191362119.34454.12236940431943580937.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 14:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 25 Jul 2024 08:54:28 +0200, Takashi Iwai wrote:
> Lenovo Thinkpad E16 Gen 2 AMD model (model 21M5) needs a corresponding
> quirk entry for making the internal mic working.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen 2
      commit: 1d9ce4440414c92acb17eece3218fe5c92b141e3

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

