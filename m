Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D13DA5C1;
	Thu, 30 Jul 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410690; cv=none; b=MFC035uUuJqO03Ov4lMntOVC3ZgV2IHfZQYVgjmL5oAYoNGGhWjXTnuqIx2sNoOU/nwhOXVvrNdqiH869t4b/0eyIPxR3DrU0iDXzW19CVIwuisTRCs5BFotng68Zju1CT3LrR6vvxVBYmJWtUdCFGx7yvDUzbupgy7Ea0qbV04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410690; c=relaxed/simple;
	bh=cYFbK6JbmBbwY7ZW2IECz8Rn0iwIIlNHVat6eNIgVKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PXTGdMvB7BSnmZwIY7BAAHOCbGiOY1HX/7Q9io/7HIvIDhhXAQM/z1X+FQALgcRb2wdSeBzl0OEm07Wqy1+m4BUqIZ5Xn5Pro3OXhQsPnIb5d7NQOcR2RJzJDVjwZhCfeRUg/6xLPpv4+2Y/1jsr2Sd57yhtEfcEgDeQptdvdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ef9HY2rC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ef9HY2rC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42E21F000E9;
	Thu, 30 Jul 2026 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410686;
	bh=LVHWZvePVBLXjM9MPn3NlL7GgsLFfAvDE8L3DbsP3yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ef9HY2rCjsm/msVt4ofQ7cVNumr2Jh/kYhQgkJkfpUzsyFh2btVUxIzD3BOz+TE4E
	 90IKtAQW6iZFKf2Otct7fWULPlVh9N5cNPn1vnIZ8OFS308vZpLwhjMi1U9y3j7g9g
	 0LIjjwOKYoRNqIDlQ9321F2+7CWmcJ3tXVtoAg3BWk1uHZprU4HEjQjniIhFgA17dm
	 uoGN12rD6oz+dMtGtwN0SrytYXLOnivfZ+c796VaNqWOfOGLa6op45NKpUlQbsvxLd
	 Vs+u2Kv2K+M3maXNGowGp2VmJ2KvG8Yf/V2CzyJ1KWiydBztzNBb/VOAfGUam0hPvV
	 N7eVEOdjCtPWA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, phucduc.bui@gmail.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: stm: Drop redundant error message
Message-Id: <178536726558.512962.11305528912668407095.b4-ty@b4>
Date: Thu, 30 Jul 2026 00:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Mon, 20 Jul 2026 14:40:39 +0700, phucduc.bui@gmail.com wrote:
> ASoC: stm: Drop redundant error message
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series removes redundant error messages across multiple STM32 ASoC
> drivers. Since core functions already log failures internally, dropping
> these explicit dev_err() blocks prevents duplicate log messages and
> cleans up the code.
> Compile-tested only.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: stm: stm32_adfsdm: Drop redundant error message
      https://git.kernel.org/broonie/sound/c/30df43c14050
[2/4] ASoC: stm: stm32_i2s: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/a6cdfb623094
[3/4] ASoC: stm: stm32_sai_sub: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/e502adb1cdd6
[4/4] ASoC: stm: stm32_spdifrx: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/94495c842711

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

