Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF932825F;
	Fri, 19 Dec 2025 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153378; cv=none; b=MPrYUgA2EcNrnsGBPcjz3Pkv7urZpDRfkQRgFd9kSqO8FEOzJESzFDhYMomi+VkZZdPQVqJuD//izMGNlvmnEsRVtKk2bZTzCjmhKh+2uKfXZ9JC4JA9D3J7wEE6b6c2+TGwouIY5OSDJH33GduG9ZjsZcfWJ/d/ETZ719gO3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153378; c=relaxed/simple;
	bh=p8naBn4GIYaJ0stZAMOiS0XH/cToPFzsSgXNLfvwUIs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=br3Yr7NWCy+M/8RLSx95GBvZruubWCs6X/RMh5Gtu8IBw5ATQy6daievth6HiD/KXJ2m+1rMeavBPVjywiaSfZoV55/GIyMN/L9nKAF1/9pabHm1/3tGemu2RG7T1jMGLo/mdZORWTJwB9o+s10OdPvARZkPH/VHGToEZ6wDeVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehnZ/L3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehnZ/L3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDEBC113D0;
	Fri, 19 Dec 2025 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153378;
	bh=p8naBn4GIYaJ0stZAMOiS0XH/cToPFzsSgXNLfvwUIs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ehnZ/L3zDduGxE0X335C1ZBhsuunVsemH+Lvc0xcWMrxmt6LExzrgKyBcI7Zi4Nu7
	 bBgHBTEd1jTiOCRCSnTd7gEYm5l40PgCqJjODddQMO4xxd0SMdOq0TtjQmoCXtvQ48
	 7EkaQf0BYXTFvcRIBgnulDj3nk/y0HsxHIU0QAbe6jwgXom3fj9tIwqkH2zBMcNONa
	 8Dp+1rQtaLPgdTM0FM8GTizu3NrdJfPCVqAmpsdCUnbQqdYJRWKlOMUVY1JYgNJKlq
	 RMp6V4te61bODHjK25yifO4CuT+hKn88RTwhhvOI0xQc8/ew0/NDePFig/FnT+WiX/
	 rHS6/cl8XBpbw==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
References: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: ops: fix snd_soc_get_volsw for sx controls
Message-Id: <176615337705.412520.1728010945033810192.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 13:49:20 +0000, Stefan Binding wrote:
> SX controls are currently broken, since the clamp introduced in
> commit a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw") does not
> handle SX controls, for example where the min value in the clamp is
> greater than the max value in the clamp.
> 
> Add clamp parameter to prevent clamping in SX controls.
> The nature of SX controls mean that it wraps around 0, with a variable
> number of bits, therefore clamping the value becomes complicated and
> prone to error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: fix snd_soc_get_volsw for sx controls
      commit: 095d621141826a2841dae85b52c784c147ea99d3

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

