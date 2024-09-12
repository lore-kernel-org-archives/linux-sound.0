Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FAE1420DD
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726172652; cv=none; b=RL7NAwICRdYiIy4Z7PY6Tk3JNKQVeE+cwfS9rfaImzeltZrG2vO8NUgIMXOi7Z+al2wbm2xgEDuWe7GB/ZYwzYQIb/DXV38NVQAhp0HPl2G9We3KnDLYbHDINeZJNetAJwQYg8kaCbMsKnB/2rnDOYNozC6D/+o2+2BW1YcEqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726172652; c=relaxed/simple;
	bh=gC+fcBNDegmBfLcT6uIWgOW9JoeIFQLU8SBkZv0Ibck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vk4Pi5swxutTqjEMenEHzAQDOH89Ha3ZwVwqBoB5fcebSCq/T9efRc/QbIytfvusczk4oy2v1Eeufwu+D/XkJG3PSWzwHr9NOTZueGGc0TvDYZqQIwAvrZ48r8nyLl1st+FUtCpEG5z0mu1/PZbbw1Oq/9GABCsxoXC8ABZ99KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Asz7CJD9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Asz7CJD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88502C4CEC3;
	Thu, 12 Sep 2024 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726172651;
	bh=gC+fcBNDegmBfLcT6uIWgOW9JoeIFQLU8SBkZv0Ibck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Asz7CJD9zbdDdZfCQ47ln23B8NeHX2zHn+7St8+cgBcIEdAnPOWAhwFXdn0s+4qdX
	 8GlU+KqeEWfAAsCxAipeAMWavKwxPCI6SIfeFMGx2Uhq7afBlfU7B2mW1MVlJft4ZX
	 pI5R3C97tzwakGVntWgG45/hJoH/bXFes30ISzHR7FLcjkgQxB99tnlYZCNoMxIoXj
	 r0+xPlvJ941W2GD2Fbx8IJZoRjD8KN6iaWV8AP6ZnCse72/tmW9bQrE1zXhECsfDFv
	 CdBWo5dseRr8MnIjgSkH6yAbvVRr2uUA2WT8QCHW7bD24ytlA1btJryQJDoazIZIGP
	 BVTmmbAhDzlwA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: boards: updates for 6.12 - part 2
Message-Id: <172617265027.103578.5085866260962537332.b4-ty@kernel.org>
Date: Thu, 12 Sep 2024 21:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 12 Sep 2024 20:03:01 +0800, Bard Liao wrote:
> Cleanup from Brent Lu and add HDMI-In capture supports from Balamurugan C.
> 
> Balamurugan C (2):
>   ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
>     ARL.
>   ASoC: Intel: ARL: Add entry for HDMI-In capture support to non-I2S
>     codec boards.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Intel: board_helpers: support HDA link initialization
      commit: bd07676ddade417c7cfefb58fb87c27751395bb3
[2/7] ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links
      commit: b28b23dea31497548010c248398162ef4c25cfd2
[3/7] ASoC: Intel: ehl_rt5660: do not check common_hdmi_codec_drv
      commit: 2c80bcc27557b5db4aca8a0c621fc7d5cd10cf7e
[4/7] ASoC: Intel: sof_pcm512x: do not check common_hdmi_codec_drv
      commit: f22a351fe2193dac803fc919096b734ff2947958
[5/7] ASoC: SOF: Intel: hda: remove common_hdmi_codec_drv
      commit: dfa1a7f456f10018229d0d5b3c36dd36a9b5344f
[6/7] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for ARL.
      commit: 47d94c13d5f1f9f9c2bc29e26ebbd4efe912256c
[7/7] ASoC: Intel: ARL: Add entry for HDMI-In capture support to non-I2S codec boards.
      commit: 322706e16988f6156ddd8fdcc6d06f87efc058f6

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

