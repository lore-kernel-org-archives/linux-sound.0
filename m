Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22393FEF
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715045742; cv=none; b=sFuc3gOGSystEukdcExdTfiQShFruoNrMa6zsxC+mrgJURI58yalv6xfFUDIZyW8BJdSPhMaljGP6j9JVUgRndvzerGsnbKSoS0BVZE0V9+e+NlZlR7XGDaIKOFf48hWpmS92AUHWD7vzXh5HZsefJnDdPmFzYgqmbcgvro8DMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715045742; c=relaxed/simple;
	bh=wLPyTumNZmOMXhzlJoaqM3kMwqIaGV/vQOf5CKud1p8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tHD8rLFCJEJA9Ih1mzT/c+ExqLGRgrms4N1G8ttI7tRP82L/YYMq+wctEaRXFRUILtb/g/dnyw3/Zsj6pL8HZQ7trORejYcRv8h4afKUuUokSAbaaF39iBiieK0ED1OXrAh9n7hA/jZljBw6kEazSr3WcZK5Gj583oNEeqt3nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZrlu8Vg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZrlu8Vg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCB6C116B1;
	Tue,  7 May 2024 01:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045742;
	bh=wLPyTumNZmOMXhzlJoaqM3kMwqIaGV/vQOf5CKud1p8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iZrlu8VgNM9iPXVswIJ+owT6zT18ujRfBsLd8a7cy7C4gl/xS7Y11R9GxnRgYTikU
	 M2U2vue6tTmb9XN22h3h/B0syv+Ef/Zc/jLzsgDnCKRASqq0AFyWc/L/1hbCZygNWb
	 WuoLogJbMKQFGEfF+Y5wRVQjDW1+ButFwkV8L4WrBgiEUM9YykzinkFf8AkurMnkll
	 3bDQBmuXMtXUnlWU7wZhz61/lkOWpfKgbGRe1L6THHRWkjRF3FlEuE+31MpNQjFx2A
	 vXIVLT3OYDdiJY7yGY6xNDw6NnCih2ojp0D1rShDC2+UKDlgPMcIJdJqWTCWEG/rh0
	 1W+nv64y+O27g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: HDA/DMIC updates
Message-Id: <171504574162.1980570.10707988335766984091.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:35:41 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 03 May 2024 08:32:50 -0500, Pierre-Louis Bossart wrote:
> The first patch handles a problematic configuration where the wrong
> machine driver/topology is used: when the hardware reports an external
> HDaudio codec the direction is to ignore/discard ACPI SoundWire
> devices.
> 
> The last two patch deal with DMIC format configurations and allow
> users to select S16_LE even if the DMIC and internal copiers only
> support 24 or 32-bits. The code changes are located in sound/soc/sof/
> but in the scope of Intel DAIs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: discard SoundWire configuration if HDaudio codec is reported
      commit: 5a7543d0ca01d68d992f480d151efd693807e0ce
[2/3] ASoC: SOF: ipc4-topology: Allow selective update in sof_ipc4_update_hw_params
      commit: b679302526d637700e998da85ed1e06d8f7d3674
[3/3] ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob request
      commit: f9209644ae7688e82f629e737417bc8916db7b57

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

