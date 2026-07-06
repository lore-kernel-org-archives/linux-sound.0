Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA541D4E9;
	Mon,  6 Jul 2026 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360500; cv=none; b=G9gOG0YcGvASQhdpNFijUro0y/QhcVkLrH5109IIYLbgBgUGV2f0qGEkgzJm2f5EXCXW5trCpMOwZmeBIPBQiFo+6bdMtd0uft95d9zgXLjahE0axPAyyC3umjS7hLpWqb+J9yfPlnS1K9EZYUDndRpmb8xxczSEdeh7iTk78yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360500; c=relaxed/simple;
	bh=KL+caWsOgmLwGkku8IOsy48IVkYB7ygAvj6l/K1kHdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XfGQ1WO5xN3XIoL/K5q97rznkyTL//BEiLtD2OEmA5yJY2fYU64kNj/q9owIBhMYT38P2jBS3ot7CMjqEHqn3OBDUK0q6GwmYRIF3b5xNq79uy5gZKeISDNmLOiAh08toUzMgGrz8XTbZCTFdZsbu1FcmXe4K5OXlIKDSNWRj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooHCeitR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooHCeitR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16071F00A3A;
	Mon,  6 Jul 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360498;
	bh=NXIoTeuJFvQLWCY+jvg0qjnA8QMe8ihNLu4xi6Y+OzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ooHCeitRzewK5NpHrnCqLLsF8tHxlil5Nhb+uaPFe9fCJFiNVivTKPQSXqxsIRBVq
	 fCz/muc2I1s/8EKY8Q0PrltRypHiyPgR858FofBgUTGoR147MqAD0TNzDFIPYl+yRt
	 ls6jPLDWJuvKxHqrFJU1xdm/FC8fyI30Bgf500MPk0rV0gU2uC9ZV/M9zqHMm4Gdsv
	 2XAH9Z+hB5h9QeCW9N6mo/NhmVuuih+lNQgNMP2AkY0ELB7KDFLy40PtvHknxjEPgQ
	 bbotUqz7u7fotY64ZQuSTwuJn1HthX5hnh2sMWGOX658P1d+cTFaFZgS9IGG4l5JNG
	 zwaWZNnnqRweA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Tianze Shao <shaotianze@outlook.com>
Cc: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <TYCPR01MB872223CB999D2099A5E0F58DC4F62@TYCPR01MB8722.jpnprd01.prod.outlook.com>
References: <TYCPR01MB872223CB999D2099A5E0F58DC4F62@TYCPR01MB8722.jpnprd01.prod.outlook.com>
Subject: Re: [PATCH] ASoC: rt712-sdca: reset codec at io_init to fix silent
 headphone
Message-Id: <178334526253.57168.48666916265647107.b4-ty@b4>
Date: Mon, 06 Jul 2026 14:41:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KL+caWsOgmLwGkku8IOsy48IVkYB7ygAvj6l/K1kHdg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS+vvh62Dm1OueVnETKfyj5D/021wZQdjpgL2/
 n6QVgdRWWWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakvr7wAKCRAk1otyXVSH
 0ERGB/0Q1nr+4BxyDKYNDAoW8PCXjFnb+RvIdt4cw6T3/KpBt0YX4Qkbm6JppJfwrrznDymqzS/
 MhH8J2pOtBNys0UsKnJCREO/0gdrhYwhWcgpbvesoDoB9lRECAMrz/FNKhB7qlaX7bpFNS7AL4r
 PUVmr7ZBnuuoEcGpfhAVvyAuG0MNd7OAEupxyc5m1FgTFDvDBdpb/8s2uu4lldhVtA6JdmvJBff
 cwiz9aIrO+lYl3ZmLpVD3Vc1XjEJbW/rlsCANplYmhldmx7p6+M5l6tvvuvpkI5x0ZTobrdVBkP
 FE3Lgg0mGG1V36kcg1borz1vCZjHy4H/RjnWS5q70fu05JFW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 16:56:06 +0200, Tianze Shao wrote:
> ASoC: rt712-sdca: reset codec at io_init to fix silent headphone

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt712-sdca: reset codec at io_init to fix silent headphone
      https://git.kernel.org/broonie/sound/c/4c9854ad3cdc

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

