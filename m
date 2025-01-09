Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD526221DB3
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440806; cv=none; b=cFowpDOxrygOSNpe+/4MVcXuvOcqpB0osUUU42D0fTZMx/CIs1U08nUXgYq671P4T4BcSRcEsJ9Mj6Kw9IHBQK4IMyghXchtdEjqBHqzL/QV+QW3PEzB2f8e7ZgL+GAmc28Bg+F+4j81oxICKbQC8hwXJ7Sc57YaNwwFA5Wg5Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440806; c=relaxed/simple;
	bh=pnAgzog8cDkVe9accaW/FAyn0BumvLZpRCBRJ1uP9GU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T7LisbBnPJOjckpEN21nkuSP1l7td4TPN+YNMS18MUObNNCoILVTe9WTSquvTDjlnp6v8M/dS6KVayoyamNnrOUGcTz3W6fdZI6fs80bxq1H99/haHHFDGsTCnGiepbvZGB2EK3fAQt48Ph6U2uOod6XTRogs6fk45l2myuXluo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG3MUN02; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG3MUN02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69A3C4CED2;
	Thu,  9 Jan 2025 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736440806;
	bh=pnAgzog8cDkVe9accaW/FAyn0BumvLZpRCBRJ1uP9GU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RG3MUN025qd1058AgrSwXMsMUEYQc+MK96tg/LCn08qnbiTZJjXsYhz1Yy7ifn5U2
	 XXEHcx1I+Ito9kAv6x00EymwB05R+aUtA7gc7ic/3BpcM85X/r7AGvytjHaMDCpyNd
	 hFFnQezKKdrVMAhmBq9w7QKmolEHIhvrLdm4XMpI98LO6fztl7Vy4iBmXYQtAFmBNK
	 6gDLvC+dQlKitAYQyDAZHmeMEe1HtqplReZCsj4FJBrjWR4JVR8j6R6SnjrZCUKaBO
	 pevvO14TLebHUgZnvxsAUVhWIsBU9T7RQrQjTvckfd+tuVLbev6RxUDYv+q4uV/xVe
	 hw2laMpjXhTVQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <87seps2522.wl-kuninori.morimoto.gx@renesas.com>
References: <87seps2522.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: check rsnd_adg_clk_enable() return value
Message-Id: <173644080553.472379.7370150520829417114.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 16:40:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 00:40:05 +0000, Kuninori Morimoto wrote:
> rsnd_adg_clk_enable() might be failed for some reasons, but it doesn't
> check return value for now. In such case, we might get below WARNING from
> clk_disable() during probe or suspend. Check rsnd_adg_clk_enable() return
> value.
> 
>     clk_multiplier already disabled
>     ...
>     Call trace:
>      clk_core_disable+0xd0/0xd8 (P)
>      clk_disable+0x2c/0x44
>      rsnd_adg_clk_control+0x80/0xf4
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: check rsnd_adg_clk_enable() return value
      commit: 139fa599cea0fd9d38e00246ea9f79af6c59acbd

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

