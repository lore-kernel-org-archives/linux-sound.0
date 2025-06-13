Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E4372
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833557; cv=none; b=pu3IDBjviuhdkbUqfRjnh5mI8BQGvfYx00OEe0zws5fV9tBUonK/+qsITQUP70EVIJRKUQEeCyDx+wHkUWd0G3F4QnEJRQjN8UUCKwSo+OET764sYRndRqZnfEa7D27ZxNqSL15LgPESmePN30Q8v1mZ0Z2re6hfnu6YwG65pwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833557; c=relaxed/simple;
	bh=ZP8SqTy5h8/LVrXATd4z8DxAP1e9mzSt9gmnvU94rfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dd27UAOCBAJ1j35+swXDMrTvaCQoas++2Xgvv5hUDfISgUY36yZnfs7PjjSc9tPtKYJlCk1MylSHlWQVt6SPRRRtmbPHZyph6oDg9+J9vA46xhnTiGYZpj62dxFWBybm04bNDXzeTNy3yDLDkSIoqWCc6dsngOxdAlflScM1mBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuPzOlZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuPzOlZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1123CC4CEEB;
	Fri, 13 Jun 2025 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749833556;
	bh=ZP8SqTy5h8/LVrXATd4z8DxAP1e9mzSt9gmnvU94rfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VuPzOlZA7p2xVVIJHPhKRx/Ioc758k27isxxkdNiCtqzr58YxXieO2V055l9BLIb8
	 0RLNvcxe9qGqlH1tqBqQrGOr7Cn54lxjt7+KUn69aA/bmZ7H6riPx1auYTdp6voH8i
	 UxyjhCNrmhuaOoSWAJ8/S+hZU4cKMswNvRkjeFxHNu9HfG5loV7xYgosRNQJX3mf47
	 0y8b6eWB60O57hWZVF+WTj1bInKNDaOieIIzidEGy/RxtdBX0JBjj6TziHFU2XhTid
	 SLeRYCUyHfuE+4Ek2gsD0k4GgXen4PeLqKD6lrYWcah4czkz5hJwffNGuBL38NRidj
	 wvgqHwloQBqTQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
References: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-ops-test: dynamically allocate struct
 snd_ctl_elem_value
Message-Id: <174983355578.217351.13383396626687362293.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 17:52:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 13 Jun 2025 06:00:20 +0000, Kuninori Morimoto wrote:
> This structure is really too larget to be allocated on the stack:
> 
> 	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
> 	1304 bytes is larger than 1280 bytes
> 	[-Werror=frame-larger-than=]
> 
> Change the function to dynamically allocate it instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
      commit: dae29b678bb74aa2995c1d2b0fa6b1b91f5d8986

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

