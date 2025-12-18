Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A9329C40;
	Thu, 18 Dec 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046073; cv=none; b=O5+izWaYs1r5kFzmB8UimSLnUM1gNWsYdhch+Tm14wSAMTuP30pLG3F06OXSZPAguaOVeNGKAhOQjJl0nAF0I3+iRcGJqCpwwbrZSjzTixTT1sx15rFBHZGapjKz5H7tUCauSZyWfO4bLXY/tikqy3Phid7HD0PnLxL6kUqoQio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046073; c=relaxed/simple;
	bh=R3asQQdz6TmI+GJz49VWg6UjgoqlN9AMqI8tCVkVTh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HUE6j6e61Q+/z4veEuSxN5mrMwKq8tgzWEB2j/SmDW0vcbYar9TFJgmhOY7/vzoP/zTPM3mvgkOfa2a8mREK17eoXxlQ1t5SJAdWtIOI9KEDRG95r7NtDSsBCWpIWOEQniVjJ+jO9msXK4zwOn9IkflqX3NcNgbKkBXjc7lwF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0ikqlUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0ikqlUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683A9C4CEFB;
	Thu, 18 Dec 2025 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046073;
	bh=R3asQQdz6TmI+GJz49VWg6UjgoqlN9AMqI8tCVkVTh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b0ikqlUC/3iGp0KQGPfjPspSc74aVJ/P18sypOuQc47UP50piVjr3acehncbYkMhY
	 LGrLYmicK8BqqiTwk2kG5rLnSqV7vRJkphJKtDdoLsNHQiPfiRb3eRbNeQwa/2b+Bp
	 vcNQNFk19VKpxsQIFksS6ET89MqGcU3kb6X3Y+78y3RtS+fUT1FyTyMQxObrFRLTdr
	 lPydu6oy/PJ8mm9EoS3S8PMGBAHqxnoGfmPhwopHPPs7cr9k3Hs0YysuNT2slTi7N6
	 BtjbpVrYPWK1ldizf3/kIhBkCFiiT2IkIOZmgY+w0jJN5p6ZhA8H/nMwx4zTzTPSZW
	 khaXU6Pj74YQA==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251217104356.60839-3-hariconscious@gmail.com>
References: <20251217104356.60839-3-hariconscious@gmail.com>
Subject: Re: [PATCH] ASoC: codec: rt298: Use devm_request_threaded_irq to
 manage IRQ lifetime and fix smatch warning
Message-Id: <176604607116.48417.2906210047267177275.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 16:13:58 +0530, hariconscious@gmail.com wrote:
> Replace manual "request_threaded_irq()" with the device managed
> "devm_request_threaded_irq" to manage the IRQ lifetime and also
> it removes the smatch reported warning.
> Remove the manual "free_irq()" in the "remove" function as free_irq
> is tied to device teardown.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: rt298: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
      commit: 3a4e4e0003678a87600e82d02c9522af282a5c0b

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

