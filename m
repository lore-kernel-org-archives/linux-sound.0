Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862029;
	b=hdvrjoiAlFHnwZ0m3m9ppCRxPVa3qWlU2oOrrFUY7VBBUbDTkyC7vOnZMEDgEk3c9VxT
	 04Xl8naSCp4jRyGmEyHSa7gMvkAcs5ngUG99uKrWAWcWQBcJDJqqPLmtST3ijNuQy0pmf
	 mP5wuD9pcKbVg7qtIRd9Yfkxk+kqIgpjVRFiouvv/Aibe5XBssVEpMgbrZ3g0aDb7UnSE
	 5gV941mRwjReCXI40IWLKP6Tv2wU8XsH88Mja2kgmQi7i+6oQSnXJSHF2tXLZZvo3Jh+7
	 x1EF66SkrHhTNqc2/ig5O+7zQJczSa9tpYFtiRYexIgYArNZmTQvskoJzy8P6gUqeBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862029;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=spuwznmFif8ClY0PJJz4ISR1AZmgjTB1CPE9Yz60cQ0=;
	b=zZle8XJCSzyyjuQ+jkEZS5IdqY4qF106ZbUj6KKiME8906rn5/V38nN8KxuAzsJRo7xx
	 dzx9hF0DThn6Ebh8XEGGimk/kUYsTbV8EY2b98MotUaRwrOJ2lB+jG5KuYCB4lyQy3noG
	 bWGqyX8s5PFj0NfXxZU37N0cyrxmb35JLBoPtPjtWXqCRzpSI8m9PyzucMRxnq+zf9WgQ
	 JEcW732ZDbvS9JYjK587QCq02+zGX2Hw+ougwpYjLU9phI2l34GJmv5i1pb7tjpJEs+p1
	 VjZAWj8wvBSQpZiLRCcpL1N2jaCaJL3s1idSvCpiLIwLwC9mc37R6r+UI8psdZ7xsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgR3e4PV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09089606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgR3e4PV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08641F000C4;
	Mon, 16 Nov 2026 20:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794862028;
	bh=spuwznmFif8ClY0PJJz4ISR1AZmgjTB1CPE9Yz60cQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NgR3e4PVCRLKaOgmu6k7Zob8Cz2VgQLwPCG0Gh7fV7OdmHJffKkIZFcDjr5jeorBa
	 +OUfkTEyqoNM7FHKTpqn8n0YHoCn0gzkdAImcoufQCCpybHVW+K17kEevNKPUrvdzU
	 g16xMhwUHYCQt5Nw5KFXsdPhBLkSR9J2RsajlwozgCvu+/Kih26I03Y3fC2ju1Pwzy
	 IMZ7ELknQOWlFDAMHGN8VKOEGs0dTlFdoE/uLhm1weQ22B+o798q8nrS1Z9t34XitZ
	 XXTpqg0GTt30zeoiRRQQ5gDS66oBNVOGPBsAeK1VbMBSJWwlivqNI65BSlu2IuiOri
	 /kKNwphj4NN0g==
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 bo liu <bo.liu@senarytech.com>
In-Reply-To: <20261110034736.742465-1-qianghua.wang@senarytech.com>
References: <20261110034736.742465-1-qianghua.wang@senarytech.com>
Subject: Re: [PATCH v2] ASoC: sn624x: add support for the SN6245 part ID
Message-Id: <179484700102.186909.14702828659133477111.b4-ty@b4>
Date: Mon, 16 Nov 2026 16:36:41 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oe9JqctD2S/b/CwFpL/BEYaigNgvA9F8KA6soPEvs2w=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+Z5+or3FKCcmb2ybB8zZklolg1lQ5piuiqaZtf9UL7
 s6zW5HfUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImsrGZkaJHP/3BGiHmdT2FH
 qtrcS1lFBVL2lseZ5DyE9/kueMhrwPBXrvD8EeGVnN4J3587BxXMVlblcp7BIeisdXlvznejDCM
 eAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 11:47:36 +0800, Qianghua Wang wrote:
> ASoC: sn624x: add support for the SN6245 part ID

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: sn624x: add support for the SN6245 part ID
      https://git.kernel.org/broonie/sound/c/2768208d3ec9

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

