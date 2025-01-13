Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AF1C4A13;
	Mon, 13 Jan 2025 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736792552; cv=none; b=sSFcnDiyhgyahla9aBFkse31q86iTA0h+JcfRZazGGJmnGfbcH29iNlJpFEo4U+F2o3g9cEgIANLhPbxILNj8dIWPgAIsrTIZ8XKxxbebeK6PWw6Xw6qijkz7df6f9rue6QCQs4yrb+9KXpK0LXP6n1itYKRKDmzDpazZp8/nOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736792552; c=relaxed/simple;
	bh=9xTaygjVYJuYer+Yhp1a0xEHtZSyUCkLiWOkWfL3QOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rRXiLp0FVMGOHJDT60mVAWvFNwrdIUrGRH2zUabiYJerK22+EeZ+ipl5y/6InoD/eHyyScS5l5OUKMDSdh1cLMrYWxwZ2qieoBSS0Ftjmjg4Jzyzj04t9me35i3maIPUibxzSfncznb/yVlnTfoCQ1d5rmZm7cMmDJ9iFlqo8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSpyCnC7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSpyCnC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60188C4CEE2;
	Mon, 13 Jan 2025 18:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736792552;
	bh=9xTaygjVYJuYer+Yhp1a0xEHtZSyUCkLiWOkWfL3QOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PSpyCnC7yV+B9aBpt8IdNtx0eHil2MP+xV0sCjNScgXaknVsjaQqrxkzwGEYWAWbE
	 pqLhZ5ca8wPY1EAGDUyJWNXzrkBfTT0fbbcBBTop7647gS8v1sw+jzyEGJtJiEAxY6
	 DFq2gQtGAuq8+4c5qcf33iDHxO6hnzk3Z/tODlXF27y/daQ/LcojSxiEMvK7rsomyK
	 pWUKcJK1Q3vD4gtloyYQnHPPozlN2EmATsCc7n16545b0IITi3mjsrW9RJWY60Khcy
	 FrLIuOTf9tVU/le+RAHMTs/YEUfo9TgmF5+u0D3I60okN3iVaMHSHtDcHLnDl2AHGA
	 Wx7SUC713XTlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250107110900.3716-2-thorsten.blum@linux.dev>
References: <20250107110900.3716-2-thorsten.blum@linux.dev>
Subject: Re: [RESEND PATCH] ASoC: SOF: Intel: Use str_yes_no() to improve
 bdw_dump()
Message-Id: <173679254911.99208.5674999762418020539.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 18:22:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 12:08:59 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Use str_yes_no() to improve bdw_dump()
      commit: 7299cc06fe4ab2ac26af73ac5fecd35a28fef527

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

