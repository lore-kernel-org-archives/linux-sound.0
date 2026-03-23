Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EED2B2D7
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311111; cv=none; b=Xdx6JgaHydL9mx24Sric4WxghK+FxDyX3sYKV0NNIJDDXQZ0HROs5simoQDFK31LUeXe04Aoem/hSP9yzaYUlzEcQneRJbLJAms/Hjq2GxI1urOHpDCpzOEXuz/Qf5kw6uTHroZzrNXbChSl06WBAde57h8fdrv0uS7BEYF/vJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311111; c=relaxed/simple;
	bh=q/as+6i3LHXRn8oHYUud9fH86zHXpn/11Evng5Xe4xk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KazHznAlCwbvENsvdUEx34XmJc7YLqWGGmqdQHuM/yR9G/abtJuj3DmVN9AvbwmSjqG2b8msKrlgrvcKI07rulBjHV8xSEBwmfwEI4oiyo07YvJyTWfADG5MKBo72vHSgo8jG55msDIfydetHyj+0kKVWkjBgFnjN7uiCRX9Tfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0MeF4jE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0MeF4jE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC6AC2BC9E;
	Tue, 24 Mar 2026 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311111;
	bh=q/as+6i3LHXRn8oHYUud9fH86zHXpn/11Evng5Xe4xk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N0MeF4jE/zmMPitKcwiOahOGQRsEr9PU1mFPa7bTkkQFRqXJfTxVFidtZ1w3sgClF
	 Y13WJNhxb1SRahaY0WfVZvhAtBGOVc6fZi35GZu2MG08f6QSndMc979JVToEXEgthG
	 O0mHEAWPqBQsg97HQBfGPYkYEPhaLpoGSQy2BnmLadMi8xTbu4V73y5tdRR52W4Kas
	 +vD9JOE7WoRwTFxSK7v17Fz7d6KupiExvHkeYUPcCf/tGETeiJdzHOxnALO4R2t42K
	 X4AlfLz9GU/TFjKY0H2VEf3dXXlwdJixZMqFFrDKMYsBemJzMZlo185/TZloxh+rM7
	 1nBSNS387jX5A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 andriy.shevchenko@linux.intel.com, linux-sound@vger.kernel.org
In-Reply-To: <20260320101217.1243688-1-cezary.rojewski@intel.com>
References: <20260320101217.1243688-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: catpt: Fix the device initialization
Message-Id: <177428722925.115931.2092232381432305260.b4-ty@b4>
Date: Mon, 23 Mar 2026 17:33:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q/as+6i3LHXRn8oHYUud9fH86zHXpn/11Evng5Xe4xk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbFty4CqIvOmn1rJnPZl0Wu7u5wmwmE1nE24
 XiYOKGoqKmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWxQAKCRAk1otyXVSH
 0OfqB/4mlU+a1RYChN4NmpndthdlUA1bdWLq55SBLz/FCbzG3hi6sgXJWiI4EezSH1k92R2BGTP
 2MJAlLKSUTD6VFwJkP1QkIALBeuWGzF4QItSGLoIT6JN6pm0d7YwzhtjNE4CbKi/e9W3rfA0hjb
 TsGaUQLeDIreT7uiaCrGql6+xPeM8d7duzyO7Ebi3Elu6HJHLsAmyyw/5jHhjVED6R7iEphJp5E
 vKw9cZZC2OVy+IooAcF94tTy+jDzitJtf3aTIVzjIKe5+4oDluBTG++8AvGhxf14owjeBL2+0ac
 0tCEoDNQOqU5Y2RGWXjm7SfMm1y9MFMr1P48Tq6bHtBIyUUP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 11:12:17 +0100, Cezary Rojewski wrote:
> ASoC: Intel: catpt: Fix the device initialization

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: Intel: catpt: Fix the device initialization
      https://git.kernel.org/broonie/sound/c/5a184f1cb43a

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

