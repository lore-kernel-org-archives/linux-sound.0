Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA41849C0;
	Sun, 23 Jun 2024 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719163319; cv=none; b=JrfkFrTktSR14KUqqTwk3D3AiKhd1JOHi6EFpUcjBbIGqin1fftQN8je6n3CCZT0XvstYyhZM8e0zMjXOwBMgrPIlZhjtYo6Y2h0SmkvtvIMizjiIzPsK9bjY709V8a9JP88jsKfWCkDCjU2HxvhvCHftMsVK8TluUJMgaqamug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719163319; c=relaxed/simple;
	bh=W0fyAXBDQvBbwqWtC76vrRtS6ahvHxH9EXi7zXrEP2o=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lj+nEc+rbCMO1MV7PeC9spltGJ+NROshDjGMPbvSOf5NLyCM0lYPDb7wpWGNmB6CWg3RcS9CLk6ic+pBtwXiuKaSnzKilnFCiKsvxTsNtvzsvFGURvQTSnk4CxHnrZpqheU5os8nW4Ca42SaRqCPsstntVmK5uyrfoyIdqGSRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gyx+BauD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gyx+BauD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E685C32786;
	Sun, 23 Jun 2024 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163319;
	bh=W0fyAXBDQvBbwqWtC76vrRtS6ahvHxH9EXi7zXrEP2o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gyx+BauD16I88JCXfEbgt3ZevHVHsPzl1uXo3xbGNHiGmPDw8aFxfBps4itjMWRMw
	 e7z06/EbMAEAVcUGYh8MMRCOtCPu5YwClNLky90LXkB+YSZ0SHbN3eWXxGO6JVNfBn
	 5sXSngHtbgI3BCeW3UX6ZXcceEIAGx6uKTsP0r36tRNRW/m/Zidn2NC6kFd38upWrx
	 gZZv1jwFTMNBfO52EEesaeh99MZM5QXG7ElOIe6topnbDT0HDRNFESW54WPe7zo1Rz
	 Zxdpk75qimh80ePfcM/ASvJZrYiWxFWE9tVKvVgFeIZzaoy0zxo+9kCeic1PaB8h8F
	 ki7tu0q368d2A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Paul Handrigan <paulha@opensource.cirrus.com>
In-Reply-To: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
References: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/2] Cirrus Logic Family of ADCs
Message-Id: <171916331710.350242.10084902644118560395.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Wed, 19 Jun 2024 09:50:53 -0500, Paul Handrigan wrote:
> This patchset provides ASoC support for the latest family
> of Cirrus Logic multichannel, high performance audio ADCs.
> The devices that are supported are CS5302 (2 channel ADC),
> CS5304 (4 channel ADC), and CS5308 (8 channel ADC).
> 
> v4 changes:
> - Remove regmap volatile_reg callback since it is not needed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
      commit: 0e2407ae89b340c385afdca1e1c61dd651ae6b35
[2/2] ASoC: cs530x: Support for cs530x ADCs
      commit: 2884c29152c098c32e0041061f8327bcdb4e0697

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

