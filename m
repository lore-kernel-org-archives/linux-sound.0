Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55436C0DA
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 21:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426604; cv=none; b=FY6SrcPu9NUkab59hk3JI09XFwYTo7FOz7fmUh+vatl4fYFduYAxOnH+RNYK+QvDwhYeqKMNb299zpMuaDYZYQWkJo7a/7aNeVafyvN6rc92qof60U4lxxcxfxIwRs3bne9paD79a7U/bY79BSafoZoOEY8YLOUcDzuHuoJOX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426604; c=relaxed/simple;
	bh=JXVmiqbZx/ENevPGBPqApwTU3Vs1KJ/HQ3gvThI9vz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oy2aiCqw1H/+LGViGntvNDrt76YlerF1dYVobIyPj4Abz6EyDNvTI9aSdV672iqQ4+OZs0UTsNwyYvWpl/gKMrtRS2+6nxYHGYWGg3hdB5OPybSJv7/uxRogdkmzmF3kw0XKpKIiGtynZ+KfJgbeKswiclNDCfsHH1qNMhkR+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdfZkXQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdfZkXQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486B3C4CEF7;
	Wed, 14 Jan 2026 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768426601;
	bh=JXVmiqbZx/ENevPGBPqApwTU3Vs1KJ/HQ3gvThI9vz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TdfZkXQE856nbMuUZL2GkKHG+RWvwsqIJ/PFkyDhBOeJocXYSu4rLnjY8OpGX0Pwc
	 cd18mpMwQBmj1DN/2aVlcH493+0R0gORJeWlEDSr9Y7Nzm18+XPxvRF1OBOAk+8SUp
	 mAfcIsXTW/wwrhEZ30y7AGK8EFGSH2mYdJY8Y/B6I1B+CV/puEOVPvkLuWSjPVco9k
	 QGeYTYiaFLk1GfM2qao2pSGfN1lNSW2HrJbBjvLfrIDbu5Q/Fz5fgU9L4paGw3C+/0
	 k5NiNwybo9VXbxkeasbSGwLUAuXpg7lSZ5h9Bm99//xQ4D3WaQ9AWrYE0P3wpzfyWa
	 4J+G9wkoyTOEA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, David Lin <david.lin@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <87tswv1t9c.wl-kuninori.morimoto.gx@renesas.com>
References: <87tswv1t9c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: intel: convert to snd_soc_dapm_xxx()
Message-Id: <176842659903.229619.13690940325171068342.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 21:36:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 09 Jan 2026 01:15:11 +0000, Kuninori Morimoto wrote:
> This patch uses snd_soc_card_to_dapm() to get dapm from card
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: convert to snd_soc_dapm_xxx()
      commit: 850c9884b917f440e659a09dd309a46a136adada

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

