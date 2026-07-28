Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F417A2EA;
	Wed, 29 Jul 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331953; cv=none; b=JtlxJ21oe7WVH0MzFzeRCTK5hz6wZItZ1Z+mW+WrTES2kcx9mEP+8xh17uVMj5FtTBLk98AAPvPHHz1SPyQqu9Hr9TCLzvBRJzY7yxp/fpxFgFNx1y8upIsq10zmBaVcElMtr69coZHaoYTbEpVeL9waozGqpAJmR5LwYM8G+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331953; c=relaxed/simple;
	bh=H4PXMb6kzsC2lQeqAtOOPuzgDrOIRcalxIlDQnZ+/gc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OMi1oPOdyuQLTy61xAW3NBerMPl8/XbbNEbUcIqBg5JE9jx6PpWJj7A2G6BFRpagCZgse07TSYjfcLrF7PjMGlgdrRHt/OK3C6US1XtsBxYYzdfTUyuXM61bfYbtWwifhzVjXQKDqhx/mZog1HgHXnlg+/UBheLIT4SnLaw7hRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=df65KOgj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="df65KOgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C561F000E9;
	Wed, 29 Jul 2026 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331939;
	bh=J/Onbl8F/XNCjYT3JRdEGudvWR26qkOyF7fmg/LHukg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=df65KOgjpnbcBR+sYBhExYtJviov9hYqQ2BVHnI0Cripnjll57L6eZFdsBrJKYnVi
	 Ou3rHnIp++ZvPtSGJs60i0PElPY5FqMtbhMQGsCnH1nAXcR4RQhQRNgE7TDLWwUMBw
	 fntvyTI+e+p+KiLTqLRHJRpj8nN6+U6feK2uU+at6l3DnL8z4uPw9e/RvgbBoASnpt
	 2XIyl30SVTVc6b8dD7H00ef4JM4TULJjlLOH1Csy73jYBsHP2lxCjElrZrIQqvh8AU
	 AdZ8IUZijv8VEAWXJFdX/5ExPMyRa9rMigP0Y+f7Aq3kqTJE3mzmVHTnzI8/E6fOe/
	 QTt6KcoMXEsGQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260720064131.75156-1-phucduc.bui@gmail.com>
References: <20260720064131.75156-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3] ASoC: soc-generic-dmaengine: Handle DMA channel
 request failures correctly
Message-Id: <178526393453.318884.2284982156120291222.b4-ty@b4>
Date: Tue, 28 Jul 2026 19:38:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H4PXMb6kzsC2lQeqAtOOPuzgDrOIRcalxIlDQnZ+/gc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDhbaASLRqEELYxVnAFlZI3vblBS4iAINV7f
 TSJMwKXUKCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA4QAKCRAk1otyXVSH
 0FquB/9KGg0KEiV1NPc/lRG5daODePCXv2WmZwRfPNuhbDhXFBo9MsVjPS4ZMqqjAiRRZuBSgt+
 ZmkunsbPGK986421X4BdTcQ8PXZC6tb2uRnDeGTrNRwvUdhML4l/iIjR6lxUzyJ4JP08X1FQtq4
 ulVpi1IqWC79LIamAmdnBO+J1igav600yt0Fd1Hm9yUAK7brWSlTmzD5satuVGP96jf/eYRaSdo
 xKcHzdDRARvUKl4WqXdT5aoyYmDyZSf4y9ejThliHpuNv2YVvZc6AzhknIJeG6/XpeAxavSTFB+
 Axxu5wptvPT2JX0psxRBX9EehO5b5fErhMXFQ265nO9CsqnL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Jul 2026 13:41:31 +0700, phucduc.bui@gmail.com wrote:
> ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly
      https://git.kernel.org/broonie/sound/c/9167f260477b

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

