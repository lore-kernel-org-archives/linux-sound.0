Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C5828152A;
	Tue, 25 Nov 2025 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764098553; cv=none; b=nzO8XTtfmc1q43pBye4hzC5NcAwccjtIDTfXdQLCOpWmb62kPcmpJ7fo78YJ8ACY+mpw8wn/2PIXRm+D2XNL6dBDMvViVWRXeQgYtLp+xsYZ1o/2+UvuvtJESNHjnJTZhqk4e3HbxWFBQwDWwGIFvIQkmYYLG4c1B+qRBGjao20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764098553; c=relaxed/simple;
	bh=TMqtm/SVFamTAGTSFTQcQU92j6uXD24dyI1fNi6kgag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HEbosOoFHa1fodEjJzOyl5ObMbsqaove9JEp7kLOoNzvi5D0X20+E+/5JPggFpexWIHd1xHdrh5fM7+iOF539p3R8o2pEaQlOem70kLp3D1HI8NfMxyL8PJYFiG4Z5L6+PDwmPfE2+tHP4lV/9Gpbn+MPl2W5KYlwjIat4tREAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyBV8ZME; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyBV8ZME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC751C4CEF1;
	Tue, 25 Nov 2025 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764098551;
	bh=TMqtm/SVFamTAGTSFTQcQU92j6uXD24dyI1fNi6kgag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YyBV8ZMEOAL2WYG3Ev/qdeBc97HXeLATYFF1GhrEoX0kAan2YYRFpdmcpsa+WBIhU
	 Z+/vBhcuik16MqVdUU79/gBw9VmF44JNW8c5yR1Rq4ORs/nSjc3//A2pUFpBckyqEj
	 rawr4PAF1pJKQCv+ft0BMzkF+eY3d5qRTyyK2n+sMRNfV916zpRgjd8V2TBs9SzO/a
	 1TDuNrets8HPE99DmY03P9M7Hv2LkP02HAhTDz4cex3W2dQp4/Lui37D+zo6m99xWr
	 zurXaCBHuU/MZSEM6wIV9tkjCO4JPZBNqTHExI/vbYiUwc/trFBbWpRabMGlxQVO7D
	 kHWXDUozhci0Q==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251124104908.15754-1-johan@kernel.org>
References: <20251124104908.15754-1-johan@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: stm32: sai: fix device and OF node leaks on
 probe
Message-Id: <176409854967.84790.16552995327264561748.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 19:22:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 24 Nov 2025 11:49:04 +0100, Johan Hovold wrote:
> This series fixes device and OF node reference leaks during probe and
> a clock prepare imbalance on probe failures.
> 
> Included is a related cleanup of an error path.
> 
> Johan
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] ASoC: stm32: sai: fix device leak on probe
      commit: e26ff429eaf10c4ef1bc3dabd9bf27eb54b7e1f4
[2/4] ASoC: stm32: sai: fix clk prepare imbalance on probe failure
      commit: 312ec2f0d9d1a5656f76d770bbf1d967e9289aa7
[3/4] ASoC: stm32: sai: fix OF node leak on probe
      commit: 23261f0de09427367e99f39f588e31e2856a690e
[4/4] ASoC: stm32: sai: clean up probe error path
      commit: 3a03de362975398b39d4c6df7325ccb982026a8f

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

