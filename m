Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E07FC09
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709584774; cv=none; b=rD0Kz0LG5JR98B2oyuF3TpZCuOv3QlbmEwVkb3zj3UYjgePF11As418ssUCv9tsaw52ytIUWyCIOrtfK3+TLUKDOWYWhRna6x0Dk4QKHrd7vcOqRo/G9QNCijvmryCiiA2pZKBRE6k4BDaDCcNLazgujHQpaPnKRiV3t9sVxxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709584774; c=relaxed/simple;
	bh=04nMoYqVUkcSBJOJnm4RngC7PaOMqhkjTAtnI8X3D5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KkJIDyTv8r1rXI2hf3nKlGcwScptUDaJgOCQeIap8rQnpN+ga+UoniZb0tMHHUgpJDO7ss7ghT3kW3+Aev1Ne/ucV3sf9zubKdlAy2eKXG7L8ulifc0KbCLDkvsxIHzbHzARMLMegFOm42NtZnBViPFaAtPZYSorOglhJ96GbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Son7wq09; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Son7wq09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE06C43390;
	Mon,  4 Mar 2024 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584774;
	bh=04nMoYqVUkcSBJOJnm4RngC7PaOMqhkjTAtnI8X3D5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Son7wq09UMxU70j0JxvfzaQ4lqq0J/pIa0hwUU2z8MfeO8IVsg5hhXiBY+X8vb5zQ
	 CxZNUX8aiJ79nQ/Q0UoJfwKvi0ymqda5Fzu2SpTh2z4+cTk4GEfs9j0a1jeUw3Gma7
	 g/LJcEONbPMyWJQWHmaPjX9WyooLOQF+Nevevdf5xbM/TYm5DGM4XUp13HfKXy2tdl
	 PhKUFSJYve1CjPyG8KWRnUtyXo0OZ/G1AC2uN29f8uZJApejXW7isNrF9p5/aJmBYq
	 wNOSM/MXjU7eUyOV3e+Ym9T4plG8yMjiwOdTrRlD1F3mJmSPpITt6pvAFlZUD/NPJE
	 pkbm53keEuKcA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Vincenzo De Michele <vincenzo.michele@davinci.de>, 
 Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Dean Jenkins <dean.jenkins@siemens.com>, 
 Eugeniu Rosca <eugeniu.rosca@bosch.com>, 
 Andreas Pape <Andreas.Pape4@bosch.com>, 
 Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
In-Reply-To: <20240301085003.3057-1-erosca@de.adit-jv.com>
References: <20240301085003.3057-1-erosca@de.adit-jv.com>
Subject: Re: [PATCH v2] ASoC: rcar: adg: correct TIMSEL setting for SSI9
Message-Id: <170958477137.789715.8335791604405299468.b4-ty@kernel.org>
Date: Mon, 04 Mar 2024 20:39:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c

On Fri, 01 Mar 2024 09:50:03 +0100, Eugeniu Rosca wrote:
> Timing select registers for SRC and CMD are by default
> referring to the corresponding SSI word select.
> The calculation rule from HW spec skips SSI8, which has
> no clock connection.
> 
> >From section 43.2.18 CMD Output Timing Select Register (CMDOUT_TIMSEL),
> of R-Car Series, 3rd Generation Hardware User’s Manual Rev.2.20:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rcar: adg: correct TIMSEL setting for SSI9
      commit: cbae1a350e3ceff38242a4905805c80ccbcfbba5

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

