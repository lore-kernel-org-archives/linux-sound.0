Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08A41B8E7;
	Thu, 16 Jul 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201897; cv=none; b=s0hygxXWZOfwryZfHKuCxMNu6yEUv/AzNujFLejloz/mOAPj+nvChutJTc4gEc91urZaCa5g55FKYIok/GYZZV2jsPkfdmKD3mjYIx2lRVKEu7FRYCQ60S7JHdrn1t7GekMc4M+h7Tmc7qb5V5N+CZH09zlhqEi9Cm2zJWzM0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201897; c=relaxed/simple;
	bh=zfbzuqqRT+fRh+zcHvqPPjFxlctg/cqPoswzu5jSnq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EKktKEPuif7XzfYgSWsiXdkWpz6K/H7Ofz0HGmp1oEM8vKwLwxyk78a0CBHUT7wueBqCPbGCXbSACh70OIszY0/FiUG7JV4zUtZ8LJJ3eE6MovHsDtdIhBXQkDtzpjKB6f87NO3Q+M1DzP3c90PyufsUSgVTMzbAGX1HZc/+t2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9loX0/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9loX0/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2421F00A3A;
	Thu, 16 Jul 2026 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784201893;
	bh=GtZxSeZ+DD70qiiXHYJl/fLF3Mqfi6sSq98l5+/OafA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W9loX0/Fq7IZ5jSRF/GaYHdtphycX4rc14XrPNKc2TwbnWUmtyKWLo0QnKliluik0
	 lkXAKupXtE5Matnxg7P4Ma463Vs//VIUvIEIy4FoIQxZakgCL6a3FE2TdgpPn5QwjN
	 XDD7Tj40EidYrtIPmIj+U4Lo/cn00nEm8pOT3W/PIMKETRQSfcSU5kFX2zFplyt/EA
	 46jjYjnSY/gwHhOWNelQ0VUxSpu6OSGQkDksHnoJuSgxp/EwZNZgqBgDQPVBPguk3s
	 jsGV7M9yPGMo0fGFMchtC3yRIXh9qvJJ/t/4HSV0tcFvEA5JYoyqY0S4bMtNUXgDaY
	 AokFc1NfX0HNA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Garlic Tseng <garlic.tseng@mediatek.com>, linux-kernel@vger.kernel.org, 
 shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260715100620.1387159-1-shengjiu.wang@oss.nxp.com>
References: <20260715100620.1387159-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH] ASoC: bt-sco: fix duplicate DAPM widget names for
 wideband DAI
Message-Id: <178413119914.5968.1206438897957176304.b4-ty@b4>
Date: Wed, 15 Jul 2026 16:59:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zfbzuqqRT+fRh+zcHvqPPjFxlctg/cqPoswzu5jSnq8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWMKiLcK7xiwHmHHqalAzGLtiiN3SA+jr2Pl3o
 cbBbzE5hL6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaljCogAKCRAk1otyXVSH
 0LBpB/9bUa7R5VdMoRwI5h5qF5rsw0HG0dr1EcmKs2m5zUqx8T45rPOxv3rerxgiYs5ObPbWmNX
 6v+nLQgP6YuuscwoZPKLuKVsULi4+mJCeztpXlRicmJ9eaB2E4tP5Bh9OeioLuhabJLp4IBSNiu
 qgy3BuiVekYgQI4HhwSMzeJBFiYEZfdTc1+FUjArV4r9DFfv0I4FeIA/GFGTn9s3jvWW4mybgHv
 hYN40CyACnI63HSDqlnqGF+qA+xjSTs9gSXIApxX2oCjg1ky7M65ugTXP1wFEzLLzVNWSrY7DI7
 NyqyhSTHO1nB8cnqmNPQpqg/pq2kLcagPGfT0/TdPaB49xKQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 18:06:20 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI
      https://git.kernel.org/broonie/sound/c/0b604e886ece

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

