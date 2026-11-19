Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177153;
	b=oeTEHe7DTcjRtIrb7dB64D3S27KzOy34pxsw7J3pOCVSytG6EUVAY20pDq6SU29ZpanD
	 mOzFUgw7+k/md7klemlKhuDKb4ZGmWHxbVt2mczxvEXxRa9ljpzcVp7zSzJ6RuQVrV0ef
	 a+ywixvTKCWdcGi1By7AtcgN1x6cHQmbi2QI2BSGdfq1U5L2y3i8RF2gnXBa1x5eIaeSr
	 HElB8sRQgnlw6eQOSlT9zpBbulpot/si4xeEG/deqJwKZkpw8Z5lwrqmbgU+nuBt+o8TD
	 HGZw8DxPxUOXNS9/j3CVLauHLpXpm1H8eYxUEO4FVxlG96j5XoiC/xrJmQzLGh8szJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177153;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5miPjfcrxb1KPQAI2VzWvtR5dJQYu65YcSQl2Plwqwk=;
	b=Qp5kFKUlN4o9xRVxB2WwKiMYEtKgpdtGZG5TmbcSoNNk421XK8YpdcIt8/8PO5R+hFRI
	 SZKyr9S1Ubm8f7Vgv7O96EXLjUxxPgs2d5szJt0vg6gHpqTXFO/Vx6AizfwzetQl18+fB
	 hTM+FKOS2AYFkL/+NZ+/1OHtxoHo0qmZMjJQ77Z5ezGRJqGKNvwxayS+l/TNPimAmeXpl
	 5g/BKzNgPk1Oh/uDAxI0+U/5twxFYAC2OWJEGNeWzYGxu222FkYBgbTcGNLiGP85FcLxb
	 OfD9DJhbLGSx8hZcBi0JaKSnuFqlzbP3g7ig2W+uoIKpUkF+IyIS19fP4nanSfTejxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyPu+N0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047CB606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyPu+N0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DE41F000C4;
	Fri, 20 Nov 2026 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177152;
	bh=5miPjfcrxb1KPQAI2VzWvtR5dJQYu65YcSQl2Plwqwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KyPu+N0Fg/C+n7Mzf/k2Zpjkz6fbtHTpLYusVAlO8FEzLPH+AdK6hx/FMepVuVvt+
	 luqcuXc5DoVQhhvUFYxeU6yedZRZjlOnvBJlZACXnsYupCJY6mPIjujEyiN/yqZFD8
	 7Buy28pvgCLrAPVia7gOfojGOVNDTvRX+G7H00oilXP2rKNT6P6mC9JHlSavtQFb0n
	 tflWtvZlQp7vIRfam+8MMk4mDDQWx2CfpBg4jE4o4oPB89Y+H7/QAzI4VYztCbwenT
	 iVdWUtd2n4o5RiNPCaKYwtN9ne+yRGNscbqSAhAkIM9y1bHahhCGVhKoOtA56aTnRm
	 zF5+Q5vf9C2Tw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
Subject: Re: [PATCH 00/22] ASoC: Remove orphaned prototypes
Message-Id: <179512910199.116416.4766750678269902555.b4-ty@b4>
Date: Thu, 19 Nov 2026 22:58:21 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4246; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DW2IaaUgI6PXOAYpCr1b+4Wf6jbxEZiktStGMtwe1UM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrPZeCetQ/Dq/6en0M+fq1eVMmAMMt6zm3Lh8rqaV1
 jS57LXyHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIiwSG/yUOueemxl79kHrp
 yr1ddquTq0RClnj9iA47ENKWJj+Lm5mR4QWDkgbnIzcZjqXHu9OP8zyTaMm+KSQ+eeYdjbjvnfl
 fuQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 20:01:57 +0100, Amadeusz Sławiński wrote:
> ASoC: Remove orphaned prototypes
> 
> Some of the ASoC code either either declares functions that were never
> implemented or at some point were removed leaving orphaned declarations.
> 
> Clean up by removing them. Build tested with make allyesconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/22] ASoC: soc-dai: Remove orphaned DAI suspend/resume prototypes
        https://git.kernel.org/broonie/sound/c/9465c6f63f10
[02/22] ASoC: cs48l32: Remove orphaned function prototypes
        https://git.kernel.org/broonie/sound/c/d69afb013bc7
[03/22] ASoC: pcm3060: Remove orphaned pcm3060_remove() prototype
        https://git.kernel.org/broonie/sound/c/11757763268c
[04/22] ASoC: rt5682: Remove orphaned rt5682_register_component() prototype
        https://git.kernel.org/broonie/sound/c/3fd2b98cf393
[05/22] ASoC: codecs: rt700: Remove orphaned declarations from rt700.h
        https://git.kernel.org/broonie/sound/c/bb5426a6e255
[06/22] ASoC: codecs: rt711: Remove orphaned declarations from rt711.h
        https://git.kernel.org/broonie/sound/c/4676da1cf7ee
[07/22] ASoC: rt711-sdca: Remove orphaned rt711_sdca_jack_detect() prototype
        https://git.kernel.org/broonie/sound/c/0cae691485d9
[08/22] ASoC: rt712-sdca: Remove orphaned rt712_sdca_jack_detect() prototype
        https://git.kernel.org/broonie/sound/c/c241c558bcba
[09/22] ASoC: rt722-sdca: Remove orphaned rt722_sdca_jack_detect() prototype
        https://git.kernel.org/broonie/sound/c/f8fe52efa078
[10/22] ASoC: codecs: pm4125: Remove orphaned SoundWire helper declarations
        https://git.kernel.org/broonie/sound/c/af2b68b0ba01
[11/22] ASoC: codecs: wcd937x: Remove orphaned SoundWire helper declarations
        https://git.kernel.org/broonie/sound/c/80f56845e202
[12/22] ASoC: SOF: ops: Remove orphaned snd_sof_dsp_register_poll() prototype
        https://git.kernel.org/broonie/sound/c/434a47f4d2f2
[13/22] ASoC: SOF: Remove orphaned function prototypes from sof-audio.h
        https://git.kernel.org/broonie/sound/c/282435d20a52
[14/22] ASoC: SOF: Intel: hda: Remove orphaned hda_dsp_ipc_cmd_done() prototype
        https://git.kernel.org/broonie/sound/c/da3f507464b4
[15/22] ASoC: Intel: avs: Remove orphaned avs_parse_sched_cfg() prototype
        https://git.kernel.org/broonie/sound/c/06dc42bef334
[16/22] ASoC: Intel: atom: Remove orphaned function prototypes from sst.h
        https://git.kernel.org/broonie/sound/c/3c13b2613d0b
[17/22] ASoC: mediatek: mt8192: Remove orphaned DAI registration prototypes
        https://git.kernel.org/broonie/sound/c/c76651851f52
[18/22] ASoC: mediatek: mt8196: Remove orphaned mt8196_dai_set_priv() prototype
        https://git.kernel.org/broonie/sound/c/226d9f059859
[19/22] ASoC: mediatek: mt8365: Remove orphaned mt8365_dai_tdm_register() prototype
        https://git.kernel.org/broonie/sound/c/861373c60a9a
[20/22] ASoC: qcom: qdsp6: Remove orphaned audioreach_map_memory_position_buffer() prototype
        https://git.kernel.org/broonie/sound/c/1b4fda966515
[21/22] ASoC: rsnd: Remove orphaned function prototypes from rsnd.h
        https://git.kernel.org/broonie/sound/c/4b1b47b38e41
[22/22] ASoC: ux500: Remove orphaned ux500_msp_dai_set_data_delay() prototype
        https://git.kernel.org/broonie/sound/c/398c569a032d

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

