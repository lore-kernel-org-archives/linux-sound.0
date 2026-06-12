Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF73CF68B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302736; cv=none; b=Nk7Zfg12qlXWxBrCKJv9DHKi1Ghjm8K72UYaYoct3+y17n8/VS5KY2bdMBkNrI+c/gAcO88UNQkhV5JkjrxQvFIgC3fIHtILPfDkhOEo6mdnbiatPIAqOgEo7ynb4NrxYhX6gP7s3eKNHvPDAOIRuy9O1av60xS4a3KVcVYHjLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302736; c=relaxed/simple;
	bh=YWn6FAYrPXO0xm465XI9qtsiCC7dwDkM3ErJ90CNUgE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ug0SifTi2Ye1CAC/CIJqQ53BCEKqAg0NraEWpBTDs2mbVuhvptU9gz1m/9GPXuTOP78r4tIoAALdaJ8Cza0o+p5Y5WSlSj9o3WuxS2Aqd53401vTFKebcft/xVs/CN67d861VG2orNLPC8Utl5XSgNgWVKpQaHa7jbFeIUL+QEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLJgDbRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLJgDbRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370E11F00A3A;
	Fri, 12 Jun 2026 22:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302734;
	bh=sLE6RJrWJ4jzVjBOqKNDPHuf1hDGsLLuuDmtB9pvVSg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cLJgDbRHziNwHv6dp/7uILo7FFR4mCglzRxEtnNVst6bPJK80Z8XqBoVQkDHq1LX4
	 Gv7KjLK8my8vtNNk7knedhqLemxprh7j1Oa6ZeW9JM3KWZ5mDEBmlDagH7miz+VDNk
	 IgQAuyWbZ1JmQkv8zK68DpYRMjsw4cK/O6X6tC/M/LoWpCZQ8qOoafn0EximMcUGPu
	 FGT4zuWEKDZ+QMLRBBY7BkT8ie/d/Hla2engT7x9t0Z3sGghZpG5mJsBD6Q63PAIuG
	 eFvz1IeKf92aLTcBvVqG+xF2v/VUI8u5TVX3nB/mAnGWoh25m35uDVi4Bkc/9lVA60
	 WSUSOuyHrMOWg==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Herve Codina <herve.codina@bootlin.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Sen Wang <sen@ti.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/9] ASoC: don't use array if single pattern
Message-Id: <178128708937.48375.16314350637227721199.b4-ty@b4>
Date: Fri, 12 Jun 2026 18:58:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YWn6FAYrPXO0xm465XI9qtsiCC7dwDkM3ErJ90CNUgE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXIz0+l/LtnQvUZ8Q4/ANtUECa3XYPet8ifE
 CQaHyvFt3iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFyAAKCRAk1otyXVSH
 0BOoB/9kWSB8ko2OdAr6Bgu8eDSXJ/O5WG2XgQovm1EkB7Snyb5MQUOSiPr9AtOtx4g98U5vzzq
 lOD0KbAB29ecSqoRYywz6YALyk6rptuyMBonmSwFE2YzLKWHWZk1QI/ynrD5USE9eOZo6mKe2JI
 ABzlldt+1W83puJXYrOuZNtgQtkSQHZuqT7NS69sXzcTDGaZ1Ot3wMPApQafWng3kDgdarC3VYE
 q5beOImw1ZSVMAaYOzW3N09de1Za1ab36TgoUyzfO7Tn1t6nEnfDCn4fZChamZNMleF/UhqiatG
 UNI9CN2GEM3sJ792eie7F1lNTHO3qiIGxFc3XNGWLHY5GOmG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 00:22:31 +0000, Kuninori Morimoto wrote:
> ASoC: don't use array if single pattern
> 
> Hi Mark, all
> 
> I have posted this patch-set as [RFC] and v2 before.
> This is v3.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/9] ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
      https://git.kernel.org/broonie/sound/c/04c93ea9ce14
[2/9] ASoC: codecs: framer-codec: don't use array if single pattern
      https://git.kernel.org/broonie/sound/c/da2d7ecd6b32
[3/9] ASoC: codecs: idt821034: don't use array if single pattern
      https://git.kernel.org/broonie/sound/c/9b5101c37308
[4/9] ASoC: codecs: peb2466: don't use array if single pattern
      https://git.kernel.org/broonie/sound/c/ca446ac6b38b
[5/9] ASoC: codecs: ak4619: update auto select format
      https://git.kernel.org/broonie/sound/c/23ad6257cea2
[6/9] ASoC: codecs: pcm3168a: update auto select format
      https://git.kernel.org/broonie/sound/c/06449c0c47b1
[7/9] ASoC: renesas: rcar: update auto select format
      https://git.kernel.org/broonie/sound/c/97c7d3d20348
[8/9] ASoC: update auto format selection method
      https://git.kernel.org/broonie/sound/c/c6b09cda3904
[9/9] ASoC: audio-graph-card2: recommend to use auto select DAI format
      https://git.kernel.org/broonie/sound/c/442cfd58e712

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

