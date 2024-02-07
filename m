Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B782D84
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707329533; cv=none; b=ht4N83cw+gtqWRt7wR8lqhAScitDJskvj0F6khFluE3Ip4ehbg5KXsOzNbDzu25qnB0HIe9nY70bS1Vlzuwp1QsmiWiw2t64iP0W1ePnL51Wcuq3Dl4CZWEK7Eca/SIoT3dOeguB5bBcr3B+Je+lor2+O2px6SQRMNoOmBwmK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707329533; c=relaxed/simple;
	bh=YmZrsexK4Bjd9O/ZPQMxONpH+oVHxFDMDjM8ZyE4w9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hJq14dB1srnT4yvF1PNUQcAXsA9Uia/hQg6P4zaBJcM1CwN6MvPrcmj09+YQvhaFpe7Xgl1QV6hda6a9JV70QtFEIoO9I6FeBcjAH2ZKhP+kS6qWhSFhyNZeJ8CDsk10uWadXTZIR6vk/l+mqf485vNy5sWPGQ2pCxCQaac5Ak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXqVcjou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXqVcjou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757DBC433F1;
	Wed,  7 Feb 2024 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707329532;
	bh=YmZrsexK4Bjd9O/ZPQMxONpH+oVHxFDMDjM8ZyE4w9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CXqVcjouyYiy4OwXn14wwdZPKH1X603iKq4XoMmOtioHGIeByIXHySydXKwwwD8oy
	 3652tnGyf6K0ulK2wQKEaq+BAwoboFC071dLN910WlLY9vcOzejhdD74ugM85BDOm7
	 NUEE95QAjBZdESrzOQlZEQ4OmoQ4HvDrXxqiwhQDE4bh9w+MORPv3kCPwnTp4azSOS
	 ukpTiZIVkQ7FWwnj16qFg9d/7VGa5RXULrkAsMxwLhUSIROXSWi9fYELO1pGG02kih
	 B85Jhis/tnw1VUr7j7g3rUmYe0yGejiqzXnWYJD5SIagCcKiykwjAwPoqNaSHuRy+g
	 IUz0zXC2KhGGA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240207122509.2222214-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207122509.2222214-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Expose FW version with sysfs
Message-Id: <170732952961.1093000.3665274145143025130.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 18:12:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 07 Feb 2024 13:25:09 +0100, Amadeusz Sławiński wrote:
> Add functionality to read version of loaded FW from sysfs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Expose FW version with sysfs
      commit: 148b93a5062d3738348fab813930615700a266c3

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

