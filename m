Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96958268C46
	for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732818; cv=none; b=W7uusqT7vZarYzLXqB43Uqo3gO6yoteJATdCahb9gugl6FIIsKbqmT/yApVMa0jokJaaQjf0fY1uYTgQrQbhWkLQIgCS31Ga46SGff80bMKMm0DR1abulzSdpDFbwCjU5fYNFpm9X+uOtM8HSOlV96uM1dqc4HaRiSMSbhFzK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732818; c=relaxed/simple;
	bh=ywMT2bP8x/PAxDObTZZPJZId0AEpf3c01eAg2BRT4ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vm+KDlzTiZgh2I4xvNOv6w9HqLEkgYGUMZX+FE2CHxOT/Is3wkDK+f+Gm2fH8YiuqITShdbkZqhI0KTqhUK4bWoF8wkx8aofe4CZyZb4ISNA/xFoIos+WXKMxGGwYoDxbTEKaryiuRTfNY3YrYpGrKj3cuS+b2u6LIzhfPQKWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0hGhuzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0hGhuzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F369BC4CEEB;
	Tue, 20 May 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732818;
	bh=ywMT2bP8x/PAxDObTZZPJZId0AEpf3c01eAg2BRT4ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R0hGhuzTaHtyl3SzbsgiGAAFY5aXuSJz1mgEetH0AHFP7n6y1Tl2HW6zHSVDwWKRx
	 D3W3qTo4c/GT7Q520DCjWWQOs+qoEzzQtqqXqW2CygER50unpoStshNR3nD3rXjAVK
	 0mtazGXtDPI9yMp8HZTAoLe7XfUz7m4hePk3DVfYapQrCOkmidOJQOX/XM94tIR0aD
	 G11LE0dpjbbeuIT6YoEigUFHWw5Lsq5yvVmyyymV9FlziVXhFtqFQnanWuaG2Wgui0
	 obBIlM1YBOTUqukfMNwuG2/Jxzhv/blPI2qjJOZifl9uzsWF+NbdOUlqAsP2inFRlr
	 Ou6IlpG+Ze6oA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 Vijendar.Mukunda@amd.com
In-Reply-To: <20250519090645.2620292-1-shumingf@realtek.com>
References: <20250519090645.2620292-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: make regmap cache-only in probe
Message-Id: <174773281565.19497.17798608721565803173.b4-ty@kernel.org>
Date: Tue, 20 May 2025 10:20:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 19 May 2025 17:06:45 +0800, shumingf@realtek.com wrote:
> This patch makes sure the access to the codecs is cached until the device is enumerated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722: make regmap cache-only in probe
      commit: 152c773fb4d200985705218e0314fbd7875a3292

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

