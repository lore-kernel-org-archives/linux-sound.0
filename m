Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C0630C617
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807115; cv=none; b=CSIJXmGLxUDCZD+vr4BGsExwTIn+hMkMhP2ZD9tykKdPZiGP314uj1MoaY7b8W+EC3ri1XEwnvPgQ9AAFZX4xI5qsVtZb3MUI94Xva3ElmFsZFhkXAFI1leieARERDDIVKygyXdLinOgxQvb7bzmVLVVdrajTkBnXCrSZbf5W7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807115; c=relaxed/simple;
	bh=ip/H+fKzhQu1mZ3Pu6QYTzrFy/YU+1b1qApE35hB90I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jKgClhH2KwkR+8i4J5XR/4IybjI7/OqXMqbf7/c8TM51zTPLT2MqDHq2476trKCTb1YX5egFNUe/CjK6dU53zkUhs5RD1ZZcwu7yfu6mvuVOYmJGufQ/4zJSNN1mYTZD15pYutc4jRVRitbYFvecptKw+/pSM1YRBW/BDQlZDls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/Ysak3y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/Ysak3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C47C4CEFB;
	Mon, 15 Dec 2025 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807115;
	bh=ip/H+fKzhQu1mZ3Pu6QYTzrFy/YU+1b1qApE35hB90I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B/Ysak3ytO18IrEioBTunjyG1OV5wbp4qhRRtDWL+0hjSYlWiVA0E/jti92G8KYqK
	 9kIH0ptLviCd86j9TlcsjSdDw4FXuWKrPJmGfDMVeBIz4GIvNoYDGINVxE/MDjzJXh
	 +c6uOv55lGvUzFYeG4M5yUCe/CYFQJ3G7bv+n0ujrewo94Gj6/ZA1JT7EHrp7JEZLr
	 HQvZ6VOt+4ugjvgcs72u1IVts9PqPR6yVMuyX/FTx9/COK/oFCG7gq0a4bmPB7ZLGn
	 VcnmfqlXJJfgs87vV1Rt/KnNAnWnXJQjOmP8uPhVkUyZaaez2BagJCwb2aERbS0o1J
	 1oYJ2cOW0uthw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjkgnnhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjkgnnhg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8189-nau8825: don't use card->damp
 directly
Message-Id: <176580711455.161056.3831112474573405599.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:34 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 03 Dec 2025 05:27:55 +0000, Kuninori Morimoto wrote:
> We should get dapm via snd_soc_card_to_dapm(card), and use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
      commit: 69927c13d5c5444f5f774e891fa5970ae1bac4b5

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

