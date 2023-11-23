Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C80224F0
	for <linux-sound@vger.kernel.org>; Thu, 23 Nov 2023 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuFMepwn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712E7C433CA;
	Thu, 23 Nov 2023 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758808;
	bh=zGd8DxX1wjCChLzUne6ijJYjDDvfRf0xhdz0NGOau8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YuFMepwnkk1Ibv/ZBmbqWCCs12vo6vaJDeqmnjEUC+86kx0cM3RNA7ub58tJbDhbn
	 Dy5FDpgrzCZxQU2wrFwjxPvHsOwNp+u1LSlBGJ1nuYPcS8k6CqZHYXPrCtPoBGW9Ql
	 2FqtrnIYIAWr9J8GjDh+R5wLbY5UlFAC9exhti2D2qXdC9ampGxp/oTSBPqxK2GGSw
	 jrP7UR7A9Et4XcPvvbeb93IkXA6vVKcshp3UyvG/G3QNLuIOzQNlVzkR4BiXROuAG5
	 1shAK1QFDS8rtSFNVFOdISztpU5b0+504LUZuIGeOX4uuGu2JgbxHhyE07FsxlAgle
	 MlvqzVtg7vzoQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, perex@perex.cz, 
 tiwai@suse.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com, 
 tinghan.shen@mediatek.com, u.kleine-koenig@pengutronix.de, 
 kuninori.morimoto.gx@renesas.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com
In-Reply-To: <20231123084454.20471-1-angelogioacchino.delregno@collabora.com>
References: <20231123084454.20471-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Add Google Steelix
 topology compatible
Message-Id: <170075880330.2448402.15081642632125216155.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 23 Nov 2023 09:44:54 +0100, AngeloGioacchino Del Regno wrote:
> Add the machine compatible and topology filename for the Google Steelix
> MT8186 Chromebook to load the correct SOF topology file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8186: Add Google Steelix topology compatible
      commit: 505c83212da5bfca95109421b8f5d9f8c6cdfef2

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

