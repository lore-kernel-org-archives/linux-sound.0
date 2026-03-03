Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0DD395DB4;
	Tue,  3 Mar 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536809; cv=none; b=nTAkj2zj7Rz6GIrFTBUkpS0LuKqXULeg8FhbL6p3TkZQfkAheQTgMh+8Pa7CB/YczkOcZxGzCblTFdBjekaBGXvPWNJexpSt2my6xtlG+Rn0T7KFej1XZrm03Aijm9I+9U0jztiIkBJBN2jjEDbuz3113g2gWR0cefTO5Dnh5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536809; c=relaxed/simple;
	bh=0YaZZ7ud4Beh8bPUIn8q21fI36VkdY+KQ+mXlX+Avlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MRDAGoc8WmHPGE4FMQ/uwSo9e2KL0MneOy1vxkMtwZi7bCT4+7orlWxQTUzqCJpVxTZfpGgWqpXNLZutcpvNkyOnxks/7H+w6gWXW93AgsHWOFRajuJXVyHO/pZXVe/UeDU5/lhKaHG6QE+zPwFH48JYs/2jBkSio1Su/U+c/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMpJ9C1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMpJ9C1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEE0C19422;
	Tue,  3 Mar 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536808;
	bh=0YaZZ7ud4Beh8bPUIn8q21fI36VkdY+KQ+mXlX+Avlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TMpJ9C1MqMwHnroebvF7EqdQ+OvmtYEtYbzZZutkymaa6RsMVSa43nu82G/aSA4tk
	 6B7VVczG21InmQHVSUb0ZYbb5AMirkG5hz+ZTagWuFRsFH4h4R3Z8WAt9VYcT+nhzM
	 uYbG56xmzq1qw/OidSt3EmFx6jv6ml6Xx+J/TPGlBfiwUPhNq4HMXIMSXdCVj9d8nQ
	 I05LmlyJsFyr9cYAgwRG378E5+nv20xesSKuUL5tuGXPo0OdDTxDfnDdrFRd7xTb95
	 JlQBwcgIDGCHwcJn5PLbrQhuLFoIdWM/2qN9vGyneV02Ov2PJRnGbsmSd7T+958ROM
	 /rDbfnAVfD1vA==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sander Vanheule <sander@svanheule.net>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260220152634.480766-1-sander@svanheule.net>
References: <20260220152634.480766-1-sander@svanheule.net>
Subject: Re: [PATCH 0/2] ASoC: sti: regmap_field usage improvements
Message-Id: <177253680666.22767.9354392028975895985.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Fri, 20 Feb 2026 16:26:32 +0100, Sander Vanheule wrote:
> uni_player_parse_dt_audio_glue() allocates two regmap_field objects on
> the device's regmap. However, error codes from these allocations are not
> propagated correctly and the resources will leak on device removal.
> 
> These issues were found while looking for users of regmap_field_alloc(),
> to assess the impact of adding a cleanup helper for regmap_field. It
> appears this driver is the only (remaining) in-tree user of this
> allocator. Since the resources are long-lived, it may as well switch to
> devm_regmap_field_alloc().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sti: Return errors from regmap_field_alloc()
      commit: 272aabef50bc3fe58edd26de000f4cdd41bdbe60
[2/2] ASoC: sti: use managed regmap_field allocations
      commit: 1696fad8b259a2d46e51cd6e17e4bcdbe02279fa

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

