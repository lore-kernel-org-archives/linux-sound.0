Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262539BFFC;
	Wed,  3 Jun 2026 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470300; cv=none; b=VxsWWI+oX+fiAW0L3NsPgfTzCE9PkOAO/eVqf422FZ5p3M01n/kXHFa9j5oFq4hpN5+vTiSjPAlMTT6ycwxejkupXU2Xwl9A8wuKs8Kz6Jf15MC/WTKGjAia/XIo//D14+FvXg4ETN9+1wC4IUoLOnvh7lU55NFUQsKPPjSoAaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470300; c=relaxed/simple;
	bh=u75aayacHU5ThArfb+NDqELwfPIiXKr16QTaLHvcvkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kg//z/Lj+XD4P9WOio9puUHRsmk4hsxi4HFwHe/wN6s4bpPqhTeAoFX57KJgUw93E35TAh8/ITFKusHtgKa2g51fpOJ12LlOzs2vc8BkTjdFOBvZU23DsyRYyzJxjz83jh8u9jkGAe8vaGQ4WM2aGCEcu53SLH5buUd+96GUBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rabq8mqJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rabq8mqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862A41F00893;
	Wed,  3 Jun 2026 07:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470299;
	bh=8iI/l+AKt2+8EYUbXOy6djmep/HEurYIeEsYlGH84Y4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rabq8mqJwr3yr6dkdeKgUiUJedkzetR735FUOoYxTqjcLGc15BosqcQh0XaOytFzy
	 GZqHGDWKqsWKbAk4BlJQsWy7EnmOEi7CfJqRwQF70cmXMyK0GJYXVo0Exl6jb28S0u
	 HefkdKuXIGUsDQEwyQgmZNgaNyPY2cfgqe1+AQ4LetAETuchelLyRzL+R7+2ALdxXT
	 cn144zZLcvVshrB+epr30y3ZRtdUilZ+uBdCNRiBFd6/NQrQ+lqoj9KMwX0CKHKtHW
	 DXKhk1I1CxQ745BIwUU7aNJoU3UEau6KMPT5FVVIWz17uz3aArOoWxy2OGBAqAn8B+
	 VKPXswVXWACRQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260529140350.408557-1-rf@opensource.cirrus.com>
References: <20260529140350.408557-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs35l56: Share common SoundWire interrupt
 enable/disable code
Message-Id: <178041171690.93058.13399612595454104137.b4-ty@b4>
Date: Tue, 02 Jun 2026 15:48:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u75aayacHU5ThArfb+NDqELwfPIiXKr16QTaLHvcvkI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IZuqsGpybZGB4uAU6RxfPwJxli8UNI55GA6
 crE5/KYjAeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SGQAKCRAk1otyXVSH
 0LE9B/0a3wl0c5uHMur/4QTAWxecH8S7uTqza/ytL+hnT5GuCwZZuzP0moJuMZeBqJkRsq/XM0Z
 nJ2/wJv0waDIpD0yhIIcTvFmZwFHsDofE6Psi9fDZC4HkEvg3X/8KErI3djpUFeF27ZK4glr0bK
 sO1W2yIgpf5Ux6oR4SK/jT0VxhjVTr1p/RcqDunck+kAZ+H8oqkixW3RK3icWh5a8e4EWCmklky
 XvR7z280vzUu4XuB0E/Ygk8rurMoolsaaKiyHxe5l1SVW4SX59GIyDmWFX/g+7KLz/tOnmP6Gzq
 yhmHt7ILmUTgHHT1vnOphD0OqVr/0MNgUddvKk930Vxzlwrb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 29 May 2026 15:03:50 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Share common SoundWire interrupt enable/disable code

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Share common SoundWire interrupt enable/disable code
      https://git.kernel.org/broonie/sound/c/cab82caa2d37

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

