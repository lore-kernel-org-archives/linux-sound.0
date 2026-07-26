Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37043CB55D;
	Mon, 27 Jul 2026 22:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192885; cv=none; b=PfcmvMATu4OBRui9u1ZaFWN9zabJdjbmCGuiq4VXgy4XRmSWuMVGA4AaPhwgtU1QAQP3pX6HJDfP7wws2sHQVEgu0TowcyG0wxsaoGjNAEVlTyul101HXT0ZgZ1nu5S/RC2b8qcjLDNi4Gjnn8ZDk+yRlgG/dg2KwLIXnu9nOfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192885; c=relaxed/simple;
	bh=/fSFTuPeJsQEGNYswQfxedwObielxyrbrLTCNQoeMVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tBqzz+NgPHoEcm+GYW0Snvf/dQOaN8LJpfsjBOMG86EhhAsgtzco8+bpo1JZoGMYmdoWz9311f3XNoi7Nm1qjI1rgy4E10l2AQehjlq8RXVUwCb5sjtg7VIn5T4JnPKB8lwwSaVruq70GTOKDCoiyrJBtOWmO9iDFVxHdpIWPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ/5Fs58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ/5Fs58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF2A1F00A3D;
	Mon, 27 Jul 2026 22:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192884;
	bh=oYRrz3EUfyuEIWe072gbj5iAtWBhgpzHXzlRcgU03TA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QQ/5Fs58tGgXOUAiugCne6fQ6ajPHho0oDzY+4mGXztHrDS/HOJbvVQvKb1hh+821
	 J9kskZwfEA7Vk6aEnThmehtx6dRyD2VziXGuddn8jbQTxeEyTBoXuLfTuX4AwDAXRm
	 HLThdb3gbXZWoCDcOcgmIDRShNcbvOxqDkr9t0qOEkrEyhT0nC2jytFDxRKwXxh2DN
	 f87gINEpKYrXA5p8OR/MsYOJVvUiT1XmDjzB5ml7/O8898DwDakAGWOv0Q4qQZg0dp
	 HquH3ideobgmoyNiHk2Jb0Ax5JxwmUt24vw6HKW09HHV0rYsauDKJoTuhkFLWs8p24
	 wjQkLv40nRABw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Message-Id: <178508747839.10630.10650914663923353739.b4-ty@b4>
Date: Sun, 26 Jul 2026 18:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/fSFTuPeJsQEGNYswQfxedwObielxyrbrLTCNQoeMVo=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpn4bDIvaZsbiCzmTstvfryWilJRLHJvpxafBnPsoFLRyD6E
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqZ+GwAAoJECTWi3JdVIfQo3QH/RHr
 8mCQ//GKJsNTE6ZrPWib+5v9w0UofYF/fUPjhT9ZM3nBs7Un5Y94JtGcO1t5WwY40fzurol7doQ
 TBy7g2Pg4mQ+DzPo6Ld3DkUihFq0uks4+WMbr9+sXdK3ccpAdIakRo0TOdDdn2pZYd2NQtAJ8SR
 sjWdaE01xauDID1Sx2Mt4nong2dw35qrkAWVfEGi99bu1e9hMEb5upr76xLuYCfAumAhuoIyG/3
 FPQ/GbwlvQGoKQX99sI+zeA9ntHotw1BpPpNQlr+5tmy/rGaYe4Bb3LgsLSSoMkqAe4nNBZ1MDi
 Tt5oxr5l6stoZZIe+10Em16VEJY2e1xbScnJXOg=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Jul 2026 23:54:43 +0530, Mohammad Rafi Shaik wrote:
> ASoC: qcom: qdsp6: Add MI2S clock control
> 
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
> now retrieves its clock handles from the device tree, allowing per-port
> clock configuration and proper enable/disable during startup and shutdown.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
      https://git.kernel.org/broonie/sound/c/54324f3973c8
[2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
      https://git.kernel.org/broonie/sound/c/cc8495c1d45a
[3/3] ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
      https://git.kernel.org/broonie/sound/c/766f3f79c312

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

