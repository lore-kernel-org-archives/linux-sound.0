Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370743264ED;
	Mon, 16 Mar 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683548; cv=none; b=VuJx4mdjO5Bh6xrsKPj//WrdSZu1LsLyUdnnNKKWXhtAgwhtoSYsizt1RYkV21gJpgafn1e9j1N1jOnTIBJiL+t/gqmummPhXL6aUvoPi0boxU3uZxT22edFANTa+iTNiCLGUF7104+O/4FfX/Hkw4hULmepulJ2SLyf2+f9NCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683548; c=relaxed/simple;
	bh=553ubSb+txqxPSqOb8jW+sWkJfFLki7DRs2tAAK29j0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BXInZagbioNKb4ahlJZZgUBVHeDmRXWSIX2S0kSNYt7DbL7rj4v+m0/8kRQhbwxzbA5u1Su0YM4mt66vd0hXfTrbDzVxakpvFS7n6Crv9r8r6/gG/bKFm7p9K4L1cm3RwE/wQQ6C0d99Nn/r99oY5LLzNVhzo5XkMK3aeBl2IzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6d+anUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6d+anUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D33DC19421;
	Mon, 16 Mar 2026 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683547;
	bh=553ubSb+txqxPSqOb8jW+sWkJfFLki7DRs2tAAK29j0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e6d+anUgQ6WKnlCCMTy6IXrSxRiOIaEgv+7ReiIrfbPpHT0QjzIRMD6edd8xbl5Tr
	 AIN/qSUN68WCEbgHDNh/XWLw1DJ+BLd2Xq78NaB3tJ5QfVak/GMpIEiU0E6uv5ER9/
	 bkXMCvyK7JtD1zmdQf94XOlfqL02hVavUckDXp/QmSkZbHOQJqGpmemjjwj/xjHV3P
	 cnsyTePdlDz1XaKOfiv7uTJnMNufwooa3yL2gPIzFqJSBrJ+136097Ntb3LCG8+piB
	 meIHFpgF2evPsQKanb5rYfzD+UpeUgffLoWu+wchwW1e2n1Bjw/1PpNysQvqtKIaXU
	 hNVH2Tc7YhZlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20260311-aw88166-fw-v2-1-8ef30dae3657@gmail.com>
References: <20260311-aw88166-fw-v2-1-8ef30dae3657@gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: aw88166: Support device specific
 firmware
Message-Id: <177368354523.146755.7925960174449128605.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c

On Wed, 11 Mar 2026 12:41:20 -0500, Aaron Kling via B4 Relay wrote:
> This driver currently loads firmware from a hardcoded path. Support
> loading device specific firmware when provided by the boot firmware.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88166: Support device specific firmware
      https://git.kernel.org/broonie/misc/c/fc1fbafc18a0

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

