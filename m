Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D638385
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423722; cv=none; b=q5IC+uDo10k6zi/dPyQR3K/dbSxvyQgL/35vXvMGCV8YkNQlloM2CBPq3YHhdKpwxwXA7v0rINq0tjr5zCvzx44hjYVn9AOzZARyZW867ZF14/uYdCL1JMMuE2Os32UBHP7p6dxIAfLYjBZRpz/krGcCDLcPeHj3qPphoLVLf6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423722; c=relaxed/simple;
	bh=AwnJISLAcr+jBWBhT8Idv4eVNhgvLSP3fAzQTR1pX9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GlmdCVrshhia5YzoxqR7dEQKwFm9fbhs849eEC69lDRHSIEB5iIpw6PXQvpmpXd6kpXhnAKIlRxOouVe98GFKc5vdXsXE1cJuvIgI5kSs7GDLtTWrZZp2BR7OIT6kDKe1BXH6ZXX8texEV8PDUav3lQ23gK3bfVPykQ0xcDEuE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULp/gQv4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULp/gQv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF01C433F1;
	Thu,  8 Feb 2024 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707423721;
	bh=AwnJISLAcr+jBWBhT8Idv4eVNhgvLSP3fAzQTR1pX9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ULp/gQv4RebT7gcbxaL3CpfrFYFPhdb/guXPCtRT4ECFXXlpKRmp9sasfkPtjO0Ni
	 eJ3W3voHTcsw0Un0dlpT5Z731xjfgTJhrh1Bxlf5t+GXfqx+uZEEkOQ9rWpp00xEK5
	 8ocpTOdpoXDcRVwVbINse4JVkCF80nIXhIlaZKijueCyeX+celCdBUZXHyvja98O0Q
	 vuwMdTQ7g5U3+UdBI3OfbYiNzVnkKmfXcNQuwbttsDIJckR+Gw321PHa5AHJPO5FkU
	 UfmLPfKcC0SEank5bgJkxlbCwL1h+kSbwUt3yI7y04q6/frakRPGB9Pjo74EamUz+E
	 T5iHviSU8uwjw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: Intel: avs: Add support for sending
 initial module config
Message-Id: <170742372000.1997067.17428489843842276238.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 20:22:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 08 Feb 2024 11:23:57 +0100, Amadeusz Sławiński wrote:
> In some cases it may be desirable to provide default initial
> configuration for FW module using payload. To facilitate such solution
> extend topology to contain initial config information, parse it and then
> send data to FW if present.
> 
> Amadeusz Sławiński (3):
>   ASoC: Intel: avs: UAPI: Add tokens for initial config feature
>   ASoC: Intel: avs: Add topology parsing support for initial config
>   ASoC: Intel: avs: Send initial config to module if present
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: avs: UAPI: Add tokens for initial config feature
      commit: a5766cd479fd212e9831ceef8e9ab630c91445ab
[2/3] ASoC: Intel: avs: Add topology parsing support for initial config
      commit: 1b4217ebbb3e9d9b014db660618a4ddb61b3c321
[3/3] ASoC: Intel: avs: Send initial config to module if present
      commit: 8a49ef789b1be68242624d460df2ada8087308a7

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

