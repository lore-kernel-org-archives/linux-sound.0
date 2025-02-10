Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886D24F583
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205005; cv=none; b=VHVjmmnE9Czzm0mGeTILlJZ64n2JhK/xk8JBfFHm4f6R6ZUWjiDlN+AulrLkvnyVGmMFWn0osNZcvniCrMDi4lK3pVaRScxm0xxATF8BsPQyFZNc4BT8PBdKHHXkvXxOSwh0I9zsKc9dSd/ICKHh9mSaKL9q1KaX+6qLj4nOtWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205005; c=relaxed/simple;
	bh=SM54GaZeaNaf3pswGrQCoNU2ROHZ/4DBWV+5EAEhBic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WEwZdTOSAt2ilrmAH3BxWiw7eYwPvyKzQ5HjVbikQ3gHoeeq2bkYwFoc6Pk+uNdMAe8DNoaYsF6fm/GLYrj7n9KNsLOwzJx/0jezdZozzTek4ri2UMUz/i1dzWoOtOJKeXdDNpzdXC5NCsJkDGpAhxpWLXvaJcI9Ztf1iFU6cDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3eH6VJ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3eH6VJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED898C4CEDF;
	Mon, 10 Feb 2025 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205005;
	bh=SM54GaZeaNaf3pswGrQCoNU2ROHZ/4DBWV+5EAEhBic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k3eH6VJ/qXBPuqmJrT8oAgwkIgs8vgczofgcDsL3grlt0n0mP/ug3NO1Jf195haA8
	 fsHmlhvdGlInrr87Yy/qNobouReokZ9049DE/EavnYTyfJAGehxZKx++2QC1GK5rlw
	 Rt99jMVj1zZ43ygzpZBInOMZ7w7yrXQpTo64Peuf+Qy9COhpQ2EHy4+vaIEMfxTIrw
	 hOCfOXwhDsi6QzW3GDUocEPXddhN0+007GANlyHD/7yj2hKXWMRDu9CdN9qB/VUVOX
	 tRe0HK6bxuFiV6lcj7Us4+jSkrIpA8kuAMbZhpPNzZGuwJhNqEnDTq63TwwM178U8j
	 lpZT9ArfBHT2A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
References: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-ptl-match typo fixups
Message-Id: <173920500368.65690.7325532254545501109.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:30:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 07 Feb 2025 20:36:35 +0800, Bard Liao wrote:
> Fix copy paste of lnl into ptl.
> 
> Peter Ujfalusi (2):
>   fixup!  ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320
>     support
>   fixup!:  ASoC: Intel: soc-acpi-intel-ptl-match: add
>     rt713_vb_l2_rt1320_l13
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] fixup! ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
      commit: 91f505dc3a94c04421a2a51e8c40acf7ea67ecbc
[2/2] fixup!: ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13
      commit: 852c0b7204ded184924c41ab99b2ac7a70ad4dab

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

