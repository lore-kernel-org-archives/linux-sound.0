Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136573;
	b=mPKh7UVxxXLXFB6JYnxMSgrRtE+fNfoDVuAEkrAkxu49MHMQV0V1CEVMmhsNv0FDhfxR
	 GhYrD9nqejgBSo+U17EORxWFhuJZgi79OJru7/mkTni24xUOkuuKjtkve/cJQTSWlKVc2
	 AbmP7pvIikkFp1MwdmsrJvvjUHvUqBOhRqTA4BnHp7bi8heoCnZpCPkf50N2qA3sih4GM
	 clRSu0LX2eV+KhdTRB9XlBaWnEyggpBHBedDhXAs4RHDIjXe+dzev03i9OjRNtxb3uGzU
	 QRxi/yZ5O6NfnwKgiZTZHHBVUBoOlbW6edbkTw3i4pjvkxyQmtV4ZrRivdvNZ55Lhjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136573;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FLkhu3h6fGtG/QE3RWiGSRjGhTmeI8ZHhelZkxFjLT4=;
	b=nSGn68ACmwAt+VOPIFGb4Q/tXhIsZ1W4BDjoFm6wSIvo/wBHXnKrcuD7StlTsQXBIlp3
	 HCdAK18DFLKVhJxr7WptLq5tGSxL8rqvF8EOtkTV0QN8lKmaryH1daSCCy23BvTUL08AG
	 eAWSM3+a3tQS4zQpSw4xxA0eD5SzPGAO6F29t3Am4huprl0r0FLS4PossdldcivU3u/sF
	 O8H9nLd3psJk7B4HDBZDSxF+2rlzO6QBPMbIyiOSO3R5MNeFEARPyqOiqfrv3hinpg23l
	 9+TZJm9AOdyi8iHUOd//o3ResxnKFal5suoNeNRgrYns2xeqK7E71U/KYGG6D/63WrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SwYMZLZZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476A606A330;
	Sun,  8 Nov 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SwYMZLZZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903B51F008A1;
	Sun,  8 Nov 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136572;
	bh=FLkhu3h6fGtG/QE3RWiGSRjGhTmeI8ZHhelZkxFjLT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SwYMZLZZy3d6T49A90gJZg5fCx6I8G0UI5zPo3YZvkF3mRKC/xUY3Zhf5if162ALY
	 YoROMggYdZ95OVunMDQGLKsihjip4fgmTx3exy3ba7mh7OlKHtcKPxuRFkU8Kj/PkY
	 TZUpmmDZ31jVbXlOd8edGjxQQEZkB9nUjE4JlyKAh45nPTIjm5y4iOuHJxXKUNdzab
	 oaqKOJ7zUfhdWMv/ys35U8Mk2N1HgQvWaIXkkohHjGqK/M9KrzCpOcs/8xO2QWiBay
	 b1JAkaJBAewO6tFihpNmny6dR9xID180pTlW/JuFcOhUxxYG27FlQghVFE4+lQoonN
	 S9jLAXcMPjABQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DDEFE2BF9000;
	Sun, 08 Nov 2026 11:16:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261104024047.1508584-1-vulab@iscas.ac.cn>
References: <20261104024047.1508584-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: close the graph when compress
 open fails
Message-Id: <179406092306.3424803.15219850363779867972.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:15:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0FNhgGV/KxQqmNW+5m3L98GdTtgGryyFButged53mCw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP76csW/kGO+ZXJ5ewzDCuajIS4vZfOkKuN53i5wv
 jP79dz+jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzk2GaGf3rM00q/LapgWFr2
 xjrcSiLKeXls9TOdnqWmZZ2T9IWZmBkZ2kLOTVX37Pi2ZcG7D3VqouXW1XYOzskq9w3UOVQCGIy
 YAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:47 +0000, Wentao Liang wrote:
> ASoC: qcom: q6apm-dai: close the graph when compress open fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: q6apm-dai: close the graph when compress open fails
      https://git.kernel.org/broonie/sound/c/63364dc9f101

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

