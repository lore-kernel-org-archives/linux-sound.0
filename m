Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A23FF8AB
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850890; cv=none; b=jca9Rz8ngh0s448W+lLjgY4/MwBkUGxIfUT+JqWmQyzJ2LsnwG5OsYgtSYblIaRQdgrFc+aDBaut/08MDxQZVm8NsqkkgqITjdrmu9xjD9NAXgSLB+jbDFT4Nm5IvkMhAytc/am9ZGhhqjhNxt17QL1GcbQkR3XHyGcDuhMs+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850890; c=relaxed/simple;
	bh=7KQPegOrVVaIXGOzb8LG1xqgqTNxq+6IECTr7xzDkLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZTStC+eUoBcmjYT+XS7670hzOOXQwPriGv/lhPY5WXNfQ5B6js1XpQHHutXLJlVmBiuhIwhXwsjnCvoHakUsVExNAHXE9oNlmUz3yBWeLdhnbF5IXJXs4MKJDs28nBtKD66HRNTsQdfDWZjaooJkUMp4p/JT+3JgoLbyVeXxDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvcJ/Hlt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvcJ/Hlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDDCC19421;
	Wed, 18 Mar 2026 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850890;
	bh=7KQPegOrVVaIXGOzb8LG1xqgqTNxq+6IECTr7xzDkLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mvcJ/HltU7VhS8hy8Bmrr0sMuadaCVtBPFRzqN0z1zqEMsg0V2ep3tYmZr/9P49Xn
	 NVly8FUADL+epPvc9Ztj5f5iRF22TyIpKDtawAnYPTtf1T36jEk/6Lvs+tTvRaqyDC
	 oVkiZelrPVScu4IhFD8LiuaHYhm2Y9V+LM8bYW1+FpGYhw0lh+lN+49fyal0DmNc5o
	 JD6HkmediRyKTq0Vr8j/53RCfebO00bVSNpSkhC6FiDOnCkDuQeIbq2U30+3rPz7or
	 UQUneFpI1IaHBrlJYZalUDvnBXyc486xRSiLsuZEska/Zs4CCGww7qBaTRapmEQfaH
	 6Cf2Qu+rQXG7A==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260318103813.249190-1-ckeepax@opensource.cirrus.com>
References: <20260318103813.249190-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix crash in kunit tests on arm64
Message-Id: <177383377212.5804.18090146697992582491.b4-ty@b4>
Date: Wed, 18 Mar 2026 11:36:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9787
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7KQPegOrVVaIXGOzb8LG1xqgqTNxq+6IECTr7xzDkLY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBputEI4adercXELM2ptzTH13SCwdgqerFeuzVO7
 0tQSwFd3QaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabrRCAAKCRAk1otyXVSH
 0FxHB/0Wc9PQu7cPT56ZZX8P0j/NPQg32wxPiQc6G1IubaQKpPG5L+PkWu3PwTt0f/NCionWKaZ
 Zm5pDsZft66+282I2R//+3tpzVSTqPiGeLs4JX9vAkdQ1pU+gEt6qDQufwwmypnjZn+MLf7Knyv
 7rPqDwP/7qVcmgBHI88bzek1XXxIjNwlPRv/TT1Wct4jcKX4e/SuqdqSEOqZZt8hV/q4eRccmv9
 SNtPoxW5lVtToucpaOdwIPEx1NZbkfYN2NNj8d/CfZjjWCMpjwjZFzvp+Rca9N3G4Ge5GvAyK7J
 SwTuLfHXPzHm3DWSBhV2jN2bQMaU+IzSbAbi6OCEBwo6KCrt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Mar 2026 10:38:13 +0000, Charles Keepax wrote:
> ASoC: wm_adsp: Fix crash in kunit tests on arm64

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: wm_adsp: Fix crash in kunit tests on arm64
      https://git.kernel.org/broonie/sound/c/6017671da9d0

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

