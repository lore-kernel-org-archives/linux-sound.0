Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8101F942D
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806564; cv=none; b=h9+wFDnKEh6tLUGuucbtvflTxkOnQhjIRFxfbQ/mE1S9zF84So83m2wGsPEBEH/s3ndcOAIc4E38UAPo/WgcJeqyQwIXxG0rgWmpYa3Y/wnE49SiWBAe7k1oH8uX1KiuzF0+DdHVCOX4iIOt0TacEGoe/sG4IAi6AGYFBbu1EPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806564; c=relaxed/simple;
	bh=/oKuCqB3IRnnLhrqiy/efeTTvJk1NyFFeR5XpaQeHps=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SkvK/CZQ7gh3E3L62bABlAOup/1f1IwZzkvfJF9+ZsnIpXdvU+esOzBnoWpyoh3F/WA9VBm7SKgTiJDgKwuqlbnHd5/XoskQwq8PrHzJFcE3QxYCwocp6ZHurQC+AS+Ywu/2p08sWGUNh+pVwn2OzXi6kAdbwfrZmXPF+CA4L3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fH1WgXPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fH1WgXPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADE6C4CED6;
	Mon, 13 Jan 2025 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736806563;
	bh=/oKuCqB3IRnnLhrqiy/efeTTvJk1NyFFeR5XpaQeHps=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fH1WgXPIEZWG2klGOrW/cOcI9ZIPyJNf778bOpi0FySWEP6onzZxKmUwM6DPuMe7Z
	 CjuBCeCs+7eXmcxFahLOo/LRvcX2Mr5fbb5lKF1+dtGjC/qNtVzDIUQzTYqXIT1UVY
	 aQfbG6eaZBV6fUVNszrGldb3caLmHr0gY4o5P2XU+XfERyqrzOUxld0HStsxboHghh
	 dUhit6EkxdJ+O32TNZ40A9vdSOVdQNi8wH3/+hcnqyv8ZTZwGzh6/o7PHn/dq1n74O
	 ontduFbIs0J4kImXuEOydOg3DRPTCMKu/VuLpXvq5ICHpGMUApmvnk+E6v2ftSytcA
	 yv2dKzZoZjgZA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, 
 Stephen Gordon <gordoste@iinet.net.au>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/6] ASoC: extra format on each DAI
Message-Id: <173680656201.149204.14412057736910855187.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 22:16:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 06 Jan 2025 05:48:41 +0000, Kuninori Morimoto wrote:
> Cc Stephen
> 
> Current clock provider/consumer setting is set by dai_link->dai_fmt, and it
> is Codec base on Sound Card driver (= SND_SOC_DAIFMT_CBx_CFx).
> 
> Current CPU/Codec drivers are already based on its own base
> (= SND_SOC_DAIFMT_Bx_Fx). So, Codec clock setting uses dai_link->dai_fmt
> as-is, and CPU side clock setting is created from Codec base setting by
> flipping. Because of this, we can't set both CPU/Codec clock consumer for
> example.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: audio-graph-card2: use __free(device_node) for device node
      commit: 5f281c3e82b1203c40cf6ead009ffb5b09db056b
[2/7] ASoC: audio-graph-card: use __free(device_node) for device node
      commit: c8a1dccf449eb71b23b6c04ff6b40db568d7cf92
[3/7] ASoC: simple-card: use __free(device_node) for device node
      commit: 2518a0e1b878042f9afa45ae063e544a16efc1a3
[4/7] ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
      commit: c8903242bcb119660232c9cbf336fea3737d1a60
[5/7] ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
      commit: 85dc053c87bcc32afd8e5cbf20a649dc24e93d24
[6/7] ASoC: soc-core: Enable to use extra format on each DAI
      commit: 24410f499e808884cc91239dc16013e5bee8779a
[7/7] ASoC: audio-graph-card2: Use extra format on each DAI
      commit: 365865b7d7467aea9767ea18670198921bcada7c

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

