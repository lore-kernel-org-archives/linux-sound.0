Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1045977
	for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818318; cv=none; b=OmcaSbMxyH9XwhUXZlmDRpoFToKgRGvlbbDuHL3yV8A5kNvWr+xwLWPDvJJ5p8hWKjjZrwAJiB2ggTol86t49zYJ1IfkPDUdGl/tzZxhQoryxTe7lXCw51C4iha0YReHetzULZNfdHqUh7Ai2qePTEYK+mdY95Y+ygjK9M9nOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818318; c=relaxed/simple;
	bh=QIlcfav2ha1umyk0ZBufDe96vCl77uB0dt7vX00D6xI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WsPLSpgCOC34fQoBrtWOMX5O2mdgOeWKIUNOTnQ9mnuvlnA4nYRi/b0t1Ak5tyP5EaGXDVMcEckSTPf40hiY6kiYs21GtG5clMDCWYpJjVGBOfBQ3hWb/Iqxda7tVPbRjFXO4r2XM+h1tkJHLCxf8lG7dXH8kafDSNGMANbb8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxRZ58h6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxRZ58h6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB72C2BBFC;
	Wed, 19 Jun 2024 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818317;
	bh=QIlcfav2ha1umyk0ZBufDe96vCl77uB0dt7vX00D6xI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oxRZ58h6NU17QOwXBzvXF60oXsDK5OcsYGzBsECjSZ+b/F6ItszdQeyLK2Ll5g6Y4
	 /Ay8FuH9F2JExARR85Hy7rTk0h+mjpnZg1VBni2fScsOrntUzSBbni/HyBIHlbuuVV
	 ALpvEomOhSSIwK3xur6muX5zCMQaY6KVG1LyIAQk6AJkoNu9cn+jII38Dk9+EmkwCz
	 XYH8RFRX9/1XvMjIk6OKDFwnri7tykWnpAIEV+MpBrVIj/LNS7HwJXJGFGR+lbjPvy
	 OL+9aZmZCLnl6qac3HmuIXe5nK+Fl9NKlLoudw935Kces+UVxdpp5ZO3GqZKLMtg8J
	 1quVu4m67sqcw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 pierre-louis.bossart@intel.com, bard.liao@intel.com, Deep.Harsora@Dell.com
In-Reply-To: <20240612075740.1678082-1-shumingf@realtek.com>
References: <20240612075740.1678082-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on
 Dell SKU 0C64
Message-Id: <171881831508.221331.13576411057158316144.b4-ty@kernel.org>
Date: Wed, 19 Jun 2024 18:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Wed, 12 Jun 2024 15:57:40 +0800, shumingf@realtek.com wrote:
> Dell SKU 0C64 has a single rt1318 amplifier.
> The prefix name of control still needs to be set rt1318-1 corresponding to UCM config.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell SKU 0C64
      commit: 60ff540a1d476c2d48b96f7bc8ac8581b820e878

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

