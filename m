Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EE3D6CB7
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037507; cv=none; b=RfO/71vv+Pa01Fu63Zc41Jz4IZww81Pmv0O6CICaiMaD/9GZYPPpqZxQHNCwqRpEyH4rV6NR8D7BgLiLjHSCyCaTOnEK8MFW2g+rvIKmQeLnEawLzU1r3UkC8LRLrvpKP6rHvm4cHtLjEQYOjHz9f8cDD7XAZnwRbvvOw8/IE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037507; c=relaxed/simple;
	bh=IWCG6o3l5gHTkhyorjR6x7e5E+ew5fWa1yyGJ5tosT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UiRMtnT+7iogjqOBQAuDGTWuxjyPtxBtzs2CyTqfhHGeBaiT2Ao79klFm9RVCYoDw/JbiUjxAF8R43JE4IjamWy3xtPbk8LXoAgMp5IQGNWXMNYChPj8kB+eLpkAwDTIjqO0ASNfWO2EOw/5VVmkZgOO4TsKoHsSswDb2e7Q2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNH9HYPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNH9HYPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350811F000FF;
	Thu, 10 Sep 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037506;
	bh=NqnAOT3WGlYoG5pQaf16vBrLuZFHGz9U7YfCdiwH6o4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TNH9HYPF834ifM7zcpLA0hp9JGlq2Ogb0JI4fTzS1PlNHOP6Hd4HECQr7KQcRQYjg
	 hcVA4BpBxtUAKNObImbNthynn4GBiThhdz8W/FbMi11GjOqDiFqIXwlCwWSiRyVycP
	 zgLSSfsfSBgNjEcLHUMz9WMZvgerY4cHgLn2lCDWMDGbXvRS73f2QzmlD8tDdpr9os
	 F+Lmx/CEJkfkSPM9tSn5FdKTuVljm1inluG2n1bOz0yHdF9hS9Ae2A0DHMz6cjcT7Z
	 z7qphBeSVvvAq1E707v9pJkzFeKM7UEJ9VT6Yb9sApCxnV7e3H4UjRhJiSzkf9QmA8
	 cnbTwT9ZJFMKg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/14] ASoC: soc-dai: move snd_soc_xx() to soc-dai.c
Message-Id: <178896871889.151853.8351775761779372661.b4-ty@b4>
Date: Wed, 09 Sep 2026 16:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IWCG6o3l5gHTkhyorjR6x7e5E+ew5fWa1yyGJ5tosT4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoou+LqwbEtH3TRRtQw9zkXCuXUD36UKbXwe+w
 WWztaZtoQ2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqKLvgAKCRAk1otyXVSH
 0Ja1B/9CTRDs5YFuZTpaIwLbJR5axk3biL2inslWroXxSTSmplwKGhSQ0FOrLvzFyb8/nBEp0YU
 CaHmQ6aVJZCZl7p68qdTk3yaXwNpcdMo/Y30LuPh1QLQES+Qej9zF4U8cf/owfa4p9p7mZGLk+C
 xgAkHqPmxMOxoKrKhPxSLYo60u5v+ywDxUwDCMYoECH3xFz3pghJn6DPLq0Umhr01j1u4rOKiFd
 3PyDHRue3c1lDyNSAO+W7Uh+Yg4tVhy3NTcg8p8DweFqeMrYuIR6O+9P96R+t/gIW9sfIju35DX
 kk4vqZUJ6k9aOnjVAWLtam+TgMIGflQInz4OFivjhqtPpd2N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 31 Aug 2026 06:37:50 +0000, Kuninori Morimoto wrote:
> ASoC: soc-dai: move snd_soc_xx() to soc-dai.c
> 
> Hi Mark
> 
> This patch-set moves soc-dai related functions from soc-core.c to
> soc-dai.c. We should have snd_soc_dai_xxx() functions on soc-dai.c.
> No functional changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/14] ASoC: soc-core: make fmt_{single/multiple}_name() non static
        https://git.kernel.org/broonie/sound/c/a27da8f9fceb
[02/14] ASoC: soc-dai: move snd_soc_add_dai_controls()
        https://git.kernel.org/broonie/sound/c/ad9bcf81fdcc
[03/14] ASoC: soc-dai: move snd_soc_dai_name_get()
        https://git.kernel.org/broonie/sound/c/e913f9b77f39
[04/14] ASoC: soc-dai: move snd_soc_is_match_dai_args()
        https://git.kernel.org/broonie/sound/c/eee9ed47dfa5
[05/14] ASoC: soc-dai: move snd_soc_is_matching_dai()
        https://git.kernel.org/broonie/sound/c/6c668f07513d
[06/14] ASoC: soc-dai: move snd_soc_{un}register_dai()
        https://git.kernel.org/broonie/sound/c/6d2c9a5caa11
[07/14] ASoC: soc-dai: move soc_pcm_set_dai_params()
        https://git.kernel.org/broonie/sound/c/b143c6c13480
[08/14] ASoC: soc-dai: move soc_pcm_{apply/params/update}_symmetry()
        https://git.kernel.org/broonie/sound/c/579d17faf163
[09/14] ASoC: soc-dai: move snd_soc_dai_get_pcm_stream() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/4df2e9cf77ed
[10/14] ASoC: soc-dai: move snd_soc_dai_{get/set}_widget() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/a1b4963762c8
[11/14] ASoC: soc-dai: move snd_soc_dai_dma_data_{get/set}() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/ff1e6b54805f
[12/14] ASoC: soc-dai: move snd_soc_dai_tdm_mask_{get/set}() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/b006e4d060b2
[13/14] ASoC: soc-dai: move snd_soc_dai_stream_active() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/5ffa1b3d7f04
[14/14] ASoC: soc-dai: move snd_soc_dai_{set/get}_stream() to soc-dai.c
        https://git.kernel.org/broonie/sound/c/d9ed2b5a7b2a

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

