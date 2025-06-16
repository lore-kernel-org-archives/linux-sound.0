Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90B2206A6
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089047; cv=none; b=cTZe88qRA+RJGW4BXYRZvEqxwEOgXV9d1eysddgjnP2SqQ8ghWuYVkp6Wlw/ARLGeHYF2q0Qv1mc8MO2/sJqLfG3h7xrYxI05BaO/K7rLnqtLgjj0FhlNC4ZI6xhPM+AGt7ftXwRVZBRzqx6HvCfyI+u0luYFKYiCQ6aqQndX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089047; c=relaxed/simple;
	bh=Pk/FBo5zZdbkOTTOWZWdZP7Rkead/gzoaWBxkdW7vCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ltttIjz/c6K4ER8QukkNjA2Vwor+Y5w6NRZc6gnlleatmIAEuGLMz57kPPf+uywezFc6FYNaOM23kg+RVIufGEoznxGx23eZCRJPZk1E3SaDwFlkRfnejtnhOErOzR5/joTEDYU/oSguZJTZf/zW8AfIJLZbrPRBTCJh4IIbj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFtOCks7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFtOCks7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F590C4CEEA;
	Mon, 16 Jun 2025 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089046;
	bh=Pk/FBo5zZdbkOTTOWZWdZP7Rkead/gzoaWBxkdW7vCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uFtOCks7DIaB3S/8Cd5OXtwNVcXD9amLStNHOCrRfk6SnmnnnEo1cI5rGAf9Jtb+3
	 AQZOrgWdlYWRv6yGp82XiaS4Wuxzyp9E5LrqEImD6577fGq+f/zy1eFq5gvgktO4pC
	 ggpqGPFlsjzanv1656m+NniTyifhw7IUg1gAteZ3MamDJ2c3Lz3lQ/uZDq3nVOqAsq
	 4IedB6FjUQL5G2SiPJCsRb0Bo42v5+tRi1fQQ/QJpY6+lu7LHKcFEz0MYEo67X7ze3
	 hNHRtFddn268WuKApgRXYAiKTgyN4hOjA+G+SLOmnhViJz5gxNfQpUraZJ+PdeSoqa
	 37Az6ShKTtMBQ==
From: Mark Brown <broonie@kernel.org>
To: Sachin Mokashi <sachin.mokashi@intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20250613163530.1165690-1-sachin.mokashi@intel.com>
References: <20250613163530.1165690-1-sachin.mokashi@intel.com>
Subject: Re: [PATCH] ASoC: Intel: Replace deprecated strcpy() with
 strscpy()
Message-Id: <175008904526.262284.7856990729788013892.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:50:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 13 Jun 2025 12:35:30 -0400, Sachin Mokashi wrote:
> strcpy() is deprecated, use strscpy() instead.
> As strcpy() performs no bounds checking on the destination buffer. This
> could result in buffer overflow. The safe replacement is strscpy().
> 
> Link: https://github.com/KSPP/linux/issues/88
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Replace deprecated strcpy() with strscpy()
      commit: 47972c1c3315672352f25c68f91dd88543541947

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

