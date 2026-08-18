Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051A4332637
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086008; cv=none; b=RfVPS5js2aEQ7b7nTmYAGfe7A4MyjXCKvFLibQdmp7JJ69LdRK1YI+d5gL4VN3U7GS+Nsajdmb1uvTxJCrTiZz+tgP2tdYhYtjlYtRzsqFioox9rihS8zDDX+oLBQppwQGPznhbsSxeeT1Cm7ZFtAgI6+IzT+dNdXVWnYuUxTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086008; c=relaxed/simple;
	bh=5CxK7+y1Tz/wGcnnW2pSE4wKhVBGXqNCddCsuzD/HL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qmOb+2BZMEOEQxJTMviO8b77I87R8sEJZtlVXYiQEt4Lea1X+/d9+mWZ4Ce+D7oAgJeG2ZAk+ZWy7ZWxVtCtc2hp2iDtRG9B0tUQ48AXyNpfwVGpBGivdE9nX2nu2sOfsiyJ9LYV5+l/nOzuG4ijV89kKWKjdmRitzFbAI9SVT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am24Jo1u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am24Jo1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F991F00A3F;
	Tue, 18 Aug 2026 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787086006;
	bh=NSbV70rgiCJEJoDzt/aj7v8SInMtT0DlwC0ArupL/rU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Am24Jo1uETNANbQelLjQvYFQ/LRn3/1huB8xokDoccOZFUDPRMbND8MtEKzfu8EDk
	 rrxUtpd15YeKYnlB4ziSiZKSdR10IvuIWIJUzLUWmE7xJwnFS9/61LUsnXMD/JODpa
	 yjJadSupCaDyHDQA4t/igLaiCAmdBjUL5zZ306p/ApU8MGd8YL0SAyj1M5ArH9yj5A
	 XLHXfqkKqnpoKWCeM+FJm9dugp1xO0yEPhmrw0qmLZl7db1X4gXak5BvYs2R1dHed0
	 tp6XPBMovPoJZelUy47f8nf1i8KnpvT062eyYN22Yv0YhYcXxywJMUl7arLz7mCITO
	 HHhnZvbzufH3Q==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87wltomc97.wl-kuninori.morimoto.gx@renesas.com>
References: <87wltomc97.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codec: max98926: fixup invert setup mask
Message-Id: <178707328841.154835.5680594595393492038.b4-ty@b4>
Date: Tue, 18 Aug 2026 18:14:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5CxK7+y1Tz/wGcnnW2pSE4wKhVBGXqNCddCsuzD/HL4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqhMSzRg/NAuvYBuJ0w6xVKYTTc8RIAFPTw3NYv
 yCiGuKxb+6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaoTEswAKCRAk1otyXVSH
 0LhBB/0V3caDvN8o20X8QZnBLUFfZe+pm9M+Bc21BRJGT39tIr3eIhqL/tU8I4jyWX3EtQNQ1wg
 eS4uJvuY+j0v0kXiDl6qi0EUj98ik+qs8kYGHK5DZCcCCRfEapa2P0pgyYIdZhCO5y6dbg8D6hx
 AMKm4oLn9ZbfC7oa5CIz1jV2D0ZrtI3yATtExfgANaMvkYrkXLowsPWIOBX95Oc/t/N44H0OVlo
 0Wv+2+c2G+RsoDEiXSbqXDoGxRI1jzXzi0KUlbyqjROfBaHpylz0YsZJS90eM6A1YKykQQAV6Db
 YEwki1XemfujdvJEGEtdSNgkAZOa3d66uk61FOWqQVFStomM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 18 Aug 2026 01:46:29 +0000, Kuninori Morimoto wrote:
> ASoC: codec: max98926: fixup invert setup mask

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codec: max98926: fixup invert setup mask
      https://git.kernel.org/broonie/sound/c/dd0ae9a2e19a

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

