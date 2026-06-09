Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC43EDADC;
	Wed, 10 Jun 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087010; cv=none; b=egjvxLJMa/W/7drwccpiJwRSKPhAF33m+4aJ987VUrDDZ9ilA7lVlIgyBbufdRsgDZ08IxxpE0+7sM2flotVRagtLFiT/lSIeWENEoKZWpyorH5zWW3yIYXhht7WsVGXThaiA+lPc2sTjqKfRO4FdGiovyrh8AvcUNIDYk+xpq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087010; c=relaxed/simple;
	bh=UQAnq2YXLmupQVM/pRTZ0RkTX4WNPg4BgloksHcYWDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwdDrw5u9/FGCSsjhAzW/Ytk0dB+2Z2pnar7rrdUlLP9OZWnJoVFJShZyr4LxrQEUGeNMlgSy8qZRKaRljxx20lJOKvgKa2KXF9w5HLr4ZPpwvmjxcvZoE/yrEPiTZG9D6jawsSJJ6DcLibOsKCY2MaQZzY+yA9GcDD9OsDWtB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVuxqR7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVuxqR7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F30B1F00893;
	Wed, 10 Jun 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781087009;
	bh=A5u2j0rAyqHgSz75n9lvgtV1EPVu1AaM5RZylBrwCgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TVuxqR7fo/2nkeYwodxnGTCIk0QoewsG0riZBvtWW8CEvWbZcF9yf1m2qh0GcCMZf
	 h93ISY4LQoEza20ZWoQqDeJAhMTMIAUsHPkCuJf5Lm2uADI+CammIpxTLBrIzK8a6a
	 nvQX0jZXlu+1irb8RkDAWi6Y9L94LhZpHe8sDQPN3mBXQhaPNvd14eudeuhnonBSB4
	 FcGPG0njMVnBvBTzKE9VorrdhlUgOrw7EOqCFmpONHPwx+IvMaidnAX+k89xyzwVt9
	 X0lImssyzKLURB1PAHEzFxFJ9+K/uablpun/pCLGY0wbkQV1wKxvCnM1Rii0UIEhD/
	 YY7jSSRegYu+Q==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260604125815.42297-1-zhangheng@kylinos.cn>
References: <20260604125815.42297-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK
 PM1403CDA
Message-Id: <178104642940.212106.9368942774086869570.b4-ty@b4>
Date: Wed, 10 Jun 2026 00:07:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UQAnq2YXLmupQVM/pRTZ0RkTX4WNPg4BgloksHcYWDU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKTsfhZW1BfjU6rp7A4IxvTH6kvNwlLnOyBduQ
 hUHG+ig/jSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaik7HwAKCRAk1otyXVSH
 0AYpB/9MqTLMIcxdYCqrAwfxN0a4dryaxyw1hBP/V0XAyeT5cBfpC5QONuk7ioUNSdnofSEzhCS
 oV1SbOMPakgVlzeMo9nMMdeH9EKXrKltFuNzroyQ7fThybZbEBx8wEpj/dG82lm9IZPmJxezO1Q
 jeDN9IgmkvzjR6ZCI4eNuEPCyVVNmenoqgLMYfY5V75PX5ryVfD28BdZfvrTy+n+ilIqSsAb8xr
 cGaVNOdboMdEMprOD3Jn25v2uQskXiAo0K2CCtMALcmrKkU7Ie49NrmxKZ3x/dTeoDLxCbZMJ+h
 BrP/Bwd2F2rJXr/S5tjnPDHl/7My7d3VUng55etrn7EAQs3j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 20:58:15 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA
      https://git.kernel.org/broonie/sound/c/0e152e4126fa

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

