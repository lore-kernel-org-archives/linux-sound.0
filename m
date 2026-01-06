Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D712F616E;
	Tue,  6 Jan 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702070; cv=none; b=muy3UXjoy5t8dJJW81veFt7oRWIGopG76iZS/NrpT81wDCa5fs6VpfZMML6iGDOS3f2pITRPCGgb4vJ2texsOakfVcfKOMJ/wOL7yjNacfxM+MnarnqPZAmUepFVcp4yTts4ULGImIntg/EJsunLksPEzXXIw4TbOJDbnXCgi10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702070; c=relaxed/simple;
	bh=VDKCdSjKGs5XziVF9QY3t4FzNXOgmDAZk821kwGV9gI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qOSjjBk82zyM9QE5dezQfQlvZZvR8S1mh0SMjkJpa6G3+AcwcTTE86R0BC1eSg8vHwZwixuz0b4ajRFp8YiObfH9N43U/vAZ93VZgXaexj3rea6xEQNnWYSoZcUVjwoIdijv9QWXTMVSgvLPSKNhlzuQaT4xZVag/sk5TX8OMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzVAkC/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzVAkC/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7B5C16AAE;
	Tue,  6 Jan 2026 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702070;
	bh=VDKCdSjKGs5XziVF9QY3t4FzNXOgmDAZk821kwGV9gI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UzVAkC/W5Y9Vg3ydHfeYy3n4PWj9UCPh4vSzqKPaneKwk9RAxd2tQJVnIKavkX9oE
	 WO1nGuQtFMdQF2KQxgRyaQfh68iMj5cgngMpaHMUDMD6jLi4iHBfoXJvZYlf2JD0y1
	 VAIDpbxGIZbQPOyreW6Y4BdXxg7C8oQ3RNWvKmhwP8ycZgXP+MIKWWwwoPRGm/JRdp
	 xp5X/H/BfcTsj5xS58O7INJFYqGLm7kzTkCIH7oEsNpfwYYKtyrqmcj+t5InpHZtSp
	 N2DeVlrRAkRXOyRA7g/w11ooNcyyWTwL7OH/iNufNAaJ2pcw/m83uAKCCH/St7r8FS
	 yIzQDG62PyNdQ==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251229090432.3964848-1-shengjiu.wang@nxp.com>
References: <20251229090432.3964848-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Check device node before
 overwrite direction
Message-Id: <176770206863.32636.4462808122550788569.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 12:21:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 29 Dec 2025 17:04:32 +0800, Shengjiu Wang wrote:
> Even the device node don't exist, the graph_util_parse_link_direction()
> will overwrite the playback_only and capture_only to be zero. Which
> cause the playback_only and capture_only are not correct, so check device
> node exist or not before update the value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Check device node before overwrite direction
      commit: 22a507d7680f2c3499c133f6384349f62f916176

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

