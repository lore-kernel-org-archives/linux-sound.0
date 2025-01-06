Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD32360;
	Mon,  6 Jan 2025 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189333; cv=none; b=WVRqcRdMFCecoT1LhKSCJvaOfAbZ5ZIAW6PjC4iXngW+haIovhjPBof9VotuAaxAt49sECa10nf3dnst/ubxg0zYD0m5aE65mYAc/CGruZ7rITnEWSoMRGE3RLVBMLjddZgOcSVbvK5SmeA32eb+CNgxl6VbWXnA67pL9U/MGOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189333; c=relaxed/simple;
	bh=eNMIC1nKrtrIBB1mlzgTTpjczYXtUglXyPoTV342gHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXDvb4KpX3iM5CYS3vmo8rQWgMj7OCMek1uwwpjXzMYA0CVAUZ/tAxKM/Z4lWsdqmcwZX9wdjyQQawn4Zf7b9bxbJNDlBuE03oUJvdcBOH69Kg9Kgim3aCxKvAOCE526tnqZCGa6JqVArp7nahqVH1uYifRXZTYF9zr5g6GrPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwJE1SZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwJE1SZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C097CC4CEDF;
	Mon,  6 Jan 2025 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736189333;
	bh=eNMIC1nKrtrIBB1mlzgTTpjczYXtUglXyPoTV342gHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FwJE1SZENWEiUAxmrFdIMg+MngczFuF9ug+UXXKRThpBj1vWPkZZf/UEoACHV4WLD
	 MaZjboRDzzGxto309eM3Q8f6cu313bctXrC1olFMUJ9jotWJijApaya031kiOLTPTt
	 BZRpTrjmXB8+2NamrT0Uxsth3B+iWAQrmPtGBdr3QsSbSWvGvGfGjkaZHHNBmROfoy
	 9jPdIj5UHH1b8WKohpNEvnj42v/kXoj7JhQcU5llNRzbXQ2Bf1Mm8UZhXibUJhObzQ
	 GD15gWcH8Mj1/eYGf/t7nxyXDZUZurR+vFk1CUGNKKwOD5Phrdjm/GTnvTgywGR0Ie
	 l86mrgvjS/2kw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241230085717.785718-2-thorsten.blum@linux.dev>
References: <20241230085717.785718-2-thorsten.blum@linux.dev>
Subject: Re: [RESEND PATCH] ASoC: SOF: Intel: Use str_yes_no() helper in
 atom_dump()
Message-Id: <173618933053.201670.5450309818466109379.b4-ty@kernel.org>
Date: Mon, 06 Jan 2025 18:48:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 30 Dec 2024 09:57:15 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Use str_yes_no() helper in atom_dump()
      commit: c0641be588c22fdcecdb1e90a64803047d4441f8

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

