Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB833CF673
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079866; cv=none; b=YL6belVlnaVAsnF6fXjRd05p4uYYpzVNsuizUiFaVSieoX15pJ6heI5LljYCYAsIteHwoEl2uVH7F3HhmyFtcEQqlfUzysfq9Rj2S8x4aw6mNIvIsAEHniBv4HuzT2uaWsbx6gsLOnIWuNFgetVHEqchym2JjeAPCsd7/FQ2HJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079866; c=relaxed/simple;
	bh=ND0RoURgQ3RwGnyvVmo7QO/O3xUC+HA5Em2eXC8/YHo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pR98gFzD30OkBKA9vGCq4y466H9zfpZniVCakkwIshDZStmOTL4SYL46RWCD2eHV2z79SetJrvQALoQYscj7JIDHh7T+NxXaREOQCYzGW/rwqFqCTUWxjW6RU7wYN5vQHMoucVhj6HHhGbDdl7xqNyAl089mNus3rZg7NxFOjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/ZUVNhv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/ZUVNhv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2CB1F000E9;
	Fri,  3 Jul 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079864;
	bh=eWOQpBgNvXo0ZnRB4wjEU84Kr1CCcsarU29XiJxCk3I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=A/ZUVNhvYm8fBvoacBKJLlpEO8RvecvjMKyoxz4QeiWMXmOCiTb/6CRgnhxUK6JY4
	 lPE49FZys7H+V1fTacz7wEvIuidwYobgh4uBOyNvebq6rXjCPdmeox/x3JxL8iq7Qv
	 8YASyFzF2Yxt/o9Tv6PTwN2RUF9OBD9db0zfCRgg0SStC8s+HBkFRY3luRYt7s6PFL
	 CLVb09oZ0JHWdG7TRjxBmnjAzzEOz9vkxJyGoGZ8JfBEH3HbxdRoVVOO55GvMK/16g
	 0ZK7qX4fdnjosS/NQoU2K04Lq4DxOCwFT0zHf6xRkniXcgSyspT50ws04noJzHZoem
	 MVToRlxxyDIqA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875x2zcjxn.wl-kuninori.morimoto.gx@renesas.com>
References: <875x2zcjxn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650: tidyup error message
Message-Id: <178301502747.83990.10474256834081989263.b4-ty@b4>
Date: Thu, 02 Jul 2026 18:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ND0RoURgQ3RwGnyvVmo7QO/O3xUC+HA5Em2eXC8/YHo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6O2BqzTvCH7uBH245Vly8tbGrQbneJmLTyzM
 oiEVB9A5n+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejtgAKCRAk1otyXVSH
 0CLSB/42N43aBk2WSOu3RocL7AnC0gLvcXD4HxxpO+ZxjDXDTCG/NvBHLUTMhxPZTROTp+fQtKJ
 1cXSXXQDBzLRFkVVua281xjqxoGqmSqEuqP8/B5/DgZ4vqITkeTvCiCH7rcv8urK8IGEu64oQBg
 hT/mTalKNxKuxJ1XMQUv5+pl2KAYn0GJBmpE9o+ZIlRUAFPNmNlL1LaV1SJTcWMhFZ5U+G6h9bY
 JeeLx1NvsroFVyhruzGd7USDa7ld3XhLHdr1Ou/KMrBsoGbGAwbB0gCVx1E+QMtGoXfa9mKvF9a
 d2fMcfKgk5VX1PN/LFsL95xrSeCOw8rkb3asdMpsOb1EPPZ2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 06:17:57 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: mt8173-rt5650: tidyup error message

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: tidyup error message
      https://git.kernel.org/broonie/sound/c/7ffb66fd96ec

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

