Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799573D45DE
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443932; cv=none; b=LrwRhY34QCZ+qkppa2J0Ffj6RUaCkSzH4V6y1hvsapJkrWLXak7iq4HCyapSShs/gi9BSi5X/x+Lk8mGqNsvx4UPEbUiviZMeKmDMVwMnqVLWd81TpZKxYGtGO03ocAsBKikV0m7wWJ4czst22HbfhTZdEwEdEizppIe7Zbh4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443932; c=relaxed/simple;
	bh=lqns1H/7GPFTDTrS5gC/PXTkdC/uAR/WxH5Kw8GP26U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uzss0lb5x8ihYZrGHYE8aZ7Szq1WXJILbYiXMdydBwiXJdxWS0jFA1D3ReaHUDxhzygaMhRSjo5chsp0V2H9S9w/vxgY5oLZYKovjjDv85VTwmsppls61yGw18P9DVeajFqu1wnee5hMaa6xtaiNe2/oJXBc0A3WiNYN5Q1FCUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JytVDwwO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JytVDwwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1821F00898;
	Thu,  8 Oct 2026 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443931;
	bh=Ey8YsXPJ21olyKIyLWS0kmxJggrLFv5yfuKzzIuqpNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JytVDwwO1aBPBzVJXjCTA1mJoM4mQJz8AuTCQx5ek9zUkLBEKrjstnDUM0JkQuUTv
	 wTYQwB2oFCQgXB9478yjCu6f+lt9H5mvNkw+zNhO2UUngCbF26mRIguWM38ZbrGwQS
	 chIoVnLmelzRV63xyM3ipzl1wlfjl+FOU5UMTchejnZ1H+NmUginExrjGIziJETinh
	 XjL8LZIHcLEvZ2aE47uFLi/ewhD3cdarspHw2FVnqeGyOvaiolVi9W+0uBK+Kj8q3y
	 p+TYFAHZX8yS54mTPLTlCFwFqVD8FniATsm+w508PWnluf3Got/3QEag2+ul4ZITql
	 d+e6A81L577/Q==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, 
 srinivas.kandagatla@oss.qualcomm.com, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 daniel.baluta@nxp.com
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v5 00/28] ALSA compress / ASoC compress / SOF:
 Compressed audio support with IPC4
Message-Id: <179137184235.2423942.7003058373537926327.b4-ty@b4>
Date: Wed, 07 Oct 2026 13:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5406; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lqns1H/7GPFTDTrS5gC/PXTkdC/uAR/WxH5Kw8GP26U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PVso90ZTkNHZGMnD/iaJhcfghZz3TKFgPOK
 tvfGcErJQGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD1QAKCRAk1otyXVSH
 0GVaB/wPlz/bo+r/f+P/j/4l5wRodlRfmG0aFQAEXPHS1jSI39vQtEad78ePBEd8Ncn/6pW0VBv
 rDonJT0ohtT1aPZ/VbsxVf8dThQcX9zlVMme1dZUw58NIRQ8sLe5R2h0eQoEzh1lL5UzF5IaUbp
 8EvBhTxEPYGT8nrWlyZS5ZWkTJLjSFStXUvV4tK7pfCKoTyiOGF0m0gkI3ezwjy8vWMrAXqbfXC
 xcEFceASGJ9wkJY0RtGJdwx2p6v6BOxhXgA6Ubaolm7QBVlZEfkQ/3zLWv0+D/rrdRVK6AeDd/w
 V+ngqxR8kl874MsZOnUbbXn6lCr3RTljvmMIBKsVSsLVwcnX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 11:49:27 +0300, Peter Ujfalusi wrote:
> ALSA compress / ASoC compress / SOF: Compressed audio support with IPC4
> 
> Hi,
> 
> Changes since v4:
> - Move compr declaration in snd_compr_free() one patch earlier to patch 02
> - two new patches:
>  - patch 04: Fix the core drain race noted by Mark
>  - patch 23: handling of page-table overflow in SOF at root level
> - Changes in ipc4-compress
>  - make the fragments/buffer configuration page-table safe
>  - Reject a START trigger on an already started stream, only can be hit
>    with capture direction.
>  - refuse SND_COMPR_TRIGGER_PARTIAL_DRAIN along with NEXT_TRACK trigger
>    until I figure out how to support gapless with SOF firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/28] ALSA: compress: pin card module while stream is open
        https://git.kernel.org/broonie/sound/c/59b7978580c7
[02/28] ALSA: compress: register the open file with the card
        https://git.kernel.org/broonie/sound/c/fd7f98db9c28
[03/28] ALSA: compress: stop active streams on disconnect
        https://git.kernel.org/broonie/sound/c/b04c9229ee31
[04/28] ALSA: compress: Set the draining state before the drain trigger
        https://git.kernel.org/broonie/sound/c/84aede82dd4e
[05/28] ASoC: soc-compress: Provide a runtime for the compressed FE substream
        https://git.kernel.org/broonie/sound/c/c6cf521a0db3
[06/28] ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
        https://git.kernel.org/broonie/sound/c/39f013967e15
[07/28] ASoC: soc-compress: Stop running dpcm on free
        https://git.kernel.org/broonie/sound/c/fc6b7cfdbcf0
[08/28] ASoC: SOF: compress: Move the IPC agnostic helpers to sof-audio.c
        https://git.kernel.org/broonie/sound/c/3af66bfe7648
[09/28] ASoC: SOF: compress: Rename compress ops with ipc3 prefix
        https://git.kernel.org/broonie/sound/c/aa2adb90252c
[10/28] ASoC: SOF: sof-audio: Fix the pipeline_list population
        https://git.kernel.org/broonie/sound/c/be887709bd99
[11/28] ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
        https://git.kernel.org/broonie/sound/c/9d16a6633f46
[12/28] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
        https://git.kernel.org/broonie/sound/c/973851a710c1
[13/28] ASoC: SOF: sof-audio: Expose a couple of functions
        https://git.kernel.org/broonie/sound/c/e1135ddec788
[14/28] ASoC: SOF: pcm: Modify the signature of a couple of PCM IPC ops
        https://git.kernel.org/broonie/sound/c/9de51be869dc
[15/28] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
        https://git.kernel.org/broonie/sound/c/2271de29a097
[16/28] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
        https://git.kernel.org/broonie/sound/c/b7822e6cf344
[17/28] ASoC: SOF: ipc4-topology: Support init_ext_module_data for process modules
        https://git.kernel.org/broonie/sound/c/73df6ceb8314
[18/28] ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of ipc4-pcm.c
        https://git.kernel.org/broonie/sound/c/03f3ae9e8928
[19/28] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to fw_config_params
        https://git.kernel.org/broonie/sound/c/9fdc525713f0
[20/28] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
        https://git.kernel.org/broonie/sound/c/275203b2450d
[21/28] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
        https://git.kernel.org/broonie/sound/c/e58b93a5ff49
[22/28] ASoC: SOF: ops: Add new platform-specific ops for compress
        https://git.kernel.org/broonie/sound/c/c6b1d75d0646
[23/28] ASoC: SOF: Check that the audio buffer fits into the page table
        https://git.kernel.org/broonie/sound/c/8c3db31941f0
[24/28] ASoC: SOF: Add support for IPC4 compressed
        https://git.kernel.org/broonie/sound/c/782a378dacdb
[25/28] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
        https://git.kernel.org/broonie/sound/c/176f4f893401
[26/28] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
        https://git.kernel.org/broonie/sound/c/ed161257703b
[27/28] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
        https://git.kernel.org/broonie/sound/c/2c7b19f782b6
[28/28] ASoC: SOF: topology: Add support for decoder and encoder widgets
        https://git.kernel.org/broonie/sound/c/85b9b3b3111f

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

