Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602941862A
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756408538; cv=none; b=VdPVSa3I1N/S91feoCNjxoO6yPXMNEqtAvUwsG2MFOQ1DhAB7GoPTQ+3LeFEtM+eOub/kUi0F8wtmB8Q6nGFZ1vxr82hP4XUeSo81ivcJG7xgBa1IbEaOJfwR8qN0Tbl60VhCJhsHUzevK37OKT94/C359uQQ4GHN4+IyllNBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756408538; c=relaxed/simple;
	bh=UZvVwUnXFMxn7ffwKa4vhfeU1d6IrDg65DuRZQrbbwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EtuLW1k2BbqL9zDO+M7URKqsBqn10AOQrf55EJLTpg8BoM4alQSJ4OJU/+KNLAFNtEV2kZFsMKwOhR6++BuxZVrQC0ET3CZ33iCD1DxfQ4T0jmLe2YV/hhARhif6gBsqS2oHOPsLTq7339JfE6N9KTPP22hVVh20A0/GFKhlH8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m85XeNEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m85XeNEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50183C4CEEB;
	Thu, 28 Aug 2025 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756408538;
	bh=UZvVwUnXFMxn7ffwKa4vhfeU1d6IrDg65DuRZQrbbwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m85XeNEByasdoBBl6Oq0laWgEsgdzswuGjhMDnRAGCayYPhe3YYhPQMEY3j0X+q4G
	 b9V8xGonWCGWYg3XBIFZgp5zJTSq+3l9PtktFjf+h0DhzjUZZTPs2ZaJxNQklwdz4h
	 jsR25Exlg2BuZcOxntvOAZ2KMFeMmE/kRhybT2C4EIlT+7OtSeqtmVEVrY3GBeaLu4
	 zAAUAJqggWjxEY9hxfmiGid9ewk/uvjmEhM9VrZSYhNLtisypRVR+nU8mLbx0c+06z
	 XDGhNznprvA7cIxS52rHYOLCr/aviGHbuIfEt9BAWvOlc6feIM5rvYE9s1JbBn8nws
	 rlMgAxMVwqxdg==
From: Mark Brown <broonie@kernel.org>
To: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zfbmwq6v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfbmwq6v.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: tidyup direction name on
 rsnd_dai_connect()
Message-Id: <175640853658.350900.1292860331822130745.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 21:15:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Tue, 26 Aug 2025 06:30:01 +0000, Kuninori Morimoto wrote:
> commit 2c6b6a3e8b93 ("ASoC: rsnd: use snd_pcm_direction_name()") uses
> snd_pcm_direction_name() instead of original method to get string
> "Playback" or "Capture". But io->substream might be NULL in this timing.
> Let's re-use original method.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: tidyup direction name on rsnd_dai_connect()
      commit: 8022629548949eb4d2e2207b893bfb6d486700cb

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

