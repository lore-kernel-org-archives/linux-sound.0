Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11A3D7A01;
	Mon,  3 Aug 2026 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758968; cv=none; b=MqtDi0rewUkGmslP0CSctXQEzS2r/EnAAjkB0sHNQ0uEAChKrkIFkHECZKBj8Avt0U0pqrG0rGVsOp9cOM8pY0ryTag8Zw8jIqPSE7f4KdntuU9GJg1NvllDcTFvHZhyR8iUmstL+5RsKj+KTA8fuhMcuDgClHeTsNCsBPHsaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758968; c=relaxed/simple;
	bh=+3IRmbvZXBhG9DubnrH2spxYkwMVuq85+ZRQX4iCNnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P7jmefdUs/NjXfd5/qY0idS6bzeA4z6ZlCvXwS9vZkxia4mlY41Z/MW1an3Qm5WcflCfY1wxe8aRikhcOOm58gg6Uxj6aBBpKp6ZRWIwLzb4Sqn2dWUq1OgWd6sUOpuzD5NTFVJyamoz/Ap9hpvBgaj1o2UGdR84CgRIZGaB1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sgnwx2Gi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sgnwx2Gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469661F00A3A;
	Mon,  3 Aug 2026 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758966;
	bh=3kdzUSQeKM6vKODHA0AKcOsPRvbbaNOmwx5n9YYIKUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Sgnwx2Gip9VEaMD/Fv2XZ9Mxdcua5LDAPjKt1WwTw/PBhzGyo0U/T9dh1q1bx/LZ4
	 CzkrqgEcZ0eJl+JxcysRxzE21tr6hpJPtxeu4R2lG25FfRMKaU8xp/Tg6LPUU32UU/
	 jccbp68ds9RVYVdGdz81KkOFF5cPyTCjIk4rbLWWzoU7KxPR/S0teRk62nuhvk8f0M
	 i0cecnZkhDXurKj5KKyKTKFCuycMd0Nf7E9FGSUMHthsNp6S8NYAVOH+B/OmnsHob+
	 rCYcXWSQkCwyZw3P13m5Bxwy28qshcrewrFx88iW7R2hvc23HBlTzuB3oSsYIHIYlD
	 c375qkA/qxhvA==
From: Mark Brown <broonie@kernel.org>
To: Tim Bird <tim.bird@sony.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260730095407.33894-1-phucduc.bui@gmail.com>
References: <20260730095407.33894-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: spear: Update the SPDIF drivers for current
 ASoC APIs
Message-Id: <178554850127.1405722.2183551813883540892.b4-ty@b4>
Date: Sat, 01 Aug 2026 02:41:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Thu, 30 Jul 2026 16:54:03 +0700, phucduc.bui@gmail.com wrote:
> ASoC: spear: Update the SPDIF drivers for current ASoC APIs
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> While cleaning up the SPEAr SPDIF driver probe path by removing
> redundant error messages, build testing revealed several compilation
> failures caused by outdated ASoC APIs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: spear: spdif_in: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/ae788eeb17db
[2/4] ASoC: spear: spdif_in: Switch to snd_soc_dai_dma_data_set_capture()
      https://git.kernel.org/broonie/sound/c/c6c14a9915d5
[3/4] ASoC: spear: spdif_in: Move DAI probe callback to snd_soc_dai_ops
      https://git.kernel.org/broonie/sound/c/9f2ba3a10449
[4/4] ASoC: spear: spdif_out: Move DAI probe callback to snd_soc_dai_ops
      https://git.kernel.org/broonie/sound/c/ad95fc2e9b3b

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

