Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B334A3D8
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072727; cv=none; b=ko+NTzaEDazvS9ntc9vX7wnZkoPOFLteIogbr6RD6tBGks+KWDjpxgCtO9/4gotY8rFTxbn9+pLl2ANmjlbvyups/KoGpGHvgDJBBP1MMZsde8YeMf+9xOrAyd8cRj3M2PcBjyjn/F0ZI0SHNZBeITRMeOWPhLjcGzsYP/wyP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072727; c=relaxed/simple;
	bh=HLPovl4AFCW5jOSIT8YjtFAwTWSba0AmnyvHyqhgkcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dg464NSIqNHViHbbPpOTyw1RZex0SPnRxSKGWqnXEP9B4WkTCAcM6oNpBvoLTtROzLjDSZQSN+4YOLbLovyvpTIlGR4emOnetLjdqtvXEKD8vc+7HOfITDjxXVB9u/0Y9uUizHdzj0bgNSHCm5MgEsyp1BH9unhlzGUqUWUQxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr5comi8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr5comi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603FC4CEF1;
	Tue, 21 Oct 2025 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072726;
	bh=HLPovl4AFCW5jOSIT8YjtFAwTWSba0AmnyvHyqhgkcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sr5comi8kVHuJyQ2gUak45cX5kcz9SH1EEZ1KUjfdO/7VhYMcg6HX7Nbt2YOgTOCf
	 ZchrVoazYN/vUTls2uZSyWwbE2p0uDZKEqFeG7Q/OGWREPnaTsKkzJnQhyt7Rny7pY
	 TRZojlKCoR16ZP/m3Xu8L1qLbl2LY9MuGusQucz2CX2brKkgQtTP8cfbLPqTWcgCD7
	 wuthyyBwPrpXyYrDKZ4xtn75vZKk3YUQrcJ9UwACKtpCYIqBRo3Pjt7IXhxvLEYcG+
	 tByZWLX08f8fNIiNGqX+N1Gh4NoD2dVa9eNJS/RMfGvFgf4O5+GtziepHaCsntG0OV
	 Hd9NtN2wB/F2w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 000/139] ASoC: use snd_kcontrol_chip() instead of
 snd_soc_kcontrol_component()
Message-Id: <176107272531.196841.7775370497295136408.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 19:52:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Tue, 14 Oct 2025 04:19:10 +0000, Kuninori Morimoto wrote:
> We would like to hide struct snd_soc_dapm_context from driver. So we need
> cleanup code first. Current ASoC have very similar functions (A)(B).
> 
> 	(A) snd_soc_kcontrol_component()
> 	(B) snd_soc_dapm_kcontrol_component()
> 
> (B) is using very picky way to get component but using it is necessary in
> ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
> using it without wrapper is very common way on ALSA.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[001/139] ASoC: greybus: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: cf9d07738fd94e1c3cf0c3ffb61f4d2d1e4d0c57
[002/139] ASoC: atmel: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c5f73c6679ef675fdb4e35dbc8ae0ec59eb0526c
[003/139] ASoC: codecs: 88pm860x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 455f2f9509b0034f32979bcdbc5441579c3a1d0a
[004/139] ASoC: codecs: ab8500: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3827b34564951febc0ffa7ce93c1d9c05888e53b
[005/139] ASoC: codecs: adav80x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3c000883d110b381fca21572147a8c0463ba4a25
[006/139] ASoC: codecs: ak4458: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 92ba8c4c78810b991b697af1087ba31226aa5871
[007/139] ASoC: codecs: ak4619: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2e6db9d197ed161702434c6c14b1c65bdef51a2c
[008/139] ASoC: codecs: ak4641: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 344af572f088e2bb1248bb752ea3a532f7fa4208
[009/139] ASoC: codecs: arizona: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 62b175d6ff19de91544c9047dcaec8a33a5759a1
[010/139] ASoC: codecs: aw87390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: db25c438f9e02c0f1566d54840640d23f59a3d4f
[011/139] ASoC: codecs: aw88081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 205a7f5c6ec0051248384e7440fb17d3f3aee372
[012/139] ASoC: codecs: aw88166: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 404e8bfcb9d6a8b6af4745f23906a7382b7eb4c4
[013/139] ASoC: codecs: aw88261: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: afcf45b7555fcc8e2fc177e8d4e7a2d9d79b13eb
[014/139] ASoC: codecs: aw88395: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a43676fa0585a9988e44ec000649d20c2649a3e4
[015/139] ASoC: codecs: aw88399: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 40c729f0a3fa14845d733f5572c283728bea0c32
[016/139] ASoC: codecs: bd28623: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: fd27a636d3746ae20e0853f4fa48b93080a2a43d
[017/139] ASoC: codecs: cros_ec: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: f2b55e567172ccb248e66e8a0f1c7380279127f1
[018/139] ASoC: codecs: cs35l36: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3815962969c811bbfa32c7d503246f9abace38cb
[019/139] ASoC: codecs: cs35l45: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: f7fbe0ea5f03d918418e6ad28d61bcae52bb2d22
[020/139] ASoC: codecs: cs4234: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 0bfe0c0a9aa7edb88f571bfbfc8f4546d6b311cb
[021/139] ASoC: codecs: cs4270: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a014442252380abd19a81ae27fdfc29b988203c6
[022/139] ASoC: codecs: cs4271: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a2aa8c0a2f1cbc5be1cb6195038e4484d2af38d9
[023/139] ASoC: codecs: cs42l42: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c0a750ce364b248efc0f4b993904dcef194612cf
[024/139] ASoC: codecs: cs42l43: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ccbfc923fe935b4f1e3b1e51df828e07473faff9
[025/139] ASoC: codecs: cs42l51: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: e621116150c5983dde75195f0eb2ea22baf4e87c
[026/139] ASoC: codecs: cs42l84: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 8f1d72f84e85a8757a0981040654be1fd18ea6e3
[027/139] ASoC: codecs: cs43130: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 211367ef1d4031a29fa8e07f430155d68802e8ec
[028/139] ASoC: codecs: cs47l15: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 9549a29371c5548a4eb0d43622a25d6bc989337f
[029/139] ASoC: codecs: cs48l32: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: eb52e20b15eac1c230fb81f7481f6f1299c2a9b8
[030/139] ASoC: codecs: cs530x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 46c4e08bb11aeae95c364fa610ac6348896b881a
[031/139] ASoC: codecs: da7210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 8b5cc56389d08debb225d94a35e62e11a80a9b4f
[032/139] ASoC: codecs: da7213: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3a3271a52075d4dc34f403c0ed850801cdc4bd4d
[033/139] ASoC: codecs: da7218: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2f0a334df0fd8e0793a7dbea40fca0d4a48dc927
[034/139] ASoC: codecs: da7219: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 4b5e66fc0315b9a85ce817b97a1f33829eeadd29
[035/139] ASoC: codecs: da732x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 73e86fbf251708bb2766fff746eea0ebb6fe0747
[036/139] ASoC: codecs: da9055: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ddd1705b62c6920b77d8cfcccc695e99dde25ad7
[037/139] ASoC: codecs: es8328: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 13c4c81b7bc819d533c6e0aaa1bf495cd0dfd8f6
[038/139] ASoC: codecs: fs210x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a5e7aaee483c7022e96181ce899944b8c7b1f1e0
[039/139] ASoC: codecs: idt821034: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 5366dcebe65bf1dc82a7362e505b69d441b5f755
[040/139] ASoC: codecs: lpass-rx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 11c13a65e82afb830fa0f7df2fcf3ed415e6fa1b
[041/139] ASoC: codecs: lpass-tx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: e7ed084f4cd49806b9ff91d800c6422f96f6f5ea
[042/139] ASoC: codecs: lpass-va-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 52a87e0b5ec1f7316293773f7859996d123b3ea7
[043/139] ASoC: codecs: lpass-wsa-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: fe0b3f564f9b1ecd74180c296129486d840bc3f9
[044/139] ASoC: codecs: madera: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b1daca0396b91a9b436b0654b8aae6a8220aa51b
[045/139] ASoC: codecs: max9759: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ee4ac04e3ccd7f4d54e767b7ab5a4067f9737fff
[046/139] ASoC: codecs: max9768: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 0c933edebd96961529e01686ce6930be5decf400
[047/139] ASoC: codecs: max98088: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c34209ba43623c2ea2593ee332f4e4f6b47fb921
[048/139] ASoC: codecs: max98090: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: dc5aa86741789d6dcc0c24dcff5f3ba8fbecccf9
[049/139] ASoC: codecs: max98095: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: e548389df744bd28db1ba3923b6ee74ba6f73926
[050/139] ASoC: codecs: max98390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 13b2c42b0dcf539a1ddf18374792a7a49a7afa4d
[051/139] ASoC: codecs: max9867: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2673034a1911c215f67c64d0b844563f7903a677
[052/139] ASoC: codecs: max98925: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: be9342c57e28d8e42638e4f234d8727da9ee609e
[053/139] ASoC: codecs: msm8916-wcd-digital: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3c9e6dccede1146d53f940ff8b25ceee275c0686
[054/139] ASoC: codecs: mt6358: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ef464d9c418741ac83a33c7662db3cffda655b4f
[055/139] ASoC: codecs: mt6359: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2041666b8f4320da1f7b8efacaafab40a745e126
[056/139] ASoC: codecs: mt6660: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ac7db529b6c2d748102cef60da29f5ea281a757e
[057/139] ASoC: codecs: nau8810: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 7e90cf82a33827e174d3955d3ede1b3e7bb56325
[058/139] ASoC: codecs: nau8822: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 14af3d3c4d2d8d01d91049576a59590d9c586f3a
[059/139] ASoC: codecs: ntp8835: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3a071bb34cea8e97e403c7946a1fc03de164f70c
[060/139] ASoC: codecs: pcm1681: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: d9f08106c16a32cb9514986351754d36f3b3c7df
[061/139] ASoC: codecs: pcm512x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 776b160f3234f85899eb3c8d454c37176484facb
[062/139] ASoC: codecs: pcm6240: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c4ec2c9d7329b509e10c8980e4077f823ce68df6
[063/139] ASoC: codecs: peb2466: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 800c666497e045c3152da516fdd6bc2392571a90
[064/139] ASoC: codecs: pm4125: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6dcc15ed9e1b0ce6b1f3f53af33e2afaf0a53fa0
[065/139] ASoC: codecs: rt1011: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6950709b6658fadc7db860a4ec33de8c5226c728
[066/139] ASoC: codecs: rt1015: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b805b4e062fa216302f86bd66485734683a51236
[067/139] ASoC: codecs: rt1318: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 1ad2f1c5662fabafc8df405a2e480ba45cdaf054
[068/139] ASoC: codecs: rt5631: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2191593d061cfee48763d67e69ccb1d27655ee62
[069/139] ASoC: codecs: rt5659: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 09b29035fb5c93fa0db24df165081cc27239b1f0
[070/139] ASoC: codecs: rt5665: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2c688df0fd19d02146e031502c701c184b86cd0e
[071/139] ASoC: codecs: rt5670: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6047387ab92acfc77dd981df27adca36b0c2e9ea
[072/139] ASoC: codecs: rt711-sdca: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: d7e1399884a65e868f7b121b8ca5d613cfac6538
[073/139] ASoC: codecs: rt9123: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 5ab215f2b60ec988e63ddde421eecc6ced137064
[074/139] ASoC: codecs: sgtl5000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a7aa34438d6367a34555e8cda99ba379ef52938b
[075/139] ASoC: codecs: sma1303: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c7ade18aad3e63e732a93efb5580a4b2e8563d0c
[076/139] ASoC: codecs: sma1307: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3cba794c8fec8e1d5da6c3c91fafdf490de4b24f
[077/139] ASoC: codecs: sta32x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 504219ea359c4545176f76bab77e0ba38a8629d7
[078/139] ASoC: codecs: sta350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a233cb3fe736647ab2a43aeb3ef1fb9a2a0744cf
[079/139] ASoC: codecs: tas2562: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: db1bcf18fe320ff4988a196f969ca739f9c3da95
[080/139] ASoC: codecs: tas2781: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ba93cda8cc9eb426c801aa8dca8a0e3874de958f
[081/139] ASoC: codecs: tas5086: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 37d9425fc9f19eb92abdcf96189e74e163b94619
[082/139] ASoC: codecs: tas571x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 01511c18f713b7579133f451332a1ccbb634e389
[083/139] ASoC: codecs: tas5720: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 7e1393622591631673c419197dda2d5ff14aacc1
[084/139] ASoC: codecs: tas5805m: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 64d1d87d185e0cccdaff573e16af074193045167
[085/139] ASoC: codecs: tfa989x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6e3e296c564399f17e8c99623f8ba608b8fe1b7d
[086/139] ASoC: codecs: tlv320adc3xxx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: d98fdbdf8bc654242d94616a7bfc233c67b43866
[087/139] ASoC: codecs: tlv320adcx140: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b56580c7ba8ae7ef585a7deefbb137212be6f1f0
[088/139] ASoC: codecs: tlv320aic23: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ecc35b2977af71d5fceef68ca723409cd9592bc3
[089/139] ASoC: codecs: tlv320dac33: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a6531a0414ed50cbbe6244e82fec4d432a207842
[090/139] ASoC: codecs: tscs42xx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: a31e9992873ebf3ff66699ee13fdf847891746c6
[091/139] ASoC: codecs: tscs454: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 9a1e055bb51d17a44e6e46e2af922dd0d9a1fe2a
[092/139] ASoC: codecs: twl4030: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b573898b82abf8d2736c90b14d76f65f9bc8d1f1
[093/139] ASoC: codecs: twl6040: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c59fe12fa2acb1613eb77fe2d690ab76107bd4a4
[094/139] ASoC: codecs: uda1334: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ae7ac6bbf0fa4475cd169b9ad2e7f751a7cb73f3
[095/139] ASoC: codecs: wcd9335: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6bc24a7d35ceaffa0f7551b7bd13b495a27e203c
[096/139] ASoC: codecs: wcd934x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c5c6d972d6450350ecf6b1c6dc7ec7e1462bd221
[097/139] ASoC: codecs: wcd937x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: bc78514e84035d1a596eb558ce9da9dd5269a85e
[098/139] ASoC: codecs: wcd938x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 661584c295d75ff72fae3569e4f0439325b9835e
[099/139] ASoC: codecs: wcd939x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: f4ae2720f353fe58b02f49cc935933dd9ccc8ce4
[100/139] ASoC: codecs: wm2000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 6c8f8e79a3f796106b6de386b2055441b8256efb
[101/139] ASoC: codecs: wm5102: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 024530ea1a3b6e8c64baa76f046345800b99a1bd
[102/139] ASoC: codecs: wm5110: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 386db878776142f262c5997424832090ebe5c196
[103/139] ASoC: codecs: wm8350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 95972dd17b189647e96605f4edf2177a8876eb4e
[104/139] ASoC: codecs: wm8400: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 9846cb5a9d06c476c503abfa840251ad3c06414e
[105/139] ASoC: codecs: wm8580: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: fcc6ae5198bc13860053ea6e1fb7ca85415c77d0
[106/139] ASoC: codecs: wm8731: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: f72e15146ea024f849143a1d4c65f351cdd12488
[107/139] ASoC: codecs: wm8753: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 7a0fefe28cc5a127cb63aafb5fe85852d198ee7a
[108/139] ASoC: codecs: wm8903: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 18096d761f6be5a981f3480f7907859f3a431a0b
[109/139] ASoC: codecs: wm8904: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 161e3c824e63eec6515f2c7d36fba391647ccf89
[110/139] ASoC: codecs: wm8955: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 1a1a66c2cee604dedbd4de3ca7d8e3c38d7de05c
[111/139] ASoC: codecs: wm8958: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 8b412d3233c69a8545ca771c2b4e25774a4a90b0
[112/139] ASoC: codecs: wm8960: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 41a6e1032c799184586d3c5ecb594cc05b844dc7
[113/139] ASoC: codecs: wm8962: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3314ee8db5411e1f9adc0172ebe425c8a8066cab
[114/139] ASoC: codecs: wm8983: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 74fdbce5fe88f9204634e3923c86a84c3a505ecd
[115/139] ASoC: codecs: wm8985: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ccf4bead907d8be7212e69adeca64a078712d8a6
[116/139] ASoC: codecs: wm8990: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 9e851421266baaedf86f8a31b62aeda0c72a88d8
[117/139] ASoC: codecs: wm8991: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c387ff80f77e6832952fb92d511bfcfda6766a54
[118/139] ASoC: codecs: wm8994: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 0d58897657a9a31f4817a9596a200815f8c8e602
[119/139] ASoC: codecs: wm8996: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 3576a8d214386e314e83c36c13eb098433896fbc
[120/139] ASoC: codecs: wm9081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 844db7d7e7200e303fa3974e8dae5350646813d1
[121/139] ASoC: codecs: wm_adsp: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c293d36d1037fc63430f9c4ec7e3fd1e42a50c0e
[122/139] ASoC: codecs: wm_hubs: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 88b0ee610790877bd9e3efcf8f29efd53eac894e
[123/139] ASoC: codecs: wsa881x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: c8e43faeb4a608f45e362c55a1687f3249479a04
[124/139] ASoC: codecs: wsa883x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 5190935a1b93940c28cc4f484e17662246648f66
[125/139] ASoC: codecs: wsa884x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 801955fd9248ea5659189b0464e9e4ff0952a11a
[126/139] ASoC: fsl: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 73f64a4803f1e092ed83f4e96225f35c42fe4be1
[127/139] ASoC: intel: atom: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 2d54738a39b49fc46b4b22472388d74fc698b87f
[128/139] ASoC: intel: catpt: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 9bce11a336f0d5694340f85bdca81179a02eaa81
[129/139] ASoC: mediatek: common: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 96b67f9204fb63168076142777e3cfc2dd236d8c
[130/139] ASoC: mediatek: mt8183: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b9b68f3a262bce63d4d363f08b345481e4f9d23b
[131/139] ASoC: mediatek: mt8186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: b5e0fc69e42b23e86b32f4810a41ff6b842d6426
[132/139] ASoC: mediatek: mt8188: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: f793a6e08f5487b4f1e1207cc4952adc753c1f4b
[133/139] ASoC: mediatek: mt8192: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 94cd5e54fe56165a2ac7a1ac7b3599a14b9497c0
[134/139] ASoC: mediatek: mt8195: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 601e7b30670a25b4cadfb05bded9345126d82b58
[135/139] ASoC: rockchip: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: ca6731ad2a4fd1e5fc549d53d4f99445fd552f97
[136/139] ASoC: tegra: tegra186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 626cf62777735ca51a8d88d8dc2e234b56d4f3a7
[137/139] ASoC: tegra: tegra210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 308eee447306e885254bca4bc23b9f90534feb1a
[138/139] ASoC: uniphier: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
          commit: 7e4cdef1ef8f8a3baa6806d42f6ee2f64d75cc17
[139/139] ASoC: soc.h: remove snd_soc_kcontrol_component()
          commit: d742ebcfe524dc54023f7c520d2ed2e4b7203c19

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

