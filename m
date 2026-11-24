Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620157;
	b=0VvrfTti0LLEUTMfc6T4FToUEg5vvO6VG35yY17wD+mFguWBDFXGROVMAOuIe8l7wmt4
	 +o+vk4wIvyNx53QfKM3bHSZkCfMQzmt7oyIygYbegucejgsKwpcw8YtROejhyvt3WkItL
	 AJoTrYgibkD6iReTFPSn3iv0BxoRl1Kl2Txpup/MBSk+GNM54OPmp0RpDVYb4YK0lUFA5
	 QkDGtHV2pMGE7tJ8TQoPZrATakMlFa6t2F2mujugBCP/M1DqHizYoPa5eG/mwz+NEqrwK
	 ye+16iJxrxhVpyZvJ0MIlGIZvJuDdGc/znFvAFBn27lIBHyFwq8hcMAlrlxFx+ZRRKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620157;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=j1K5ewHys/5t3EL0s+jWiptRbODzjRlYhbYqEXH+Sgo=;
	b=yUJyiNeIn3z9zenYroJZKY+0WJ0kaEPgbDpnDhgd4V2ieLb8YSAmHaQm5tMfN4l2aTqy
	 v56TGlAPwMSPb77NajG9vDxwQB9/5XAHi0/zNeJY6Xf2gel5VWzqJGwOXQf16cbz70eb5
	 XrMk8nzV1qloxcnnKVDf/+QgFzK+czAwHWXWS2MyTynI+VV3SaKNgXGfz6G2DTCOdVoHw
	 3CVFJL4u0eb08qNgDcXyT/vNJxgbwW5pEh1rgUPRg6D+EMgAk+wipa0tGIDGMK1pPUSP1
	 xoTwjRnhPBtiMGSkAzzWKXCKO5txFLw6ZTO3O5IVdWCutSLB+X6O7L8E2nZ/2/WMlEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPM+OkcG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED8606A33D;
	Wed, 25 Nov 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPM+OkcG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4C41F000F4;
	Wed, 25 Nov 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620156;
	bh=j1K5ewHys/5t3EL0s+jWiptRbODzjRlYhbYqEXH+Sgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hPM+OkcG1sXtgx5Wxj2RH5GbNjqJRQ550/a+wBrK3G9XY6yMjBY76ZtGQk6nX8irV
	 26GH8FV4g5dyFgq/QUooRTE5Jr24+cS5FV6ukbU6bz3+2e5JLy4sizWgeRuVWd5duq
	 +/ESX0cGjcNitwMHfG/ozGCkXFsb06hD6NiRz5fbLacFOjrWwokjNASQvBnlPpDtK9
	 uzLvreSsTHC3eFN1Nht1Mn7cVpP3cMGOHgNzMycD0XYGTZWhwjz+dMgdM7xIV24WlY
	 Zbp0szHBAYX7CLl5GDB9S4LZwkKA9TE4ndGEA37annqDwjJ9ExE29svoRbB6zQddxl
	 +mtqqg5LIXVgw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, git@amd.com
In-Reply-To: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
Subject: Re: [PATCH 0/3] ASoC: xlnx: spdif: switch to the common clock
 framework
Message-Id: <179554501801.947306.5510285230833292211.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:30:18 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m1Bh2olESyCCYp8JXYIX86p20sRKXCcRHfKKlZvkiQg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/lqE+fZyTU0IXabp8PtKTOx2f2O7bSEbdz68fEjw6
 0TJ4BL7jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkVx3D//qy3y/5z1R/+/B4
 wkyej48VtnR7Kl5NvhERGXXz0ZbvXdcYGbbceur/rYRj7ZUT6+sPXev2XRAwmbmwIcyd7XHQiks
 tfqwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 14:27:36 +0530, Dhanunjanrao Katta wrote:
> ASoC: xlnx: spdif: switch to the common clock framework
> 
> The Xilinx SPDIF/AES3 IP is fed by three clocks, but the binding
> described only two of them and the driver requested only one. The audio
> clock frequency was instead passed as a plain number in the custom
> "xlnx,aud_clk_i" property, and the driver relied on the firmware to
> leave the audio and AXI4-Stream clocks running.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream and audio clocks
      https://git.kernel.org/broonie/sound/c/8a2e765cec00
[2/3] ASoC: xlnx: spdif: namespace register macros and use a divider enum
      https://git.kernel.org/broonie/sound/c/8090aeadf3a0
[3/3] ASoC: xlnx: spdif: get clocks through the common clock framework
      https://git.kernel.org/broonie/sound/c/91c90b881e55

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

