Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67549B20B;
	Tue,  1 Sep 2026 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286862; cv=none; b=fqITSd9QlTfcZJPCF1dOfXJ+QNfUceRwy4e7s6eDTRI1rMCyo+nE+r6WxbGXSo9ms1gPBvm0heRy2lqFTgLTFys5bpIRQ/aJ+N6f/N8zzj2SsVBDxiW9F2o/LMpMG381BsR8+7dHvW77Hy8CfMZPwwRpagYkFgjozXUAQDdWwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286862; c=relaxed/simple;
	bh=dsSrzlawcTjVN2geYOpqAWRil+tOQyfB58l5vWcfDaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uOmv1RRNTAY1uQgWoW3eC68dZyINArXaqHWeD+xyRWMPeXxMkPljY+21VkUEIdfIc2eGaLsLnrSe4bm2fEDtEbktLtcBehNC+bFLkX/rHp3wVNqEksctRNQ1gSNJAHE+HsPPiu0RRAnJRNqS2Zz61c9zKutHSmLdqImj5GjznK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2Kee/je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2Kee/je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3BD1F000E9;
	Tue,  1 Sep 2026 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286860;
	bh=0aquq+0zmJJq1Jw5/6+wicqtQs66ywHtJeJMa69OFkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F2Kee/jeLUNuQFnfBmN2R14jZ5PGwRibMLtzwAFU2hauiBuE4KvoO9aClpFDA29PZ
	 3zsdfWyeVqHLH0h9iAseMBTvllkBu1DTKmAeW2O4EX9BtNm/4dI1NIsW8rHjAtYKXP
	 s0eHDWZqx+/PUaasxXLXJWQWjit0YMZPoab6PBYkumpbEMVwppYeQCvIEFAM4ofbF1
	 7mPMgkaJ6XorZoUsF1UWuLHQUXaFz3PEoCt9wL5X+El/gPpvb0Uqg29RF4PB0+/37i
	 2U+4sRF+suW8fNJ/qJj5AAaog54ULGvOAEv4N96sycGiTLlp4HjwW4dtg0A0jHQE9G
	 mgRDWPIvpjdSQ==
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com, 
 sjlin0@nuvoton.com
In-Reply-To: <20260825021644.1203076-1-YLCHANG2@nuvoton.com>
References: <20260825021644.1203076-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH v10 0/2] ASoC: codecs: Add Nuvoton NAU83G60 audio codec
 driver
Message-Id: <178813028184.13461.14517335323075054558.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:51:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dsSrzlawcTjVN2geYOpqAWRil+tOQyfB58l5vWcfDaA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxeI0QbnnuzssYZuy2YP/z2l0mos9U0eQfhHH
 seOHw3DRtKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXiAAKCRAk1otyXVSH
 0Bj0B/96v4pK3IaBuoH2rTWrK1i/wCW4nCkHpONulByjXFv9Rf6HACa9whmCDfm8zB0UEcHjVqr
 i5liq7wNqcRJdY2sPz93vxPjKqDi8B9CfqxEbAcyEz9YYdcsQRlXi5wc1cNtPn/2tGYlDqwpP/a
 aSyegolAA0TLa80YJGTCIBlrpwAB4B3ccBbajOwVAIy40FXwt6bdndZM+7xEdNCT9vvCE0MkMQ5
 6uOxBHSpSrS3iibBhNlSBaA2srZ0dU7drM5O9LCYdn1I3s0fs2I+ZCzefqaPqWG+nIgRF95iUKa
 IDVEgdhUDBt3JYxqvC7yDa6WKwlMqX/rHwwAyAhiMZU/mFjk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 10:16:42 +0800, Neo Chang wrote:
> ASoC: codecs: Add Nuvoton NAU83G60 audio codec driver
> 
> This patch series adds support for the Nuvoton NAU83G60 audio codec.
> 
> The NAU83G60 is a stereo Class-D amplifier with an integrated DSP and
> I/V-sense capabilities. The driver supports I2C register access through
> regmap, DAPM widgets and routes, TDM interface configuration, and DSP
> firmware loading.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
      https://git.kernel.org/broonie/sound/c/384a0f7b5adb
[2/2] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
      https://git.kernel.org/broonie/sound/c/be88847a8bb1

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

