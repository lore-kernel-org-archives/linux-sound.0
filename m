Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413142CB12;
	Mon, 27 Jul 2026 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192901; cv=none; b=rqqfO8l0D1OxRsBcnIQYXA4dMg/LnRkp6goK6lRFKjoxPjmXXIq4Af4+NJrQiBRRjZSlzGg5DWZlphI3OQZ1rtH5NeR6f1gwQJgjztvnUbxqa18KIyool7xitsTh2yV1dwYq1T1oSst73F2ugbBlOUMgZI3R/JMvEpbpocxkPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192901; c=relaxed/simple;
	bh=L1ArCqa7xuRQTCtHJ407WA7ut3K/aNK+JBz7/T/RuKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FJgT7Ahf43eR1k+ZbhkNSCJGdNqTx2reyTq/TviOa5dD45arEj4oSQwXi5Ffsf48YUDjGLvhZHq//7lGCnSyY3K3nw+VtWDgx6mKSD70rvaq9SXCtRSffjjRwNCdPRIvZNasRw5uTHhrE7NpQRc/6aEBdqs2+XFxv43GuwKq6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmCDS+7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmCDS+7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405C51F000E9;
	Mon, 27 Jul 2026 22:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192899;
	bh=mYy/dR3F2y68upsYai280lOHsYvv+bV/DygQduUes8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZmCDS+7ebpDqF2fSuclrEVpzVXr3RPuxt1Trtm5acVKIBe3cwz6SYgptxmPDpFhqh
	 1gYfuI6KqvmwwU0M3Zc2pcWBMGGsOyhKqYzCfSsQjALL9kvvTb40zsGVxW9fmz1/iI
	 fuanOHIS2UlvbepgowARPUfrGGnf3l1VJZNahy0xl9vZgy5audXuhxz3nI1wrh1hEr
	 1BtjZOr5SZIdzAgIw9iMZwJAV3IG5AotbXvvPw3rI/Y7c6yLBH/d4vzLAuut2Of+SW
	 5CQ4VdQOqW+C5gI/vfafp/vQj47Jedm0R+CbcOjtuB4jziZCRiQWTPAzPqARwlEFnB
	 oq7zmykilOnvA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
Message-Id: <178517265681.50339.14054694326713842261.b4-ty@b4>
Date: Mon, 27 Jul 2026 18:17:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1440; i=broonie@kernel.org;
 h=from:subject:message-id; bh=L1ArCqa7xuRQTCtHJ407WA7ut3K/aNK+JBz7/T/RuKg=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqz0hweW+XWXPFG+OPFNVO+2V1JlC/L5r5lbTDXk/tucJ
 2qSH+DSyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBM5KoZ+/8s+3mLr5o/qzib
 dab/dqwnz+7G7W8rzH/uVfW48da5P14xZvrcJWFLb5YfLBY4VMvW+txGmqUy5ArDoZSfJ3coebu
 l3BPRNfTM9ZItDgvSDlTeo1iz7Owj7g9iMy+k+wca89xrfMgatne62sMQ3nL9F7Nnh0yZbnHBNT
 dNfaPlDt3vwaoGtQbivezfDxzY+HRWSreXqdVPC7f/pi+/P9AVy3U3fONlnVxoMOtSWAKXwcxtT
 x5rP5gdkHWgRMfG7de342mftM/rh8jf8Yo2sf/m9M8v5Vr4oVXx6ezl6uyv1ev1vV5zbOW0f9Hv
 1Ln03vrGDH3ROauna2o81179MW75MW59n5JnXQqs2mmXAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 23:39:05 +0530, Prasad Kumpatla wrote:
> ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
> 
> This series add support for sound card on Qualcomm Hawi boards.
> 
> This series depends on:
> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
      https://git.kernel.org/broonie/sound/c/327679a60512
[2/2] ASoC: qcom: sc8280xp: Add support for Hawi
      https://git.kernel.org/broonie/sound/c/358782121d82

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

