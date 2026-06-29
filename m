Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058131D372;
	Tue, 30 Jun 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818206; cv=none; b=VXl6PltxG7X69puYWEhBxMJ/1mDNTwZleg4htQhGk3L5xqKTK3MlczOOuBIa9qLw19l4M5UFeMmnstvRvh8PSi+L0C8W8xmNSGy4ENQ0Yi4gwqNsn5PTxI8QfDliQ1kWERQworCFGLiALtwjm8b4I6KN8L0rHbrxWs//f/WHhfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818206; c=relaxed/simple;
	bh=PCbzGkWYAYYksoSIhRQjpcu2gmaaexe+mLNsnTfEwio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ePDwTZi9Oa1hMW3u1GM+1HXYEepusGKsQXTYxzcVQMF/l7tHqj4pH+V8zVyfBjDAjtDuAm6cz7pKvr9S3fWzfSBIn8041XwAZ4HKBMiNZ2EHF4xeUTB0tHLWqbBqj36mDFibNuq8eo4QSm9fBgHctF/kzklqVSTEaH+0Pja5E9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvCLDp0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvCLDp0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EBB1F00A3D;
	Tue, 30 Jun 2026 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818204;
	bh=uwh8Si0th8ZwAZOQzQjkI23sQnD/NKR2H40oiYsbBcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZvCLDp0pTJUja1XYhOzi88zaV4EHqESZME0ESIQ32LTRYEeZbSO3B4q7aGfWdOoLY
	 pRbyAMMf40Vryxrc1tv88gwaTKZrnnFfe+Ss0wyI+xoZ2RKVpFBMKFpJ8I/Ci/xl35
	 Gd5wzahFfoGk1A8+Ko9pRhRdYbON8YUe+l5vIqrDqJPS/IYHSP6oGEWI21GYc8Yx9u
	 ytXRuYlaK9I99EIZ4onc8CH+oKR8uLkHyeeBK5SbYz7jZ/i6BFkfgWUMnPrfTpBEtA
	 xuH7P8IbaVBkO9fEuCXgOkr3ef4JMsUArmiRZ3jz6k4Qbq4TWAp2ZYsVt1XVMHinD3
	 iMsFwYAEZNPLA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612020113.9557-1-phucduc.bui@gmail.com>
References: <20260612020113.9557-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: meson: Use dev_err_probe() for device reset
 failures
Message-Id: <178275373770.47562.15070770755130138575.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:22:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PCbzGkWYAYYksoSIhRQjpcu2gmaaexe+mLNsnTfEwio=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WZWIfUc4s45wZXBGe4jnhWyGlRcJ4JeGqB6
 TR7yRlefNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlmQAKCRAk1otyXVSH
 0KBoB/9OS3c4ESlo/bqe1KuMbLzj61E4fIEf/dCQKC+rfqTLbj+FVX4llQ5hBA18hz7cTbuUaag
 728XcB6dqMy7hcndFYcP1LYA9VMNYmj2+AX9xPxPtVINKe7UY5Z0K5N7RXWK3/ZE3h7HSqUZoxA
 OVn0Kg1uJEZtQ4xywEx/qV0JSr/s4cKjPs8ANjmeqFTi/4eSFRMPHwciZwZ0laLjttXYEndWWgM
 2FlUU301soopsIdiUCPNb3C/g/08Z59sVH1FghmQoamnyOH35vN6tuVbIPlBAWoPydXSjbMO2yI
 7ilTep2elxjZcW+4awRuKh8UlrWkKckhuF2mcCy2PU/NLYFS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 12 Jun 2026 09:01:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: meson: Use dev_err_probe() for device reset failures

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: Use dev_err_probe() for device reset failures
      https://git.kernel.org/broonie/sound/c/6ed013a581d0

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

