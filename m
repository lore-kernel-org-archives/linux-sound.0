Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40E2206B3
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802751; cv=none; b=gFwTgySSZ/FBnGGbIA0mxTTlnlMMW6TVgJus5f+QennnT5SfDydMKsizr8C5nK4wcIwM23yg7ieopieK45Sq75cdJwNuc+Vz2TkBCG0eKvx/7tguli0aXMWhHvG3TMoanNYl2Ag8TkDVqDWrXWsfyeAOt+b1nMsxqdERgPRt808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802751; c=relaxed/simple;
	bh=n5Ga8groeJZrSIREQWIKUJEaLYhRBQ8zudkgA8+H6Ok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pAhIV/du4BywcMhPK9Wec7vH+Tcr8lFdeCRaFF/R4sN1S/ItVyBOPPHmz3/sZepRJdWkXrR75mJgrbOV5AwgB8xSAkOqKp4YTMpE+ydunCT5VsCGwDISbwPKMKKfyjkREUkSu9gtBP6+zCNH/m1O/t66RsNyhQ0bYuLNBtRmeGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJGiNIjJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJGiNIjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A6DC4CEE7;
	Mon, 17 Feb 2025 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739802751;
	bh=n5Ga8groeJZrSIREQWIKUJEaLYhRBQ8zudkgA8+H6Ok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WJGiNIjJH1yKhJZ4sIqHrmhXJuJd0/rGrp3OO4762oA0Exb0YWlSEN/JSao+Cm80T
	 ODSs05GxMU9hQL09xqugdq8hdYjKeJVZLOGL5WxSEqXoX6Hbl4zgNb91phcwExTgtb
	 xkQ5aia3N/r/jDwhoDsUu9Xdapv2EQlGN9gr7l0ilL7HdwmPRJlcPUx88Aq8uo8qHV
	 4cGpAw6lpP0McBCyggCUgy6feazUeDg9WRSffzBAWnN+/sQeXAYg8dKbFadXvjyEVu
	 OUj9xrtvy917f27jwlBWmBbweRTCIkSTQy58e4xlbJQUE3eiNzjgJUoL5ohA/dI4yr
	 aguC1Hiz2GU1A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 00/12] ASoC: random cleanup
Message-Id: <173980275047.49890.1756192412914778088.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 14:32:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 12 Feb 2025 02:23:02 +0000, Kuninori Morimoto wrote:
> These are random cleanup patch-set for ASoC
> 
> Kuninori Morimoto (12):
>   ASoC: soc-pcm: no need to check dpcm->fe on dpcm_be_connect()
>   ASoC: soc-core: makes snd_soc_set_dmi_name() local
>   ASoC: soc-ops: makes snd_soc_read_signed() void
>   ASoC: soc-pcm: makes dpcm_dapm_stream_event() void
>   ASoC: soc-core: line cleanup on snd_soc_bind_card()
>   ASoC: soc-dapm: line cleanup on snd_soc_dai_link_event_pre_pmu()
>   ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
>   ASoC: soc-pcm: remove duplicate param from __soc_pcm_hw_params()
>   ASoC: remove update from snd_soc_card
>   ASoC: remove dpcm_process_paths()
>   ASoC: soc-pcm: cleanup dpcm_dai_trigger_fe_be()
>   ASoC: soc-pcm: cleanup dpcm_fe_dai_do_trigger()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: soc-pcm: no need to check dpcm->fe on dpcm_be_connect()
        commit: 11c1967f1a796bf2ff56a7118147f1d39d9f5ee0
[02/12] ASoC: soc-core: makes snd_soc_set_dmi_name() local
        commit: 238c863eb3d3c6ed58493bacfd1f4b36bdcfa92f
[03/12] ASoC: soc-ops: makes snd_soc_read_signed() void
        commit: 1248d29464cc682c2a1793cfc5d4ebeb374c6738
[04/12] ASoC: soc-pcm: makes dpcm_dapm_stream_event() void
        commit: 7e1caa679686dde5c24d60b139f234568045758f
[07/12] ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
        commit: 7f1186a8d738661b941b298fd6d1d5725ed71428
[08/12] ASoC: soc-pcm: remove duplicate param from __soc_pcm_hw_params()
        commit: 0c4a06395156d16ea33e959fccea84e4cfec04c4
[09/12] ASoC: remove update from snd_soc_card
        commit: 257a060fe219bb0dcb98f12ce34f04eca6d08352
[10/12] ASoC: remove dpcm_process_paths()
        commit: 40b1f89a1691c4b7740bec2c868f1e4c60346353
[11/12] ASoC: soc-pcm: cleanup dpcm_dai_trigger_fe_be()
        commit: 3aebbcba4baaa81bc8c83f2229ed8e774cf40618
[12/12] ASoC: soc-pcm: cleanup dpcm_fe_dai_do_trigger()
        commit: 42da18e62652b58ba5ecd1524c146b202cda9bb7

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

