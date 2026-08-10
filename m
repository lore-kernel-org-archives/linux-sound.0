Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF13B5E08
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401806; cv=none; b=SoU8wnBxQT7jSlVOwq7d0+ffBFJnsaAZpJqz0qampZiEGKuoyfBZpKRlN45xcHUzHisOtXegZAU2HoLOcJrxHrEwCgnbv6MNl7eVzCQQhhUjGH0GF1pCuwGFnlK3oPAlRpZn7FhJtYR93YEGaDbwgwxv+e4e7tG0k97EHKu8pJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401806; c=relaxed/simple;
	bh=m+hL7h+k2Fp8v8A/ZSxwi7exg7N+l7U5qhpHRFuIIww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KGYmrGauLNtx00jJBri/bNiBynVuZ8fn289srg5wns+Qy+Y4cv+BI1pbNYlo89Q/lWIBtwtOgmnLcu432HKAMd3kAoA0DEnVymwFGXOQLPTiwbYVLFkFuFwi7B21z1MKfkvUtQnuSs/MUdfOnEHzYH9R9r4xfoiUHJuwGyCQiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXQQKCQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXQQKCQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E4A1F000E9;
	Mon, 10 Aug 2026 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401805;
	bh=1QGU4yPc5Vsd+1J7CMay8ekvfukE1qAbJtDy+wmpN00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lXQQKCQgDhnDgNBkMhozXGtTsxHDs/A//hYMR/H8XdueeDABbFd/usIMe4XJd+yY5
	 iWmK97er4dOLCN8aANcWj0EVM+8GFcw2IeQmXMNBckFQ91QMt5UdaVO/A+H2FXCyhE
	 xIOdyO21/uEt3kBA3BFiYtsEr6E+r+WsFV4xQQvfH0j81PHHNhImOxTi+wklOpGwie
	 XvcJ52Hu26f1/E53J1TA9l3EU8jOhuduz7dnN1eyX4/gIfc0xsVipKLqbVoeQ7xSUO
	 Ch7l8C4t0/PMet2eYYKvGUsPqM54hqbywm4/CSveDGQ3aO0W4uH3PEoO/kgbVrfWTp
	 LNFUPvJlaieZA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Baojun Xu <baojun.xu@ti.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>, Kevin Lu <kevin-lu@ti.com>, 
 Kiseok Jo <kiseok.jo@irondevice.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Nick Li <nick.li@foursemi.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Oder Chiou <oder_chiou@realtek.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sen Wang <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Subject: Re: [PATCH v2 00/31] ASoC: Use auto-cleanup for firmware loading
Message-Id: <178637260703.155010.15309712287046900636.b4-ty@b4>
Date: Mon, 10 Aug 2026 15:36:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m+hL7h+k2Fp8v8A/ZSxwi7exg7N+l7U5qhpHRFuIIww=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqelQHnjyv1V2wbJiyHfCNPFI1scqJgmnSq+9K0
 wvRRZS8NsuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanpUBwAKCRAk1otyXVSH
 0OkyCACA2QUgGddXym8xnkdH2WDVWcUZcBrWTMNEVX+nQAp7+35y+mnOQa/Xq/w93npuGlFdWdt
 CBl2F5qivmc/TTOdOy46jGICYSe7QeezPsnamhacdv2ukICgWNo3JfU7lW04yXAIff2qRP62IFu
 jiAPTTFMFn3LxwEEZoMjySJgWh1vdm8tkCyi8QwSw/SJ1ZhQgDUeLN9WxXymDu8Iw5WbGtHx3FC
 mA7chL9ngBCdUNbeN/kpVjdvEE8EBDZvdjo0yclZzYOWF/tyrYEefITveVwOc6jASVQkdv/5bCS
 tW0YBPxb6OVv7l7J1zxoshvdqOgcfoes1caFEjFo9x8ydqGG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 15:59:32 +0200, Takashi Iwai wrote:
> ASoC: Use auto-cleanup for firmware loading
> 
> Hi,
> 
> here is a revised series of trivial patches to use the auto-cleanup
> (via __free(firmware)) for firmware management.
> Now compile warnings due to the mixture with goto have been addressed
> for rt1320-sdw and wm2000 drivers.  Others remain identical, just took
> a few review Acks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/31] ASoC: aw87390: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/3eea69748a49
[02/31] ASoC: aw88081: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/a26aa707bdf6
[03/31] ASoC: aw88166: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/dba82cc76661
[04/31] ASoC: aw88261: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/037729f509fe
[05/31] ASoC: aw88395: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/d8e40355d9a3
[06/31] ASoC: aw88399: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/1767b85125e2
[07/31] ASoC: fs-amp-lib: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/aec8a1e14a80
[08/31] ASoC: hdac_hda: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/a57beee8f816
[09/31] ASoC: max98390: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/b37d70e5bfc3
[10/31] ASoC: ntpfw: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/5dd15c805eef
[11/31] ASoC: pcm6240: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/c0124e91a9f2
[12/31] ASoC: peb2466: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/38a3855d0c37
[13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/a372669b8dec
[14/31] ASoC: rt5575: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/c36d435b7455
[15/31] ASoC: rt5677: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/0582725c6b42
[16/31] ASoC: rt722-sdca: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/d8c13497200f
[17/31] ASoC: sigmadsp: se auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/4eea8eb99d6c
[18/31] ASoC: sma1307: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/2afbdeb48302
[19/31] ASoC: tas2781: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/37cb22498fa8
[20/31] ASoC: tas5805m: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/834c7c851179
[21/31] ASoC: tlv320aic31xx: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/e420e87ddc9a
[22/31] ASoC: wm0010: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/148f54aecccc
[23/31] ASoC: wm2000: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/2db054a5efa5
[24/31] ASoC: zl38060: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/b6ba77dfeb2a
[25/31] ASoC: fsl: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/997261a59b94
[26/31] ASoC: Intel: avs: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/6a052cf54fa1
[27/31] ASoC: Intel: catpt: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/a0dae90ea966
[28/31] ASoC: qcom: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/c5663770970c
[29/31] ASoC: renesas: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/81ab98716983
[30/31] ASoC: SDCA: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/73a5271e10da
[31/31] ASoC: SOF: Use auto-cleanup for firmware loading
        https://git.kernel.org/broonie/sound/c/6d0a9e4df179

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

