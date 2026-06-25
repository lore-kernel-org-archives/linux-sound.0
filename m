Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A436CE10;
	Mon, 29 Jun 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735256; cv=none; b=pGTgkPYhzVeNcXx6u0qEVmMjsh3NJzQFnWk8Z33gauKcGW1jq7KLHmzneWcLx5M678ArDLCeAFGGiA31CDud2x+UOKuQAPU10ELpaHLL0sfUksSCDT14pUuHcup/iirfcsR9QZNSDsHJGBlPzYHTJaFt/CLF7TYCl1uR0cXMdoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735256; c=relaxed/simple;
	bh=S1uHXem2NPKorcIgxQtqKkiIBFoLN4lrRepfZPijNe0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jDUHPJG2s+EyyItbZ7IX+CZMiKpdmNyWLdkvbb4P5ebTTATRsFs4A9r7+BQRLgfLcOfxMM8rLwV52M7RcEIYOyDwz9vir2sxKVCT7REv+Lsrn+fDxujTbgs3gDjKsnygzQza/4f5T8LG7s/H+lRz/ia0A1ACZboNm4sxIPTp2Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of51FpbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of51FpbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B551F00A3A;
	Mon, 29 Jun 2026 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735254;
	bh=n+coV1M1k9ivDucBnlClOj7zKR27F4vBF8Pokzkw63Y=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Of51FpbA6HZf9/yVnds+0yyBzWj8QCMKAo0CYcwO6gMOYO/mvx7EWIGwefwRhRHwS
	 JB581U6jI+P4OYASwOG/Aqc+cHn0tIOsxWN6i+7TXRnh5iEg1YahtmqfXY+Smiappl
	 Aw8aMt+kYoGhCMVhYEboehvN7Yw0c9+aBg8fLR3NaKokErsRp+tTRxeeyK7o7wbVyS
	 HfwHStRiv0i8oJZJscXlRdEfHfR4f4R4m4nBSw52s8qnkkKtDTnVoAbFxC68Uq7yw4
	 5lH30uDaR44kTY5KeIu5JD7dJ5CKSnyzLP+X14QFXkHApMRWM0x52tcXLXuB6zYWzr
	 xejSUPDC73oPA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@oss.nxp.com
In-Reply-To: <20260625102416.424911-1-shengjiu.wang@oss.nxp.com>
References: <20260625102416.424911-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment
 with channel count
Message-Id: <178239587658.51343.2769093541201001196.b4-ty@b4>
Date: Thu, 25 Jun 2026 14:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S1uHXem2NPKorcIgxQtqKkiIBFoLN4lrRepfZPijNe0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQmGTG5TwQoa6xRAxjRcbu9vHK0fnsbEKCdAdt
 1FXmqZvZ3qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakJhkwAKCRAk1otyXVSH
 0JfeB/0TG2IJV8dN6ol8F4L57VLrZBoF7T+7fvk1ZvZat7083qw8BgAq4M1SP4lKZqqC8VcwvM7
 gyHOadeU30f+zwRWtC8vLRF4LY7CcAhZTr83IJKDLlPfqTQ0+20q/xXaiBQj9sIPq1I1P0XHKiU
 Eg56u/k78XIchupjk+6wReOxi++HRMZ73Hy41hxD7b/degqTwGcFyfxoTobXXGAGeS061MKrTzi
 g1fSZz2G0fXIgqiOjHVU8XXYF7o1caxLQ7hPi9+2lJXIXCGPDF6Dv1Pd4EB8ZCAu/TjEO+FKvjw
 BwYiw5pXnyHTNoPy/vIXVA0rycSYxu8bzMbYi3Dor9GCx86j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 25 Jun 2026 18:24:16 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count
      https://git.kernel.org/broonie/sound/c/cf6f56990ea2

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

