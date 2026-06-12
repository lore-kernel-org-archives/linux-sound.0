Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A73CF68B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302722; cv=none; b=FU65HpJ0Zm7WwsHgtzPkm9DbC7FUtQxyJIOM522mu+0nvikLXlOv0BqJuyqYj21T3VKnyXuRjsEDihRQfudEUrpBqa3Nl+qB7IPdXxLa7MdwKPCEyL3WGwcmA3kLdDA8PGsIfAVmwRWn3pAa+fXd9JutjUx1FRaEaouHnJGygqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302722; c=relaxed/simple;
	bh=PEeW/x3EciyyPi5JHTyNeVBwCn24orf5ywbzd/LTbN8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Krf2MZtmCuuSS9Zdd28h80Kgt7vlWJZW+MGuf5sQFAtJLG+EeeG8SUTNNdByAnsXs/3442sIQb3R0fK5IopAlzJFhYXicft0YFxIaT8WF829tPb68ByxkAeI2f9mGnSNkkLvdGMNaL6JipzBGMOxem4j7n3dApu+9X6RQnDwPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRjJNmyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRjJNmyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5537E1F000E9;
	Fri, 12 Jun 2026 22:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302720;
	bh=yEDBkfLAyVjR5pjuab2fm4dDN0Al31rlnTtthd/w4/4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=bRjJNmyQXfw1cuU3lkdLRiXOrniWRnDt99e8+z9j1ZYUIaaL3vB3aC8nDUyVBgg7F
	 H/AvWBu+yqRlbgXRkod/L3Oy+VQmBDqWyj1pmt2dR6tr/yAOsBq6dIc7/HuTiUD9kw
	 JqIFLCJdnsmstIPDSNAQ0ZnG5Dvbx6jAvMVpalXKfhqFKYCVv+a6J1YIKA7VuLckfe
	 eYbBdD+Mi7n+Aup1es0V4/r5DtNdtUhTWsnA2mQbis97glhP0SFn0HJLCK0zyKgYDK
	 bzXM8OPDtHWYdvPjn83a7JyJ7BmC/d1VTNYEHUJCf+xSAFVZJsVIG1WUdZ2n6lRbbR
	 F86dDjm01aFkQ==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: mediatek: tidyup details
Message-Id: <178127683217.48375.9312920447884821177.b4-ty@b4>
Date: Fri, 12 Jun 2026 16:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PEeW/x3EciyyPi5JHTyNeVBwCn24orf5ywbzd/LTbN8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIW9G38TejwuAvWGkZ4OyNt5XRZpdEqD56J7O
 3UPwrqNsX2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFvQAKCRAk1otyXVSH
 0JwVB/4o6s5oI+/IgvuMa13zYprq4QkBJo2NM0KuRK7yWR3PR4g6cJRFBNMYmrsnu5DDByDNwv3
 tXhcF6Roww65vf8IQ0kq4ASkmyIU7GQzeeSzCE18GAcWAgNzkCDvOIn+UQJs+zcuy0PNB9IOb3q
 NGwMuEgYBLBb8o+Xs9zlUHwHUfe8mlXyckILPWCcflw50hRpizRaLgiCNNxWIeO/pb69KFhfUMF
 /0s36M402jJtXNwqYk54xlxnKIHW1yoqTnmu1yiDR25b4+I4zHyMY23QAGBRmR7JIhDR2rHGNn8
 9+TEGT60y/VKKl2lCQynHX7onv6mTrdZmObJENC3CSWsrIyp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 08 Jun 2026 01:24:28 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: tidyup details
> 
> Hi Mark, Mediatek developpers
> 
> These are tidyup details of mediatek drivers. Basically there is no
> functional change. This is prepare for later Card capsuling.
> This makes code review easy when Card capsuling happen.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/6] ASoC: mediatek: cleanup mtk_sof_dailink_parse_of() param
      https://git.kernel.org/broonie/sound/c/d7d3dc1dd345
[2/6] ASoC: mediatek: mtk-soundcard-driver: tidyup set_card_codec_info()
      https://git.kernel.org/broonie/sound/c/1ddd7dcbc858
[3/6] ASoC: mediatek: mtk-soundcard-driver: tidyup set_dailink_daifmt()
      https://git.kernel.org/broonie/sound/c/7042c5dc12ca
[4/6] ASoC: mediatek: mt8186-mt6366: tidyup mt8186_mt6366_card_set_be_link()
      https://git.kernel.org/broonie/sound/c/e611c2ccf75f
[5/6] ASoC: mediatek: mt8186-mt6366: use *dev in mt8186_mt6366_soc_card_probe()
      https://git.kernel.org/broonie/sound/c/fd83ba0c7de6
[6/6] ASoC: mediatek: mt8365_mt6357: use *dev in mt8365_mt6357_gpio_probe()
      https://git.kernel.org/broonie/sound/c/c1530e7b8c03

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

