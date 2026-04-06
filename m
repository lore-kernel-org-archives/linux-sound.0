Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20543845D1
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488991; cv=none; b=ZC+dtPCfBHkA365MavoZkls09x0Z+/+GKQMYdy9rwkSnLquUFJoVfM0ugubixpN/chVkgAF7r6GHnrx1+/QvRUmZ7vNJlZuATCxdPm5TboQuP3rHXqPX1jAKXNfCdXpC/9439pQxNQJy1KfkNXg4s4ls5gxThrJdaGn9ilvs36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488991; c=relaxed/simple;
	bh=usL9WZn0Ia5gu5Wvsom11n4myWv5mkqlgcv549i/sdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NaMFhumWS7qFX0xImWlB6msxTe5r8j/+xjs1bFazWHDNY7VYIMTDdNit0vGAJ63N+AwHbmryKj5gpqfgpzYP2OTCUhVoXMFP7EOYIS4G+Sk5OCDFRHKnKgOyLT2hpgVsJXCQ5FluRsiPNdMAyq4LKxExCcve9dFLNOo7if8eFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rig45atP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rig45atP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C62C19421;
	Mon,  6 Apr 2026 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488991;
	bh=usL9WZn0Ia5gu5Wvsom11n4myWv5mkqlgcv549i/sdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rig45atPRlyXVQAlfrH9iHWJT2FKMKfjWmDHSEGTZgZO7H3N9kjw8cDHlQVnfFn9P
	 rLlatNDYMFVoBdRkETyQZ74/Jgj6PrnP9akQRgJHI/G3rMUTyr4ZH8JCFk49O0ebe5
	 veNovv02enUGiNQK9G9HRpSbqoN5/UMo35g7yVqXfUwS0rLa5/dV048/dnPAx9CFEX
	 t42Z4lXfpaABFT1MvqbCAVvPEPEe1YE2WEiT7OJdYCXLNA3lM2SPeo6GnT3zOFZX8B
	 vO40HQTiji07c9d3nlRXyltY2zoFtHcbyhsmbo0u78Ylrwp3NXEYVAg6nzdyj3GVLm
	 QFaNbkBROHh6g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, 
 mstrozek@opensource.cirrus.com
In-Reply-To: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
References: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: Fixes for find_acpi_adr_device()
 when some endpoints are missing
Message-Id: <177547825335.46304.5650514883031022616.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=broonie@kernel.org;
 h=from:subject:message-id; bh=usL9WZn0Ia5gu5Wvsom11n4myWv5mkqlgcv549i/sdc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/dD4qltsxIn7hnsGl8ZN6iUN07bPkEfZ1A1
 KPvWmb1XXaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP3QAKCRAk1otyXVSH
 0MJIB/9im3zgV3+UaH0h2OvooSgxpIqSfptkGgbRKjDXjxCgrgowB8+Dtr4/aU8O/y+jK5v+AyL
 sBUi79nyvV6Car6/RAZ7yBOdpXjAZLO70xF24nhyunk5ALXjD4i3CEmoiT0tadT3oY7TT94k50V
 dgS2UyHtl3zHifoBAOWHIJXc5RANNjdIXdi9TTsxh7i/GEtFEIVE1XjkjptnYDIqihPuO6lZIA3
 pnLWS4f8eTc6cPXAypGfkARwUvWgB2qwOsk2znnPHmUEQNx/aECVPuXPGXEUke7PXfu2pdHuOqh
 m11q+uvSYufwhf4cT9mDi0QTyW1UNeuL4/+6/vCCQRhuXBWb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Apr 2026 14:45:29 +0800, Bard Liao wrote:
> ASoC: SOF: Intel: Fixes for find_acpi_adr_device() when some endpoints are missing
> 
> To make sure find_acpi_adr_device can work well when some of the
> endpoints are missing and do not map 1:1 to codec_info_list.
> 
> Maciej Strozek (2):
>   ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
>   ASoC: SOF: Intel: fix iteration in is_endpoint_present()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
      https://git.kernel.org/broonie/sound/c/86facd80a2a3
[2/2] ASoC: SOF: Intel: fix iteration in is_endpoint_present()
      https://git.kernel.org/broonie/sound/c/1de6ddcddc95

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

