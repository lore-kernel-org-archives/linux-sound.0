Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7531F63DD;
	Tue,  7 Jan 2025 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279145; cv=none; b=b8fQOye/fh8+Jafk6pgiaL/lpuT2j/AzZTWu0GdLwB2eXA9YZokOdwc3LEk5vFj78cEnI78mPOFGqiZU6DgGQ+yJbyHWgdRRwYRReEkxTVlVIjtkSKvUwndEoBPLUm08YJnoxYh7zoF8EvGSbL8S/D1AkbcPNLgrnqnKnXEPHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279145; c=relaxed/simple;
	bh=+Pw+L38NhsuCTP5M5Sn6fAJ4zxbLh3FucqseNcjrvZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mTrQ/EvuznPHDsm13SswbfDdn2S92drDCsf4FwUNGKW9YXwEg8Y3BvOtGxyi4bK+sb+WKOlIB44H02aZfQsj0km8LBDInS2RpkTothLANR6AgVqYKMiu1WPN3kr6NTT8OrkPpNfLXUQ8s1hAtxAE+nBG+58RasyCsq796V5C2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic4cHwwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic4cHwwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D22CC4CED6;
	Tue,  7 Jan 2025 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279144;
	bh=+Pw+L38NhsuCTP5M5Sn6fAJ4zxbLh3FucqseNcjrvZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ic4cHwwrW++n0gRvLZIbfmmH6XlWems0dHg9OwBMlYZk4R+P0Pf+4nqO6WBv/dUid
	 msxL2trR2VQm49py+3sLQk4/uvp6Vp3EMdTHA+wWbyp3dsqccRdvseaDxdlfksMK5b
	 SxWD41NZIxsLe+qrARyTtQ4maYuje9gSPP9zMbqxXLuPfSL7W+j3hF2YD3WwnX8wjg
	 I2ZkdQ5lYscV4kKWQbGQOiyYmi6bQNs/KOrp2UYOm3VnGkQxn8fGfOpjkKPPkGWsoz
	 FLYhKB2NMi49UYwcJhOBt21k/QZDVeOyJsLUAvkZvhPvsq3dY+9JX8KHjsyfsikxt3
	 wkZvokOoCmpGg==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, perex@perex.cz, tiwai@suse.com, 
 Stephen Gordon <gordoste@iinet.net.au>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250106050659.57924-1-gordoste@iinet.net.au>
References: <20250106050659.57924-1-gordoste@iinet.net.au>
Subject: Re: [PATCH v2 0/2] Minor debugging improvements
Message-Id: <173627914278.519339.18099076069378356943.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 19:45:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 06 Jan 2025 16:06:57 +1100, Stephen Gordon wrote:
> Some minor tweaks to debugging for dai_links.
> 
> Changes in v2:
> - All: s/asoc/ASoC in subject.
> - Patch 2/2: Update wording as suggested in review.
> 
> Stephen Gordon (2):
>   ASoC: simple_card: Improve debugging messages
>   ASoC: simple_card: Show if link is unidirectional
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple_card: Improve debugging messages
      commit: 8c588fe965d95fd2d18e1a1d55489b9237eeddfe
[2/2] ASoC: simple_card: Show if link is unidirectional
      commit: f1a92bb81a6cf9ae9a50d175be8b396bfabcb487

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

