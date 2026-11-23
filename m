Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450270;
	b=Eyu7/jytbAgFWD7azZHRF8mvs7PcTlRQvtvOjNIgrIq6TOAKwWTgVJf7fWcPPvAT8MO0
	 lFIjbMANoRbXF2RbYGqqLlzz7d2X7RyqXeLB0UPWu8nJ5YpdVGRTbzzrwM4MWGCXw2OnR
	 5+oApiopYhJWQDnidLMIfWfbHLfpBeZ+7UB1yRKtcsTgpaSvcDof8gKbn+l3N1X4OVP2F
	 uG3qU8i2VM3DfWgCHHQFE+VybVO7eFdMn0r9wFw6jzVhWXsqUGtoiEb51CNFuEB5NVlWc
	 iEYMt0NdV34VoL4Xe5PJtX530aOj20MemhMkmPd93v3kthJtAdOtnEwFQwzRTW1xZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450270;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rmlmSo5J7MSzeJI4mF2JnukNKM0ELqAM4al7+0B8wAk=;
	b=z+JgpU4UULzamHr13/Q1pgoNsqlV/cBLjEFyWb6e9KHZDu0EljyDHEDyZPYzMOP2rZMt
	 b/pxi3IyxeT2xcruNYewyBkC4rkv16Bj+xQcCwKLaNZGQBr6RolzjrUFLYBoXZoOS6s+N
	 cB0EvqfaLU28Jsi55tXr8f3TwaER72Zl3Bhab4+lmOKlK1Po0REMF5fkZcYKG3r7a/EUo
	 bygTVFw35kBBoI4D+66k4KUFRHtSs8evJBKTzDUTQDvkNhxSS/OuPBbGF8SSiej5Jab6Z
	 emLgoyuF03Pk2KtSTYPWYSEkNuHoZKxZV7NorRRtzxDeeVGpOnmN+o7ZgTJpK0fM4jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISaTfiQh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A3E606A31A;
	Mon, 23 Nov 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISaTfiQh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF52C1F000C4;
	Mon, 23 Nov 2026 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450269;
	bh=rmlmSo5J7MSzeJI4mF2JnukNKM0ELqAM4al7+0B8wAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ISaTfiQhMNhH372l0XuZmburNRhHWJ9IBoxCVhcEl6XfTU+Bf9PY0OVv+M1Q/u4Ho
	 QPYYL9Kfpu/ULrFQnziZ6CjcFuEAErgq2Gka/t4Ty4JIb/coyagY8Ksmi7YF0Dlmmq
	 JIgVFFNv6dAJM1JG1pNcZnc+d38MFIo4AMJc/zDQcYOg7l9paox9Wio7HO/3HrPqbE
	 Yaz2fz6Eff0RqIdJ4n/dI5UwQIARM2tEg83auNQl+sA9toypCIkzG50V2vjEuS9zjU
	 epOjfa9XZFGAWkGteS1xts4HYxGl2OA72NtRtBmZ7YMP2jyvh3cz800d9wDVJW6og1
	 AtcwnwsI2ZnuQ==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119075716.50110-1-zhujun2@cmss.chinamobile.com>
References: <20261119075716.50110-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: ak4535: Fix AUX input DAPM routes
Message-Id: <179544335431.25092.10843658359018834117.b4-ty@b4>
Date: Mon, 23 Nov 2026 14:15:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5wtudIOfbJZMa4up/bwmMQJ4Cz9GQUrKO3aTPCxGD9Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZUmdXrT2bnFMqwHdrelnI9DNbco92nlh2pj/88zyDK
 Y8eiMtM7ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEjogwMjRo9B661eeeq6ku
 tOtGm3XKnb99/1Uf+Kxet/cf/+3ijDUM/4uP687onHI7JnImtz67zia3NS02VqYNK5lM2PtY/ru
 94QIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:57:16 +0800, Zhu Jun wrote:
> ASoC: ak4535: Fix AUX input DAPM routes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ak4535: Fix AUX input DAPM routes
      https://git.kernel.org/broonie/sound/c/a6ac1eb673fe

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

