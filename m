Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12C1754B
	for <linux-sound@vger.kernel.org>; Sat, 10 May 2025 01:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841777; cv=none; b=uKulAaM3ipP+aV04M/6bSf1HMR2A7+lXKF71HR3zUbs6sqyxNp0b0lzUy9lmt3exx9eJGI3L3KTF/+fZlUiXstJVB1/g7XBVluK7paYI9f++/b+xNRtCYePhjge3rjnWMCkeKHxQtxfWz4QOAEiFJH3GT/BKtqB75NfLxNWuVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841777; c=relaxed/simple;
	bh=YXG+A2e90eBQbJppnpZA8PD8fov0vkRKs0SYoZ2BU4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p2T1d/7MQXmDpwqUcDfo5ArktcT1MG2cMow7dbiuGwIc8cfvdPgLmTgsO3s5X11s3XZN2i0QrnO7Ai16iE7u6pYgo+JdMvQEnQJO+6EdapsB4wtwd2/gF6FvDDQOYuodvMEoGzV2i6Nc/M5jaq/T8hKUoIpo+okgns2G9phrYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeeTv4aR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeeTv4aR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA7FC4CEE4;
	Sat, 10 May 2025 01:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746841776;
	bh=YXG+A2e90eBQbJppnpZA8PD8fov0vkRKs0SYoZ2BU4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeeTv4aRe9iCJIwVWZd85pjWo9h+LW6gZ5fI5DRKmFvWVKyK1YVx4KPiSP33lJjCl
	 YfdzUCSlICEpRCt6fwD9tS2by95kRtDc2NV7iemKeBpgOaxQ+w64JYFt5IzNfvtFzJ
	 0R254w69du6pVzl+bZ2ZYuQ+/PBaBXLdU/GEqCPtz4DzMSI2L9NKS7Ks4wS44CEXd/
	 sb/uvdRj+tBT/TYZDeCWgLBbaVzribBWdA+7sLJ+9j9hDOMMSZ3vX3uXaSOKR/V+/6
	 S2i6TZOU2fn2VTUqaNvHw/C9KbEP0L1mAs4+W2eiinmYEiAx2oWLkdu5TgYp3DhAjM
	 jEynLrUksd9Aw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldr6pqlh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldr6pqlh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc.h: remove unnecessary definitions
Message-Id: <174684177557.47320.16358395854258108256.b4-ty@kernel.org>
Date: Sat, 10 May 2025 10:49:35 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 09 May 2025 00:36:42 +0000, Kuninori Morimoto wrote:
> We don't need these definitions. Remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc.h: remove unnecessary definitions
      commit: 321f9db5563e1a6c89546b19bd031269aa3f17b8

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

