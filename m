Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2BD210182
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641645; cv=none; b=jyt6uTARxKfT0LscSNxwPcSmEtqhH62CH6L0eKt/sUC8V99UCeI8qhOoqNlHf9zckCPBd/3wUf2PTUmBomwRtO364SSrQZ/7qxFk3NLeY5r5R5Nqe4mTMkzAgORRT25Uy3nJY1+afnGOxjIfoD3LvwSnmGyqzFj6T/dZSf6F97w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641645; c=relaxed/simple;
	bh=VlqblCwcm8JLb/pdm5TIvB5VbKbRI/eFTSEUlGPHb9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kz6YMS1Tqn23Q8TRHJkcMCuzgZiZwn5YCVKirYluW2ydrXZEJKo8NcoY0+u7K5sJqORWSR9DPQ4xmds0UHj2AHZiXOnmptTFpHAyt2XKR8l8oOgugrIpCiJdCqT1fOuN2A0XiGxpdyvywickSu2RMiuH4OK55p6uqAFMrTM9qYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gisT2pom; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gisT2pom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DD9C4CEC3;
	Fri, 11 Oct 2024 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728641644;
	bh=VlqblCwcm8JLb/pdm5TIvB5VbKbRI/eFTSEUlGPHb9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gisT2pomyNS70ic2BNAUe0uWgSaad3Ijv0kXDjFSgPJtqDNezOFhl7fI4ODkNTWFO
	 5nrOtvlhaR0IiC0MZ3dRVYbtU4hHoqA8Gdv6Lxzimt4VQJ+CPo9ChCv1vtE5qQxmaa
	 IDUaE9v9gX1qYJISwwjOu7HFei0ASxx1o3MGYKlwZmAwNX7xSjZr8D1wN/U/P+JpC0
	 +CA1iNVbkz/khC7vALFU1NIXBxXnTUhMsgFGJ6QlYXQkz/J785XVPB4bABRsG06wV2
	 2nN1MLvi3Gbh/xVKVS7O9yZ04MBhvV/EFx9Df0yCoQwMZyPM7VHEyjE4aHllI5NzN1
	 YJjOdAboT61Tg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241010112008.545526-1-amadeuszx.slawinski@linux.intel.com>
References: <20241010112008.545526-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix return status of
 avs_pcm_hw_constraints_init()
Message-Id: <172864164240.3853572.8328107515251289485.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 11:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 10 Oct 2024 13:20:08 +0200, Amadeusz Sławiński wrote:
> Check for return code from avs_pcm_hw_constraints_init() in
> avs_dai_fe_startup() only checks if value is different from 0. Currently
> function can return positive value, change it to return 0 on success.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> --
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()
      commit: a0aae96be5ffc5b456ca07bfe1385b721c20e184

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

