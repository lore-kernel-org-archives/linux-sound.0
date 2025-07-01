Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB923B628
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 23:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751412859; cv=none; b=CpCBSdMPXKtPxsAK/7yEKWyjbjVNG+xwP4JrdzmW5zL/dPdf4dig/GBmd62WCTlcti2Ps2eUXfktRpwzdiPOD3vVKV9xVcNZZ5vIFcn7qymojEdkwGxa2rcL1xRLqQkkufc+PVXRsytvE2ssTUhBNp4rjtCSyizIpMqVmHfylNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751412859; c=relaxed/simple;
	bh=xDt3Dh4bQKyIdnhhJM55Zf0Wh108yZWNCa25JoPcSWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fG1LfSc0nx4ZLdfM/5jZGAyHM+9u6MdCte5i3eLrGDrGbkN4BaDQYhynHEGzE81l45VSaU2Ri30TRZQnL1ApRZiLtADRcZWCWwk+Ow/q9RVrwfcncI7a43rzaffQVu1Nsv1mZPLc1p06a5VUGJyPm6ATs9eQdQ+iwpNfvdcPBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbBLfWsa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbBLfWsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7112FC4CEEB;
	Tue,  1 Jul 2025 23:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751412856;
	bh=xDt3Dh4bQKyIdnhhJM55Zf0Wh108yZWNCa25JoPcSWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CbBLfWsawTVZuBd5ZMiAb84u9grbgGexkFjVLLpYgMqj3bJaSgbtZmmJCSxuPCOds
	 NGFjaeI5aVSn4rHP/aSZIgki+shyc6WXjvUMQoZfVWZAW6lWmhIPNU6E2dRbxSEKxd
	 /lVMC5w1GdzpS1kn0yVQN9Vy8sfdWBUzAlNYAz+kDx1JYGIynsmvWFpEPBuFnYkoVq
	 QmIoPF43QAgIIKrpaQev0yhL8X3lFlDUArkXNfk67+fCtly7NFuRg44mZ+R+oDDoit
	 rWeZTm2vjHdxZ/K2n1uzrTWbjK/f5PTkfhS53lmpHQVrDsBKxbe1Ly4bdLDKO0Zv6j
	 my8XcvG8LuVeg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/7] Add SDCA IRQ support and some misc fixups
Message-Id: <175141285519.833196.16611425828576500210.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 00:34:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 24 Jun 2025 13:28:37 +0100, Charles Keepax wrote:
> Add a maintainers entry for SDCA, do a couple of small fixups for
> previous chains, and then adding the beginnings of the SDCA IRQ
> handling. This is based around a regmap IRQ chip and a few helper
> functions that can be called from the client drivers to setup the
> IRQs.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] MAINTAINERS: Add SDCA maintainers entry
      commit: 0383a710d28dd5dc43d26ccf9fc74e1ba41868fd
[2/7] ASoC: SDCA: Add missing default in switch in entity_pde_event()
      commit: 2ed526bf04a6d81592b314f81e7719a14048f732
[3/7] ASoC: SDCA: Fixup some kernel doc errors
      commit: b4515fd87cc9a260ae89fb81ca2aa928d496ac86
[4/7] ASoC: SDCA: Minor selected/detected mode control fixups
      commit: 37d2aa62138daa8ecb6442ae4753704e9c92346f
[5/7] ASoC: SDCA: Add flag for unused IRQs
      commit: 775f5729b47d8737f4f98e0141f61b3358245398
[6/7] ASoC: SDCA: Generic interrupt support
      commit: b126394d9ec6f9d8322cf392ba23d4a5f96faf5a
[7/7] ASoC: SDCA: Add some initial IRQ handlers
      commit: b9ab3b61824190b1c6b2c59e7ba4de591f24eb92

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

