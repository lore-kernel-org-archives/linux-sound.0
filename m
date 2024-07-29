Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FA189F25
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273456; cv=none; b=Y5lWivRE4zfRrwjgftxo7n/qKqMSP3ZW5ictNXPDebC9xWr6tRhZCwGHxqCSNvgfRgNInxPKJ515kOAAG438br/PP/aS252Kz9QuGYl7PLVwfz3FjVr5AwhS1gtLXembbemyb1hKxwYIN3BJOOreQBQ586A6LrIDWgJ8r++C+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273456; c=relaxed/simple;
	bh=2/fxQabMbrn07FPkajHzSXbNfRWxzdCNHHSma8lb0Pk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NbaraYMFwNq2sthQcTqtwEP/0oe0x49lbXGCPX1WuP9JeiNvLbmIgt6PjffJ9xwloMwBfU0ZumEXvBqpV7VQBqxm5Di5Fll9EJpOqdYPDWsd0W66GLxFr2RzWSSpxgfJhkLar+B5ugBLdbSe4ouNVG0KyS60y93W/HqfT781Oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhGKJAuN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhGKJAuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD242C4AF0A;
	Mon, 29 Jul 2024 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273456;
	bh=2/fxQabMbrn07FPkajHzSXbNfRWxzdCNHHSma8lb0Pk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MhGKJAuNWgqSvkPD/idKQI8dZvzZ6v2IPEcG0yx3j8gS/ScZAYCkQ0j+HtiAagQc+
	 Ai+W1lUzDVayO1RF/1sq+/4KLJg7w0PcI4+VCzyMd5b/EyL9Ed1d6dbI332AMWMUna
	 ZROtWgkaPX90gJ9O1iw0IBXoWEtXhNMzQULDCsr2b6XMQk9DDmwK/DocxtyMaBv3RP
	 q/h3AXnGm79GyVkqekCXFWKwHG1vjzGNEBBhmu3YP+YKDNTHhoZUKElnPJPR6PKSP/
	 h2V0Ha9P4gNpfCwirQORB4sBYYpl8BNDntAka9AhRR90JYkRb9B6MiA3AxLZ4tAFa8
	 TIahLX2ZpxLPg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>
In-Reply-To: <20240726155237.21961-1-tiwai@suse.de>
References: <20240726155237.21961-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: Use __counted_by() annotation for
 snd_soc_pcm_runtime
Message-Id: <172227345549.109775.451012584100322040.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 26 Jul 2024 17:52:36 +0200, Takashi Iwai wrote:
> The struct snd_soc_pcm_runtime has a flex array of snd_soc_component
> objects at its end, and the size is kept in num_components field.
> We can add __counted_by() annotation for compiler's assistance to
> catch array overflows.
> 
> A slight additional change is the assignment of rtd->components[];
> the array counter has to be incremented at first for avoiding
> false-positive reports from compilers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use __counted_by() annotation for snd_soc_pcm_runtime
      commit: aaa5e1aa39074fb466f6ef3df4de6903741dfeec

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

