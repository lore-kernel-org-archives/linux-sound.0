Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20297191F75;
	Wed, 15 Jan 2025 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736970591; cv=none; b=eyC1bamV8LooHWe8nxKjBMZ9GZ4I7MxxxKPwG9cWhzNJmwNmo4miCyeesI/xjefXeRwXO9duRnDBk/KL8pNPoIJKM/fgYgGwbEgC4nNtJyBC6fPLq5AS2Jg91Xye05y7YUMUw9Y07Ggf0jkyOwJfSZ9Ct7G2y9o5oqcxsmZwia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736970591; c=relaxed/simple;
	bh=hWr2LWF1qq99l7wU7TfzRrkTYIpdhEz2+9mynXF6C8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rvJp9rLxr3oxb4sVhMwHs2a6VmAdLfZDG3KyDlXWR0u8zVbFzqBxDwSFhpAIGd+tGtdM1EmYvokbOn/KbA1fY9FdzLuKzL6xSuwe1rSEiyRnyGtAmnnrgVI6Qe2PmdPHePzEhtghSg1QwGEoFOvzJcvmE8Dvjs88RapFfsM9QJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbHQBoDn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbHQBoDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63110C4CED1;
	Wed, 15 Jan 2025 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736970590;
	bh=hWr2LWF1qq99l7wU7TfzRrkTYIpdhEz2+9mynXF6C8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DbHQBoDnh62TnlsIBfkZlhXltn5Ejh/f9vBU+Rv+dyBrMYyTG9zORSt3XP1FA0gOd
	 3dDBCjOu2mKl6v7Xw047b6O54WN0WxWSGkGlXt0NOv6e2mgROGwjS8I5qtscoRsGcp
	 E++SryFMg0O4Nlpf4x1Tz0eB6FgP4XBaGQsgRcw60g4MmfjmaeYpsd1KlqWE05Q3mx
	 fS47Rh2PRWer4r5TMDj6k9uZXZ/n2bmBrvvoHwun5MSNwSiNjQET9FubjeVTbsig49
	 IVP7ZPk+QRU9+//mzCYBdY5GFXAonhVCsO3/7JmduCabL3vAugNx2kQjT7uZ7juFtf
	 NSIuBCdT5Fx7g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
References: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH 0/1] fix priv->dai_props indexing
Message-Id: <173697058913.269766.14406601636391678268.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 19:49:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 13:43:13 -0500, Laurentiu Mihalcea wrote:
> Fix priv->dai_props indexing in simple-card-utils.c by introducing
> a new macro: runtime_simple_priv_to_props() that can be used when
> dealing with PCM runtime data as rtd->id may be invalid.
> 
> Changes since RFC:
> - added comment that should help clarify when the new macro
>  should be used
> - Link to RFC: https://lore.kernel.org/lkml/20241220151213.2462-1-laurentiumihalcea111@gmail.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fix priv->dai_props indexing
      commit: 04e97fa7dd7e3eda754712f92df2136acd1d9088

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

