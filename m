Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B71EE006;
	Tue,  7 Jan 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260080; cv=none; b=eUkGr8KCH1RCHLVjwOHDdOyEKTlN9jUobwohDMNZ8Q/6WVGrc3ueXsZC9puA0cykyodlLsNjYZP5PDmmEQhdoJBPLRnmOftH8MG3aSKNaXsNaUiSfaI2pVNpAfhRC2k/RmbcyxUWSqFMyWSXZrFBhri6QQIK/KmF8eiMuZzwQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260080; c=relaxed/simple;
	bh=A1BSrnWHAC8gWF3urg63aa18HJ6wAuPYnvIWhN4LzoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kw8VNWaeudp38kmzmDc3NBMTh2kWUeEOdv0JKPtp8TM5zFAZVttvnAYT49Ufw8jOdVyqU6c88KiF0yTc5X3+08cfrojIBdt4jjL31K47wUcKUzE57JcQQAzVBeTG9L3bfG0/EpUIoh61TmpB54FTMzoWE70/5wqlmdKmcItsSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwTQW0B9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwTQW0B9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916CFC4CED6;
	Tue,  7 Jan 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736260080;
	bh=A1BSrnWHAC8gWF3urg63aa18HJ6wAuPYnvIWhN4LzoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DwTQW0B9Cm+SMltXxijCLEXnzHKoFcP4GJze4eh3QbKYJArwSizsueet2FmN1gWx0
	 6CtS4IQCcICmfTURYFLNe59i7ivwEIJ9vtMpZ71tGThHUWyT+28Su9CX3xDXalAkpS
	 ucyRp9RmAoKe+wkPxQsD0ngmprW3wCrQqKtAXkh74jaEWc+SDcTqNfa8zKF6456EuL
	 7vl1RDRo6nNsKHcdjQhQ0Us8CSrn1t6mZxT1GgKTFmE7z0GyLax74Ff1W1w9ZWUTgr
	 +grdlUAauStM23PZTa4uSixB5MIFkDUtvmHPSW/35CP1FAD9p8ovgcel7xvCg/wVx5
	 pbVvgIbppOR5g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250107011355.2035-1-thorsten.blum@linux.dev>
References: <20250107011355.2035-1-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] ASoC: madera: Use str_enabled_disabled() helper
 function
Message-Id: <173626007834.72678.7144742916428315484.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 14:27:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 02:13:54 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: madera: Use str_enabled_disabled() helper function
      commit: a83678be5ea152dca98791956f7bf2a0e899e3ad

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

