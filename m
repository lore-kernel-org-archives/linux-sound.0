Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02541D86D6;
	Wed, 15 Jan 2025 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736970593; cv=none; b=Pe76bXXBQHyoHGrF+9tWG8Xy6ETemc1u7BDdQXIdmrkHafLbJEWzFEVWw9Cqqt6JTIKsq04cIj2yvHNLRLJ2tU2KmaSjLLsz4teaAZbjhpgwoH82/b7fJTlr+sUuRMg8emmNSgJAqYW8VfvG7s+wYJMai1kd1azc1zfACBov7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736970593; c=relaxed/simple;
	bh=ILvfg5pwanMyo9xV5843NrDz24Ynv1QnmM3E4AZ3fGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VM80A4d6JRemVx2zpnECwX6iF145SV9LXny2tjpuBScv4DuXNXCbAd3R1GHHTSGI8gFVwa5S9uZGIs4R5YFF+Qq55TiEa2prj5hWWrKf3x8dsJ8GMqCCBZ4fdr31uuOZuecE+6hVf+Ar9pcp0wIl21Z+J7lI+CSoF/4d3lFcjgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMpoj+IS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMpoj+IS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1647DC4CEE1;
	Wed, 15 Jan 2025 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736970592;
	bh=ILvfg5pwanMyo9xV5843NrDz24Ynv1QnmM3E4AZ3fGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rMpoj+ISagJLSOHpuxWGPdKQjMqQK86VHpsfmXodm0I3c6ACz4d8b0W/b7txz5StP
	 6cMsU+jc6eapmA0n1p2XxN+bC1GB7Els4vzJFug/CGd2Qq3IsG6n59TwOU9Y1Es/sD
	 rMrBoxsmT+AnlvSqCcAssxlrP4dMKSFGNaiEr+ZaNjFjRQGJdC3Z77PYpFORpZmUtw
	 2V+yatPpzTV7ToJ8X2YXVe8GeSALyoacMT/5W51VFNKp1rldDJ0eEwkRLnp9EknwCa
	 ckWuvYhfpH1eZZBZnDv8lqvDsSO99hBBp5tHKkW4OIJcAY1gT8+dxHn6dzdDi8nKaK
	 Fs5iJuRM9LcLQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250114184314.3583-2-laurentiumihalcea111@gmail.com>
References: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
 <20250114184314.3583-2-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH 1/1] ASoC: simple-card-utils: fix priv->dai_props
 indexing
Message-Id: <173697059083.269766.1510915543090525977.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 19:49:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 13:43:14 -0500, Laurentiu Mihalcea wrote:
> As of commit cb18cd26039f ("ASoC: soc-core: do rtd->id trick at
> snd_soc_add_pcm_runtime()") the ID stored in the PCM runtime data can
> no longer be safely used to index the priv->dai_props array. This is
> because the ID may be modified during snd_soc_add_pcm_runtime(), thus
> resulting in an ID that's no longer a valid array index.
> 
> To fix this, use the position of the dai_link stored inside the PCM
> runtime data relative to the start of the dai_link array as index into
> the priv->dai_props array.
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

