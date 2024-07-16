Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23E19AD4B
	for <linux-sound@vger.kernel.org>; Tue, 16 Jul 2024 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141143; cv=none; b=o1b32o1LIl6CNITK4vUFIyJbzgohE5aPvxoYRW1DgN6chRN4uLxemcDUhX89A17hD+WF9fh/0ae4OMaYY+YjF2Tcqq7M1ulI/R0jBP0DH/LNaL2+atYwQPj6ujJC0t0rXQhVwipT6CD+b2K5YMdGOL1q1nodHMmJ/9OVvzfEYew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141143; c=relaxed/simple;
	bh=8WQ5SlhuRTQjpns/GLooy7U1HTe6n74GnCF9hYexhNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fpvJVlBov9/gPdF0B7cKNoAsVWH5pOwD1iTzF76zYTDBOWKzwr3MA5hULXVsOL2mLwZKdgH+cOMxpr7bf252JEX0JxBNJAEUTjZKFD1UEOUi0Oao05f/sZaNRCpubl4Bm2/0cGRYlpd0a27q9hsW/im5LOmeDiPDAaTOKCocaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vol71J+6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vol71J+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3C1C116B1;
	Tue, 16 Jul 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721141142;
	bh=8WQ5SlhuRTQjpns/GLooy7U1HTe6n74GnCF9hYexhNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vol71J+6opG6uf2V8Js9u8hX6Nw4uuzdi2if/5TGnukv3EcZk+FwbrYFVpne9B0K4
	 Weyyn8U5YAn7zNQTd/K6xKjQMIoTKnVuePbKbYj+ArLXG2jHGoipBVgWs/wpkrpaDh
	 5D+tXxBPB0Vg2cNuLytk2ZeFfiRJhhZ4gH3i0tNgY/HkE01R0puPjMhVwJ8YRzor8J
	 mCG6+4Vl0cm4J6/8ySijfjQuEtSK3k29EALiJn2NgC0f3l9uiuZd6U2BlQYg7fX7Qy
	 npEiGfANupxxKGi12VKXxdijMxsEHjsLW8HrVqS+X4x27eMby1CruEMPPOo9ZF7Sx+
	 8T8JaWd8V5/hw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Mike Krinkin <krinkin.m.u@gmail.com>, 
 Todd Brandt <todd.e.brandt@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
References: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASOC: SOF: Intel: hda-loader: only wait for HDaudio
 IOC for IPC4 devices
Message-Id: <172114114117.56252.16346089758764770806.b4-ty@kernel.org>
Date: Tue, 16 Jul 2024 15:45:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 16 Jul 2024 10:45:30 +0200, Pierre-Louis Bossart wrote:
> Multiple users report a regression bisected to commit d5263dbbd8af
> ("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio
> transfers"). The firmware version is the likely suspect, as these
> users relied on SOF 2.0 while Intel only tested with the 2.2 release.
> 
> Rather than completely disable the wait_for_completion(), which can
> help us gather timing information on the different stages of the boot
> process, the simplest course of action is to just disable it for older
> IPC versions which are no longer under active development.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for IPC4 devices
      commit: 9ee3f0d8c9999eb1ef2866e86f8d57d996fc0348

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

