Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3746AF3B
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936902; cv=none; b=A5TbCcGHRq+RTC1WE1NoobzCTF6/2kvf8f1FXnbhc+/2Trw5cGBbm7SZTqTOaFlxK2/baUv5cVJ2xjkh6XXeZD6duukQBnlEkN9aYg/zM+Q1UoIBriQovFo2stgXrt9KbE/oeeWXPaokpWskcI9F2mcf/dpjEIx7NELyqoXXBcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936902; c=relaxed/simple;
	bh=mHl1/SoopD56EWdMV2oSzPfvhwa9LtOOX95gzynoxL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TtxLlNy7ZC5bGQGUh8RdShIcOBRgujk7Cl+mwZPCOqYzR2eGBa8vYLCTK+LRZWFXjhBTQP0FMSjsaHIc5SP/nM23XMmcmM3BikFumunQOpCDdJ7WdtRzHwB9kixUbJjrQsngsFxp8r7AD5LAsE7ztWQ7mjKBrM8z6K3atH749J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnnUVvFE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnnUVvFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A68C16AAE;
	Tue, 20 Jan 2026 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936902;
	bh=mHl1/SoopD56EWdMV2oSzPfvhwa9LtOOX95gzynoxL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pnnUVvFEhHc//kwckWf3rjVg4Tw9o6FdPIcgEAqxP5W2BBoPGVyJOzyGFJ5x4FwaB
	 /vt7jq/Mp1K2m6y59rkBPMG+gUVZOMlPtwRmoriTpsEoMK6lzQxbB6wEIQRvDXYdNu
	 ELkWapkdVhOBYBTSlP4fnNSQS8jeWjm6D6zS3XHs0QDfdkx2WDNHvLr5T7D4zn4xm5
	 2ek6vDXZL3PvAClSaPrhie0MItvcJliiZdKm6+Y/VE3DcXL+YuA+AlloWRcxofwjyS
	 qp3MUxwf/JCppHI9iqJIzX2dRWJFFiZg6iZxnf/K0N+hViL7crEXYUl5spwhaFpR+G
	 rjwd7Zqx/fShQ==
From: Mark Brown <broonie@kernel.org>
To: Anatolii Shirykalov <pipocavsobake@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260119145618.3171435-1-pipocavsobake@gmail.com>
References: <20260119145618.3171435-1-pipocavsobake@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks
 list
Message-Id: <176893690167.777973.4995517024553204054.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:21:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 19 Jan 2026 15:56:18 +0100, Anatolii Shirykalov wrote:
> Add ASUS ExpertBook PM1503CDA to the DMI quirks table to enable
> internal DMIC support via the ACP6x machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
      commit: 018b211b1d321a52ed8d8de74ce83ce52a2e1224

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

