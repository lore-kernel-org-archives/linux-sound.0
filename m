Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18D47CC87
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063970; cv=none; b=AveIJB7hR4eQefBkd8zdXCAOTmzr1xbYKmQhva2gXt+fwNMfTxGrB42feUEcWfvtZhpPL7k9i5O1GrckXsebSZAAGs/QpJVixhBpa7lrToyIXIMk2rwKlwzbvt9f54oWFfOA7fvjOzjKKK9LxDaeF3rcYdModNTaUYcBMQJooag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063970; c=relaxed/simple;
	bh=shHJF2cdJjXDf6l9QzhNSuRCIFN1g++8hv/dCaR3iWU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VlkVCwoj3udaHiDwutW/Z1wdvE7lDiLspl2Dyy0CP9VoA3LBdki4FnhhZF+/3QHljRIj0eiymoq7WRZj+mZZdNFJ8mnxa2127ZT4qenGzVxPZSklRLCt1LHuV+L4r03QCloRfCWGn0x6jOLfsu/WYqEHyyzjjY4lu4b5q9048FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzaBuv/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzaBuv/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDD5C4CEF7;
	Wed,  1 Apr 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063970;
	bh=shHJF2cdJjXDf6l9QzhNSuRCIFN1g++8hv/dCaR3iWU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SzaBuv/LIt2JG8QjefKTWDdwmdpWHcBV0nHnj03Q8zIplKXODiaGLY0PMJIz4rQNW
	 hSZnSQsTixV5+r87A3qCvFcypLgpuCGajbUDHzqWcjW6QmlSyG9s9UBuAyti2z3K3q
	 tRy5wvNnhHncyoWZs1kRA3F52jTY6VjhLKwSiljh2f4+O5AveucysJ3Q3kyR99n24m
	 i9cSgtzgQN+5juGyr64vO5ZO8xHchb9xI97rncWZ1Sy8yddKiA/pYQlp+zIeIRMUqL
	 1cIBjFRV7ecoXvboDMdfWFLlKBu5FB8Q51vfMGmLJj5kS1+pBlo2iHeZFbbgqb4uGu
	 tcojwmnc4oeKg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875x6bttv8.wl-kuninori.morimoto.gx@renesas.com>
References: <875x6bttv8.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: ak5558: remove unused snd_soc_component
Message-Id: <177504529061.145704.7839156846976973126.b4-ty@b4>
Date: Wed, 01 Apr 2026 13:08:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=shHJF2cdJjXDf6l9QzhNSuRCIFN1g++8hv/dCaR3iWU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOg+17qHd/vNyT2Z9TNkgGPDt7EO1HF05Kep
 b/0Q6ZsQ4CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1ToAAKCRAk1otyXVSH
 0Ov9B/9qFtxx/ENwZaYRptFHJH5lHgDYy303kzq1U2cAhPvjcNYKXD8OVts7JmrBFQp429tkm8A
 icE9dZI6EcayNSi8AyFegwoEundhsTZdidubA5Gqt1ZnrnMPl8f5hCFG3GDic7xVX2TbmaNScv7
 GTYEqz9CukIaTLH8f3kZo0E7yMEonGteSxHGoGWDUDcYKvTNmXP7jRg87biBc72rEG/NhhmAyCr
 TR91YpogYTpZpMvdN2EicaVJ0xaLFo6XAKP49k3oYP38OTBbSOPQJw9bozXCQ0AY7CpWbITpVsq
 yATluiopMZbwOn11IORD8I+wbMuuTBs5alOsTWoNFM06raPe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 00:19:23 +0000, Kuninori Morimoto wrote:
> ASoC: ak5558: remove unused snd_soc_component

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: ak5558: remove unused snd_soc_component
      https://git.kernel.org/broonie/sound/c/9b4f93a8b1a5

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

