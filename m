Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450274;
	b=QgqV1mfEZqp83G+XpMgsv21YG6/T40fkoPXCfmD5nsft2LEmgDC8DIln7dmg2dIMqmCg
	 YN0YbI3+OY0fr1WlGSOqLX0tQXBxbG5asyVaO2f/3GzEY7ttcCBLB/isawkOx5O0Pwu9e
	 YepxRnZCiOYU8FoVpn1wc3qj6EAlot/DYgotpOzHFtTdKn2fpUsFLmZhXXwtZaAUy1Ipw
	 N1XUiuk4KAX/MoT0W42xeXeXLCoPReImYWHZTSdDBQP6l+gQbmm1XRo5ln10XGq00gTKG
	 Nmqg943VLNE9+R15f3CKmYI30zlGGomEklLT7wHz6mz7JbuZem7CGFIGjoNpZ60HOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450274;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=f6evkd5ySwbUyxgsz2UdwCGKTAltayTDuC8CByxF6pk=;
	b=iy96/pqQlLoRLKyeHkHlOJwrouZ4CEsfJRePKpusxglrbAgxBxuAEk8uL8IF7zzsLYBu
	 pyiS8iEinSlUbkKyE4JF4iZti1YTkoKfvMWxeNSB2TypD4TVP8sy/M949bkwJDWAAbC/3
	 hYU6kg8i2Tyfd+46ga9ISdPvR8ICppKpVjYz0IKbiWaAYJjH2HSZ143E9sW3WxCnTv+U1
	 T86ETL7eK2NUnX3117c09acpSulJDHOYLj1VHn9XRCdf2K/4479aBa3WbOPEjZPES8f/W
	 UfXrF9XhlO1T0ZGPsLYCZf98xQEF8m4mXZJHTEuwROQzyL0a1o3QBqVSRQnsmaxl7hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1a6MZxu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A80606A31E;
	Mon, 23 Nov 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1a6MZxu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C191F000D0;
	Mon, 23 Nov 2026 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450273;
	bh=f6evkd5ySwbUyxgsz2UdwCGKTAltayTDuC8CByxF6pk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V1a6MZxunF7IFCRFCLLy3+1LeD16v3pUvQ0kXbMhCbZRrJyGpZmBOwAhmAynRC7ju
	 EgS33jMahm7D7ZSvrQiUh1DkDSuLWSVMlJHA24POXGIpYyaAGkzCJxsw7copPOlRz1
	 fGMg9ao+2K8A/7NwewSqUFyBl/v1iAUItKaCOn6UvwhlBUsJrabIZhgLp7z/uVNs38
	 x43woMf/7ncAvelEBEhagINuqZK51tgLLQEwZYNKXvJheR/WY1nA5tlCtGFSH9y4RZ
	 FGUT9ApOk6qN1rkiri2mZW0QPfkttRMFxFb/DTEW8SYgtV4cJ8yyFu8oN1HPOmHUk0
	 brPnFlhQjddXA==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, srini@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075841.50185-1-zhujun2@cmss.chinamobile.com>
References: <20261119075841.50185-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: lpass: Propagate IRQ lookup errors
Message-Id: <179544219570.25092.3827596718662265347.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:56:35 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WJj+xU8G9FGeh9p9kL6D6hb5jIf6D7dAjVkjBXZPbTE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZUucvO3ZZUT+5nM3lz6mOuC2/t2eflTQterJZhT/Jf
 0dScte3jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyE2Z+RYRlvzqTS/T8Ei+We
 yl59aLLmdI50/jvTuc+eLZiacqt74j5GhnPTv0a5ydxdvX0e34Snh3Z/Fp71SiZI67ui6xy/z01
 bmJkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:58:40 +0800, Zhu Jun wrote:
> ASoC: qcom: lpass: Propagate IRQ lookup errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: lpass: Propagate IRQ lookup errors
      https://git.kernel.org/broonie/sound/c/d5612641c0da

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

