Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837862C18A
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElLbXAld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E64C433C8;
	Mon,  4 Dec 2023 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701707361;
	bh=l03PGOdUpXAjQJxyhn2jCXzYkIewX87iY4tJWHWgmbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ElLbXAldfKAr1QHhgOyNO7vKUquxj2w/umm0r0AAKpwnRsqbsPw3RgXUFi5Y+zc8h
	 suMe0+B2kAiUofDF32HCEPrZVMHLL67XdH5C3WhzY3MR9QB0FscTWyFZu/O58NYyOz
	 K0CzmmBM/H3xwmDjtwf5QHCgKQRlq2VBnHzWj0owcVTfsvyRTgzaYuQLJ9TVh5IjGe
	 grY5mJV1AEsxE/UiL7LqDyab/5hOQjB0gDlU3OYC+br+d2wxq0TaYbw8bhNeaKm4tl
	 ImwdOL5kDQpQZ3ZYVk21NQsr3g6PoyuXtbydLGAdV9huQ9U3nP+4KJ9t/aslw9c3ya
	 UO8APZnBELu0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Marian Postevca <posteuca@mutex.one>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231202223001.8025-1-posteuca@mutex.one>
References: <20231202223001.8025-1-posteuca@mutex.one>
Subject: Re: [PATCH] ASoC: amd: acp: Add support for a new Huawei Matebook
 laptop
Message-Id: <170170735951.96782.6842317047782976918.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 16:29:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Sun, 03 Dec 2023 00:29:51 +0200, Marian Postevca wrote:
> This commit adds support for Huawei MateBook D16 2021
> with Ryzen 4600H in driver acp3x-es83xx.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Add support for a new Huawei Matebook laptop
      commit: b5338b1b901e41bd7cead66a0b3a796e9fa95684

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

