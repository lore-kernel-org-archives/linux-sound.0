Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD333CEB9
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120326; cv=none; b=TbzTFosdq+VkRObH/toimO+xi7bsr9QlNO+zwIBzxfSBeGDA+mE1Z6ad9M0zkXrVXbTUHNGzpa+gOithYG0lLM0YHG0SMosMWvfDxoN6/Km5KRMq0bCQSOBjSnwP/YQBD8fkIphuOvL7qehxsL01RntAcVXIM8GScQPnCCe2KIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120326; c=relaxed/simple;
	bh=5/47Y+bY6YWxKC6OFIPb7ddxrHRroMu8PY+YNbYHwlM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dxs9nv3zjQPUq0A7GXmdM/aYpBzwihWKzT/xuw8JswhH2rSqTEBsP0vug78/yLwsi4QIutsi8lLD2Q/a8hBA2pqaKD16KaRARHokCrY5iXb8jiUx/Y0UR8bPjC4X2yrcmGjRsM6Dd4wXSjrhf+cKvoSUhHeS3yUJOkE3Bg/7t0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2iEtps9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2iEtps9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1967CC116D0;
	Tue,  3 Feb 2026 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120326;
	bh=5/47Y+bY6YWxKC6OFIPb7ddxrHRroMu8PY+YNbYHwlM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U2iEtps9UtvfGCDq6vuaZjK93Be4vY2Jep/B8/ItpAzIrOoXK2s/ieUUYY9qJqxIx
	 njX+A00Qhp17cc72uJhfGj3fBpE7o6DTrEI5doskqnoplPtIIuRYF4vN4reKXrIxrG
	 tjdzIl0FFR+0CWNgqlk8mglL/LZG9JSqXh+ezAO7tYMwCfXeP+FyMVaBoPkqbI/pQ6
	 Bc/hnYU29bwHc27qaMJpvNug9N/pka+0bDC5OM9lhWwbgTR0XJYX/kucuRjkK4+2Q0
	 GmNzoFck/UPiVWk/RyQQrUbbKduXorRfyFFeS9aE30XrLLA60KRNp9mzUJUfA4Vdf8
	 Z8ozwoTDUNHEw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Hsieh Hung-En <hungen3108@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260130160017.2630-1-hungen3108@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: es8328: error handling and resume fixes
Message-Id: <177012032484.85387.11663786086743925205.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 12:05:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 31 Jan 2026 00:00:12 +0800, Hsieh Hung-En wrote:
> This is v2 of the es8328 robustness series.
> 
> Changes since v1:
> - Split the previous "set_dai_fmt() and resume()" patch into three patches:
>   * Check and propagate errors in set_dai_fmt()
>   * Use cached regmap on resume for regcache sync
>   * Add error unwind in resume to avoid leaking enabled resources
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: es8328: Fix DAC deemphasis control handling
      commit: 4c6b74d58766ce7cd66ae8e14babf877039adef6
[2/5] ASoC: es8328: Propagate errors in set_bias_level()
      commit: 0801a03a317b4848ca8c10a98f9b84028b7c8fc6
[3/5] ASoC: es8328: Check errors in set_dai_fmt()
      commit: 3570e8eef217e60178d23eb490a34d64249bee45
[4/5] ASoC: es8328: Use cached regmap on resume
      commit: 9917d99f44231b531a1c704bbbd58059e78c2f59
[5/5] ASoC: es8328: Add error unwind in resume
      commit: 8232e6079ae6f8d3a61d87973cb427385aa469b9

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

