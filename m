Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137258;
	b=d476emmE+7Fqang1GP6SVjFmN251dGBRRR/Fal0K2OYC85hmAuLLT3PXaSRwl/NHq3PS
	 b98Hsl6Ke3O5ULfogLAahBiVoJ3rpwLIt/arwgr2sbQwFILxoMC07F/kZij/pHIleOsjv
	 cgjhfgIKZPlWMxFzsobi2GBCjCez/f/HpcNSqvTjTgQrATO9gy0av8LtcRg7RoHrnGKtY
	 0nRcGvwj9Ckx5anACIpeNPlvw0kpZ+4qCOq/DhfcZl6P5NzM0BXtZn7/1DqVP8R9kn9Wd
	 jybyshCOjdGaNmbTygq5txYi89gW22Rs5Lr1ErRwb0mPQFHDRrKmFsODOwdlnIdZ4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137258;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=k+urX5e0m76vxvuV75DF1x8cYEKGBfo9X662yjd7pio=;
	b=upKqHDLdHYqTAkBAQ5S0+RDfMblZ+sKrbgHz4DBjzwBe993Uv/Lx7a+s/3zF/WlzytYR
	 UGxXcxqInpkiUeZ4UAgQl0SxWds8T/Qc/xS67sOOC++vwWWDywIzr5ZEx3S0ahhtfQSPr
	 1zl2GXMAIYQJrEl83kMYN4/o5Jt6hJWM3/hAUW232QcVIQXUQV0xQCy9EH6SDPr9K32cd
	 P5QJWBb2XbQ/mUQ42E+fEJpsJ3ds5z5kJDCcyyZacEMh7i5K91KHYBgb5QcIZJr/p8ocj
	 AasoB1hhV9k6DAvKt5Np+0fgVWK4NYIYjlTyQ+m1Hix28AyjhhMmnSmbxNX5cK28NjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c3l/PPgR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF74606A322
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3l/PPgR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F6C1F008A1;
	Sun,  8 Nov 2026 11:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137258;
	bh=k+urX5e0m76vxvuV75DF1x8cYEKGBfo9X662yjd7pio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c3l/PPgRcaxf9pGUIVFbeEjh2PdtoE68tHt6c7TTpZ7MJYNjhJs/1XZ0By7JUT+yq
	 xniXGSvKSQfP/DijfmLjUd5YjdDei0RvZMgkEr49U37b0T2Xo8gywUf5U4B+Oakmmo
	 Rue/oaUijzpGMXYf50C8oluRhPOn5f2TnJbz1ApLQU+4qm73e/OGbGNXWGdtn9F9/F
	 RjoVkOfYUXOET0fG7vkb31hBMqGMMR/8D96ZFp4qEZEEu/By6Dk9TDDuLQnbVtItVK
	 7h7bCCfnYe5wJN4Zl6SkrvQi08rrxc8Nm+Igfw/yG+wizhSQUv6fY45F6shFPThimT
	 HRqAzoRMM8FpA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BDE6B2BF9263;
	Sun, 08 Nov 2026 11:27:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/15] ASoC: soc-card: move snd_soc_card_xxx() to
 soc-card.c
Message-Id: <179406327208.3424803.13117419976586053782.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:54:32 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+q9bRHwq+ckjPm1BfnAzKwMraUoS8O8XpqI8w3+it6E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+xCx/rLBH/PIB28SQ6VKnruVm+Z2r9T2etMJl1+/pj
 4+dCb2W2lHCwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJHF7J8GPmnwrzxX8uXNrZ
 EPtnwbJzjw4dXivDPe/I7dzQxZ/+6NYy/C+u0P7z9crFnNC/cbp6+ye8XfD7Pae/9doNa7Ivx0x
 xmswPAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 02:42:55 +0000, Kuninori Morimoto wrote:
> ASoC: soc-card: move snd_soc_card_xxx() to soc-card.c
> 
> Hi Mark
> 
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> This patch-set moves Card related functions to soc-card.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/15] ASoC: soc-core: fixup snd_soc_dai_compress_new() return
        https://git.kernel.org/broonie/sound/c/0e9a49186621
[02/15] ASoC: soc-card: move snd_soc_add_card_controls()
        https://git.kernel.org/broonie/sound/c/930c66f40da1
[03/15] ASoC: soc-card: move snd_soc_card_debugfs_xxx()
        https://git.kernel.org/broonie/sound/c/fca7ed8ae2a9
[04/15] ASoC: soc-card: move snd_soc_card_resume_init()
        https://git.kernel.org/broonie/sound/c/d19bd1bc5af4
[05/15] ASoC: soc-card: move snd_soc_card_fill_dummy_dai()
        https://git.kernel.org/broonie/sound/c/bffafc899cc1
[06/15] ASoC: soc-card: move snd_soc_card_init_pcm_runtime()
        https://git.kernel.org/broonie/sound/c/82126f901f86
[07/15] ASoC: soc-card: move snd_soc_card_link_dais_xxx()
        https://git.kernel.org/broonie/sound/c/21db4448e395
[08/15] ASoC: soc-card: move snd_soc_card_link_components_xxx()
        https://git.kernel.org/broonie/sound/c/2d459fc0edde
[09/15] ASoC: soc-card: move snd_soc_card_aux_[un]bind()
        https://git.kernel.org/broonie/sound/c/73f44c64b093
[10/15] ASoC: soc-card: move snd_soc_card_aux_{remove/probe}()
        https://git.kernel.org/broonie/sound/c/c453991fe8ef
[11/15] ASoC: soc-card: move snd_soc_card_set_dmi_name()
        https://git.kernel.org/broonie/sound/c/2acf786bf6dc
[12/15] ASoC: soc-card: move snd_soc_card_bind_call()
        https://git.kernel.org/broonie/sound/c/956918f7f1c0
[13/15] ASoC: soc-card: add snd_soc_card_rebind()
        https://git.kernel.org/broonie/sound/c/eda0bcca774c
[14/15] ASoC: soc-card: make unbind_card_list static
        https://git.kernel.org/broonie/sound/c/b703abddbc1f
[15/15] ASoC: soc-internal: remove temporary funciton defines
        https://git.kernel.org/broonie/sound/c/d32126bec1be

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

