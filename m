Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62482C11CA;
	Tue,  6 Jan 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728556; cv=none; b=FS9mSe1Gt0AZcUCamHIgrTeUYitVvPV8R66ReEKNu5E2EZsaUmrowuGVDa6PX9XgzLZGsUCde2tI9e9Z5f1fXUWoTy/NvUUiMoMn+BgnEmkee8G1cD32E0mhg/CO3Lix1tmGLt+Ka4JBrSOEU8MMnEpARhVweOZ9MHginrTskCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728556; c=relaxed/simple;
	bh=jO8ronp3OIBJKX4FfoDlfzU75FCGfFiZgkPNFPMJq/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sD96oXp7slf3SiZExjSQ969bLVOyE54jtuydnWUag3bbnm4ZpKBD4caYq9Ns896upkJetx01WeVoSLy3LuxBDStl9rE8Q63KbEHLoaADUHG3VCXsE30Hfi3bpR9hUUkF0y0FrqCtGiCsilMExY6gQVkutfWrgT2TbMqnaf3bJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1A8popS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1A8popS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1627CC19422;
	Tue,  6 Jan 2026 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728556;
	bh=jO8ronp3OIBJKX4FfoDlfzU75FCGfFiZgkPNFPMJq/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A1A8popSBW2yQ5BQXObBUgm+CIHzm5aSb3Wl/MbmrRMi9Et0+j5hdJL2OAZ65U28T
	 DVDMsgeMCMhKbEF1218TXyhEH9r60TF1u4/bpWUsgnp9NUluOX+xwssrCMsa+nFt24
	 HEeoc4mObX0RKuZDiOOcLlXB7FKnp8UYIRIgUtVo/3Y1KhKlPnvveN6I+e8EP+Cbb+
	 9XQE9I8WPNq+pqhxAw2B9VNw+gbDPU/QB24Fpd4h5NSdcBRklg3Ze0NmvY5u4380MO
	 5qdtNgFrS27Rha4iVPxRovrJUhijDPTltsxlD13T7qeIt837PMdpigaEZ5tnClDXHZ
	 h1rxfXaFM6HZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Seven Lee <wtli@nuvoton.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
Subject: Re: [PATCH 0/7] ASoC: nau8821: Fixes and driver cleanup
Message-Id: <176772855484.328192.8286360588615483165.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 31 Dec 2025 22:04:14 +0200, Cristian Ciocaltea wrote:
> This series provides several fixes and cleanup patches for the Nuvoton
> NAU88L21 audio codec driver.
> 
> Testing and validation has been performed on Valve Steam Deck.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: nau8821: Fixup nau8821_enable_jack_detect()
      commit: 70237853edf0a69773a7370eb74ea2a44dfe3050
[2/7] ASoC: nau8821: Cancel delayed work on component remove
      commit: dbd3fd05cddfdeec1e49b0a66269881c09eebd17
[3/7] ASoC: nau8821: Cancel pending work before suspend
      commit: 7786b10688ac0ebeaff655923cbb2c7d34a98995
[4/7] ASoC: nau8821: Drop superfluous return statement
      commit: 2a3dc1bcc75e357e4e68c92ff9b9e7f6e775c3e7
[5/7] ASoC: nau8821: Simplify conditional in nau8821_get_osr()
      commit: fd843051b8cad777f69cd09c797b4a2d81d48f4c
[6/7] ASoC: nau8821: Drop unneeded braces in nau8821_hw_params()
      commit: 42ca16e3bace1e76803876358ea908ce9d87e0d4
[7/7] ASoC: nau8821: Sort #include directives
      commit: 9bf0bd7bdea6c402007ffb784dd0c0f704aa2310

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

