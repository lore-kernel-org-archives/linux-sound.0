Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB926A08A
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 23:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245728; cv=none; b=k/5DRU2D/CGr81ReaYK/OhpIT42qE8erRpDWHSf/ih6JnEt5zYZzxrW0lRHKaL90ps1+njEZRMwhR0voYTnFGQpLeP++KYkKIK3PdyFYXftkAvVDrabW7h8nRuM+K/sJM3ZQ4Ad55sBjf/qw9JX0AHh5nTq68jmR+OOCOLYKo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245728; c=relaxed/simple;
	bh=Vb925mdM59mifykWSUAilNqCYymWpBDmg2sRxFVkdAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WAVaQCOAX7FLCG6ZC5ddSoXqHMq2rcYBs+poZhNZ2g1ry2c4n80iFZbXgDcPNrJj6SRSlAprYgtCttBSTL4MTgz7Oy7fuJW0uHvZlUDYCkMrogBXvVFohAChJbW41BHvpdljzzxPLUAp9bjgUo9OKcxvav19ZKor8vZIpjRPvps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0vBkJeQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0vBkJeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ADBC2BCAF;
	Sun, 26 Apr 2026 23:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245728;
	bh=Vb925mdM59mifykWSUAilNqCYymWpBDmg2sRxFVkdAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A0vBkJeQgvCofu1H5cBx1Ulflpzf3POW1hHjIz0TtXPs3+BvUigyvT0LZ9JoxadqG
	 LtaMw3gXRmeL6o/FqHi8aKrkn+dke0cjGLbAW4oQrvKpAktoT7aoUFWYqaMEi4ydDx
	 wNs8UCa+naSa1w8Q8xvalaUt6uEZBVhROODZer8UqG0dhqvYTTvUsXFZ24IXUJZI/D
	 fqVzpLEFAbG1QmlzpOpoJ6bgIM0poi+yIQJuR6+E6WQZaMh5eB0wBcok3Mr6mmunch
	 rc3YWqE0kovZ8yRgMrgFQyouRGBBK3jM5rDJBukPOLLQxIeur4DfiPQnDbdL0V4oNS
	 4YxOQq7Uco4fg==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 "Joao Marinho joao.bcc@usp.br" <joao.bcc@usp.br>
Cc: Micael Vinicius <micael0208@usp.br>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260420203218.15060-1-joao.bcc@usp.br>
References: <20260420203218.15060-1-joao.bcc@usp.br>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: Replace manual bitfield
 manipulations with macros and typo correction
Message-Id: <177724027656.266775.2142649172096596981.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:51:16 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Vb925mdM59mifykWSUAilNqCYymWpBDmg2sRxFVkdAU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4dObPlaXZsO4jJNaQ+VjfelH62WTdyJitPs
 dcmk5gIqbCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eHQAKCRAk1otyXVSH
 0PojB/9GYTnzHZQFK8TCC2scT21prvmrlQ83JaK+CH3VaODU5Lyv1QQCzXsYuITzbX+KmKYG0uz
 7d/Tmj9WnIXOHBcnGjlM4oxOOCRrrjihgdMjvMh9sOjkYh3037NdodyVR2Y/7uQAlxlqFFR50/o
 JWd/Kobh4zgPUT/x0TNJK74zHI711/nrkpxuSQPgVMjIiEttZcry5jeaZmkQulHYHscY4hKxUey
 t1vAhaaSE7nGN+ZcRPbfD80LnZcG555wePEe9iZMxDZ1qq9UAuMzkk5Wp+eaoBB4dD2yQQ0dhjV
 /qIrfAmgi29aSlzqmTAVfLW7kerm2QEA7JNMIa1gRpSL1orY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Apr 2026 17:32:03 -0300, Joao Marinho joao.bcc@usp.br wrote:
> ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction
      https://git.kernel.org/broonie/asoc/c/0241d6192a11

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

