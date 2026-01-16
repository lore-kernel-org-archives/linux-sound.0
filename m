Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AD261B71;
	Fri, 16 Jan 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569752; cv=none; b=OvnG/k36DEwqKIoYAaJyayPQejf5oVBtNr3babJyVDZy0w3LSendS5T6YgPQs4dBExcmo+BWkviAE1nrTS/t5ev3qIDtEDkz8Lwfvz4vo+uIIUtkw4dApj0MMt1EV63WfKEkY7WZEGSnFzL3UYqxWQEP7U0bUbSnWuqmrkRQe4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569752; c=relaxed/simple;
	bh=2VEdYo29uWhDiLRP2fq9J98xnEkof/Pep3fKzqyIui4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jqFILh6d6rDl/4SCg1dHHmPBEULUesJgn6vMVeC9xwnOuvB0ekf4AR1oFwzH4H6oDjaXJyOEmZ1ui8TiwBPSVb4jo7/3hf/uQaV06xw3GkCbZY1Q/+ABehqFnu+hiooRSoHA/lv2mDhLRRVhMoHqqV3eXrxl/t3bMM87hJszfq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkQxmtjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkQxmtjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A21AC116C6;
	Fri, 16 Jan 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569751;
	bh=2VEdYo29uWhDiLRP2fq9J98xnEkof/Pep3fKzqyIui4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MkQxmtjSLAsRu38Ok5ugheI+luIhbZtgYVTZxIS662au2cdG/G9XcEvn84fHnVa13
	 B+2NL3xg0PZytmkATpKmzSIzsQwbXZjM6tvl5y5pStCLZq6SKH8sGKwe2uAz2cLSE1
	 dS4EMm69bYvYHTTJqKnNVpD3aJLO4xiZC6VgNlk08Tgb0YSOViBXvak44NuqFr1zyO
	 lojMSVY/y3gXI/Kczfm9+vkRvwFkepm4ZZGwFRUo+qsQ1rZIgcUdQ84s9LAnZ31lI5
	 IYvyPZEMZ7vWirvpsGWy3zid0tyhnITI6wDeUiB6FcDwcUmTlX8ZD242S4o+6ayuLS
	 L4euapTRhHURA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, 
 matthias.bgg@gmail.com, julien.massot@collabora.com, 
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Message-Id: <176856974724.65310.2260409999915258318.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 13:22:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 15 Jan 2026 13:56:20 +0100, AngeloGioacchino Del Regno wrote:
> This series addresses most of the MediaTek MT8192 dtbs_check warnings
> by adding a missing SPI NOR flash compatible string and fixing both
> the audsys binding and devicetree node name.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
>   arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
>     audio-controller
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
      commit: 60e8451be1f7af4b51540f2cfd65c9c85af752e9

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

