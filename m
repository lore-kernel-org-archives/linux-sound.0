Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C50305E3B;
	Mon, 27 Apr 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285226; cv=none; b=eZDPelokRfLmhjkF6q/Kuuiffj0SpfZoUJSjxzuxIJpscB79M5QidOTdVLyRCMkP94drgdZ/B3tJmbto9JHV3OmNMQSH/Hc/Gi0SlKOtLBAR0MwkrBGzmKGrYrkWEyzOmbPjicAvwHEQs6vrEX0gI1Ckjyu/kR1yV+WUgWiPPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285226; c=relaxed/simple;
	bh=NhCAOaKAon5sq23oNjs0R3LpQS4MmUsU3jGRLCPg8Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cRjRDX4Ba6LFJ0ATMhcm32q/zFYL1e+luyPAULTvAY2NAUdQ0VXXhoCcezTv7ikjn26HB620MrjkPn85WkG6M3bghkJJaSGclEfvlv33TQn+HlXhTRQfeUcSqaBt7rYfFgq3gOXQ6hPaIQFARvdgy7NhcxG67cQXvqwVKh/qP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwRK+Svw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwRK+Svw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72447C19425;
	Mon, 27 Apr 2026 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285226;
	bh=NhCAOaKAon5sq23oNjs0R3LpQS4MmUsU3jGRLCPg8Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uwRK+SvwQLoJIqFsCUAvgwb/Vdi1uHTUc/hHXiXV1gtVR1XtcvmntT/gPz0rx3pnQ
	 DDSyLC+zFylgmZaqHBdnPQRnf4p2tLq+fFJugv+lF6QA8aamOc4yoJxBiTSxqGOcCw
	 mx6sRwjOdq78A3An2QIw97NYBeEyFH4lR/E1FVvtimYCE9lazpEvdCaQoxZP3kugzw
	 X6wSRpGa26TlZioqv52Pu8IeiPGCnvhmGpFJPrb8x6XYeVubGbPqpKI1WTe61e7+nW
	 2Ku117QnGsqQAjTkK9+BNwtIo/G0a36XVgss5PwY1VkIgbOUFxQ6Pk40LyEW6p1tPI
	 8bKTF8vJw/fkA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Rob Herring <robh@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20260404183547.46509-1-marex@nabladev.com>
References: <20260404183547.46509-1-marex@nabladev.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK
 swap support
Message-Id: <177724631903.266775.17442968887704831835.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:31:59 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NhCAOaKAon5sq23oNjs0R3LpQS4MmUsU3jGRLCPg8Mo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsz3FmmneNVOFn7SZNTo0BDX3rxPtyH/1OwlebkH+lUcc
 r5w6Nd2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATmSnK/r/6USr3X/7Lmvtt
 Nur2TJnC9ZTJMHFdX2C/ueRL6Ut/9U+IeyaKOuTVeqrP+HvdZfN8vsv/mEoYZUQlNm7wubFwipk
 Cw9pFevWGb2R2z/6UpFJqWjw9msd/BmPvgrcZZv3NQoqMYctz+8/7mtpsijs5U9P/Z07GFM0gj9
 SfxrFTFtj5PpzjeKtmtUVhWkzxHrHtra7yp9d47ZkfbhWXHLs596DeNfOIzBbJ6Fz94wsz+oNmv
 3k2iUXYfkbhgzgbjy7R3703P2wMm7NF4e7qb+H3uAQLEy43+mipyRR01K0RXpcW26ddLphVssu0
 ftX9QxfOHNz175znh0TON3brAro+X++tTlc9xO+yMJ4dAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Apr 2026 20:35:00 +0200, Marek Vasut wrote:
> ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap support
      https://git.kernel.org/broonie/sound/c/9897a9776681
[2/2] ASoC: fsl_sai: Add RX/TX BCLK swap support
      https://git.kernel.org/broonie/sound/c/dc06cf4268a4

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

