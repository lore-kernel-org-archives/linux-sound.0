Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE62D73B5;
	Wed, 28 Jan 2026 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628692; cv=none; b=lzh0clSvvRDVk1vLwwQsgxWAqVbQhf2dEDAhZtJwBkTzBQCo56G79ZMp+lGj3SxRYB0QQ0LN7tRGXLCBFUaG5Q+B1xJV5Nz4lmcIelLtKmPqUKjEClY05Ct5uPbJ/cF1Fu0RmGNZZ17n/HKwvQRR8Nfry10huTr3IWKjAjreXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628692; c=relaxed/simple;
	bh=MW4FOJW365fdxGoKSejqSsA4OqI5JDIvTEZiMhmwaaY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Trv/66HTbQ8unbks++le/eUQZo5uM55ejKl180h+5hkDzAsLhANHrAwNNWV6T7Xl4oiKJ5heqT3+KAwE1AghOeiEmJGyxFqXgHaASu2Z5AzhRwS09PsMlIR14h9yKrC86lM1wqVf3VDcdiGA4FXy52DTfAwhqcta7hOMCfd+wRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CASh288i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CASh288i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69AFC4CEF1;
	Wed, 28 Jan 2026 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769628692;
	bh=MW4FOJW365fdxGoKSejqSsA4OqI5JDIvTEZiMhmwaaY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CASh288iwolnJ9SmNNRzR8TySmre0MJ9KnqlWCIJmwp6fe2SuCr6nPuYBPGh7w0BH
	 x+YLqlCjcr+1kzSDhbgI09MSvFS50XYIRk1JUpwm6yM7fwN3mPS4Tjz+H/PhfCRB1h
	 mvgmyB/2l70uJ8kU14fMYjgf6Ka2WoxdjUINW7Xr8sDNdVHUzC6FYZovLVX4vgcf8R
	 m7mTnIeXJaF8yhRWwYy39xWYuJAmATYx6VzOQ29SSyX/S1jAUPKdTK9YpnwLebTKIK
	 hxG8PCRx71oTUr0jeRkwW7fxf4T/oFlHR9ze9BJ3R2S3J9CoR7nnoMgevCGNSAe3ir
	 bSnAXKjfLUQ5w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com, 
 sebastian.krzyszkowiak@puri.sm, brgl@kernel.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260128025955.2562331-1-shengjiu.wang@nxp.com>
References: <20260128025955.2562331-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: add .set_tdm_slot callback function
Message-Id: <176962868949.3153382.6349530413327726424.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 19:31:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 28 Jan 2026 10:59:55 +0800, Shengjiu Wang wrote:
> The slot_width can be different with the params_width(), for example,
> DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
> length is configured to be 16, there is no sound on the right speaker.
> 
> So add .set_tdm_slot() callback function to configure the slot_width and
> update the word length according to slot_width in hw_params().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: add .set_tdm_slot callback function
      commit: ab3f4f0c7f3aa050cd602cc32830e24ac4aaee97

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

