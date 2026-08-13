Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA743F8CF;
	Fri, 14 Aug 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707493; cv=none; b=poB44Eel47XQQb0V7Clwg0vZ8hLF/xq2xBndU95BytcFq22zSf+/d+4+DYetAzxyn76KXGJqRkoUIz/IORIFITU6WpB23ToEWvpbPPzYfRc8EXC8wkcrfmqq7N219usN4ylVhkiOsRemhVr9VrJNIArEDtOJPuDeR94jAGLtPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707493; c=relaxed/simple;
	bh=X+bkHMIykGMfgTnFl5dYB3gFs/d1nAs0ablI5dIyuq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gcgd0+InLhl5/Jv5VS4tsKATBNFdf5Yidnp1Hjb1Py2fO062HB3gAJOBmQuV6Iyx2gVhjmdbHsTWUSkXCqBfATWYCSPwnavTzezgn9GB6uZEp/ndRq9PFqiivd/ktIaG4T+MhKT2Zu6YKP4qcI2qvlnsd9Kc6SOANUG3OCKBE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KepxzxOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KepxzxOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F16A1F00A3F;
	Fri, 14 Aug 2026 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707490;
	bh=VxlozOHTV0l7kH01VkY8gMQr+CBC1D950EXG7JLaJQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KepxzxOdSYKlibc5rEqXOGzBXVMFs1aQ1AWkQvi595DOpbfObOGWdjN1Mc78QnPxf
	 CV6LbtEgYVhqByWeVVFCwzbE+vyfMQUqNunj2/5vGwu1hFYOwZHh43k67r52FshhyS
	 FVwAoFhKIxCB9dYoLpCWOs0dh/il8BKHZAPgpAWboFG+BfaHSEfwyyjhca3erZarrB
	 ymKGZb5iU0F+Vu+ZyEW9p4NUHFUEYDmTEjt79GSDWwVSKJTkub9/jb70BeNbGtQXTJ
	 wM5jHPePD3YVU8y8V3hwuHP6NFTP3rXTC8OrMmO2RuJXFgfiZPWwr92Vs1XIZzi+Bk
	 7Kqrz048g5HMw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-rockchip@lists.infradead.org, phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/14] ASoC: rockchip: Simplify probe error handling
Message-Id: <178663242938.110398.4616104123339333100.b4-ty@b4>
Date: Thu, 13 Aug 2026 15:47:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=X+bkHMIykGMfgTnFl5dYB3gFs/d1nAs0ablI5dIyuq4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4dF0ELklDTaytUOl3gquXr3axUlVMYXBwQo
 1zxlqyUExOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+HQAKCRAk1otyXVSH
 0GiuB/4+eK/zn9anwX0PkYIkZrXfGhmYu9bJt/AudK1M4kG6Hscfr/jvlLrncqp0ySlP4PrVWZo
 y19XgIcfarO6vNf9pESDLYcK4TbEopvlwz1AimPqRRjFMUDVapCXMcA2XASw/JgwQ1HEHNB2hKW
 xRQMiNQe4DPLp6npE4yZVxMDChCMHuleA2qEGbioQGc+8dEDyzN0CkIJPa3koXXXMgai0SnIkc+
 lK/1rNPaXlqCdq/oCr0xhi5kVmMQH1lla/liD6ajFrGVQU/Xj3Bz22rRhLfv2Stqed1Y28Tt/bn
 NZhofyWyJK5k3oUKIBtzLsE6J4ZHJy9BNEnSUeWuMxAD2tW1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 12:21:22 +0700, phucduc.bui@gmail.com wrote:
> ASoC: rockchip: Simplify probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies probe error handling across Rockchip ASoC drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/14] ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/931f4a1223e1
[02/14] ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error handling
        https://git.kernel.org/broonie/sound/c/06f5854050f5
[03/14] ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
        https://git.kernel.org/broonie/sound/c/b5e4b1159743
[04/14] ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/c1bf7ae0c87a
[05/14] ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from devm_pinctrl_get()
        https://git.kernel.org/broonie/sound/c/be4f82d15235
[06/14] ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
        https://git.kernel.org/broonie/sound/c/334d5ea7582b
[07/14] ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/9fea4805ed95
[08/14] ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/de983524dcbe
[09/14] ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/7d3f7eb890f1
[10/14] ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/b300f1313b00
[11/14] ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
        https://git.kernel.org/broonie/sound/c/c97bdbf862c6
[12/14] ASoC: rockchip: rockchip_sai: Return the original error code
        https://git.kernel.org/broonie/sound/c/7a2229ef7cdb
[13/14] ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/26c9632c33f7
[14/14] ASoC: rockchip: spdif: Return the original error code
        https://git.kernel.org/broonie/sound/c/5784ef446847

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

