Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A43645
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661393; cv=none; b=VmZmy6WWk1HcU4vgtQxIsPDMz6jjzl5BrcwXSt1Oq3zav+P7E1jhihC27NwAXjFpXVo5Y23CINYZZBLfmCZf7tq58WA9AOUzEiQnAom7DxFZGxFEpZPIwqO6HJeZUQb6W2Kqz8GVQTC7MZRC7jPcMQpy3HRakZuFwF0/yYjuNQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661393; c=relaxed/simple;
	bh=zsIYacikpcD55jKm+iNIYO7i4OgOVZdvFB3IGX220Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s2EYBZMlMpZ3EnSAHZluxC9ibXSPBDpLRQKfL8nVJimGfhnIcPAKvqY6bn1hOCwwvXgOC2v+0pTHvll+tjU0M/mQBsQrrooHAkB7RmlPPir/85UQlHkSE9bZw7hlQ8Mw5UPhk+vF6GqGADc2OWfKCIqsLDXj4aDtuN10U2fq+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpiFmXSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpiFmXSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962CDC072AA;
	Sun, 21 Apr 2024 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713661393;
	bh=zsIYacikpcD55jKm+iNIYO7i4OgOVZdvFB3IGX220Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DpiFmXSMl61Zx3X4COSLWu2+6TDtdsRsdav4ATP7y79M2YS/LSfqf9yAvF4xTS4F0
	 q7MdFW/23wp76hittNwQnbEXm/7/yeTJ8Mi525hQoRbHtNtPfhO8zT3xCL0UbJj3hZ
	 +jWlPi2r1AHgmiQRlCvdHMvHTZwSOSoyrI6Zi3qYCW1thmgWzE72+KTtvnyy/0Rm7+
	 qBiGBP6eJnP0Tq4hnNv5ZpI7JNQCTVAvvNKSGxanZODFqQHIU1HoS7B6DXDtxX+SKB
	 0WsyKi0Wr8ntAwvHCxjjdy6Mefe0txdrDSL5/BvnVrQAKfa7HVdaWebHDrjtIv8X1n
	 E9GDfo7tcAnGw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 hdegoede@redhat.com
In-Reply-To: <20240419084857.2719593-1-cezary.rojewski@intel.com>
References: <20240419084857.2719593-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Refactor IRQ handling
Message-Id: <171366139151.1739626.4193433952768635118.b4-ty@kernel.org>
Date: Sun, 21 Apr 2024 10:03:11 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 19 Apr 2024 10:48:55 +0200, Cezary Rojewski wrote:
> The existing code can be both improved and simplified. To make this
> change easier to manage, first add new implementation and then remove
> deadcode in a separate patch.
> 
> Simplification achieved with:
> 
> - reduce the amount of resources requested by the driver i.e.: IPC and
>   CLDMA request_irq() merged into one
> - reduce the number of DSP ops from 2 to 1:
>   irq_handler/thread() vs dsp_interrupt()
> - drop ambiguity around CLDMA interrupt, let skl.c handle that
>   explicitly as it is the only user
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: New IRQ handling implementation
      commit: 7ce6ceeb77bfd9fb0b22203190bd6f57fe917b51
[2/2] ASoC: Intel: avs: Remove unused IRQ-related code
      commit: 84049e2db59ad9b09461b6d7ec56bd3e8fe75eca

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

