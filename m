Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4EA37C911
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296956; cv=none; b=DVXehjABX8OREKoSIvqKvolheDC4CVovE2DfWsJ95mLzExhPNHHGegR8ZqgL4IENWG52/VtOtggKlk8WKnD+5Q13Pzk7cJ0cLGGPKvYez4J3lwH0h/Y11NtssuJ44wIMrMcK3FntH2JvbZ1pfTg1k7Fo1m0qpkX9u5MI0FVCoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296956; c=relaxed/simple;
	bh=+UyEuaV2IdOorXqucPZWUWnsr9eVEW4z3CoIi1Ovg5w=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XMcQuOd4meYuYXYMqbAsQS2RcqLZy9fljMYqCAQ1LBZEZ9VtDh2K4ffICPaM616jdZVafRTsaTucsjr9DjfZU9ez+mp2anlVOpXjtp7MwrJp1kMuPgD73z4cREL+q9pF0fTjhRJMl8R64P4UZIzi5ehDxw4gVaDhDEFxrj37Jw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQud2vCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQud2vCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19C81F000E9;
	Tue,  1 Sep 2026 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296954;
	bh=wRjGMFYgpBoy1fL58i9qEJqoecuKLR5PQDnQk2JTbIA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=FQud2vCyR/Y7LyIBWwnH+4Sz/vfCrBe1dSye68jw8/ftxjOpV9/YA/IwzmaabrA0/
	 GR5Kvw+ftVZluXU8wFe2zjMQwEew469fa48RPA04/jEIh4C+MK43Zf8V4wsuL0qrif
	 nDVQ5uLRGDoM3kK3O1f4OYOwTihcpJGK772xcxjQmVd8DqvwC/Cl0mZaVMIOaTKCgi
	 C8RbwmQJp6mBQD+0hGkDcgZ/U7Hpeogi0FOwkJWg+sqiPNhG5hA53k7pSyAzm4UDuP
	 SJpIJOaAgTkFFHBWen0iUtqQhVbefMxAt7bnyW/wUw8D2KMUQW3Kk80O1uSh1RhlKY
	 Cfb54aNbEoflw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
 Zhang Yi <zhangyi@everest-semi.com>
In-Reply-To: <20260901104946.20114-1-zhangyi@everest-semi.com>
References: <20260901104946.20114-1-zhangyi@everest-semi.com>
Subject: Re: [RFC PATCH] ASoC: codecs: ES8326: issue about capture pop
Message-Id: <178828341396.33904.252698707518105372.b4-ty@b4>
Date: Tue, 01 Sep 2026 18:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+UyEuaV2IdOorXqucPZWUWnsr9eVEW4z3CoIi1Ovg5w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlz732gy+VrbtIPOQIxhMAm2Fxf/JEx0zOjdbk
 qK7qnSgYk6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc+9wAKCRAk1otyXVSH
 0C7NB/4wyRja4ahhCcr/U3TVOPf+zjQENU8H9vWLoFwUMyrmn6q1HXbO9YDMJsUoGoB5m2j1QIT
 bPc2UsvWPa1iGZOXVEW9pMGKZNuQ+All0np9CdAKbRK/x4b6fV2GAhaxlSZmiweN3Kuu4uM8u8X
 souw8rB8oVE2IDsdGbWgOGH9KfzaCrrj8q0Y1USYsC1sC0Wgt3jaKNJMKaMMbMOBu/B0FpsnboG
 zOygflH0YosJ8mnu/GlxZ7xX3ZMMY6MRBqF7fvkYV1iqEJo8Wxh2Qlz873ciPsGTFZ1GPzIwHEq
 imeMwMFcUOP05DTPNFAU1GPYEqcBrflWvZZljcsZKDXm5Zud
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 18:49:46 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8326: issue about capture pop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: ES8326: issue about capture pop
      https://git.kernel.org/broonie/sound/c/4cb4aead9838

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

