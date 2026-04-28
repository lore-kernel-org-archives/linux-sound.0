Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E5175A7E;
	Wed, 29 Apr 2026 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436386; cv=none; b=NmZv7pKUCIZGVeJaUXWLpoiI2Bc3huZl4F6sk7yt7sQUpG7FvS2jWai/VIh1mzcNFYGevtcxSxdul9aywXKjrhhBLw0PJNKENN1xnkcFeOuQxVltfqr6F+1y4MV2SwuFokAttS/Hu4r0ihxWp4g8gH12I+mU3IQkchJDvuJLNjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436386; c=relaxed/simple;
	bh=fLkUNRG3XzNi2vIwOAcnS+7uMsvjo7QmjxTi8juHVQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GLaHyP4cKAkPAMVbLyhCoARhxoe/rQEsJPTw1qo1A8Z0rHsKnvTvywj8RWa8/er00Fyib6i4c0qGHMmMcN0IN4LTe4O57eAUHC0i+lTt1fr8H8kx2OQrPWbg8thwgF279Dcs0tQ1L/fTw3Yza04Vn/MHwYCdqUmIi1UQpRZ3qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=us3hP0iE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="us3hP0iE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8C4C19425;
	Wed, 29 Apr 2026 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436386;
	bh=fLkUNRG3XzNi2vIwOAcnS+7uMsvjo7QmjxTi8juHVQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=us3hP0iE/GxjQ14Em1xVk943gZomAFPEgNDYhHuBLhRr/XIxyI+eb3t9jhemN8i/U
	 h0B1JMHB2lmye5Ex0imvUD+eGqpYT+8eP6apWtUdKcC/LvPgdW/9TVhnyHKYIfWnV9
	 HedGNYTden3fuvy9/9Hdga+NzVWgXL4OVC0Fl85I8vtHI5hiJJFJ3pOWbygMVpEi6y
	 068hJ4VGf7E8qs20NwKpgOhhaB95FRCGR6ygCDlZzQc3kFhNwTE7OcHGY8F7dwAlKf
	 jirIczD0MRWfPUz5sJTZC7hRsJTgkgkZ+UvafC6I+0CJzduOwIEEX2r+jAiijPEZOW
	 DilO3Y7pJsN0Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Manish Baing <manishbaing2789@gmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260424210302.39972-1-manishbaing2789@gmail.com>
References: <20260424210302.39972-1-manishbaing2789@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT
 schema
Message-Id: <177736327649.363516.9564887357760635920.b4-ty@b4>
Date: Tue, 28 Apr 2026 17:01:16 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fLkUNRG3XzNi2vIwOAcnS+7uMsvjo7QmjxTi8juHVQM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YbdA1/LjEVGI9CN1pUs7Qfnz3Mp/buprmIT4
 DdKFSKULvKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG3QAKCRAk1otyXVSH
 0I6dB/9o6DjEA3Q+Kl/BtNHLQQzbaLkdI1VD0OdhzSJaHV1ZJ3GayaaJ/jpZ9ItcEbPkRMVxC0C
 Qy+Fj597SFlGvHfF2JpLQaxfBW6U6gpmstvTorf25pHSi+Qwn2F8n4BACIxbQnSeIPLOgmdqA9Q
 HErwzn1TvkjkJBHMRJSxGdnxLIkU+7fa/PJ3xP1FDheQJz0ztMTMbD9pWX2XCs/yGlGNKC3L1PA
 l1brn0ue6CfPBjxt2HTfn+K/q+42kN7dDnn9j+gphhh05hWtmsRAjva/EJqwnED2hxpFC1T4op1
 +6epv3XjfENVWwXUUrV/zd3k4kPp7Bizt3dotkN9qn1t84La
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Apr 2026 21:03:02 +0000, Manish Baing wrote:
> ASoC: dt-bindings: mediatek,mt6351: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
      https://git.kernel.org/broonie/asoc/c/0770899ca192

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

