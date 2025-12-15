Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BF316182
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807132; cv=none; b=blRT2YCiZl3XXqCkt/XvHI0R9PuNyl9jO9FgEGQz2zQx1cUFirPXQQiJ/ODUVh4v2xo9/nNIhE0kGcPxGSkf+Y9ijb2jIAM5RL6UZ17snJ6y71UC53eM7NI8Os/fVMAvciOAJ2R/OGRTGH2K8550eiNc2HmNB/OzCm3Rl5xTU88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807132; c=relaxed/simple;
	bh=NhWQTGFqdgCknewjBm87njNkkHLPbvJxn51TkdfxioM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NY6wh4/yNp+iUgNsRO64O3WveaP/y/+UaaH30SQNgySTbO7QSfnpfSuM0EaruCHmURazIn04HnJmUvZ49kL6XbCfm9qGf8aOXvXkFq+5GMvtF5Vjzs1w+PSOEJkP/riA9vaFv+UFDlp1zhANkEAiYMxDjwEEC2CBCqHaR5clLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srEncMwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srEncMwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCCAC19424;
	Mon, 15 Dec 2025 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807131;
	bh=NhWQTGFqdgCknewjBm87njNkkHLPbvJxn51TkdfxioM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=srEncMwMpTCfmXhsoY+QXGC0h/YXPNsLbMVQ1sD2/s8SWmzi7nUjhRs8MTV9ow/A+
	 BvZTBEtdQazj9lUBlRIWDKUqS1jBMs+v68Z/fQWL3XlCSqCk8WZielAutbx5yzvRZR
	 8t48l6Qx3+TH7s2VFAOwo3Aqfrg0jieqq+aioUCE0ZVhQtCUv2W1o0es/etn7cNn5q
	 xAUgZKSAefQ3Dc6h+WWluqCQsjOr16VQWsCBu6VKaAP2JNWypVQPCioUcFGxUXfsRA
	 S3TsWxlRDrz3GrXSYMYk9hvF++mngN194gEWQTjY00R5bbD5shvK5H/qVTdUfofzVu
	 mf3Rla1PYrX7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20251212073555.1065284-2-u.kleine-koenig@baylibre.com>
References: <20251212073555.1065284-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: sdw-mockup: Drop dummy remove function
Message-Id: <176580713008.161056.6994353301631717888.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:50 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773

On Fri, 12 Dec 2025 08:35:53 +0100, Uwe Kleine-König wrote:
> A remove callback is optional and having no such function has the same
> semantic as one returning zero (and other return values are effectively
> ignored).
> 
> This allows to remove the remove function without replacement.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw-mockup: Drop dummy remove function
      commit: 81acbdc51bbbec822a1525481f2f70677c47aee0

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

