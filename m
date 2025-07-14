Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64818253B52
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500554; cv=none; b=cbuYT9Mi225ET8h1jbIHdhBaYW1dFd7DGJJgK1DcHoS64/5ftR4B152mMI40UWOI4Z3mYWjq1UZtJt+o2UXzPd1F1IzaHCWqMj7Ayzaxgi97oZ2BDkJ36sd20seuw7OkMgiHYP/7mmQDarD3UjmVlmHFObwtNh86DXlIT44X7rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500554; c=relaxed/simple;
	bh=ZB7yCb6HOEiELWXcpQjtbpaM8WEGVwDuLP+nfMQgZrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UUYtqpR/LhYLgz7MQhlXOkkvsU3SGQnzQdbZdtKMT+p7rG53lWtFSzUIqzONmgmHum3eqZYA1MO46/G74Ph/gd5bwvjMllAbM48XqerucCuegn9xxMFacRVEOv1lK5aTgbJPJpA4eeTSwrbZP54klFR87k4uf9FPxT3yIZhvZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRoOsWEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRoOsWEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE381C4CEF4;
	Mon, 14 Jul 2025 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500554;
	bh=ZB7yCb6HOEiELWXcpQjtbpaM8WEGVwDuLP+nfMQgZrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XRoOsWEBtVKSwER4oH/fGAtS2GM1MBfNZYIGbALFoECQcUJLCUAqKiVUeMoqCL7kS
	 cfs6vqqkAl5csbTTUy4OcRLvMrEpHgwd1+TPV93qIyjlc1vtvFi0ENuNh4pweLVfr9
	 VEBd6TALH2ZP5r2lhIR+xnnd96DZnhBC7rY6dD6v0In9e/MTnVf/y4sXvoggUkKCvT
	 kuNHqbMDCB4c6rLwEohOUNsdYJphUIiwQZEZt1tkJOcCWFAIf+RRtsAymWhnpxRvIu
	 96Qc43/jDSN+9VSDZhM/tN4Q6pMuMXAAciDGonYr03H1SN61kHj4J/sGh9p/k+bRlJ
	 2/rAPWLDNYNlg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 arnd@kernel.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
References: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] Update SDCA Kconfig
Message-Id: <175250055143.59912.2041339395702027452.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 14:42:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 11 Jul 2025 11:06:14 +0100, Charles Keepax wrote:
> Tidy up a bunch of makefile and Kconfig things, and pull the HID and IRQ
> into the main SDCA module.
> 
> Changes since v1:
>  - Don't expose SND_SOC_SDCA to the user
>  - Simplify the makefile bits for HID and IRQ
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SDCA: Kconfig/Makefile fixups
      commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd
[2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
      commit: 5030abcb0aa3304bf91497844ffa9607a2d4ad5d

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

