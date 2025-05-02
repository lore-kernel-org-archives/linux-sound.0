Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AB21518F
	for <linux-sound@vger.kernel.org>; Fri,  2 May 2025 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228804; cv=none; b=nFXvciihDfuAPCtgLiqmurT/yFONDX9UqQTgsl1cYNOHcWDWRVG8cLkXHuwNcSOVHQoOp3fdN2jQqgsnp+kyxnRCnJU3qEc663iYSYn7H9hwNB691e9Z8yK1ViPD41M3Uym6Mw9FpuaZuoh0wTdZWgOBFrk4ir1bznLxfdX97sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228804; c=relaxed/simple;
	bh=QR5JdFC6FDHvQDaf5wrepdTzSxerOx3pO6T78AQpfTo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iYLvVPW1N+1Fq38UQgCV/pkFsoVDVD/u1dhUDOf7fXuYRepRkZyiIMiykx/4sCfN2QkIBUlwZStyoc5gSnuJwHwE5vp77JXzppgZKmRSg4Sh895PJTwVVngg4uVQdyOC+h3pvwEWYlZdocIZEOV1f4OMyRv3DdjnVV6A9Uo5pTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6DsXyuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6DsXyuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D411AC4CEE4;
	Fri,  2 May 2025 23:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746228803;
	bh=QR5JdFC6FDHvQDaf5wrepdTzSxerOx3pO6T78AQpfTo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=C6DsXyuBLJxFL8WBsh0qT727GeN1xupKW/aYQA0AJ2sACzvbYS4khwDwUuefiUqjG
	 ugPQ/5XlolVdD+ZFnW5gOYPqbvGBZM3TAORRZUKKO25ukkGvO2XeKQ+WilRy12rYS9
	 wd46Ve3E1J+Xh+1MubUkTMz/MgyxbL5pOZ9IY+niFvbZ0SldAmkYaETDK3FtP06udI
	 cRPXHiWzr19VPvAWsryq94Gkd6ziulFtgEA7Zo4hN1yzq8sXQ3aPr67Lf2sSjVaWNg
	 oQO5PBwJyvlrk95bXSU0CyZHpB+NSTfP4cJw8uIWW4p/ImuRKoWaS8E1Ab8M5M1qej
	 +S0JF3E8L4ftw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: soc-utils: add snd_soc_dlc_is_dummy()
Message-Id: <174622880110.4088832.760632648431240949.b4-ty@kernel.org>
Date: Sat, 03 May 2025 08:33:21 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 06:26:48 +0000, Kuninori Morimoto wrote:
> We are using dummy component/dlc, but didn't have its check funciton.
> This patch adds it.
> 
> Kuninori Morimoto (3):
>   ASoC: soc-utils: add snd_soc_dlc_is_dummy()
>   ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
>   ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-utils: add snd_soc_dlc_is_dummy()
      commit: d85d055e20915d10323d7f416f7fe092a58b28ed
[2/3] ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
      commit: bf2a7ff888e080e4fd71cb4d28798fef836d7d73
[3/3] ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()
      commit: fed0805ffd76161ed8c056ea30b36550eda8e106

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

