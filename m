Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192D2FC029
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631617; cv=none; b=lGaUYkTnv5/Cu6lVuL1da8dNemmXHGqj91zHI9LTw+jMndOVefMipHlvjdjbv6uOtX4AB/S5rcqXZziEj8dQTQqB2CfTxeuhPNr49YagidyRHh7KfDeEXMYyOxDU+eO03i5DHnLbPdAm9WCty/G8KaqzkK+edCLMdt3DN3IvBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631617; c=relaxed/simple;
	bh=tWOttlUOGe4yfS7hm7pApsAXRjS03QGL1C1zAgAn5rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HeMskEw+2w7O2517anjT4zxTGsOpeGJVqJHgg+B6qGXHp/N6PBp7zMx8daMSZ2Qugt886WpbCaWl0ZoUxzUFAn9iBeZMEVoZJ51Eq7TtE7qG7tiEe/m6F5nBrm/Qp69s9j3hTCUKLe64LzAEhtOs5roOmXa7v82WFCPVPVbdHUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owV5/rYC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owV5/rYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B367C116B1;
	Thu, 20 Nov 2025 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631617;
	bh=tWOttlUOGe4yfS7hm7pApsAXRjS03QGL1C1zAgAn5rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=owV5/rYCz164ysBsRXBfCrktvHHDfBHyWyLy+DxzcLkPGGCK2P16wSrKO8hDLAsCD
	 LuOxfNC57jjXfxjCp0fSB26teQRt5T+X0z3Lb/EugLvWeP+oqR5GhwDt98saevwkOH
	 dMftJ/fwohGN4MG+VGGXs1zEjKXhNCXdQmFfUkY7w0ZLKN/J25GpJCM5CMzTE99hCE
	 jprmSug4akYdEGWzwpP56QQtdaKwrpYvmz+UEyuw7oDZAIEPY0HLzPmsEaPo2fONof
	 WAKhWKdA4wPlq4Nmd2GuHMIOybnZgAoqnx1K1JwAHnhiEO6IaQnfzbPTFfSvSf/2vL
	 D+me3rEEVEfww==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251115180627.3589520-1-cezary.rojewski@intel.com>
References: <20251115180627.3589520-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Allow for NHLT configuration
 override
Message-Id: <176363161510.559933.7715997272017707747.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Sat, 15 Nov 2025 19:06:25 +0100, Cezary Rojewski wrote:
> Small set of changes providing new feature which the driver is already
> utilizing on the market - for its Long-Term-Support (LTS) devices.
> 
> The goal is to cover systems which shipped with invalid Non HDAudio Link
> Table (NHLT) - not just the descriptors (headers), but cases where the
> hardware configuration is invalid too. The table is part of the ACPI
> tree and forcing BIOS updates is not a feasible solution. With the
> override, the topology file can carry the hardware configuration
> instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Allow the topology to carry NHLT data
      commit: dd9896d41fdf1050934d6a46a1c5ca2164284e72
[2/2] ASoC: Intel: avs: Honor NHLT override when setting up a path
      commit: d5c8b7902a41625ea328b52c78ebe750fbf6fef7

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

