Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C677317143;
	Tue,  5 May 2026 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943376; cv=none; b=tX/rHKW5XEo5Mwn0v0lJlBbNjUljLyjq5IN8LV7p1HhJhsOqIqxT26qRpPejRrvUJ3gbFxmMGKoiqYY5m+o8dnaBL3MrB8zYfqcywDmmcXHSW3VUxQaTDX/0RiIFpcIhe9MEJYcXMDa7F9keLfvMWxmbu3m0qPvL5NjLdK6qDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943376; c=relaxed/simple;
	bh=dXC6A1cxG/CanaSQmcTm8VeWurKnpxTd39rurzdxKCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SAl4yh5was9RhUN8xH1KuMn1FqjmfWdIfBa34SGMyfbtXt1mY8GD+70Ki6yN2BOxJkoiYpoOsz5ZGtxpam5NR01FlmElXKSZ7H5+zh4cwXVDXA6RpcW09+xB9wnoau7L2myW/NlEuIRQyJmgJCpXvooPmDSPwWYjxaA+pmugufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzdUhuVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzdUhuVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FF2C2BCB8;
	Tue,  5 May 2026 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943376;
	bh=dXC6A1cxG/CanaSQmcTm8VeWurKnpxTd39rurzdxKCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YzdUhuVkAd9y7L6mxbXT6XT9fiRqdrB4qGVOUlmQbuJ8/w6pYDZQrECKEbzajLrw+
	 0nAXFLAEEKWQAAJoUO1iZ4Wcqq72QyH/8SjXNQ0qE+YUGnYWFD4YOL8efIl0TkjEdh
	 nUG0W3zXbpytR8pm4yOXSHtoOVp//zgFQ+GBgAa/3GXfdBSQZMUED1fJ1UF4mRC2Xj
	 C02SjVdpaIRXLADkGfOwmCTcfBV6/hE2sWpZWWn4T6TqQnw64++25GtdxadC1zhQk9
	 JDiHmiW0OEbFfhyuRC4IVAq6S0z85KBxo2IjZvZApyIIjVRpeshcA32Mft1OtMrXSs
	 eOWJIzJtDS2Tw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com, 
 Vijendar.Mukunda@amd.com, songxiebing <songxiebing@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 gannovera <gannovera@gmail.com>
In-Reply-To: <20260430014920.141276-1-songxiebing@kylinos.cn>
References: <20260430014920.141276-1-songxiebing@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE
Message-Id: <177789982460.458539.5732131707099961109.b4-ty@b4>
Date: Mon, 04 May 2026 22:03:44 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dXC6A1cxG/CanaSQmcTm8VeWurKnpxTd39rurzdxKCg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UNNEXmepHU/0OwnI/UBXJN08HJUWk0dDPTJm
 sh5zMvUlX2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDTQAKCRAk1otyXVSH
 0CHRB/4n2o4QU9w2wJr9de0if9/K9mf63vypdNCHYtzRAcm4gBqxZrHC0G8nsE5oyo/n37VoERC
 9UC7wNaKyOvwPAOuudR1tBbqqtR8kpe1zaC0l9doHpAE//vi/rXKhWd8Y8PWXwfWI1EOlAR2682
 DZXGFacFtwwhLBlbRpvDbC9VFQ8ZeqVrnmYzj86BFOZeroXgA5lews1xslUxZV/P+UYgcSxm81+
 BhNfwqDzbX1XSFyPw2i3/IItw348CbYaD6jTw94fV7vOUumR0c8BfN3tLA5xpdxZLQu10OukgWH
 NA1lIR+OK0PaMQjGrNqAt5LQYYVk9j01M5XJ0ojbKjRBUk+r
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 09:49:20 +0800, songxiebing wrote:
> ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE
      https://git.kernel.org/broonie/sound/c/0e60d9661664

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

