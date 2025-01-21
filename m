Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3881F55E3;
	Tue, 21 Jan 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737483004; cv=none; b=d89/32t9F4OeiIYT/zZofnmRDsT3beJJQhE81n7pLYfBZ7IORG019j51lRRqgabDnqQhJtD97WUwkH9THXtgIkVYfJf1uKIE57l0yCpaJo85m8xtoJUUS+oMU5s2rijOrqs5BBass5uILnJ9GjV1bYboji5Leb/JOZFqazU8pMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737483004; c=relaxed/simple;
	bh=UdZ9afI6nCqNOL74I2jYwoxBKG9cTM3qEhqteNY0Xvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iq+/E6Bw0JE/WwfJaMSEb35cx9yeRdU3irt/1ks8LrzicOJlglPVbKPOeho8DVQOFKn2YxosADU9maNwO20PcNBSnjuo8/grvrb5dIRsLHvYww2m1qVd1RYdUAN0teC6WPRoMvkijP4MSMQs01xdEi83zeMbm7mH53ot2th7U9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3VGdnEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3VGdnEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9F6C4CEE0;
	Tue, 21 Jan 2025 18:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737483004;
	bh=UdZ9afI6nCqNOL74I2jYwoxBKG9cTM3qEhqteNY0Xvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I3VGdnEXDqVWfBKW6NaMyQurjhYZwg26jWT4mb8obx2xq3dEbXHWT+hmDq0H9IYr0
	 AOnKXtZJ4YyGic6SJ9x1U6LfQzhSOeVgvPtETbofPm3bv+to2enhqqt0jJWtboz1+c
	 djHLiMYU++T6ZVO51Xk719Lsu6usSlETau/n+nPx82FJsQGhwMhSfBIF52ywMUzVxH
	 ywrOlzj/c9Acd6k6YUFXpcs8e4E3a5WinOmEUr2gwkNgm2Ol815bkjyqidqGgz3XTm
	 dGTriTLOeUYaTf8Mu4TSdKEVlEix2/GPIUKX5MM/OMXdR20XqZ9d8odIdY+arG4+np
	 yMQ9j0U+xWVoA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250117163102.65807-1-detlev.casanova@collabora.com>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
Subject: Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the set_sysclk
 callback
Message-Id: <173748300208.97954.15641423704093846884.b4-ty@kernel.org>
Date: Tue, 21 Jan 2025 18:10:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 17 Jan 2025 11:31:02 -0500, Detlev Casanova wrote:
> In commit
> 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
> the set_sysclk callback was removed as considered unused as the mclk rate
> can be set in the hw_params callback.
> The difference between hw_params and set_sysclk is that the former is
> called with the audio sampling rate set in the params (e.g.: 48000 Hz)
> while the latter is called with a clock rate already computed with
>   sampling_rate * mclk-fs (e.g.: 48000 * 256)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback
      commit: 5323186e2e8d33c073fad51e24f18e2d6dbae2da

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

