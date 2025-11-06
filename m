Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DD305977
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 23:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473242; cv=none; b=QYtEOI8DgjyaZ2e3bR6Ek9UqGhh3h0n0gJK0kialtbTUDIxMUEaBQvTJWwreCdyekUPYMaG/2ZA8xKOK8b2dlx0sX274igixRU1wYh0+9FUrUbFGrJldSWuWkZABuONJKF0Ba2qiIUQpNorYvv02idxBvkuo3g7PyAbXaN4TlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473242; c=relaxed/simple;
	bh=Oz7uhJlzw2OseSngR/GbYWZq08YRwNiy52sYFOvbix4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ufg7UWC7ZFCYEzZG7Ls6FBywJP0GQhYU/f5aGd17gDgF5KwM3Vdw/sw8UKAB/e4SnICsHBiSM1ULctr0BrZWEhWabesbG3webDHafSb812Of10sQYBosYKd933uoVEhbypWMB3sV08m7HGGSGS/6FcTp2nQpgAyTAd9XKja3P0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgxERxZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgxERxZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4A0C4CEFB;
	Thu,  6 Nov 2025 23:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473241;
	bh=Oz7uhJlzw2OseSngR/GbYWZq08YRwNiy52sYFOvbix4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AgxERxZPAdfPhQJ52+BF7IBGBOsOAhIhNx++8uRJdYZZRPiD088KQbCle5oKDddfn
	 sP/5yO6eRYOa/eT8/QvBpcPobXODwzHuAPZwv/6g8zkT/kxrjbRCcdM+2fkVrGWLpn
	 ekwmbd582JEWnbfZNQ7uEc805B76DXlvqb/h8CFXDBFIeXLfpHnDlOjcUANaZLZEZB
	 g/ycprFGdjgf6WuD9+PtA89cs4ag534pdkTnMITzKYP7xsdTFeEcMwB7FswuHCBpUV
	 mzBKvL2hsMDStAnmO8qociZkX+gU88Nc321wJPlOOT6c/jzqDF59sXSXeRlmhdMxEa
	 Y0P6srrDjvZlA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, shengjiu.wang@nxp.com, 
 kuninori.morimoto.gx@renesas.com
In-Reply-To: <20251029073600.13624-1-peter.ujfalusi@linux.intel.com>
References: <20251029073600.13624-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: Preserve hw parameters from
 components in dpcm_runtime_setup_fe
Message-Id: <176247323860.2482911.1299603297551933562.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:53:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Wed, 29 Oct 2025 09:36:00 +0200, Peter Ujfalusi wrote:
> Component drivers can prepare snd_pcm_hardware struct based on the hardware
> capabilities which information should not be discarded.
> 
> Only touch the rates, channels_max and formats if they were left to 0,
> otherwise keep the provided configuration intact for the parameter cross
> checking decision.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
      commit: 6d34b66fb726a613b98c936adee70d42aa5e4aa7

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

