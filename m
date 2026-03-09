Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074F26AA91;
	Mon,  9 Mar 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085556; cv=none; b=JbsQnwmw5NBBTrZeSgvLS+pGCaitY4PaG6AStaeKfaMqg/skzRBKxqm9UMwYOPpabV0D5L2TMDA78RmwPAec0Pz7l6EO5HK8nOIo1+ebifpDgFounAs5V6gDpL6J/ulWMb7MuDDuJ3V1QTDNGXKZAz+wjSoHPBlRVgPpfblO1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085556; c=relaxed/simple;
	bh=ebDCDH02HY8dLdv6CLj9lkBFrWd11fi3lfPOsmtQLiw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lPUgPn/mL9PuqLf+rB3utDRLvjftNNN1DObd0lITwMUM7h5k5oKe1/qH1SURYqZ7DUfb3UeCoDoGkLegy6D4fGV0wXxzQHsvZF2eVjLOUE89XzI3jkBAGHbWnyV3n5gjngmh8wLymNLNJ1D7A8lifm0etpQJmMK2t3dJGFpK6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEZ5sqQM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEZ5sqQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1797BC4CEF7;
	Mon,  9 Mar 2026 19:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085556;
	bh=ebDCDH02HY8dLdv6CLj9lkBFrWd11fi3lfPOsmtQLiw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IEZ5sqQMXYK65tUbA28w5oSUsLwjxlvMqI5RCA3HRo26Obl8FSGy7CRgn3hfTgzru
	 SHZP/N4+anV5aX19xFly1j5hcjJKoaCycdlsrCBLyqNeGtbp21dkQVAhCFE5W88eoW
	 mbq2R3MsujS796zlxrTVyj4sqVa3BMS0TYZ2gy8mklNhhTZ/3H28VewR3rm3ygaPG2
	 vF6pAirZPjf7+4geN3PJv7y4b3BKordks9UHb30tpvvTn3yzq16iMeGz7kLb6iCATz
	 8I0UyzePv4q3GbvJnSwn/4YY54azNf8ObeLgRI41ReQkQPnJlsbcyHXXpN5JSfNeuB
	 w4jv5nbrUqetQ==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <418fe76d1c9efc8182ab57b6b426a8c723e025fe.1773056714.git.chleroy@kernel.org>
References: <418fe76d1c9efc8182ab57b6b426a8c723e025fe.1773056714.git.chleroy@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: peb2466: Change the +/- 6dB switch to a
 volume
Message-Id: <177308555482.265787.462958855234708253.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 19:45:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Mon, 09 Mar 2026 12:46:49 +0100, Christophe Leroy (CS GROUP) wrote:
> In addition to the digital volume adjustment, infineon peb2466 codec
> has an analog adjustment which can be set to either 0dB or +/-6dB.
> At the time being it is defined as a switch and appears in 'alsamixer'
> like a 'mute'.
> 
> This adjustment isn't a mute, change it to a 'volume' with an
> associated dB range.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: peb2466: Change the +/- 6dB switch to a volume
      commit: eae0946b2485109a9f24f46853497f5b1983ab79

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

