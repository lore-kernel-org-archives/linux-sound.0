Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09273C9437;
	Wed, 11 Mar 2026 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226045; cv=none; b=HX9nUlv6yINuGam3UtrlWMAoo7+Btyb3J86OH+vriURmzyfBLbDkzYEQ3FB2MI67drR5Vs5y9delPd9Imir3l47v5RHbIFgHB6EIVVcrD43D3YfqG/6gTKFrNMG0Q98ccXVJFnHRZGBeeEyGh8vQl7M+oHQeDHNpt4ZRPkmN/I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226045; c=relaxed/simple;
	bh=n9wPWZGAQYnQDnwF08QYmJs5BjYlEzISLcv9Wk5+HzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Saj4VqpDBUQjLT86jleYfvuNM20d14bLyX/DPA6Io7d4nQbCh8iL2t/KBrSMr/s38C7B7TTd61k2px31m+QLmnpL/p9TYnk2eKqyTkeGmLXED23lt2BZx5NDOV1zvYYtzzzAEB5GU8wbho2ttoC0Lod29itUe+IclbvoChBoaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHRSyIrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHRSyIrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0E9C4CEF7;
	Wed, 11 Mar 2026 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773226045;
	bh=n9wPWZGAQYnQDnwF08QYmJs5BjYlEzISLcv9Wk5+HzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tHRSyIrK9A/Hiblb0q8RZIpjXoRq6H+Fl23t/p+3ALR/CI8m/2VHVV2HOLgirdxxw
	 YXo3zT9ci50szqLXSpMqdWqGaf869Y6Kw5WS9Bsyy1pjYVkQrCZNStWYIEza0q+H5c
	 cbojjGVETBT3XIZTDog5roOX9C6/N1NY14U+lGD2axSRBmgj9kZvSXj9vsXUiNUkA7
	 HsZZLJeLowy/ffz2H9Bz4QFt/WhMKKdO82avh4uY/nKxi9lfUopOcdh9gUeYXx6qgP
	 G5SDPxm8+XzleO2f9GwXHSHoPjtNTkVsgKka0zrDmYSZqnZVkH6CDID0H29K1qnTDx
	 ABFQ8vYgqnXYw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 stable@vger.kernel.org
In-Reply-To: <20260310065350.18921-1-peter.ujfalusi@linux.intel.com>
References: <20260310065350.18921-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: rt1011: Use component to get the dapm
 context in spk_mode_put
Message-Id: <177322604419.10345.5914120660838901314.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 10:47:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 08:53:50 +0200, Peter Ujfalusi wrote:
> The correct helper to use in rt1011_recv_spk_mode_put() to retrieve the
> DAPM context is snd_soc_component_to_dapm(), from kcontrol we will
> receive NULL pointer.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt1011: Use component to get the dapm context in spk_mode_put
      commit: 30e4b2290cc2a8d1b9ddb9dcb9c981df1f2a7399

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

