Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E840B6C9;
	Tue,  5 May 2026 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982816; cv=none; b=Ek2SflMuihLUULKODz+GEd9qPJkeixBW/Z55EMjBmkpDpQnVdoxbqdXI0wUFr7YB434wf33xFCbwSb/zW0Jig7+vkyr5wO2f/7U4QdaCp/bJ25tkpJ2rrnaDN17GQaXeO8KA2PzADVNTkj8DkJ2X7MjZ2sW45A7NUrS6agIf5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982816; c=relaxed/simple;
	bh=EvcaFmZ3SemGSNQwfe2IqD0C3HrRr8Eraf8WWgh4zRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A+9zfm8B+5wv0/n//8lS/GQ3Rp5dZmIPn8ihNB0Pk7aIJ9ui2FUcCY0V0uTLHkcL0nqtuT3T87Y3JmkQaIBTJvXD+OHxHS4Goai2kBoHeZ2HP8lWnLbQKkJX0DvPOX2cPFjIkcVqkbeka5EfDmcvzSBYc2L+Nu1G0GOxPFDRpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcqsIg5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcqsIg5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF650C2BCB4;
	Tue,  5 May 2026 12:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982816;
	bh=EvcaFmZ3SemGSNQwfe2IqD0C3HrRr8Eraf8WWgh4zRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BcqsIg5EChrpTYw+1mkCeRZNKk0ebPUvdtgicO05R5BTyrMFZ1KbCNFm7k5aXLh+v
	 0Fhz5g9dZA5ePmxLooBKaY1WdSQEyAjrc+FbcF9wl05Z0kUl9Fc1z/gegCZCD6DJ6M
	 fHd8U1cgAwcIAJpA9oQsUQo+C9RNsWFB9DLPbs0y+2q0yEZjl3CI7LIkzbDs+Uc9cS
	 E5l7+ccGhzT2iDzfB4G6rYYkEM3GjX/+Du0+Tl/IqVJV3u5OEnFrE1/WRK3tO5KlW7
	 CH/JIre/oli+cfRoLCgD3H3SZHx5kJWLXgIfxvKTo38A0iXhxdETIHAA0QXZs9ANqI
	 zFl2w5VzMJA9g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Cyril Chao <cyril.chao@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
References: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
Subject: Re: [PATCH v9 00/10] ASoC: mediatek: Add support for MT8196 SoC
Message-Id: <177794601708.568329.5706730296147006187.b4-ty@b4>
Date: Tue, 05 May 2026 10:53:37 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2541; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EvcaFmZ3SemGSNQwfe2IqD0C3HrRr8Eraf8WWgh4zRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+d1b+imK4W+OLIW4agEVcJncBcrDG50aFRvJI
 1ZXQWIype+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafndWwAKCRAk1otyXVSH
 0JksB/0bq9itAWEAmXSTpnL4jGlTXrf6FE2oxQTrsoA5VKlc//N/hafJMmKe1pklS3uRc2epzcx
 AqFnusgzPUsSBjxbStPioCyF0QKuCnbtFxWRjLvE0U6CC3Z8nKp+UPCKflMAKEWVcGXp/fv0E13
 GMz5ejem2tqbtwt89/7ebYCo2b+Yfvd9gmELqInRHMp6zUdESrYilJUPFtPuw8a9t+z4P1/TWsJ
 IdOoO7Hh6L/xsddtzwekY7X4bou0WP3fZKBZ0IQkXIMbLcz1sYzjn1xTgBNNPi4XYQBqIkX8Fkf
 TSAU9HDof/2e5ZkF8NHafLrRpaJTD9ypVJQEfiHh2hqsvnXX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 10:23:13 +0800, Cyril Chao wrote:
> ASoC: mediatek: Add support for MT8196 SoC
> 
> This series of patches adds support for Mediatek AFE of MT8196 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> This v9 series is based on the v8 version:
> Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260324015719.17543-2-Cyril.Chao@mediatek.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
        https://git.kernel.org/broonie/sound/c/1aadc0147b42
[02/10] ASoC: mediatek: mt8196: add common header
        https://git.kernel.org/broonie/sound/c/33eda2c14ff7
[03/10] ASoC: mediatek: mt8196: support audio clock control
        https://git.kernel.org/broonie/sound/c/7384ecab34eb
[04/10] ASoC: mediatek: mt8196: support ADDA in platform driver
        https://git.kernel.org/broonie/sound/c/9a5881402c6e
[05/10] ASoC: mediatek: mt8196: support I2S in platform driver
        https://git.kernel.org/broonie/sound/c/65a195132669
[06/10] ASoC: mediatek: mt8196: support TDM in platform driver
        https://git.kernel.org/broonie/sound/c/ede4d841111a
[07/10] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
        https://git.kernel.org/broonie/sound/c/5cd03440c0d4
[08/10] ASoC: mediatek: mt8196: add platform driver
        https://git.kernel.org/broonie/sound/c/57513aabfe5b
[09/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
        https://git.kernel.org/broonie/sound/c/1c65cc451873
[10/10] ASoC: mediatek: mt8196: add machine driver with nau8825
        https://git.kernel.org/broonie/sound/c/de764b0d1838

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

