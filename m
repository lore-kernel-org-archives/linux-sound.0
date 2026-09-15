Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50649CF5B
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560552; cv=none; b=kQPqEQpjW2EKq7i0VlqusMWJ1RByb44paK7OkrBcCjQulQ8Eqb6FmjMuGt6tgbj1wMspZwXe+THfRmxlBPsi86sk0g4uBImhffFyg0FXznZSGTor9xJZ5bIp8JmJsNzOg9NwcM2EK6B6Jtj2xsexqUjWPc+16NU1ZM+gHN2YisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560552; c=relaxed/simple;
	bh=yoxA1kz240bYoRndTGrEZPFC8CbH+cUnAupvTM2bKmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MjLprDHBEgho4aCB5ePMwmRzYbYu5u9EsPKqZgL5n0/TDvCkVawu+gZy7NB9GBla3zN1CYC/wzGcucwj2TDTXLVzcd/prUyJnIVTYkGYpskZeEsqf6aozDU8nsvT6kNhP9wdSpR7b+xBVvFWGCV9uGqsmT7CPvSeJFWtyi4uRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR+eIHEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR+eIHEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631581F0089A;
	Wed, 16 Sep 2026 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789560543;
	bh=GXQL20AwuRzjAWqtZEG9BabUC8NlGurVmHebuRja4LU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gR+eIHElQpXaad5G0wpqEpAK6ULiMNRbleEgzgdXOsHtUwaN9lgbLunPsKoMVMDNi
	 yH+yfM03E4g0L5DozpeajeH6eZ/FYpHg16L/rmIDvwKkgPAwD7r8UC87y6hbvD2Hur
	 BP0v38BJr6TvLOlKzJQ+PIW+bAmVCiW9HIIlw03QAKtgjQeeeWdQApUGf0NkSFsHne
	 v3rA5IsAznPeUiqABrXBegxzaPRattSsuyh8tO6+6VHYB0ccl7nCC6HSPyIgggVESp
	 xWKmxwwmgIQo9kxawcm6P2wUjqNWsCJ324JSKSxyZtBF9xvUhlApJU8DvM7nHOCcti
	 sgjH6hO0fXM2Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20260915023006.22940-1-zhangyi@everest-semi.com>
References: <20260915023006.22940-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v4 0/2] ASoC: codecs: ES8326: Modify the configuration
 and add kcontrol
Message-Id: <178949554587.151760.8003595604828534881.b4-ty@b4>
Date: Tue, 15 Sep 2026 19:05:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yoxA1kz240bYoRndTGrEZPFC8CbH+cUnAupvTM2bKmc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqobcNjiPcjd1DLONYZWRBV56Eyq4uQUnUZYeU
 AdEdy7CyXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqqG3AAKCRAk1otyXVSH
 0KFIB/9MW2z0+vaNbbaNp89vK4uqi2OFcf7HYGs82M1j2Xmtt+x8JVn9fGAQVvcPBrCbNNsK3HL
 eLpoRkwCbZP+UxX8AtenVsUjbLrV33+Bql5/Mq+1dBWfyeBtQC7YYcnVXaGx//1oYuVM8Atd4XG
 T3Oe0ld9o8oWU75DOIyfj3i2kFmLUbwZ3+ef28Rn/AHz2ly1aHHiOsdRo9FGt+EKUdttfWGdU4G
 wHXFEQSUggSBpvbwQcXF/8l5EKkasnZTsKZnwIAcY4JNfOqNUxTbwK9W3Nxfulty0NMJtSZYOQ1
 HtBcqn780VOC3J2mN7ZoKnmMPLSopbyVfL9qG+VHWjRguSyw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 10:30:04 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8326: Modify the configuration and add kcontrol
> 
> Modify the standby configuration and add the kcontrol related to HPF
> 
> Changes in v4:
> 	- In kcontrol, additionally check whether the input value is less than 0
> 	- Move the assignment above to the end of the function
> 	- Add a lock in kcontrol
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: ES8326: Add private members about HPF
      https://git.kernel.org/broonie/sound/c/b75981e29a5c
[2/2] ASoC: codecs: ES8326: Adjust the standby configuration
      https://git.kernel.org/broonie/sound/c/7502e1fca731

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

