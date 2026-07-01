Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D63CF1FE
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079836; cv=none; b=MEZyAOj1cOAL5BmWo1+j5QeGk6GwbWMh+Zy94ti8uDpnwzZOo8TM3FR7uxmfdlPAbDN7/9CDchyuXLIb+jsi+nxFQ1tiF2/E0FvtAu/IcCBbia7BMOnffb7UeDTCFSmqOaLrS3/ZnOn0m6CghKY//AOcANavSat2UkQsmzuSdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079836; c=relaxed/simple;
	bh=l6RzNGIAWMOhY+SR52423w3htRgrV/DeBSB6BlO635Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B6Ud2rjoe5rPfl7ikkpJLb0KDemUi2DhSIZgrnFCFAqLToOsSf564FjPKUzEXQXqzfnuAxsoWrX+xrlxI8J49ZRHSa/XWwrmR4nVTHijLRzX299cwVsodHG0e30eNYinL0F7isZduiKa4tjjC53pE2Mf57AEuwtyvtd+QEoL+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFYtNfLc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFYtNfLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42611F000E9;
	Fri,  3 Jul 2026 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079834;
	bh=onM1lYcvNdxWMDWkfsGxKVtxcvPDpKihbDwcv56pl/4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=RFYtNfLcFHUUZpTcKK2Rh3432FtD3HXxlFXMVMVp/u9W1+l3lbXNv/Nj/b+bhCKOv
	 eKymIC9hmbAu7gxsFqJjWAuNWyisA72Zmxm3H6pd5A/VrZ7L5LXLzOrnhkVWxDs3/5
	 f27iTdUFogZlXE/ktWIAgfcM7ne/QCv8uDZ2Nxv5kgfIsPQZKiz4FfeoBO5H9zJmm5
	 ZLA/E98VZJdwCl3XFNTdV90eYY8AUEcSHtXmHw3fIcMpWgniHdIkq+A5/OSvGs8sd1
	 YyloirXDWhcQsNGFDG5evILzUXKEacwznMbU0+WIAMeza+6FzmGcmjdATjty+J4Ojz
	 tpE7v5Uia9XMQ==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5mpet2c.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5mpet2c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: sof: topology: use for_each_card_rtds()
Message-Id: <178291874661.38925.486774098429195879.b4-ty@b4>
Date: Wed, 01 Jul 2026 16:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l6RzNGIAWMOhY+SR52423w3htRgrV/DeBSB6BlO635Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OXIFGwovA9/sGkEf++YTMiDsgVKvEoe9v+c
 yZL4k5Dc72JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejlwAKCRAk1otyXVSH
 0DVeB/9qKEUwscaM/zAHrWPPoOV53E6IKTGEsyH3qMtQlDGpsdFizWzelpq7kI+OWLpMD2C/WS3
 6Y/x06sGxsqZ3pc6SdZ4I6GndGu35SK2vYX0XStDVtVD9PWC+mvgTX7MY/jYhohyhkVPk8It4q/
 XHGp/YFDw3Yr2PSSeZxa3KRBVuHQbnEYN3UuyTIWwprEDXTWfdPuk4kdjjf2I9nGseq6R13HOOw
 FvmWPEk0qnY+sqlni+YV/nSi6X2wdtcTYFiyQEtZ6anT6W28K27jF11n+yLPWBWoIIstQw6Eneb
 hHhfr41Y9pa76NkoIfOSZXJG4Gsvb/HqpQwVHNVNtRvyU4vy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 06:04:20 +0000, Kuninori Morimoto wrote:
> ASoC: sof: topology: use for_each_card_rtds()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sof: topology: use for_each_card_rtds()
      https://git.kernel.org/broonie/sound/c/e3653722b94d

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

