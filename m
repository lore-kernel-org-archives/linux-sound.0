Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB634165B;
	Tue, 20 Jan 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911432; cv=none; b=rvpw3PDl8oU2l0O1z9AGlNq7y33p81n6SFDcL5RD84/LvoNgw0/qwkqU1mqa9Wb3h2Utl4yaRRhdiDdqK0oR3MFCiGkQF04FrcEy4ZXxZrRfxSJOtMdxOxqYToCFyxiLEOXiguTT+sXiE+GNLs9KZYLcYtgNOHtZwRNpQC35yWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911432; c=relaxed/simple;
	bh=Vl2Z2zvj6zQGkgfHToqkv2O+CyIg553lvIdLjZzx3PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HmWiofFiGpNNFoBkwc4uMcN8OqcnbSwQbv3bDUrdEK2cyC+64BVXDTFW78FAXQ+bTFZ+LkNGmnknYKWaxOMfcRd90LuiTAAmmgBUrl14xlFBMhSBIlXb/ytRyFHxYoOWBj2RStHifXwKVaIaTSJAYwV2OZ561RQ7rmsL1tpfWc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEw0jXmK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEw0jXmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD61CC16AAE;
	Tue, 20 Jan 2026 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911431;
	bh=Vl2Z2zvj6zQGkgfHToqkv2O+CyIg553lvIdLjZzx3PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AEw0jXmKnteI7/kKjeTuu04N96YGo1URD/xvuiGwvAxnV5SubMwkr06VUa2Tp6qG2
	 CxTUVKvwyV9CK2oTYJBh7jGl2kvgOYecIqcjXeZVt+8ZpdeYjzyCU7WGeJ1R4gOVvl
	 eV/4sJmVtSJ1PYE1ahszK9+TTt2pPtZCTyZnCaetLQCXmyAhiwWuT7hFuioCct/Z8f
	 KAuYA+wjzlrQkmkAafJhEQi4PvRdeDzlxlvrowd1Tm7M/8mGk2VR002e94dPfojXl+
	 fMV4GT+n7mnXrabEB3TYhSxyGSUzWvDtj2fSRwMmh9w5zwZkL7/Jr/b1dE+e+7AaS0
	 h3WtEzQwe89Pg==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Runrun Liu <liurunrun@uniontech.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 zhanjun@uniontech.com, niecheng1@uniontech.com, kernel@uniontech.com, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <3D20FA99934F2891+20260119025302.1288888-1-liurunrun@uniontech.com>
References: <3D20FA99934F2891+20260119025302.1288888-1-liurunrun@uniontech.com>
Subject: Re: [PATCH] ASoC: realtek: fix misspelling of "minimum" in
 comments
Message-Id: <176891142957.66787.4709456751892264790.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 12:17:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 19 Jan 2026 10:53:02 +0800, Runrun Liu wrote:
> Fix the typo "miniumum" -> "minimum" in comments in rt5659, rt5665,
> rt5668, and rt5682-i2c codec drivers.
> 
> This typo is already listed in scripts/spelling.txt by commit
> 8c3200265787 ("scripts/spelling.txt: add several more common spelling
> mistakes").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: realtek: fix misspelling of "minimum" in comments
      commit: a18467a50eddbd7c6548b53b25b68e5454ceb587

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

