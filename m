Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476333655D2;
	Wed, 13 May 2026 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636357; cv=none; b=RZUI479N6/+uFMjEotbmN120WCzDZwhpfO67mmaNWRQbzCO1v8PLV1hSMwDagElm6KSjoEA7NP3u4qPYy2seBDmJdv0Z1OMloDRKiKjXl4n6SqkGQKrW8JPuXmfCsjIYY6YwSTOfLFBU8F/IHo0wfRhZQIZstMQjcYK6CTl4BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636357; c=relaxed/simple;
	bh=ntOeOPsYsFqJOz7/vyB5yIGhKJ261CtYD3wjLz9YSfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SY49v6+1PVjlOFGIHL1Y3vLmZNP2MF0qQGGGmCCN5vfW2J1hQ4wtYyYK4Ivwk066Ztal1qHv1I8lHSR07Rz4sDYeKV++h2yawQTgfZ67PCJ7oZN+HAL625nroJZ16wcy/Etk2khXxds9cZu4maWegO/2PYW2myGEgsE5n4XtBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eD2L+vQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eD2L+vQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22074C2BCB0;
	Wed, 13 May 2026 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636356;
	bh=ntOeOPsYsFqJOz7/vyB5yIGhKJ261CtYD3wjLz9YSfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eD2L+vQ1Ao1C7tB6Ml+kkEmRVJRGx2g5Kx8iOtZio0pg7rMDriB5ANH/gMGprhBBr
	 +xvm6dJPQqSAsIgcUwN6c9jSeU8+cdHbG6XPaJTPOWChtIGtlt28Qu00sCF06cf1hM
	 5zyAWZOQuqXdhU4pi6r8CQ5AyHojBGojLefyieoH9EgflYTOqywkba+wBBQcToZ8Sq
	 W7H25KjK021eMIHJYM6p312GD6hcccgtp/1P0lPvuRunBAgZOqBN6EMaGo1WW2UI1g
	 ucB+9VVWJZYj4Wk0WSSBTHKweem6IA/GU/4oQ0GpnaMvofO5+fxvuZyQhL2ScimPtz
	 jZaYeIfTZJznA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 sen@ti.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 00/18] Add a new SoundWire enumeration helper
Message-Id: <177858284069.1043532.13233320271274458583.b4-ty@b4>
Date: Tue, 12 May 2026 19:47:20 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ntOeOPsYsFqJOz7/vyB5yIGhKJ261CtYD3wjLz9YSfU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqA9ZBrbqhIH0tBBWWc1bLVRsCFkos8/8dC28aS
 tJVc/jJwyCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagPWQQAKCRAk1otyXVSH
 0KEMB/4iIHBPfUunQTpFJ9NABajetEU+6ve3xfPu8Gx9PNik6OW/Jn4YGjS2Wd+DKjWFVPmkYTj
 6EYGK/iySvE0Slt/YFmOaDZ9pAAvTi6PD9VH+c9R3tGlmjlWMSr2doCLaklIRuxs2wONVXcvoWd
 2+sSM6mvLhxt3aAujKQS46+Hk6WsfcsVPsa0p1i6tOOriSSbBHjP+M07NiMqNrku5F4Ykzqm90k
 czfJdo8i5isMhpU4GUm2YUjH9WyE7xDbwFUzux80B3NjOzYob91HU0O4TL5eYjtJ/Y77G0fAPjT
 tpMCn3BuIKWnz0sWfP4j3QuP3BlWHwdg0dEP6lHt4Ho+NavN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 11:30:04 +0100, Charles Keepax wrote:
> Add a new SoundWire enumeration helper
> 
> Add a new SoundWire enumeration helper function, many drivers have
> almost identical code in runtime resume so it makes sense to move this
> to the core.
> 
> It is worth noting this is really step one of a larger process, there
> are a few drivers that do more custom things and are not covered by this
> series. But this series picks up the low hanging fruit and moves things
> in a good direction.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/18] soundwire: Add a helper function to wait for device initialisation
        https://git.kernel.org/broonie/sound/c/3492e8b494c1
[02/18] ASoC: cs35l56: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/9dc2b0d599c6
[03/18] ASoC: cs42l42: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/47e2f687b0c5
[04/18] ASoC: max98363: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/7fa0ff88f882
[05/18] ASoC: max98373: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/8e5768eb4eaa
[06/18] ASoC: rt700: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/c5b0783d18a6
[07/18] ASoC: rt711: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/953ee481561b
[08/18] ASoC: rt712: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/d5bd2f7239f6
[09/18] ASoC: rt715: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/e154b2472f6b
[10/18] ASoc: rt721: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/cc05ab0a664e
[11/18] ASoC: rt722: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/0b6401749586
[12/18] ASoC: rt1017: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/ab579acef4bf
[13/18] ASoC: rt1308: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/1ab950b47b3a
[14/18] ASoC: rt1316: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/b7997fcacf94
[15/18] ASoC: rt1318: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/210f109efdfd
[16/18] ASoC: rt1320: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/4461603eda13
[17/18] ASoC: rt5682: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/fee0a8b4f0da
[18/18] ASoC: tas2783: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/ac6d4f298160

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

