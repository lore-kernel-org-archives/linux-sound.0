Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80A3A9D96
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289493; cv=none; b=WnxaY2Xk4UVPl/n2M4EdJHcNawd+h9BcCMa+x1Eck5pys0yYSROxbYbD+EAI3LsEObpaeqRddo/hTdMHsdMDZm62QK1UQpiWGynxlp//EI/AbwBduwSZWEgc4xS9IN+iyYWP8a0FkSdJAh+3oURF/6Ql4esiBHXiZSHpyp4NFSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289493; c=relaxed/simple;
	bh=uPDYBNDBtKgM87YM2sqS84p8P7Yh6+su0+xmqjMdtBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Su1XDbEyFEKDq3bCV8ZookoGn8F7kuXHxHkLVdcU+BFSW8VF/yMr9TDl/iMsc7mN5Z+1s2C5QDQ5spURxg9uBgtecdhXbFXVKUixweth9MW9TuhaHq1odWZFf7ggj1XhSf8Rs0a4TDjt3G7+EN/Z7BuOlxNrdk3LNMkBW+EdTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryBd580l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryBd580l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D52C16AAE;
	Thu,  5 Feb 2026 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289493;
	bh=uPDYBNDBtKgM87YM2sqS84p8P7Yh6+su0+xmqjMdtBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ryBd580lKmytyI4oc4+vxo2pLon5hYszyIb8FvRGCOhO+YoKE3sGHC2itRQx11lr7
	 htM3Ve58O0TkvASdcDqtoGHrl90egLVd7XSxvb0LWhCtKh1yRfM8LRXldk0pJIarX2
	 ohpYiP7nG4DFxnsHXBOoBFynNE16kI26K/OO2beTuiMEiMKtBmg0fh9hSGwx4K6d+Y
	 cXhp/bx3c/1eLXAsaqbNbKYiHPfzU2DEAQe+iAZ/M0Qxle4VH6qPAahiJUY/5xgO5F
	 D2aHmjqdyiphPDCYGk3Elo2DD1lG/iDcae16kwgJnvduHCESzb3z+ZRf+87zVZvOtR
	 VWwEZyvecFDcQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com, 
 mateuszx.redzynia@intel.com
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: Support for echoref (virtual DAI)
Message-Id: <177028949129.8656.7127330432325668231.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 11:04:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 04 Feb 2026 10:18:23 +0200, Peter Ujfalusi wrote:
> The series adds support for echo reference functionality by allowing
> the capturing of playback audio right before it leaves the DSP.
> For this to work correctly we need a virtual DAI that is also connected
> to the echo reference capture device and in absence of playback a
> signal generator generates silence to allow the capture to run.
> When the real playback starts, application will start to receive the
> playback audio to be usable for echo reference.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: sof-audio: Add a new op in struct sof_ipc_tplg_ops
        commit: 236d5e66b54b8052f7f4ae2ef2aa174e85c04a2f
[02/10] ASoC: SOF: pcm: Split up widget prepare and setup
        commit: f462697680aa15c55f642168d6694d996f8ae940
[03/10] uapi: sound: sof: tokens: Add missing token for KCPS
        commit: af0bc3ac9a9e830cb52b718ecb237c4e76a466be
[04/10] ASoC: Intel: sof_sdw: Add a DAI link for loopback capture
        commit: e614fce9fea62dddf298550a61cb11abd5d84a02
[05/10] ASoC: SOF: ipc4-topology: Add new tokens for pipeline direction
        commit: 15a55ec2f8b956d6aa0dd948c907e13db7978c6e
[06/10] ASoC: SOF: ipc4-topology: Add support for process modules with no input pins
        commit: 42d0f8695db59b74e7e7db0c851e480362a8fdca
[07/10] ASoC: SOF: sof-audio: Traverse paths with aggregated DAI widgets
        commit: 74b11b22b5942a1a9b65c39b8ba6642a6e1ff5d0
[08/10] ASoC: SOF: sof-audio: Add support for loopback capture
        commit: c4b37c21c75de7b37a3d839fa3dff63464caad1e
[09/10] ASoC: SOF: Intel: hda: Fix NULL pointer dereference
        commit: 16c589567a956d46a7c1363af3f64de3d420af20
[10/10] ASoC: SOF: Intel: hda: Add a virtual CPU DAI
        commit: 6c52fda42066a87b76fd140e027280907071dd8a

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

