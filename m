Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688323B604;
	Mon,  9 Feb 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647486; cv=none; b=O6FfaUgjMN+EfkuCjOjPMIieNHdNY/1O0oCwEMYEzP2NRTz4Aq9X4LikzGgjs1sqtuIWEL2st4ZZxkD8UQWjn7e34CqCCfk9E9BuaRPthpJ/UCDXyp2qsfJCYxm6+k+c0SEja0MIqE6r2bCh1XRsVm+/VFKD4jN95FHk/qlyKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647486; c=relaxed/simple;
	bh=0aj3O3iNSUGbwd8mrrS+Bj4Bd0fnJu7yGtJS3kYsyB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E7gE6PFDrTejA9TqXmGfon2Dl9kCiTCH1s2a9TsPlxsRn1IcXzmfLpOqCI8REGZx6bD8alvQnbYy8hKcftid3sBPxcT0Z5C+pk9ct7jvdmFhHDErcniIeI1qyq77SdNUSpm35plf0s8YlJMua+48J0lME+EbcfsrynCr3uktZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7L392SE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7L392SE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54306C16AAE;
	Mon,  9 Feb 2026 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647486;
	bh=0aj3O3iNSUGbwd8mrrS+Bj4Bd0fnJu7yGtJS3kYsyB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k7L392SEL4eY6DvkhmW4NkXWELbEzMDLatRnwZkoL8uSqqgiyVHs8wQ6WSTZRLz/5
	 Ix3PRq00hgDNEEBKrvP36jAjgq9fNNsSwSWrzY7M+1St89CdFTZP3kdkRL0ClfX4uH
	 78OVnoNmGRqsB/LIto5cmsSRzHTjv5dyBnTrq9+msewlTQ3GjfgQbcSumtd+sVsWRS
	 nzyPJ6GLj1WUH+TuZT6XsriqVek3bDP+jswFyYZosxl30oSgPQPkxGdti/BwFFcugz
	 MtzF3dMPxrKGit/K1QvGBQV9/ElxvqAola9TUtsOWTIu+tgbboS/ZGOUTzWYNHaM/6
	 66+hNn2roMS7g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260209070901.857700-1-arnd@kernel.org>
References: <20260209070901.857700-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: Intel: select CONFIG_SND_HDA_EXT_CORE from
 SND_SOC_SOF_HDA_COMMON
Message-Id: <177064748076.790819.12511875681850870386.b4-ty@kernel.org>
Date: Mon, 09 Feb 2026 14:31:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 09 Feb 2026 08:08:38 +0100, Arnd Bergmann wrote:
> The _hda_dsp_stream_put() function now depends on the
> snd_hdac_ext_stream_release() interface from SND_HDA_EXT_CORE:
> 
> x86_64-linux-ld: vmlinux.o: in function `_hda_dsp_stream_put':
> hda-stream.c:(.text+0xfac605): undefined reference to `snd_hdac_ext_stream_release'
> 
> Select this symbol the same way the other users do.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: select CONFIG_SND_HDA_EXT_CORE from SND_SOC_SOF_HDA_COMMON
      commit: 3a7dbc729e42b95f1a82806a11128c1926ab26d8

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

