Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F479204851
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248465; cv=none; b=mfC4d18cQpU26JuLr/YFOZctxLjIgfgfpaiXAGCrR+ffqAbo/q4Bo0pQXFpfUq3Q1rbubAIJevZJqth6UkVnSFLG43qvnuBY/NzOP2eCd2PNu062XOmC2fEsV9appW+dAadZhgxjGsggAlaL+Liyek4oR6T0XemsEi9wA7s+Y+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248465; c=relaxed/simple;
	bh=x9ngZ2ArvxJszTQJdY+pjA00QcyTWqgkMCo6KUVxvHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rY/8/B11TzVZL2x4oGE2cKXE/Efb4sgdj6M30XAKglwwDHUnnfZSXDXz01/oQWM9QkdBBfr7V5nJV+N/XgwXwGSN1CwyjtMe6J3AmJd7iz2xYJrhdPWqjEujIHinUwmWaEWEIsQT/aJFNBYdpUnZDQKuyrMxzeK+Cp7mLoCMtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suZJJgVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suZJJgVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA36C4CEEE;
	Mon, 17 Mar 2025 21:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742248465;
	bh=x9ngZ2ArvxJszTQJdY+pjA00QcyTWqgkMCo6KUVxvHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=suZJJgVZ567jkLFtJ5K4dB6uw+wG+NJUX9/4XeTF58ta9OJczOLEzwBpBwT7wBeLQ
	 sOMSWpROIUopCdti313fTkwbYVoBpYBbJuQPYI1OHceuqWfaJ5uU0CpRbQR0aZWkRg
	 br2Wh/jxS9Xuw6Xzhy67c+Ni5a+T0/09PdQDEIoZzqz1NHv3K3S3IuyNK3uxnQSF39
	 s2urv3BybdMktsrtO0rSUxSqVzCRPmpldp1Lo8rDXGIm8fvPmlrWRCTjIwzRipghWn
	 ji+wWxVUey/g7AnuiSWD/vGQGjBMa67nZ5xBpLOyvjbyrWuCW/RGQBdZm4dn9dnKo3
	 wtDZeMIBcqKLg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Subject: Re: [PATCH v2 00/88] ASoC: Convert to modern PM macros
Message-Id: <174224846437.355189.10005555247190265917.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 21:54:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 17 Mar 2025 10:54:22 +0100, Takashi Iwai wrote:
> This is a revised series of small and trivial patches to convert to
> the newer PM macros, e.g. from SET_RUNTIME_PM_OPS() to
> RUNTIME_PM_OPS().
> 
> The conversions are systematic, and we could reduce messy
> __maybe_unused and ifdefs with those changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/88] ASoC: au1x: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
        commit: 958448bfee503d24e706605f01b98d3ce547d1bd
[02/88] ASoC: ak4375: Convert to RUNTIME_PM_OPS() & co
        commit: 5f3aeb44694fbd6ebc8790cfcf157f2f7f072207
[03/88] ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
        commit: 9f9c8e9064ea8ceb13540a283f08550c097bb673
[04/88] ASoC: ak5558: Convert to RUNTIME_PM_OPS() & co
        commit: 5ef209dcdc3fe8f9661a80af4c8ed7a2326c9206
[05/88] ASoC: cs35l32: Convert to RUNTIME_PM_OPS()
        commit: 5b73cae57a02ff461c260e68193ce973062cc0bb
[06/88] ASoC: cs35l33: Convert to RUNTIME_PM_OPS()
        commit: 7d1d8f90e456e2945cd3a1a4a429fdb634ec6f42
[07/88] ASoC: cs35l34: Convert to RUNTIME_PM_OPS()
        commit: 1d6128f56c01a417ee3c9d80b4c205da6399d661
[08/88] ASoC: cs4234: Convert to RUNTIME_PM_OPS()
        commit: fd24b93ebaa1be78bf683a6a0599856eda367155
[09/88] ASoC: cs42l42: Convert to RUNTIME_PM_OPS() & co
        commit: 227b132349825b52ded464e71271751aceb4b4c9
[10/88] ASoC: cs42l51: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 92104ed88e7c2f1a10cb72f5372107136738c2c9
[11/88] ASoC: cs42l83: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 850910df7a5ce514f4b4d4d7ba4020abf9254b6d
[12/88] ASoC: cs42xx8: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 7b7e2292e0ba84515e62147a47b79e1f81f47b1c
[13/88] ASoC: cs43130: Convert to RUNTIME_PM_OPS()
        commit: 9a1d4a56565161a8bbf5b2a9d92665010303aeac
[14/88] ASoC: cs4349: Convert to RUNTIME_PM_OPS()
        commit: 2492a736dd8959b8860ca7f7afcd395314c9c436
[15/88] ASoC: cs53l30: Convert to RUNTIME_PM_OPS()
        commit: 646443af4452793090d34da2c70d5ed126f174bd
[16/88] ASoC: cx2072x: Convert to RUNTIME_PM_OPS() & co
        commit: 81f150d4b96d73feecda475f500f460565344255
[17/88] ASoC: da7213: Convert to RUNTIME_PM_OPS() & co
        commit: 948cf1681e2ee077969df1e672f4c4d856059937
[18/88] ASoC: hdac_hdmi: Convert to RUNTIME_PM_OPS() & co
        commit: 218b32ca6c63db19ba0f4ad4fe83dc7c18e21bcb
[19/88] ASoC: lpass: Convert to RUNTIME_PM_OPS()
        commit: efd74b16af66d3ab2e65a68d6ff171ae2b4ecf21
[20/88] ASoC: max98090: Convert to RUNTIME_PM_OPS() & co
        commit: f744bcb575f7e25d871532e731398b99de32953d
[21/88] ASoC: max98373: Convert to RUNTIME_PM_OPS() & co
        commit: db001865fdbc6ee446660a06f00437fbb72cfe9c
[22/88] ASoC: max98390: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 69b638e8d4347113183496684de5f3ac2a1db4b6
[23/88] ASoC: max98396: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: c009893bc5864d55b0b0cc349413a0eaa2bc17cc
[24/88] ASoC: max98520: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: b352343e448c45940116dc4a089a288fd820dee9
[25/88] ASoC: max9860: Convert to RUNTIME_PM_OPS()
        commit: d0029e0a78672932367478e5b3479edfa2738ec0
[26/88] ASoC: max98927: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 113d29a94410ff292be090949c43911b11c4d32a
[27/88] ASoC: mt6660: Convert to RUNTIME_PM_OPS()
        commit: aa912611c43006e628d14e9319402a77ab0bf97c
[28/88] ASoC: pcm512x: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 85e8d0f37879f8761dbd137dbdad720fbe7929ca
[29/88] ASoC: rt1017-sdca-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: b83ab4fb2c6e7c15f769653118243b0974f4c885
[30/88] ASoC: rt1308-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 7130c4302b9229dda655235321c34bd5e6dde82e
[31/88] ASoC: rt1316-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: dfe8999a4f5ca8f8c67751310d0421e1bfbbae6d
[32/88] ASoC: rt1318-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: d0bb681f8e9a418e396e6b471866197ecc30bd00
[33/88] ASoC: rt1320-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 3eedadf3d7049e3ab2c49cf7f444e8f296327ba0
[34/88] ASoC: rt5514: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: fdf698fa3ff22e504505a7c32f9671c5fbbd5513
[35/88] ASoC: rt5645: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 71ba303a04ed5b314c88ed0c2eb771cf1df5d215
[36/88] ASoC: rt5682-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: ef57148d2cea0c267504642eaff36da3df953496
[37/88] ASoC: rt700-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 569f75535df2d2cdc5197033c9955bedcd2f50e6
[38/88] ASoC: rt711: Convert to RUNTIME_PM_OPS() & co
        commit: 98cdea5b7acd06e7b188ce40c7450a6240d1d0a8
[39/88] ASoC: rt712: Convert to RUNTIME_PM_OPS() & co
        commit: e4efc3694d8ab8cd7c0f230556d8457ad8d34899
[40/88] ASoC: rt715: Convert to RUNTIME_PM_OPS() & co
        commit: a83d01d19ef285f279331ffb7d4c6f9a37201c15
[41/88] ASoC: rt721: Convert to RUNTIME_PM_OPS() & co
        commit: 8798eaedd6d756ea58832e222840b2e387707ede
[42/88] ASoC: rt722: Convert to RUNTIME_PM_OPS() & co
        commit: 957e8cb375e60699c7acf52c771fad5979cef359
[43/88] ASoC: rt9120: Convert to RUNTIME_PM_OPS()
        commit: 9aaa57d36f387df01762ced4e362bcb89872d80b
[44/88] ASoC: rtq9128: Convert to RUNTIME_PM_OPS()
        commit: 9eb264d115a55eb40b55c7481c113e6c56560700
[45/88] ASoC: tas2552: Convert to RUNTIME_PM_OPS()
        commit: 1570c33f2f38b6dff04ee1c7d7b38d1702e81b5f
[46/88] ASoC: ts3a227e: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 2db8e2c7c6f9cccfdcb1c710b9b3008b73eb5505
[47/88] ASoC: wcd937x: Convert to RUNTIME_PM_OPS()
        commit: 40a3111b8f18640885ad2041d52dc1d429cf60b1
[48/88] ASoC: wcd938x: Convert to RUNTIME_PM_OPS()
        commit: a0f0a8814ab4167992f958e804051ea4791b8603
[49/88] ASoC: wcd939x: Convert to RUNTIME_PM_OPS()
        commit: 6714a569c839c658f882b2f38bbe430a8778f261
[50/88] ASoC: wm2200: Convert to RUNTIME_PM_OPS()
        commit: 208a479d039202681f1b80a5ccbb2c72a494b55b
[51/88] ASoC: wm5100: Convert to RUNTIME_PM_OPS()
        commit: adcb5d32f7318b21d2a94d9542307801cb5e08c0
[52/88] ASoC: wm8804: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 30200e61f8b8a72cf87f7ccd407c54049288f7be
[53/88] ASoC: wm8962: Convert to RUNTIME_PM_OPS() & co
        commit: 327e7dd45cea34e7a1334fcc35b9e122c05b181f
[54/88] ASoC: wm8994: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: ae5ad50b9fead07c8336a606ac36fbca9c73790d
[55/88] ASoC: wsa881x: Convert to RUNTIME_PM_OPS()
        commit: 6fb2ff498d5a2a06998e1bd61b0954fd71e6d718
[56/88] ASoC: wsa883x: Convert to RUNTIME_PM_OPS()
        commit: d09125c2c68cc95c300e2a63a04b9a3d37ba64ad
[57/88] ASoC: wsa884x: Convert to RUNTIME_PM_OPS()
        commit: 60c1c181139e2ebe138faafa4f5e4e695236c1f0
[58/88] ASoC: dwc: Convert to RUNTIME_PM_OPS()
        commit: fc12699cda764ea807db0b22db7f06d1acbabe8e
[59/88] ASoC: fsl: Convert to RUNTIME_PM_OPS() and co
        commit: d1baa8193fd8cb8d0088851b468c9b0c5874ff42
[60/88] ASoC: img: Convert to RUNTIME_PM_OPS() and co
        commit: 5580e82d222668dd0a484af5612f1d9ae938f075
[61/88] ASoC: intel: avs: Convert to RUNTIME_PM_OPS()
        commit: 72954863350eff04a4961acb49bfce11416f7856
[62/88] ASoC: intel: catpt: Convert to RUNTIME_PM_OPS() & co
        commit: 2c498d9a3a5ad28d2cfbdffde8496626f1b89c82
[63/88] ASoC: mediatek: mt2701: Convert to RUNTIME_PM_OPS()
        commit: 50ffa9e4d22db71ce370a8cde3bd2d706138df8b
[64/88] ASoC: mediatek: mt6797: Convert to RUNTIME_PM_OPS()
        commit: 6afabcdad370f117588dfd7203a803f050503c91
[65/88] ASoC: mediatek: mt7986: Convert to RUNTIME_PM_OPS()
        commit: 0d7c63bc74a8fdcfc37e093efaeb8657b0e21022
[66/88] ASoC: mediatek: mt8173: Convert to RUNTIME_PM_OPS()
        commit: 09b926f215df0206f1f3d8f4a2b4f4e28c68168e
[67/88] ASoC: mediatek: mt8183: Convert to RUNTIME_PM_OPS()
        commit: 564cb5ebb488a11708e63eb7cd8037accea7120d
[68/88] ASoC: mediatek: mt8186: Convert to RUNTIME_PM_OPS()
        commit: 26d342b04f5e9190487cd2e6fdce75c52cee4a86
[69/88] ASoC: mediatek: mt8188: Convert to RUNTIME_PM_OPS()
        commit: 49a70f2ed0a2a65aaf099dc45d73ba6b4f0c9c94
[70/88] ASoC: mediatek: mt8192: Convert to RUNTIME_PM_OPS()
        commit: ecd140a2063d618e1239351d3ae146cfdaa9a13f
[71/88] ASoC: mediatek: mt8195: Convert to RUNTIME_PM_OPS()
        commit: 951f082eb09b50d68b8271257777f206ee3001a8
[72/88] ASoC: mediatek: mt8365: Convert to RUNTIME_PM_OPS() & co
        commit: bd8540105e88581bdf27a9a92231907a9168d0b6
[73/88] ASoC: qcom: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 23a6b07ceff59eabb45543091416951711f0963e
[74/88] ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 4330d33f04ea71c9cfb193a0ae60fb40f6080a19
[75/88] ASoC: rockchip: Convert to RUNTIME_PM_OPS() & co
        commit: 43a2930348040b3a7ad3b809e211dea233267f28
[76/88] ASoC: samsung: Convert to RUNTIME_PM_OPS() & co
        commit: 692fc8ac774adb9ac86b607b9c8a59b4ddc53484
[77/88] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
        commit: 40456c8e7b9401d76363aebaae71763072b2e281
[78/88] ASoC: SOF: pci: Convert to EXPORT_NS_DEV_PM_OPS()
        commit: 24df03e2b43c8a66c0f235320177f7199dca47a9
[79/88] ASoC: SOF: of: Convert to EXPORT_DEV_PM_OPS()
        commit: f8d952c5f77fb8c2791d0978a2f4d6c72965cbe0
[80/88] ASoC: stm: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 7369a2d95878f427959980539549d0eb9ec4958c
[81/88] ASoC: sunxi: Convert to RUNTIME_PM_OPS()
        commit: 723b690723287c39b386dbf8dad8834c4acbc0ef
[82/88] ASoC: tegra186: Convert to RUNTIME_PM_OPS() & co
        commit: 5f6e34c575b86becafbee0051b2eb47145b5af57
[83/88] ASoC: tegra210: Convert to RUNTIME_PM_OPS() & co
        commit: 083c6a6f79e724ff89394d6ab900028a2e99ff7b
[84/88] ASoC: tegra20: Convert to RUNTIME_PM_OPS() & co
        commit: b7055fc11dc66f5dda6ffc0d88d7ede09970b244
[85/88] ASoC: tegra30: Convert to RUNTIME_PM_OPS() & co
        commit: 212f5c4f1d45ffe43e52edc175f294426aba8ee7
[86/88] ASoC: xtensa: Convert to RUNTIME_PM_OPS()
        commit: c7ef05c0061acf505523133986adc47086265d99
[87/88] ASoC: amd: Convert to RUNTIME_PM_OPS() & co
        commit: 5f86b16c49a9d156a459c7e9e3ebcbbe9439953c
[88/88] ASoC: pcm3168a: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 15559cdeb9be5a0fe528cdc3f8b759a27ea8f943

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

