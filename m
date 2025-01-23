Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A0C2F3B;
	Thu, 23 Jan 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737637957; cv=none; b=U7r6sn5VGRXmBEwniH3xoT9wUlaflzY7hrRrNV2HU7MpV72Cdc4UBXpAd31OL1/vKy2k65Zb9g8NJJnG00NpMf2B2dD3Tj1CNynWjvm7IZ5iGm4QhYctKp9Otf5rIw6Ufe86hCESiU0k3rfns0G09Xiog3dTF+7qPoA1UJFHAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737637957; c=relaxed/simple;
	bh=qdq2QZqA/ljts2wbAeG91PnMtYnHHKws5vZsDO5Rrws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IhDSng7aHNkeyiZq6Rtgfb75XtVCoJwTxXxezLclOqRViABC91fIZPe37d7ZCZZcoSFRMHir81Kw9arZ01eqiDyY42aT1OQ86GadEfPWPfGC50layv9UTjZ85df0AQEhxgRaLKNQ+sOBkTrIYDdt1bpB1Py8PKGIRmlesXWrQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbPG7+U4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbPG7+U4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14327C4CEE1;
	Thu, 23 Jan 2025 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737637957;
	bh=qdq2QZqA/ljts2wbAeG91PnMtYnHHKws5vZsDO5Rrws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NbPG7+U4/w0ZuwPgncXwQBVe22Vi228G0V8gYW0chg7me0xYEMbbHY4hFg7j4XJrm
	 IS1eAFGrsCPZl6sQkpk+zs5JJR0K0tAInuLWoH1pBV6CyKcSOFMYavy3yRAZDdFwTF
	 +pbWPMBx0xS7MBYOYsNUNBler2mu7ukPZJPs6JO5HyPITFHSmn2sdT5j60OKZc0ydh
	 DyPFK5p1hVNk54lQ+6AalObiwayDTLTaNev366ImJNsg/vKdStiXUiSbmaUlW1xz4g
	 KuDnWxx3se/XoDg9wJqOcIRdidHXW91rfnuQY1blYK6p6On+fEeYkpdUyQRBbAEsFN
	 LlkUhZ0ERdMpA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luoxi Li <lee.lockhey@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20250123033937.3587880-1-lee.lockhey@gmail.com>
References: <20250123033937.3587880-1-lee.lockhey@gmail.com>
Subject: Re: [PATCH] sound: soc: use to_platform_device() instead of
 container_of()
Message-Id: <173763795580.45842.13261884215131049997.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 13:12:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 23 Jan 2025 11:39:37 +0800, Luoxi Li wrote:
> Use the to_platform_device() macro where possible.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: use to_platform_device() instead of container_of()
      commit: 87284832bb91259c3ba2a4a1fa5739dc7a45dcb7

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

