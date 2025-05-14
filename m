Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BE270ED7
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228466; cv=none; b=NccMY7Fqa8LHD6j2dtdmyu4AIXZzjbVn6XZkK0vX1RPQPlt2AJsTXDiTM0tiFv6Tcja/vZhpFHISuPUkfpEUFrrF6C1AByRaVHfCg6N5FVkgvbvdaUxYFbKHfNE7LCzS+KE/YHazObfg9QUQao3nvCzXfKniybM7JVjVaW23Gqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228466; c=relaxed/simple;
	bh=V6REW703MDbz154fZPXpYDBYQaF5OzX6NK+snNlcwQ4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B6HMXXwUzmVLM//eriZx9DyQUrQQ94vpGJ0VioDOdfXArvYKv89SNDTq/h5kdWELGh8dmuK40Euv0iJwifPmjSrlxaCkOAT57jpklUmelUe4aI5NrQ5WAP8tpWhQple4rgnv5iVNSiVURR6d+q2cg13imlQFJVgQr8HLrzxoJMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPVm7cFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPVm7cFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F248C4CEE9;
	Wed, 14 May 2025 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228466;
	bh=V6REW703MDbz154fZPXpYDBYQaF5OzX6NK+snNlcwQ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aPVm7cFoz6g8pDOy/80igGTG6+Gki81VPUavSKcbMLSKVcpJOiajZg1TZ+UUuzdRz
	 fHAozszPEudrfO2K1Kt+1FsADSWSzsOqNZOIHMItgeo9HDtFof8h1uyv4OHlM4+N92
	 PU622jNExOl1klSkIGQD6AD9gtszcOlzSB2tAiT2MK/fAFjV67ER3S43tCF1Ujt9Je
	 746Rj/yC+7l7BjbYH1LAnuHxqhkkPXw/mYRtisNj9xrcBLYU0ALsKn15bvFMaYW/16
	 GUFfXf62pngeoIwCohoLgK98YskOajEEdnCMfWLQZNSvmryfvOhqG1MQ6yt4lk0djI
	 Pso/857nk23LA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>
In-Reply-To: <20250513123744.3041724-1-ruc_gongyuanjun@163.com>
References: <20250513123744.3041724-1-ruc_gongyuanjun@163.com>
Subject: Re: [PATCH 1/1] sound/soc: Add check to of_device_get_match_data()
Message-Id: <174722846306.148475.3140640026655460860.b4-ty@kernel.org>
Date: Wed, 14 May 2025 15:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 13 May 2025 20:37:44 +0800, Yuanjun Gong wrote:
> In tegra_ahub_probe(), check the result of function
> of_device_get_match_data(), return an error code in case it fails.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc: Add check to of_device_get_match_data()
      commit: 04cb269c204398763a620d426cbee43064854000

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

