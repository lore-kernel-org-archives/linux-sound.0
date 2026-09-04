Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52782365A14
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552621; cv=none; b=QHfxuNtS4SlAmlRPsRVQYwc9I7mzCpndTfSQIib4js3tAAhdrQopEgYCZwtcov/VtgCz5BBE/OKxwfQpQgIgJwWqi6vQPur5mRTAinr+4zsDPp5FYJrKFE5T1bYLueofDaBfWvEJp8s7E2HXFiG2vRTJAAIQ2Htkrv+i1iDi9Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552621; c=relaxed/simple;
	bh=wa492X/i8P6YMT6cdgSH4FjtHsREixnbqyz6aFqODws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p+0hYOxjQhboMMCCNAHCGOpaRdl8L1v3JY4lGv6G1O4++dOmCpdIy2fkfQWuabjX6VpqyoPeLDitmwbzT4JzIbw3j2cTOtbNt+H8lIfLpeYXczWWxJqCkuzqBqpv40j5FyPwp/uOaGhh288YmT4zsNcVKpSr7bp+r3rSgT/aVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxEb51eF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxEb51eF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D868B1F00A3D;
	Fri,  4 Sep 2026 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552612;
	bh=pWfyFzeyyAB52fHHGhhS6gWs6JNEIW44ThVRFZXYTwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JxEb51eFWOpgoDjP67ps5JaQFxtcvrLZyrufZOjMjlsJsKvR81r2qQdQDgDJw79mI
	 mf+T1RlDhHx+xfyENOX+3nOw66vOmdwdYHeRLrjgMR+SuLVn3sVKVoHbLjj1xUZTK7
	 1l/fD/Q7zhV6FHSgxlzIzZX040w0WSYMnWkIS05YePsQXfUDmJGl6+EpyMMZAuo8Ov
	 0Mt1gyuU1/GEHTSH76WBaRoEVCOOB/zuCiOtWjP314Q7rUCh34sdbqGAnl4bcZMw8q
	 2LJcV3EyGEYVxPrwmyQadxQTrDd9BUTgcx6OFgPF+mGfsQVL3OXbqQjEL0pndEkjt7
	 Wyw+nJ5Iw1akA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20260904104141.3885-1-zhangyi@everest-semi.com>
References: <20260904104141.3885-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8389: Prevent enable_count underflow
 in clk_core_disable
Message-Id: <178854078142.632048.4622622365603919798.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:53:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wa492X/i8P6YMT6cdgSH4FjtHsREixnbqyz6aFqODws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyWh+87KGy5DLwD2Kwt02+0Xy0K7q555JAWVy
 WnW9JbaU5aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsloQAKCRAk1otyXVSH
 0BBbB/sFNOOC55hKz9p0CwDMK/Y/J4ZjbbaJVd8WdTaKLXTsLpyzYB2bOi7IDSGV/6lT3sAhXN8
 gNDeCmmrYnHLr+JLf0aAh3A1LiSJGAij5fg57aMTGQfuiVl/4vCp3jKZGefTI9hE4VZcByohDpu
 ekBfnk4T/PO8lzh+bdCDR2quUHRfXcpC07vSDh/TCpVeIC/H5KlDHfzCdppZlcelRyDTbcaC3O/
 DsgLB0T94OW5Z4MLTn0dZs8wZJ1EnNXTyP62uooE1pzH4e8saDeJSTuwrjFuJJCjXA3SBRfbVvK
 EF5/cbMajApIzstjnV1ZgFCPeAvglw3Rwz6Trtw5vqCzruAo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 18:41:41 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8389: Prevent enable_count underflow in clk_core_disable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: ES8389: Prevent enable_count underflow in clk_core_disable
      https://git.kernel.org/broonie/sound/c/c1e01ea35093

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

