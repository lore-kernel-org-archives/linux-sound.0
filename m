Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA5F52121D
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552652; cv=none; b=hiVUkggdSiD6jo3ceNAxnNI71ki9wt5AAjKs3GiBpY0/T3W37U+ISGODowQSm/zLO1bsSnA/YpvGAsvK8Q51AEQrm83h2cwdQwBMkFmHYozJjhAOJB0Tq0jJSgUsNOSz06H+1zkbSq9ac8lCikVJU6YJr3dxTneMMuAeU4ukFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552652; c=relaxed/simple;
	bh=JHlgi3VxNI/y6Iv2HAIHSxI/E6F+QRuWhN2rtYh2EsU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VE9n+4ZK+sHqNoA0CTjA3g5XPuyX4MOmQXyhZBFwiC2pxhyErqsh1a85/Y8KCjDgKh8gNGfIdSKckLrT8CtE0TFQ68eLymdBg8TGyJ9tDEDyg392zCSGcLa9miMO82lT0AU5L7LoEO5b6zSXKvg/U9Zh/UYaibGr4drphi5VAY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvSvtcLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvSvtcLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DAC1F00A3D;
	Fri,  4 Sep 2026 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552632;
	bh=Fl65Hp6qOtCns0ftV4fcyofEMAZE915KxEYCAx/iOHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FvSvtcLaU0fewpdsU54MM8lsi+XkE6Eif26i4lbDwsiSVM9B39iIIvhrBHULIbMzQ
	 0oJLkwOw+uq6aXU85qoXtciWKDeS5U59CS51pWORvB8LRXwNRukx2ndsxcjar0PdZg
	 mqMDQTFGcrLDZdOPwr5nvvoGW6d7svLcy1Pl+Ism+09P1NgDBrBP3UAMsXVtxOZ603
	 xndeZabH5eR25XGOrI2IudXRss+7xS/+f9cNhB0ogMtnUWD1ahnTGjKs3/2WU8U5of
	 Q5zKdqYWbOj5txFOaeN1d8deAOWFoQUYhQRSN0UBf+KThqoYocAC+CmpMqxfb8tP/R
	 hVWhXexYwKufg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260904075737.86525-1-shumingf@realtek.com>
References: <20260904075737.86525-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 1/6] ASoC: rt766: fix uninitialized
 stream_config->type
Message-Id: <178853968592.632048.6740798833520648561.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JHlgi3VxNI/y6Iv2HAIHSxI/E6F+QRuWhN2rtYh2EsU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyW0N4G9trjk2GdXMx/SFYkdZdRU+k1WGQmek
 VgN7SbUEcOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsltAAKCRAk1otyXVSH
 0KzvB/0ebhClYgWhQz2EKY4EsCXD1czDYJLK2vrKK6DPEhpQrv0nmJaGw1Mz7UyEhP4jsKAa4zR
 gAgcYs8MMM9vrdBxypcjuJyhYrYy4bOyLWEBKjs1P1ZPJkAiVEp/1qwkZ42anz3f3aZvxT5R+GT
 dAYY2BTVvuYQowlSOTMl1XDYcaLO5R5O7uIfnb4PD60aBX2dxVY/osFCNU/HzVLbHUBlru1Inwo
 slyuRHu7C3a41sHGadjMHMX1rZmJR29TxvCD/4927Om3QNX+MI5ad4g+tx2zDD/g/EstI2MfAId
 glVtZ3gUHlDlSK+p2KKpX7nyWyj4EUIg6kZFkQ/nWHnypR7g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 15:57:37 +0800, shumingf@realtek.com wrote:
> ASoC: rt766: fix uninitialized stream_config->type

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: rt766: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/4e3bd70facac
[2/6] ASoC: rt712: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/0a9bce8a4ff8
[3/6] ASoC: rt1320: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/2c68c4a0e570
[4/6] ASoC: rt1318: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/c966210ed5f2
[5/6] ASoC: rt721: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/0e17e50b9930
[6/6] ASoC: rt722: fix uninitialized stream_config->type
      https://git.kernel.org/broonie/sound/c/cff381508c18

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

