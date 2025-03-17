Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BDC20469B
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248464; cv=none; b=CEAqWCKxdUbPtoxBAT4rG32OlkdoEkszlzhST/FxZcn5tAoHGB7Q2TtTvDN+vfMPAXY47Hmk10FnBxP9RpxSvlg8JXE0iss+cgRkwUXXYlNrTB+CAQuqf2AjWizWBtzqqCm/ICBl0UJKrWGcM62Z3omDdrHPfpRezxo+5ysvAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248464; c=relaxed/simple;
	bh=wnhIK4V9u1T9AQaxgELuY1bMKBSzKq0fhM4PaYdpwI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JPoUFjmfKVfmV+FnQlRfHGUXZuVV8eKywPrJAjb9czr+dZX4xe5mUzkxg/egFiJwEO2+RchpH5NhA61368CU0yKMbNG/bamVQZESzVkjTqzPiwsHzQJsPWWsysr12e5uwrQ0xvfiSo5iaj1AOKr92OvXi3CmdPEBxY6huHW/s4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot+VuHf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot+VuHf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613EDC4CEED;
	Mon, 17 Mar 2025 21:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742248464;
	bh=wnhIK4V9u1T9AQaxgELuY1bMKBSzKq0fhM4PaYdpwI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ot+VuHf9Ij8nfFyEyxMm5CP81RvYrgQCH53/D2bdjo/d5QBAJ1+s0jhQ4f/CQGy8r
	 dGRK7rBKQrFGAwDwQANqABJ290rzeQBFkDSuQs/xN/qDyq0JbdQ/6NB/j9hhKf6pv8
	 BG4aOxfY63QpY0FU7HLmAK7TkVCXrDUFYeEIdDGjnp2A8nnuOALKo7PgUox+RKPDl9
	 l2sc/AawH9fKpArM49E0LEr//e1KoXN+ALdIPK4je3V02tGuL9d6My+Ox47ty59uOk
	 lFbFswA+r5KNrGvG8Ny35SgL8+C3mZbQ9xwIsLpQ209s9PPCI+dh6Gdz/YTIuWurz9
	 /jXdM3EFoSaGQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Subject: Re: [PATCH 00/89] ASoC: Convert to modern PM macros
Message-Id: <174224846312.355189.9746492931986191368.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 21:54:23 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 13 Mar 2025 18:40:05 +0100, Takashi Iwai wrote:
> This is a series of small and trivial patches to convert to the newer
> PM macros, e.g. from SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS().
> 
> The conversions are systematic, and we could reduce messy
> __maybe_unused and ifdefs with those changes.
> 
> Merely code refactoring, and shouldn't change the actual driver
> behavior.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/89] ASoC: au1x: Convert to DEFINE_SIPMLE_DEV_PM_OPS()
        (no commit info)
[02/89] ASoC: ak4375: Convert to RUNTIME_PM_OPS() & co
        commit: 5f3aeb44694fbd6ebc8790cfcf157f2f7f072207
[03/89] ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
        commit: 9f9c8e9064ea8ceb13540a283f08550c097bb673
[04/89] ASoC: ak5558: Convert to RUNTIME_PM_OPS() & co
        commit: 5ef209dcdc3fe8f9661a80af4c8ed7a2326c9206
[05/89] ASoC: cs35l32: Convert to RUNTIME_PM_OPS()
        commit: 5b73cae57a02ff461c260e68193ce973062cc0bb
[06/89] ASoC: cs35l33: Convert to RUNTIME_PM_OPS()
        commit: 7d1d8f90e456e2945cd3a1a4a429fdb634ec6f42
[07/89] ASoC: cs35l34: Convert to RUNTIME_PM_OPS()
        commit: 1d6128f56c01a417ee3c9d80b4c205da6399d661
[08/89] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()
        (no commit info)
[09/89] ASoC: cs4234: Convert to RUNTIME_PM_OPS()
        commit: fd24b93ebaa1be78bf683a6a0599856eda367155
[10/89] ASoC: cs42l42: Convert to RUNTIME_PM_OPS() & co
        commit: 227b132349825b52ded464e71271751aceb4b4c9
[11/89] ASoC: cs42l51: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 92104ed88e7c2f1a10cb72f5372107136738c2c9
[12/89] ASoC: cs42l83: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 850910df7a5ce514f4b4d4d7ba4020abf9254b6d
[13/89] ASoC: cs42xx8: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 7b7e2292e0ba84515e62147a47b79e1f81f47b1c
[14/89] ASoC: cs43130: Convert to RUNTIME_PM_OPS()
        commit: 9a1d4a56565161a8bbf5b2a9d92665010303aeac
[15/89] ASoC: cs4349: Convert to RUNTIME_PM_OPS()
        commit: 2492a736dd8959b8860ca7f7afcd395314c9c436
[16/89] ASoC: cs53l30: Convert to RUNTIME_PM_OPS()
        commit: 646443af4452793090d34da2c70d5ed126f174bd
[17/89] ASoC: cx2072x: Convert to RUNTIME_PM_OPS() & co
        commit: 81f150d4b96d73feecda475f500f460565344255
[18/89] ASoC: da7213: Convert to RUNTIME_PM_OPS() & co
        commit: 948cf1681e2ee077969df1e672f4c4d856059937
[19/89] ASoC: hdac_hdmi: Convert to RUNTIME_PM_OPS() & co
        commit: 218b32ca6c63db19ba0f4ad4fe83dc7c18e21bcb
[20/89] ASoC: lpass: Convert to RUNTIME_PM_OPS()
        commit: efd74b16af66d3ab2e65a68d6ff171ae2b4ecf21
[21/89] ASoC: max98090: Convert to RUNTIME_PM_OPS() & co
        commit: f744bcb575f7e25d871532e731398b99de32953d
[22/89] ASoC: max98373: Convert to RUNTIME_PM_OPS() & co
        commit: db001865fdbc6ee446660a06f00437fbb72cfe9c
[23/89] ASoC: max98390: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 69b638e8d4347113183496684de5f3ac2a1db4b6
[24/89] ASoC: max98396: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: c009893bc5864d55b0b0cc349413a0eaa2bc17cc
[25/89] ASoC: max98520: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: b352343e448c45940116dc4a089a288fd820dee9
[26/89] ASoC: max9860: Convert to RUNTIME_PM_OPS()
        commit: d0029e0a78672932367478e5b3479edfa2738ec0
[27/89] ASoC: max98927: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 113d29a94410ff292be090949c43911b11c4d32a
[28/89] ASoC: mt6660: Convert to RUNTIME_PM_OPS()
        commit: aa912611c43006e628d14e9319402a77ab0bf97c
[29/89] ASoC: pcm512x: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 85e8d0f37879f8761dbd137dbdad720fbe7929ca
[30/89] ASoC: rt1017-sdca-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: b83ab4fb2c6e7c15f769653118243b0974f4c885
[31/89] ASoC: rt1308-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 7130c4302b9229dda655235321c34bd5e6dde82e
[32/89] ASoC: rt1316-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: dfe8999a4f5ca8f8c67751310d0421e1bfbbae6d
[33/89] ASoC: rt1318-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: d0bb681f8e9a418e396e6b471866197ecc30bd00
[34/89] ASoC: rt1320-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 3eedadf3d7049e3ab2c49cf7f444e8f296327ba0
[35/89] ASoC: rt5514: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: fdf698fa3ff22e504505a7c32f9671c5fbbd5513
[36/89] ASoC: rt5645: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 71ba303a04ed5b314c88ed0c2eb771cf1df5d215
[37/89] ASoC: rt5682-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: ef57148d2cea0c267504642eaff36da3df953496
[38/89] ASoC: rt700-sdw: Convert to RUNTIME_PM_OPS() & co
        commit: 569f75535df2d2cdc5197033c9955bedcd2f50e6
[39/89] ASoC: rt711: Convert to RUNTIME_PM_OPS() & co
        commit: 98cdea5b7acd06e7b188ce40c7450a6240d1d0a8
[40/89] ASoC: rt712: Convert to RUNTIME_PM_OPS() & co
        commit: e4efc3694d8ab8cd7c0f230556d8457ad8d34899
[41/89] ASoC: rt715: Convert to RUNTIME_PM_OPS() & co
        commit: a83d01d19ef285f279331ffb7d4c6f9a37201c15
[42/89] ASoC: rt721: Convert to RUNTIME_PM_OPS() & co
        commit: 8798eaedd6d756ea58832e222840b2e387707ede
[43/89] ASoC: rt722: Convert to RUNTIME_PM_OPS() & co
        commit: 957e8cb375e60699c7acf52c771fad5979cef359
[44/89] ASoC: rt9120: Convert to RUNTIME_PM_OPS()
        commit: 9aaa57d36f387df01762ced4e362bcb89872d80b
[45/89] ASoC: rtq9128: Convert to RUNTIME_PM_OPS()
        commit: 9eb264d115a55eb40b55c7481c113e6c56560700
[46/89] ASoC: tas2552: Convert to RUNTIME_PM_OPS()
        commit: 1570c33f2f38b6dff04ee1c7d7b38d1702e81b5f
[47/89] ASoC: ts3a227e: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 2db8e2c7c6f9cccfdcb1c710b9b3008b73eb5505
[48/89] ASoC: wcd937x: Convert to RUNTIME_PM_OPS()
        commit: 40a3111b8f18640885ad2041d52dc1d429cf60b1
[49/89] ASoC: wcd938x: Convert to RUNTIME_PM_OPS()
        commit: a0f0a8814ab4167992f958e804051ea4791b8603
[50/89] ASoC: wcd939x: Convert to RUNTIME_PM_OPS()
        commit: 6714a569c839c658f882b2f38bbe430a8778f261
[51/89] ASoC: wm2200: Convert to RUNTIME_PM_OPS()
        commit: 208a479d039202681f1b80a5ccbb2c72a494b55b
[52/89] ASoC: wm5100: Convert to RUNTIME_PM_OPS()
        commit: adcb5d32f7318b21d2a94d9542307801cb5e08c0
[53/89] ASoC: wm8804: Convert to EXPORT_GPL_DEV_PM_OPS()
        commit: 30200e61f8b8a72cf87f7ccd407c54049288f7be
[54/89] ASoC: wm8962: Convert to RUNTIME_PM_OPS() & co
        commit: 327e7dd45cea34e7a1334fcc35b9e122c05b181f
[55/89] ASoC: wm8994: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: ae5ad50b9fead07c8336a606ac36fbca9c73790d
[56/89] ASoC: wsa881x: Convert to RUNTIME_PM_OPS()
        commit: 6fb2ff498d5a2a06998e1bd61b0954fd71e6d718
[57/89] ASoC: wsa883x: Convert to RUNTIME_PM_OPS()
        commit: d09125c2c68cc95c300e2a63a04b9a3d37ba64ad
[58/89] ASoC: wsa884x: Convert to RUNTIME_PM_OPS()
        commit: 60c1c181139e2ebe138faafa4f5e4e695236c1f0
[59/89] ASoC: dwc: Convert to RUNTIME_PM_OPS()
        commit: fc12699cda764ea807db0b22db7f06d1acbabe8e
[60/89] ASoC: fsl: Convert to RUNTIME_PM_OPS() and co
        commit: d1baa8193fd8cb8d0088851b468c9b0c5874ff42
[61/89] ASoC: img: Convert to RUNTIME_PM_OPS() and co
        commit: 5580e82d222668dd0a484af5612f1d9ae938f075
[62/89] ASoC: intel: avs: Convert to RUNTIE_PM_OPS()
        (no commit info)
[63/89] ASoC: intel: catpt: Convert to RUNTIE_PM_OPS() & co
        (no commit info)
[64/89] ASoC: mediatek: mt2701: Convert to RUNTIME_PM_OPS()
        commit: 50ffa9e4d22db71ce370a8cde3bd2d706138df8b
[65/89] ASoC: mediatek: mt6797: Convert to RUNTIME_PM_OPS()
        commit: 6afabcdad370f117588dfd7203a803f050503c91
[66/89] ASoC: mediatek: mt7986: Convert to RUNTIME_PM_OPS()
        commit: 0d7c63bc74a8fdcfc37e093efaeb8657b0e21022
[67/89] ASoC: mediatek: mt8173: Convert to RUNTIME_PM_OPS()
        commit: 09b926f215df0206f1f3d8f4a2b4f4e28c68168e
[68/89] ASoC: mediatek: mt8183: Convert to RUNTIME_PM_OPS()
        commit: 564cb5ebb488a11708e63eb7cd8037accea7120d
[69/89] ASoC: mediatek: mt8186: Convert to RUNTIME_PM_OPS()
        commit: 26d342b04f5e9190487cd2e6fdce75c52cee4a86
[70/89] ASoC: mediatek: mt8188: Convert to RUNTIME_PM_OPS()
        commit: 49a70f2ed0a2a65aaf099dc45d73ba6b4f0c9c94
[71/89] ASoC: mediatek: mt8192: Convert to RUNTIME_PM_OPS()
        commit: ecd140a2063d618e1239351d3ae146cfdaa9a13f
[72/89] ASoC: mediatek: mt8195: Convert to RUNTIME_PM_OPS()
        commit: 951f082eb09b50d68b8271257777f206ee3001a8
[73/89] ASoC: mediatek: mt8365: Convert to RUNTIME_PM_OPS() & co
        commit: bd8540105e88581bdf27a9a92231907a9168d0b6
[74/89] ASoC: qcom: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 23a6b07ceff59eabb45543091416951711f0963e
[75/89] ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 4330d33f04ea71c9cfb193a0ae60fb40f6080a19
[76/89] ASoC: rockchip: Convert to RUNTIME_PM_OPS() & co
        commit: 43a2930348040b3a7ad3b809e211dea233267f28
[77/89] ASoC: samsung: Convert to RUNTIME_PM_OPS() & co
        commit: 692fc8ac774adb9ac86b607b9c8a59b4ddc53484
[78/89] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
        commit: 40456c8e7b9401d76363aebaae71763072b2e281
[79/89] ASoC: SOF: pci: Convert to EXPORT_NS_DEV_PM_OPS()
        commit: 24df03e2b43c8a66c0f235320177f7199dca47a9
[80/89] ASoC: SOF: of: Convert to EXPORT_NS_DEV_PM_OPS()
        (no commit info)
[81/89] ASoC: stm: Convert to SYSTEM_SLEEP_PM_OPS()
        commit: 7369a2d95878f427959980539549d0eb9ec4958c
[82/89] ASoC: sunxi: Convert to RUNTIME_PM_OPS()
        commit: 723b690723287c39b386dbf8dad8834c4acbc0ef
[83/89] ASoC: tegra186: Convert to RUNTIME_PM_OPS() & co
        commit: 5f6e34c575b86becafbee0051b2eb47145b5af57
[84/89] ASoC: tegra210: Convert to RUNTIME_PM_OPS() & co
        commit: 083c6a6f79e724ff89394d6ab900028a2e99ff7b
[85/89] ASoC: tegra20: Convert to RUNTIME_PM_OPS() & co
        commit: b7055fc11dc66f5dda6ffc0d88d7ede09970b244
[86/89] ASoC: tegra30: Convert to RUNTIME_PM_OPS() & co
        commit: 212f5c4f1d45ffe43e52edc175f294426aba8ee7
[87/89] ASoC: xtensa: Convert to RUNTIME_PM_OPS()
        commit: c7ef05c0061acf505523133986adc47086265d99
[88/89] ASoC: amd: Convert to RUNTIME_PM_OPS() & co
        commit: 5f86b16c49a9d156a459c7e9e3ebcbbe9439953c
[89/89] ASoC: pcm3168a: Convert to EXPORT_GPL_DEV_PM_OPS()
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

