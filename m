Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5932AE78;
	Mon, 25 May 2026 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723488; cv=none; b=i+exqwiLh7iGOguaY5CAcxF0zaYFVdOBXwQXzufLcshK0mVEaIRLJnoNFk2+iyM9u1PcSJVV/WPUbes7+hJJEPwwJRXgOlig0QqHrlJPQm9j7jBKSuRbLajxwoMQKs3s7H6cV9BHegzTjSeBTHBtla2qAJ1Y3LBu9B94d2lD54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723488; c=relaxed/simple;
	bh=y2YCMTBGLVpn5wHGF4BQZqhruHt6Rs6XhbpQAamttjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U0baEEeM5Bee4GLM6ShQOpqA/C4opfCx6T4kE7SsLxggdUhkh1F0kUvROqlSXSyqi2vZFpBAedwssY3ZmXyd377gPxqnB0q4AUhIciCWTy8hHCBxcc6V5iL7ZeRWisMs0wAVOuBRxftyMAjC5Y5zfLzcVOOP5KP0rRDCEzn39/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ET5VQYxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ET5VQYxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8B31F000E9;
	Mon, 25 May 2026 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723487;
	bh=f5ZJQs/DWDnS7AohcVFWizhDI54R2Af+yQwUhvziGxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ET5VQYxy4qOYPd7XFB0zSJacEH3ntELnsbIg8f6oBt4q73N4UVbCqzQiyaMsCSZzc
	 tSOITMQcGcSxxFe6OvshXIbkM+CW5sYN5s3HzhXafsnqC1CyY4NhZBQsqvde8eGsmG
	 4j4UVqjPc9UnNtDLRC5sl4v2RyUOy04XJItd+/Jh7IrbDjbkb1fpMlU3erx0oqqgAL
	 KwrYWq24ReVZmXwtUNm0tQ2+5j0UI2K+vhroEXaaU/TDAER9o8nzfWM+nNjQ2qaBJb
	 5n/nyjlF0syUjBoJ8Xb40tugzT0t3jX3eh+OU9x6EoPrtgUceBiYOGFsOCASm7rKat
	 Uscd/IPLKk2Cw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 David Yang <yangxiaohua@everest-semi.com>, 
 Daniel Drake <drake@endlessm.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260519-asoc-bytcht-es8316-mclk-leak-v1-1-b4a11cdc2afd@gmail.com>
References: <20260519-asoc-bytcht-es8316-mclk-leak-v1-1-b4a11cdc2afd@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Fix MCLK leak on init
 errors
Message-Id: <177971240774.58460.14133440320474909191.b4-ty@b4>
Date: Mon, 25 May 2026 13:33:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=y2YCMTBGLVpn5wHGF4BQZqhruHt6Rs6XhbpQAamttjw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFGzcYy3IWrqCdRPmMNOx+r58DX728PbS8Kcar
 7kI0yN134OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahRs3AAKCRAk1otyXVSH
 0JlqB/sFuO2vhsgEOkfuqKUVbcdEU2iUg8SZPmCk/ZtxI1kYdWlpinlMDrFTBdO5uuOZd0EdoRJ
 gOJk+wmNZOvyFCOVZEEnXcDlpneFjK6Dxn4QkOV3rX5QfyTaNMkHud3V7fQj1Dovkl0sgZVG92Q
 PjQJGueOMsiuKBO8MSpAF3KHR/XGcajGl8FAEJXjECAQF48rj78npJpaQnIPQj39QWVOBS+jN3x
 bHMZ56ZNcDB86AaBLG9MoEkEa39qOYz0vFc8O1zD3mNiK/xbs1qeD68dJadzwBdQHypPP9SAX7/
 P03gXFGfLK3Jyf+qvUKKBjXqJsbs9ChBBeN2Eg3KgrazMIDT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 13:51:47 -0300, Cássio Gabriel wrote:
> ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
      https://git.kernel.org/broonie/sound/c/afb2a3a9d836

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

