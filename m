Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C74C3AB27F;
	Mon,  3 Aug 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792074; cv=none; b=fYuyRRuRWYjFWWkpL6pqA638MFtLz1Ubc2uM9GvJQtl+yz9QW+T0Wdn9GBgyMhOQCnz6KQCGqz8J+ayj+UAI7Uqe5sSJd8IySH8/j7zjzeYMY/3T5roemTEpKWW9m+XpLu1bjQZ1Lz85hPpg6+xPMdpaOwTxPNZ9KeFg9VmcwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792074; c=relaxed/simple;
	bh=WjokhuLJoHY3a/CX1v7WlJzCkmOeJ9fW4R2u1i0ono0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WV3u/9MTx/GQOOTI0vOqVpb0+oHt9/eevRb/VaWaWxIT2PT02TrhCo8FaqfpL0ZwfXtHxM6ggWXZKdTECSpBrET4DIFS2rZ13haOdDbY7NpLjp4hR9NKhFXEjFuE/1vLErMQpEFoaFxKs5L2LjN753gk3VE4aAW7lmu6D6agJyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu9LWZau; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zu9LWZau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9726A1F000E9;
	Mon,  3 Aug 2026 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785792069;
	bh=E6BCHJ5gWQ41tAA/0MtJPZdIxjHgaxTZ3QQRHFmuQZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zu9LWZaux+FUbH/tJ/6o2lS2jxLLURjTrSIIhtOmqNQwg65spXr7qtv9uFkGSiERs
	 ieOD0m5Ki8LIHg7WjRAQHF2h4WuMTj+prASB9PaWCUKYoi31auoYjTzbjtHKcjEfGa
	 5FuciCLocQjhDSA5icPZNOdzqH6HHeyRfmVCpBScVZIpIb9SA6Z45ESj32sywSFafr
	 35Llcbab6Ylwo+Wa+y67Rvb0siF10J+vqsdjZixu0DNKOY/k41HjLFWRufK1FQzvju
	 9A2w5CVpgiguzWSG0ULkXjHQfMYADbpDgFGrzMcIo5EYO3S6RrDuiWLt2NZzfMR7xl
	 lb+3PtUauvKWQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803135648.917760-1-tiwai@suse.de>
References: <20260803135648.917760-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: sdw_utils: Use auto-cleanup for put_device()
Message-Id: <178578380849.255647.9554574461013662416.b4-ty@b4>
Date: Mon, 03 Aug 2026 20:03:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WjokhuLJoHY3a/CX1v7WlJzCkmOeJ9fW4R2u1i0ono0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcQZD2Gw20eREDv2rgRZlJ2ywsP3SjjjkSVH+s
 SxnXgQ9DNGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEGQwAKCRAk1otyXVSH
 0MSDB/4jQmIlvxFB0vvGUuqC2MNrL4yrWE//tHYPcRJNyU580Ghf8Z7ovLpeVY+/Z54nohJs/Bp
 MkWwHRrpT6Q6y+fclVragiPoWgnowjQMXeru8VpVn/co3nMbnxpnIncyP13P+9b+B1whuU0CZZ0
 EQ34uuEThFH47K/kbfEFpSJWV5IoAAOsWpt3IFxr/IHbC3bRnib8WiSic7j8o0m+zLTQgYFvfQJ
 BfTtDoSES3zI2pbG/9mF1vqHeGQSIIoTVfoD+A7bq8PmdYzdjczP0XIXmswb62G1ep49/A8MYmX
 J77Z0MkIqFUPUgDf5Gw4nrzhqmLj8Wh1CFk13gNLEyjuu9ax
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 03 Aug 2026 15:56:12 +0200, Takashi Iwai wrote:
> ASoC: sdw_utils: Use auto-cleanup for put_device()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sdw_utils: Use auto-cleanup for put_device()
      https://git.kernel.org/broonie/sound/c/cf07f148068c

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

