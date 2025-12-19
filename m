Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE6264628;
	Fri, 19 Dec 2025 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153374; cv=none; b=Nd/iY9mmoSwxrjRxpWeigKPj/DFcgU7YS74qJ5+XQjIZPx2k8MRAWoZ3HTA+nhpv/Dnij7d5qiPTnM/0Njt7gjOtNX1vJkYpEjhfS8fb1rvq5aTRayK6dbpqKTK1uiuaovpgaJI+xwARAEg8BDxouiQg38K9/mM5kKXoUrjUfQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153374; c=relaxed/simple;
	bh=C39rTcxAkIHv99X3RPljuO/4e4VbRRgUEip2DvPO0g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m3gYDXSw1qxMOSmVHFERkr/RMcDRXYbI7+L8cFWsRD+NSfMwE+OLFPoL+KRUjfFZDbZplZkXU49rL5H6wX6C37zjglZ+zMzyYwQGTh813bWV67Uu5YX5Rxqqz9GHxjOWMaSASvhP6trfV85rZVWE1XhmA0OXzIEZAOCVaLK83lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9QefJJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9QefJJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A68C113D0;
	Fri, 19 Dec 2025 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153373;
	bh=C39rTcxAkIHv99X3RPljuO/4e4VbRRgUEip2DvPO0g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X9QefJJNU2LOIz01mwiA3qKSM6jtH2/vmKMJL/J6f5D0MzVCYhDdbZQam8a74LjOL
	 wfyUjk5TGqbophYe+c3HaULoOfnQx9YsbqnA211YU37zoti7tmFIWpD5X9LDmxaaet
	 y7tZdMRTI30e5hH1gu1BpsdvIcTAl++fRedeEdwYUjuyJnsg0Hscjyg+hMApUFRMBP
	 lX7jUcwmtW39Km7gJOU3cJ0Mt7H+KNC5fi2ApUvGW1g5RtsYy/+rhfbsM8040vyLNZ
	 oIkWTZ45heqm0n927TgW+EQ3otn/+Oi3Fr+J05XcKBRY69IDgCZF5N3/wGiKgWHC0a
	 fZAaU0XLpXdPQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
Message-Id: <176615337149.412520.18004973037532955036.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 10:40:41 +0100, Alexander Stein wrote:
> this series fixes the error regarding duplicate debugfs directory creation on
> TQMa8MPxL (imx8mp) when easrc is enabled:
>   debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
> 
> This is caused because fsl_easrc adds two components which use the device name
> as component name. Debugfs directories for each component is created, resulting
> on name conflict. Fix this by adding the debugfs_prefix for both component
> drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_easrc: fix duplicate debugfs directory error
      commit: 9f5f3583ba423e6eed0a96e4d4b7d808d618f3aa
[2/2] ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      commit: 4de6cea0d8e10c9e3f38ccff7edd45891976e67a

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

