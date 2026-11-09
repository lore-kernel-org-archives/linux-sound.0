Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264266;
	b=LV31yCoLV/FKwdbVl3vn6wpxfUP6b70VZ4wRBkdW6cH5W3z/Fc9hi9+lNPCKnP9UTEUo
	 NJUTU4hzLn5/tsNAR/vAZsSUR3rfLLxEF1e1d0qbtoZeE4V4aV4Idp6xEwhZVWttw/7He
	 VJUZmi59w+WhlfPZK5Qe77fZcH2VoGvjxotzdldEkiyfEwAOhdRteiCOLotEN6SkWRAJX
	 gxArPEm7i+orP5XZUyWsJ60hiHtsaD095Hem+gez0W77YIBWub9Iz/cErdIr7n5KJ0czx
	 vYtHH2rE7+4yOImcsyVkFiN2J+aDiYibWk3+BviYQ765c4eT+AZFUBYddDIGAJktLqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264266;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QJxUI/WtTXybO8bkQejFHPCx+365cePVJAgW82wmkKA=;
	b=QRtCbnAw8z0coc7YGt7xk6tE2Clp1OYeN2arWtMnD37LSfHAYdJQHYqRBhP4Rxy8oJ9g
	 CqFP/B9zz7b7+r9X7b49vwJ+fFlYxsL+yayJiViX+H8Y/puP9S8DA4tl546tO9EP0BbiM
	 t1K6+nPN3w8r3UiECKCCPDtrqXp4Q7LWfakpsgu2AKfYAOMvF4f6mqynBrfgquoSUDwjD
	 0hGWIKzBtMeI+GrV/iaacJvtcrDkB11qVVwACqu41uiOtlQIqrszsBQcWH7oYX6NyJc5X
	 oDdMwDf2mHUkvsIh8oCp0nauQL0bLNiptuDkt9c4v2KR08zvQFNeuifU/QTf50WOxBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgWo+XN8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E249606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 22:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgWo+XN8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7E1F0089F;
	Mon,  9 Nov 2026 22:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264266;
	bh=QJxUI/WtTXybO8bkQejFHPCx+365cePVJAgW82wmkKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jgWo+XN8bbd5GjX/q1Y940Lp6p0oe5bQgAw+CyUQBbfNzds+tiR/i8VDJX7TWGmby
	 j4iM1zz6qIcv7uuspjHXeFOIXxoWPQEm3HuzN+U2kBYik944FHBIK2kv4eKD87KKd4
	 xscgJsbFgTkcitd88N/spo2Sum1j7NAiEmpviHHD1KfStG0MT0SRfqSB+ZZqzzvcBt
	 /QXt71Ht1VUxNmKt+7ePctISnXJ2QQYh44vPSPdRZh5nBgoFihF/GOjrf1hJi5YCMR
	 JROqQCLJvte2PhsF2J34zmleZFrqp56H6nGaClJN0QgwPixPteY8z2T0XsviBMtOd6
	 VJNn5ZfFjNepw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 4FB1D303EFEE;
	Mon, 09 Nov 2026 22:44:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>
In-Reply-To: <20261002092336.585546-1-m.szyprowski@samsung.com>
References: <20261002092336.585546-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: don't request default
 channels from dma_dev
Message-Id: <179425558998.3711751.13924724066212444798.b4-ty@b4>
Date: Mon, 09 Nov 2026 20:19:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=w9/bM0ILG2utfQFU0nXsR6thX0Dhokx7BPqC3WZetVY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++RybfpYnQXef+NWTV24G3Jmx+ED53adWsZm1xz5p3
 hJ551bb01HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJVF5iZNinLNqwf7Ytq6Fy
 6vvqqgN8k2sns5c+0uW9MmfbiX/61m6MDHPMWzaxWrwPvasfxOMtsvTt+2MeE7ff0mp/mXExfrb
 6bm4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 11:23:35 +0200, Marek Szyprowski wrote:
> ASoC: soc-generic-dmaengine: don't request default channels from dma_dev

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: soc-generic-dmaengine: don't request default channels from dma_dev
      https://git.kernel.org/broonie/sound/c/953eea4f6b1e

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

