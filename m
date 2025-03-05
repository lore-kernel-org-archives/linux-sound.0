Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F066023372D
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182058; cv=none; b=INTDiVFdg04VBpMQcpHyPJuA3oZxPtmx+1s0Jertq9XgBt/6jbhpX8goIpd1ZV7AsU9qAvhMKDBjT8cVAY/rl5eCHv3QN6Aazmy/f+8mNYO82Y0Savuebk554FHGl3NhDwJmgI3whTa3TvWrMhIqaG+law8fdiBrznT2zHqt9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182058; c=relaxed/simple;
	bh=NjNIlSQeTjNcA8+b+/u14DDI+LWNELBAz/ObpZv9GKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZOu9wZMsRE4OiJZp99Wwt6fJ351QIEv5iv8PY9r+nS0TFMZZvmVJ9WhEJR5IFoDTD/iE5vJA2hruaKZ1903NuY2/XkvnHXbFNzyBRFvbdK9FgpmsR9Wtlc2BArFw9ErnnkQEcbchNq6nx3rZf3ypDUUgjk7g/7oe+z0W3G/MdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7LUuKFc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7LUuKFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03F7C4CEE2;
	Wed,  5 Mar 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741182057;
	bh=NjNIlSQeTjNcA8+b+/u14DDI+LWNELBAz/ObpZv9GKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M7LUuKFcNLqiXAXQ5Wn6LtbezLogL71iZ6jqo/UeyS70qYEFVTh9eo0AmO50+I6pl
	 Xk52j+W6Fjl4nByshH3bGm1BrYzy0raAMVv3qr3jwqOZbsKMk2BtU9OTntq2yhWmZs
	 CYDN1FsM16d+Ree3ANbb0wGeN5RDaQDtNg6juvUnoGda49n2vpHbCybmV4wvNkXneV
	 o8j+9s6HsrTQX5mm51+shniEZC6YuHeeNkZj2Z2oePDlfSynuu2wJCWdZ0Sz3NZ4f8
	 Ek1EKeCxpnZcCPvj4QYlEM6FE9ZB0mmExzO9cYzUpFx02mtXYc5asqvbExEfccOjI2
	 fM2WhT+5gd8iw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87tt88z5nd.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt88z5nd.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: doc: use SND_SOC_DAILINK_xxx() macro
Message-Id: <174118205662.48010.13918785466539690399.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 13:40:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Mar 2025 00:24:06 +0000, Kuninori Morimoto wrote:
> We can use SND_SOC_DAILINK_xxx() macro to define CPU/Codec/Platform.
> Let's use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: use SND_SOC_DAILINK_xxx() macro
      commit: de22dc76e11d1291d4f50b73dbbaa158ba9d6acd

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

