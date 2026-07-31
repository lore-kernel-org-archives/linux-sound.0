Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5A401A0B;
	Mon,  3 Aug 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758974; cv=none; b=E6lHxIVAkqjJgdFDov81CtPXY88kAYe05nZZPOHibDzSd/XxFIlOA1oYbXsqojLR26DKuUdZ0pStBHAB9KmKEAQF0FpFZbp1EbWphfJVxsH+jcVmc8BB7JswSOqzc29FzRap/nzYKavR7oqnUOkJBgAgm/y5bU2LSeUqmn4WwSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758974; c=relaxed/simple;
	bh=0ubLwj31Q148WFirjvyUycb1uebMl4Y4Fg4bbxK+EE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=offDDnzEmCzO54NVItGprT/ujq7q10KYM/lhxxzYVvJBViAPHLXSI5tvA4w5nR1bn1cNSe97z237Q0c9ocvj012zqFOPzVrCuU8NOPNl4Tf9aUo4UyUtmb4KHZT3AzgdPYJFqpzvkgUOVmnJK//cEjrQ6O2o4oHcdpM/553+ZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFhYjIXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFhYjIXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67D11F000E9;
	Mon,  3 Aug 2026 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758972;
	bh=gLgqvs3sTRNrs/tckGqlVL1dJSc5lNbXDd2F4BvaDac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TFhYjIXY/6CMmgHNMuQpbwkmxee3Ad8Z6LjnfHKo+z3wLv9NrX4Z9bgFSby/ww5Pf
	 c7JdNCd1oku+48Q5n/H1ggZFoBzZo7EWA16Nl8681Z4cw5REzjVyKWy7uEsOWkB9F3
	 VPO+c8HN3I9fa/pLwjzaUDzPo8SPKPYLx1WQDdPk8QCk5efI/aUBPehMdAvujriKvA
	 +rbPz+e5oduZQLkzoGunsGmP3u2qeVoZX8CmVFkC/gIwhhX/FO5ZEzQKWHmroa7HIv
	 gSglZf8iCtgt16t6ymD47iejCmjzrrydg/+xcxUjU49qShwBjgi8+AJ6Dcu04ryY1N
	 7f95/udgrltUw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Subject: Re: [PATCH v6 00/15] SDM660 sound card and internal MI2S support
Message-Id: <178554049927.353541.14417243139211059408.b4-ty@b4>
Date: Sat, 01 Aug 2026 00:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Thu, 30 Jul 2026 13:43:38 -0400, Richard Acayan wrote:
> SDM660 sound card and internal MI2S support
> 
> This adds support for the SDM660 (formerly "SDM660 internal") sound card
> and support for WCD codecs over internal MI2S (represented in APIs as
> LPI MI2S).
> 
> Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
> digital and analog codec. The connection to the digital codec is through
> special "internal" MI2S ports. The digital and analog codecs are used on
> the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
> and also on the Google Pixel 3a for the headset.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
        https://git.kernel.org/broonie/misc/c/c143608b5602
[02/15] ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
        https://git.kernel.org/broonie/misc/c/96591d7030a6
[03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
        https://git.kernel.org/broonie/misc/c/e70f03958849
[04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
        https://git.kernel.org/broonie/misc/c/5f42d4525b43
[05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
        https://git.kernel.org/broonie/misc/c/6f48a57f4bb2
[06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
        https://git.kernel.org/broonie/misc/c/68400191e005
[07/15] ASoC: qdsp6: q6afe: add internal mi2s support
        https://git.kernel.org/broonie/misc/c/bfe9098dc275
[08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
        https://git.kernel.org/broonie/misc/c/0b494ae6a582
[09/15] ASoC: qdsp6: q6routing: add lpi mi2s support
        https://git.kernel.org/broonie/misc/c/14d3cca9c2ed
[10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
        https://git.kernel.org/broonie/misc/c/bd8216bfe24f
[11/15] ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
        https://git.kernel.org/broonie/misc/c/5e913c10bd0d
[12/15] ASoC: qcom: sm8250: add SDM660 compatible
        https://git.kernel.org/broonie/misc/c/84f950973d91
[13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
        https://git.kernel.org/broonie/misc/c/a3e1181e12c7
[14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
        https://git.kernel.org/broonie/misc/c/4583c124538d
[15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
        https://git.kernel.org/broonie/misc/c/ff01bff07665

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

