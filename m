Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39C2ED872;
	Wed, 27 May 2026 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884119; cv=none; b=dnG+V4Xv0f/UOUfdla48Vh8AaabCtGueGSR7Rdkb2YoWwo6z2yyZLVmZ/ACsBCTJkq1PoWd/FnsHU+S+pgHxY2Z6uBi5kWqE/LCdyUQtgjQJ9j+N9MrS4w73WHftR74EhkzzVncSO8lfsjmVzgJoswnUB+Rj2VwMpqKkAgV1d1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884119; c=relaxed/simple;
	bh=Ir6ehQgZn9QGeAOiHOoQbnP0H1jPLY8aQgGNuXki+e4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bJl35+t5OnbXun/0FWJjey9t7G0QX9vbBj7SaJbVkPV4mhYzfpH6cNFSqpr3m04OAy18Afw50AUd+fxPfGjiSXRXlTZcqX9s4r7W46cGaNYWJ9aOAmy1Xa8KzgKLLP3ltuYJ6De8DhPbEZpSIAEUNcoVe8P5VP7/tjoUx0yWDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZsTL6ap; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZsTL6ap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38571F000E9;
	Wed, 27 May 2026 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884118;
	bh=mB9xDjLb12x/4M8TukgH9WUFhnApCkvXilzqfFzUPjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IZsTL6apoSM4VjEZra853CCYg6OBLHxMAaqRu1A4D+qUoHPQXhCQJDoVZZOcD2pZO
	 VIAm/bWqAjRH1hZQDS93oev+wffB4O/x2fGOgG3Kgaw4093BiPAYTq8jMCNpuX+TU+
	 nNG5/8Ybj5UuWEwlX31fw2wayOYhzYRrraFEDBPcj5VK0jV/LR4S0NNTgzvsw0pYFy
	 7JenP/Yf+7D7O/uU/QZk+I6VWuq5SdibhrzROW4z1/mBUDAmo5JtoUxoNOKj4e62UI
	 6herdxnotAZ6HgbcEBjoI9HEixhj50sYxzgVOk1DXdlyQTcHfTq8RdhjdTYhxwWJr5
	 TpJ4cGbwgQyhQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zhang Yi <zhangyi@everest-semi.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260519203815.1342154-1-arnd@kernel.org>
References: <20260519203815.1342154-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: es9356-sdca: add SND_SOC_SDCA dependencies
Message-Id: <177983009672.868420.3894022560537813503.b4-ty@b4>
Date: Tue, 26 May 2026 22:14:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ir6ehQgZn9QGeAOiHOoQbnP0H1jPLY8aQgGNuXki+e4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFuBTDDoBiSc2QppMlcQWaOXHT9FiiFbXthDSA
 8oehmZVqGmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahbgUwAKCRAk1otyXVSH
 0LkFB/9tEqqzCOBEvT1aQwzofg9qh4KvPRcUMY7/aY9h4K9V8P9MZB1Vra38lMweqUIQOYj5MwM
 8f49zgypwFnKdPjDjA3CQdZiyi+zsaRt/y+iNJhEsgdGBGYPIsE3XMc2PdHIv+TPa+Cbk9FaWri
 Yw6yelL/PlC4Qn4lg0sa5A2xCpamRp4Mhrztxv/XEiQk8snP5Y2luXxXQhPnm88fx1usQtnxqct
 eTjPiJiL5pEhegqZV771ePVFDpRe3ZlBuRfX91UCPi7IfMRjU/4J1iE4Y+38FUlp7dnxluhv/S2
 ZGKQm45vi5eQOtImRDPR9pYmn7Pv+dwzAh6TKiNzYt1qNL1L
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 22:37:55 +0200, Arnd Bergmann wrote:
> ASoC: es9356-sdca: add SND_SOC_SDCA dependencies

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: es9356-sdca: add SND_SOC_SDCA dependencies
      https://git.kernel.org/broonie/sound/c/80cd9b010e37

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

