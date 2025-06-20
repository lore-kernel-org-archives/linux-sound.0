Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A535199947
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414987; cv=none; b=aOWxo9rUHe5jiH+meoZsyZ60tiH/iLrk2vHZf3o/T89QV7d3YVhyhpicKdxi3qvD7bAR/fe3OWCIZOcwdcgPpcFpYh/rWHMn/OMgF5J9lY1TBUJo78/HJ4NWpIu8Uo0YwBNWE9ybBnN3aoDs52//CFm5n9h+Q44gNHn5l4k0ECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414987; c=relaxed/simple;
	bh=l3ODDOYSe6DFsOfBWRnWMWCa2E+1T7YNv3S97/ilFvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tlK1zRxbEIVsgWyDbg7Q0atCDxYUYpmRieUBZk1WWXQ7KtTNZy/MER6A4jqvoQVu3jSQjwDHrTy8GLZcvl3h2jB55XVGyV5sdSyIkLT/+dABZRg8Zf7k+oRZHPTj+q01HjLdGnuDyLreVkoiYwxyAnW3nEEpkn0Bw63FmwTHpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZIFUy2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZIFUy2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C61C4CEED;
	Fri, 20 Jun 2025 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414987;
	bh=l3ODDOYSe6DFsOfBWRnWMWCa2E+1T7YNv3S97/ilFvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DZIFUy2zzKwvRLJGdL3WhbNT9Hnz88bHf37UIBQkkmViKEVlyknkkUAHzMM1l04qw
	 cklTg8Cweo1KGh0noJNKnSOO0NOKHEUQyurV/h/i1kHJavkOIbGyo1KB13xObIs5dP
	 QsoYgEPItP1P8uRBeCry923UFBAlDY1YdE4tnTwqA05q/T42mc/iTrKzCeX/fU1VQ0
	 cDS4jX/rtAg7f+unMLElbZd58rXMv2v6Hn+vKAzENaolp2gVqiH4i/oLGA09DvrSm7
	 vYIxQVqlsCkYrlYlPVE/ZhXSsEkr7JQp2BQ/TWXjQFmsJFemYSQXpU456H/vXNVrlo
	 IYmOkWLC8tNiw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250619102640.12068-1-peter.ujfalusi@linux.intel.com>
References: <20250619102640.12068-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Parse the dapm_widget_tokens in
 case of DSPless mode
Message-Id: <175041498554.23264.2300534569391040012.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:26:40 +0300, Peter Ujfalusi wrote:
> Parsing the dapm_widget_tokens is also needed for DSPless mode as it is
> setting the snd_soc_dapm_widget.no_wname_in_kcontrol_name flag for the
> kcontrol creation from DAPM widgets.
> Without that flag set, the following warnings might appear because of long
> control names:
> ALSA: Control name 'eqiir.2.1 Post Mixer Analog Playback IIR Eq bytes' truncated to 'eqiir.2.1 Post Mixer Analog Playback IIR Eq'
> ALSA: Control name 'eqfir.2.1 Post Mixer Analog Playback FIR Eq bytes' truncated to 'eqfir.2.1 Post Mixer Analog Playback FIR Eq'
> ALSA: Control name 'drc.2.1 Post Mixer Analog Playback DRC bytes' truncated to 'drc.2.1 Post Mixer Analog Playback DRC byte'
> ALSA: Control name 'drc.2.1 Post Mixer Analog Playback DRC switch' truncated to 'drc.2.1 Post Mixer Analog Playback DRC swit'
> ALSA: Control name 'gain.15.1 Pre Mixer Deepbuffer HDA Analog Volume' truncated to 'gain.15.1 Pre Mixer Deepbuffer HDA Analog V'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Parse the dapm_widget_tokens in case of DSPless mode
      commit: 6b3cb7f4341cbf62d41ccf6ea906dbe66be8aa3d

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

