Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A42522B4
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643273; cv=none; b=uHMv9VWC6bvzKecOX0qJCeE0N2jLllQgEdst7B8KYVFL7QgJYw1T3xAWUk0X62vQH1UqR9h3G/Bq9538Taz01AZv1zDRshB6tWNZdyk2gZ5tDEV+PBEDFYiZ+l7koo7ypcq4qN+wiFaylJUVj5LcmsM2eTPF+YsBZ+eKJwxaE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643273; c=relaxed/simple;
	bh=X/ID6J4zrZO63TqG4wegAx8WmD9Pdhzbqzr9xH5pM28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZNRKgT7dWwI/TVDX2Cj0u6bGvvSDwZMcFBnpQag6ejo3o+49knGsVcDg5DnnoIoDsgBo6E6mMStZIckE+FlvelRHIDqlhGJOcSTPTuH5SGorlAhooBgkx4Hs24frL/QhX/o8TQLc6wGYhiahmCQxop/B6xPDCSsC4x5AjVaSk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDJ4S4Qg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDJ4S4Qg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BB7C4CEE2;
	Mon, 14 Apr 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643271;
	bh=X/ID6J4zrZO63TqG4wegAx8WmD9Pdhzbqzr9xH5pM28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CDJ4S4QguYIglWxUPuA1Nw8droV+2ZPSwVLsB2xUKXo7Oxsagti+/2FebkzcbQyYj
	 lEvCDo+AW/j+STZc5oPr7CnwL+l035GpQa1v5HyGTVCfIDnVUKW2KZ3SBXH5lqkble
	 qbFzXTsYQa0W1VEN48yWs5eOo5RcMd5QsAZ51FuQ9TaR/XjZk5dkuyvBOjTzRi7WS+
	 puvr0wo2t953RYpRoSzBL1y1UtYI1YiMZTqcSiz8FpoKDF+EdNm3jelgATzrfsbUH6
	 oklLQmUtEnRFzj7AgjC2wIcn86TL2SrD+IX4nkQfbaXl8Digx/HSmg+e3i1dwfyCSz
	 XKMuZxD6lUF7Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjszr1xp.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjszr1xp.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: use snd_pcm_direction_name()
Message-Id: <174464327122.115540.11341981007835602346.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 16:07:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 01:01:38 +0000, Kuninori Morimoto wrote:
> We already have snd_pcm_direction_name(). Let's use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: use snd_pcm_direction_name()
      commit: 2c6b6a3e8b9338e7ddbbd699f3cb085fbc78413a

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

