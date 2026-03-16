Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F923372C
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662798; cv=none; b=oHMif1NuDlhamIHanpcU25BZWA/nRHz5AZXCJAVuUxQqwrD3YET0Fp/UaDGuPYkFWaLOpqJfQpbJTOnFII4sNNd8ZeZpJ6Wufbsk6gp4BxOCVmYN5NQnTRcQHQP2oW1tYEwBMUQ1nM9Ya5geeg7u+g8QB/P+zq862z51bzzFydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662798; c=relaxed/simple;
	bh=d5zVMLMaSXjxYJZy+NI0dl2lGs6f+EWiVldfjU8003M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P3AMLSQ3E2IsZhGu9UXtxr34rtCUn3EhQFAtL4k0M5YSqMMRNJ3fYe4sBU06uBkQxjBQfxrbxyvd9GutBJmZ6cP+KCeQxEaT7zX1sO2xN6D8uYUSOoDXaQY1acF3pR5V96nEs/ZiarK4uDEeiYf+5PyhH/lTPqu0mL/QPrP/i2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+v4T2BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+v4T2BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D081BC19421;
	Mon, 16 Mar 2026 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773662798;
	bh=d5zVMLMaSXjxYJZy+NI0dl2lGs6f+EWiVldfjU8003M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S+v4T2BBSbVPqxGZ3n/FQcJTqCDV1XijXob+Y81OVk+P+ERDO/v8bffYZ7mdvMAOb
	 cfLC1+DicPGCerHvqYoPTurF1g8xKUGTfUWT3vu0SCk6xEPch+5sjDZX+U4VY14nWg
	 rtRbzSZ+D2mXtptaYm5XdB3HbKge59ed9rstLAXvxYoNL14m878Wxb6egrMAZlSyP/
	 CGw+cxagY37LkptjK75TXJK+0/Ood9fpOSqsinWYc/f7KigbbcjwGRInlB+el9MYYX
	 /oJ0Rx5JtUsV/5yP6Bt9Xl51X8oU9W7J/rBC+lqH0T0AugXfnmJ4gxBjWXEjhiqYuH
	 pRSamPtGRI5oQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
References: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: amd: Move to GPIO descriptors
Message-Id: <177366279615.260651.1179851776699323842.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 12:06:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a

On Sat, 14 Mar 2026 21:06:19 +0100, Linus Walleij wrote:
> After a quick look and test-compile I can determine that
> all of these drivers include <linux/gpio.h> for no reason
> whatsoever, so fixing it is low hanging fruit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: acp-da7291-max98357a: Drop unused include
      https://git.kernel.org/broonie/misc/c/6d841b46ec05
[2/5] ASoC: amd: acp-es8336: Drop unused include
      https://git.kernel.org/broonie/misc/c/0a80eff3f53c
[3/5] ASoC: amd: acp-rt5645: Drop unused include
      https://git.kernel.org/broonie/misc/c/d63b722361b8
[4/5] ASoC: amd: acp3x-es83x: Drop unused include
      https://git.kernel.org/broonie/misc/c/70f0a90e718d
[5/5] ASoC: amd: acp3x-rt5682-max9836: Drop unused include
      https://git.kernel.org/broonie/misc/c/c43988dfe25b

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

