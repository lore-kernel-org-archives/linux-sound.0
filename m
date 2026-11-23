Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522458;
	b=j+6wNeNfhOqX77bgC0IhgAVMFcXeiAomKiPUsP8jgWvlmGzsJnv0yBgMkq09P9+he4oH
	 xf3+B7jZc2kIpLxf2cGQApZjWuwWkxU9ASwjS33m3fZjumpW2AxjCIW6pHP8iSRXKIBJ8
	 RdvcXSnyrqohJL7eHif9hk+srozsk6k+UqgbXNx5sJA/FqhRm0eYOFNHUqdG4SXLoVpKB
	 YU0uSXnDlsL5ZzZ1m7DutIMGZQHWt5AIXvQKb6K3E1nusndoEDH000ZFjfqzcNpek7UKi
	 DJ9X+LE4DVe1kubhnX+/WwNvJCTo45/cnDdbCYVrT6XMrLAQrBkVKHeKI7NCb3FW9Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522458;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=m929f4/a2hsmlAlH3httPfzyS1EzHTFZBejxuumAn2k=;
	b=e6RhTVSqgXBB0Ti6wYu8K917tzZ4V5li7Cf8EMC4RYL14gR1YPE5+qHxNO6i/lqzc2/l
	 0ZTQMK+Xu8N5lwiotPzEpFtLLxJJXYvFxB1mehUh7I3NU/reQvC4CANZxTszUda+dwHPR
	 ddamtIGjYe72Nj8K7rUWgu3U07+Hl3sLG+ais3fujjo4EZAq4BzHzlkyNme7uVxBdgE1o
	 1Vtldx728uEnsMQQMWK2sN0N4HORr0rZ3tL7fMisrexRTn69EkyeVO+Xdjnt8O6ui8tGa
	 u4Bhml8T/FAGdtWd3SJrBpP9xTvOUK55mfp1g2W29m+zFH86Clu3gQD+FiOECzkdRyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChJGsJ4w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18787606A327;
	Tue, 24 Nov 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChJGsJ4w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683301F0089E;
	Tue, 24 Nov 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522457;
	bh=m929f4/a2hsmlAlH3httPfzyS1EzHTFZBejxuumAn2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ChJGsJ4wJ08DTCS6U3GaeIZTeAXuYvmzfUHcVVz0oafoEVOeK8bCuzuwzSBRwYigG
	 G5eDqkLGJ0OrzWzXO3p5iJ8MweHuVer07oy+xLJ+2YrBSbZQUOmDJdFazmQL2lyFMn
	 ncrT3aCwNfCHAPjSWKa0obURlrarjgpeIEkTFrRbnT1aqCfgWotZbOOJn54iLhMFIz
	 rKo5Wpe2e70HH/WnuxNVUsbrx5XOvqhPcmCVIVZ+3vBLf40TTQCs/c6NWuBA3jFtmj
	 cWupWhiP9RTZ6Yg8c72Hmw1GMbdsRPlm1HLlKOJeJI2gQu4B7l3bjCXgISlVseqTw2
	 kHWqSlxtheSYQ==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, arnaud.pouliquen@foss.st.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075859.50201-1-zhujun2@cmss.chinamobile.com>
References: <20261119075859.50201-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: sti: uniperif: Propagate the IRQ lookup error
Message-Id: <179545915744.25092.2318364807146963731.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:39:17 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z61NxEvI8ET4WCLWvmneBZXDE0I2Nak2xn0p7zCiHEg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ66dVmfFam51b5d+8K25+kv+dM15eIQzWLE+ubNf4m
 GWkG7u9o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNhVmX4xfT3nlGq4n/xv08+
 T/e6Mnenh73/7H9GZYsvvb6/tf71QzZGhmsBB+MNc04G/soT4myu5lNn/3fyUMT+V10Pc/cFGuR
 kMwAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:58:59 +0800, Zhu Jun wrote:
> ASoC: sti: uniperif: Propagate the IRQ lookup error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sti: uniperif: Propagate the IRQ lookup error
      https://git.kernel.org/broonie/sound/c/ed1e119c2781

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

