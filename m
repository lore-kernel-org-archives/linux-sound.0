Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154238E13E;
	Tue, 13 Jan 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305304; cv=none; b=dgkUEaF+9gCWvMmw2SkqRdAH2G862880Bd7v0y5jMUfD6EbwMdwCwe5O7ICsZKSkRvfBdfgK0/hzkamlBSp/ITNd5WDEibM2LkxqaaMA1dyzzA3Na2/NN4URWjgtyUWiB/i8HTco0Bl+Egl0C4fZDNuj232Tkerhyq/IRTCGuO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305304; c=relaxed/simple;
	bh=vILcIKTOivMzFtpPuiDtPrEY00gIpzY5boW/TOGn4kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RZDjjzSQKN43mXRfkz/UbWfYo5F8AnRlGGGT4jx0uwltt7ASpktBqWqgXp7ERhQFhiP0FcjH2ZWqAq01lKkNszlLQWVlmdyB9vyBjz78oW6qde91cdZjpF8jf0pBCf/FZRGDBDNwJYjg5dgPXFcwAKcOg147gkQCz/iWOFZ3SxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHLSDnDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHLSDnDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59C2C116C6;
	Tue, 13 Jan 2026 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305303;
	bh=vILcIKTOivMzFtpPuiDtPrEY00gIpzY5boW/TOGn4kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHLSDnDMMMlpFgZy6NpiCaQrw0VOXVGJRB/wEgdmTvWFmGjqUEGUv+KHCkIDoxuLE
	 lidC8qZtEOKGJffnZd/nUV8VoDfr0GvZCkVHSrLtKJkgHMIL/FpH1/tckSzbwDKgtd
	 4OWPFVrSxZx8ThahMCpnWhRsIKpCmn+308+MbY98uyVBof0Dkt4HRMqKarKkDWswnr
	 wrQV93gxIEbL8k1UsJF1hHJ/AWNuSSQH0J9YfB9XYfnTGQut3C/jI7GvmlEgCEhMpc
	 2rOMHlbsXf3U0Cbfnb0q5SF427xZT5bRgCUHkxO7gYEl5HjMn4EFI+O8iU2gNA+P6v
	 s/isw68EDmHVA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20251228071041.2246718-1-rdunlap@infradead.org>
References: <20251228071041.2246718-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: pxa: drop unused Kconfig symbol
Message-Id: <176830530141.30686.5406683094869244016.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:55:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 27 Dec 2025 23:10:41 -0800, Randy Dunlap wrote:
> Drop a bogus dangling Kconfig symbol for select SND_SOC_AC97_BUS_NEW.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: drop unused Kconfig symbol
      commit: 7af9e30a0c8bb05b7254fdca857c1a1126b652eb

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

