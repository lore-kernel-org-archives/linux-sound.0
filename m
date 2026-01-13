Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE138E5E8;
	Tue, 13 Jan 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312204; cv=none; b=rUXCfHsUj5BAyKGsFi6njS37Zia6do8qRbQXW9FyS4twPrQffpN43dOnlbq/KImJrA0ZjK40CzPPBlMfEl39qfD9jrnMfYngowRB+BKDvbqnQlsDJzAf72IbfsdblSMIqW4Sn+TVpmNGmnOcpiKQnzff5tNdV/TSDDxN14TRhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312204; c=relaxed/simple;
	bh=z7vysxioJbz4b7ISaqoGSZ/iiDtrxIOqrsNxEAd5W7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PAJtB+T3jRtrB907vhYAy23xLjd5JhdLh8Xn8qD5y0rqZIRbuSezdZ9YREKPIECIQQwZGWj4iSAzx0rFl5xZFwv/XiT6TwTvchu3UyILQcIeanqmnjDedN6JL38umfgIgxD4zusFbeM/PKDeuBuilNId/OKfC7tn+dkqpUdVz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ7Mqdkr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ7Mqdkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B81C116C6;
	Tue, 13 Jan 2026 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312204;
	bh=z7vysxioJbz4b7ISaqoGSZ/iiDtrxIOqrsNxEAd5W7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pQ7MqdkrW8G9X0CfzGP0NQrk6i2tZ7p05XhZbfimGOJeXkIxKBbqAJLftljaB1h9d
	 Ly3z7DDpYQhSZENiY1ToduCgBvKEACVYiyZYlB1EAhlEnByUn+UsC7xlM8b2SOvQEk
	 e82lP7cMnu/18eEgTuQdRAUV01rnIFix/gqt1Z+WtRCI3/7RL0LTAqLfB3kzfUqJQi
	 hB/tHnDB3bkOwB1YQcbS3J9na4fREiLw0XjCsrnc0d6dK/bd/uDc+8xPKisDyYuvtL
	 Hc+Yh/xmZtw85hsUTpsKVkqdjbjY9OXVMe03rO9qkp5gfEIcHiSUMxSgkGvOwhiLhX
	 evJZ+c4fHlRTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
Subject: Re: (subset) [PATCH RESEND 0/4] sound: codecs: wm8962: Assorted
 fixes
Message-Id: <176831220240.70484.239744247812927978.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:50:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 05 Jan 2026 04:02:07 +0100, Sebastian Krzyszkowiak wrote:
> Bunch of patches developed while working on Purism's Librem 5 phone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
      commit: 66c26346ae30c883eef70acf9cf9054dfdb4fb2f
[3/4] ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
      commit: e590752119029d87ce46d725e11245a52d22e1fe

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

