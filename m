Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6FC14A627
	for <linux-sound@vger.kernel.org>; Wed, 21 May 2025 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837834; cv=none; b=jEyLlSS/z+n5cE9k3LPalQVlKHhqI41qTIioF6YDVsJ3uK2vIvbRkLEYshRomrDfJXdVhfWDfCE7+BLv3fAM3E7O0rdyFDpiQbiRIXw/qiON2fzNi8OnKhwpay5hRB0Ykq9FJ5xqCvqwT7xemlyf6iofRH7OChiI0HiTcgJCFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837834; c=relaxed/simple;
	bh=nxKiPnG6q3bjbGAHQvO+JGjTS2bNZNx6kYYq3445a1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bA7wV0N/1rhXu3J+CNuPMgnEU08UjTHqAJReZZiVuDoob1iUkjmg5KP6nr+pUX9hgHvhu8oLsXhb5J/PpvEB/lm4FHGTOyrxVvLWRrTvulTAc+pw8lSSe3fCAzE2KwcRHHaBAt0mFEibA96PuBjHaLl3OYuMpPUT1a866Bme4gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsilpYrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsilpYrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF061C4CEE4;
	Wed, 21 May 2025 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747837833;
	bh=nxKiPnG6q3bjbGAHQvO+JGjTS2bNZNx6kYYq3445a1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsilpYrQWV3FsX4MOvf0YgSome0XOpb59M8kpY0GQjmXYi6di2+PCYNpY301hqYHF
	 +O3+6rvGXfqG8tiPF05rXvuC0MMPfP0J1wTmUxwXh8R+6Dtf3uM7lHmSzUY7Dr4VMh
	 xH9iUsf4Zh26uMqCAL1H2L05a6FEgLlPdjjmbynvdpHhAmF2ugD4a2o7iJEo28X/dr
	 cwMdjXW+sLnkvXhXGraOHxMAmYhtMCDsXRjasMqnOB1o9cMjMGrbBLzJpkxLoyzMO+
	 P98K69GCeTNVVu8Vj0n+ZuvMy5BivRvBosHQE5fLznW98do7X4m1UelqPFF20PePZR
	 g2o+XWMTpxl9w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250521034840.8083-1-yung-chuan.liao@linux.intel.com>
References: <20250521034840.8083-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add support for wclrvp & ocelot
 in WCL platform
Message-Id: <174783783250.128902.1420468428463415657.b4-ty@kernel.org>
Date: Wed, 21 May 2025 15:30:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 21 May 2025 11:48:40 +0800, Bard Liao wrote:
> Add an entry in the soundwire quirk table for Wildcat boards to support
> WCL RVP
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add support for wclrvp & ocelot in WCL platform
      commit: d3e75291838a877440b462dcfec4b4414c705863

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

