Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F7366060;
	Mon, 11 May 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500939; cv=none; b=Cvon0dc9uhRlUpH8oDYpZVsWYjTDNkVRPtZq186GsKOXCkC1jCsc8MQBxEmMvGMvo9PF9fBGQOOajR6IUHj49iX8Bnne5BucvGAvJD6T4KE5RPA5251pnAMjdHrnx6ViteIVPDNggkkYQFqcZLoxopaa3osDSttXgeP3hRFJigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500939; c=relaxed/simple;
	bh=GA0pHyKK714DYQeFCO2P9+VvWLfGBW8lWGjt1QHHakA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cGpdM0bAxjM3BjNsNVAqJ47y2HDbIMKz/jl/+iEt3LfMv78fftqXKmnBP29NEV0e+ImXr7bauj8BOCJlahGuVY8k2cs3U92c8BjddAizjdoqZGj/FBRaWTO9ZIEm+qQhLwpydKkVXat7HG2bvaj/Sbz9SL0kaVIrOKIR8Hgojbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u938A/om; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u938A/om"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBA0C2BCB0;
	Mon, 11 May 2026 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500939;
	bh=GA0pHyKK714DYQeFCO2P9+VvWLfGBW8lWGjt1QHHakA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u938A/omZ505bdCOIvbt8vBjfgsgnQzaRUbDyAB9AjtmFbK7Nk9jYrx5z6EpnTJ0G
	 1g/OI+lwfbZPzHz3I2yM6rlHAQwB6vNazd7zze4bHSevByphZRayjU8Twu6+8wTPGD
	 oMKY6xSK/9Zjf0LwISvQqKQklBNnJ2JcVhLBbvBvqyLLC0Gh5Ve+UmXPq7KBXrYfJa
	 GrXr05CpSgety3PJFl+G+i8OmpBafcr2+jaUaGMRnS59NiU3tYwukXCDxxMZD8jfzW
	 YHvgtKI0XKWym5RJJuTSsM2kQkAFeh0CALpFiNNIFScAl6hp1qPeJDj1FrV7tCqV+j
	 oaUp6+lRqITmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, sen@ti.com, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, nm@ti.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
References: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang
 as maintainer
Message-Id: <177845929352.986162.15557185037319837499.b4-ty@b4>
Date: Mon, 11 May 2026 09:28:13 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GA0pHyKK714DYQeFCO2P9+VvWLfGBW8lWGjt1QHHakA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVILsi5dGPzSwVS+afObDGHfywULcad7ggaQ
 U0bYQVLPbSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFSAAKCRAk1otyXVSH
 0KP/B/99RpxWKhTr3F283ljGXBzCWImJLVFChuIGlj+59h4QG4+NJJ7IZgehRSaeN1/WobO53jf
 etG4r5y2JrDwxbelXIsBqZGXWF0zgbpZJ5kI3SMQqL2QsGSO9bewXcCLL5M2/37tU9v830CDJyt
 cbp7qneFDFWi+q3M3iYHKnLpQWZjgVQdN/eL/nl5OXGtR3P3IKydyEqdbE3JBr+kzoMXEfl2k9N
 Aw0haxDxkpjuXALDou8smkYJTu4elxZCG50wlBTPfPeWggmp6l+t9KOfQ8iT0AXtkvamsRlf6qo
 NPAIMziAp/l+A4rUqNOsWo0iGZfaV64Xc6ccjJXNTc2DoP87
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 19:47:44 +0300, Peter Ujfalusi wrote:
> MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as maintainer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as maintainer
      https://git.kernel.org/broonie/sound/c/b9d16482bebd

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

