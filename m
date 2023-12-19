Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4784C39863
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOZ4n/7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B84C433CA;
	Tue, 19 Dec 2023 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009195;
	bh=xvU367qZzfAoUntmQ4FrQOKLmlPS6l1Zf0ye+sR90NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bOZ4n/7Yy02VN94mVPXxQrbcKQJ1jFJwhu9dfm7uR4YYUiT7bqEjJKcEa+IBOvsSo
	 xTkyEYL9EWNR//tuTiPZiGRUPelGSdr+oy0jV0nsSEGk0+suARviknuZB+fkrZdpp+
	 jxOuHHzAcXq9RjdBvzStgiRcQpQafVKf4CvKrGQEf5Urg3smNlm0QM51pqrSbDB64e
	 JrntcwRK+JjCAFKt3KmKiMpCMtVaVEEcpavlN9x/X83xAe0n02UfMpxb1ZVIWRF6Vy
	 eU69NG9xnFtu9SJN3vuEuo24f7D+QDsFxa0WahtAVNj6dNw8T9T8ReS8Fv/xrJ3P3u
	 wPdEbGqXIZzQg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 angelogioacchino.delregno@collabora.com, perex@perex.cz, 
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com, 
 Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v7 0/4] add es8326 dt-bindings, commonize headset codec
 API, es8326 support and Enable dual amp for rt5682s
Message-Id: <170300919336.125466.4717213995056504777.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 16 Nov 2023 17:35:08 +0800, Rui Zhou wrote:
> Add dt-bindings for es8326 and codec es8326 support.
> Remove duplicate code, commonize headset codec init/exit API.
> At the same time, Enable dual amp max98390 for rt5682s.
> 
> Changes in v7:
> - PATCH 3/4: Completion "}"
> - Link to v6: https://lore.kernel.org/all/20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
      commit: ea244b35a4da60a92d0e3be528f82ebcbcf10753
[2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
      commit: 1a268000b03a162bd5feb7fce1c130f1b31602b5
[3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
      commit: e794a894427b1d64f2ebff24f003c60373d68c2c
[4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
      commit: 3423c3db22e9213acd279ff3800bb1e91aa2ac89

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

