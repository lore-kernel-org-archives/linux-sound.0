Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3422ECD29
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996706; cv=none; b=rl+umLk92bZkztN40R5ztR+RQDr/Sb2//zLdkzfCL/L7uZDx04v8Dyns9FIMbsjFaa+PM/NNNIVzErTysWesBYK2qyfTDLSlxhYvM/cfvBDtulqtUw2w59tQB0JfOfUSOB4hmi4j1jlANbETtYltD4xuwIgC1G8nmp66UwVCL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996706; c=relaxed/simple;
	bh=OutnMHZESiBf5M4qYSokxLJoeTEJ7bk4VW9lSSmvitk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DDZkGOKIWy/L329U9hWz78bHdvSyziTgpR1Gr9Vc+dYV5lPOKiJo+1+NKQjQFZwmQ9kv1n/xvLAoVGEA2HBOsakNiKo869uLIX3cnYKf4WLAInoLZbNRM0iVpPr3JZMiZ4+LpqRd5mMDK5LbT4c7pdGD+VRY4vOufpUTCWWDQVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuJ+75T+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuJ+75T+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193A0C4CEF0;
	Tue, 12 Aug 2025 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996705;
	bh=OutnMHZESiBf5M4qYSokxLJoeTEJ7bk4VW9lSSmvitk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JuJ+75T+mcZIo5ZkmIXKF3RcOz+uuzYxdAPJWueI6ZoJF6CbXdzgMw9r5esnbaef8
	 rgRpLPI4ekj3/pTrDej1f95ZvplFaIVVmqXD18BP+46lcuzMlgiAdEkv/siz9XawBh
	 HBckdaD3xM1AXEVrNBFVyywDJFPkFhtmnKBK3nqTDgWygqYhCtZWeXhpXt10XxV+D/
	 PhJXrfTz1R5ZSkSXBzFuMCQnhwbEUlyBXlKS2t8QLl7ZhoatCNT+WVKQiMNy/Fktkc
	 PKri+BV4YCEoEG6qFMYwQ2PMpK4E+eSaY+U3OZu0hpfzfYXlCYJVd5aX9jTBoJp85i
	 CczyTUFeweM2g==
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7n0c9d0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7n0c9d0.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: generic: tidyup standardized ASoC menu for
 generic
Message-Id: <175499670485.16031.1234390045522532784.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 06 Aug 2025 23:34:52 +0000, Kuninori Morimoto wrote:
> commit acc84d15e45393fb ("ASoC: generic: Standardize ASoC menu")
> standardized ASoC generic menu. Then, it moved generic menu position
> under SoC group. It should be kept generic position. Tidyup it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: generic: tidyup standardized ASoC menu for generic
      commit: f13ab498726bb6c636d6c5cd8c7df911444316dc

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

