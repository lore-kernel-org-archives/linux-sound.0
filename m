Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728204;
	b=2nKUSJOvb/NuHSTsaEIZsA8wHDPgr7ZD1LE+ifJJu9XV/fOMVWJaUhuNI5/VJ5I9FfeS
	 EP+MHG/U5rxgI/cF2Grpoh4fuvKziKGDDQnH/i7+yJv+l1adnFI1LPa0y8ymt9SLULBie
	 iKguknVgarrg4zlZ7tnjX7YH6VJ/JsesmBCx7xHfIeavW6QyzltC2YuKnPkFoaUNkjnZg
	 3BQvTZXuHI/Li9bF2n8yGmMQqQfuWHcRUtLmdRovgXWThMs9WbHR7gHSpBKk0DxSU4VJU
	 MpchkO6R5sESL2ap0XUbmUBIrImWGC0H9nXNaqG27zS6B5IsvboAMb/Wc8oQK8zUDGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728204;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1sXQoOr9ufXdRrrO1fTUryvUg5uBcvBK4hxZ5Qgo9Yo=;
	b=Frk2Rgxmg4ai1I9CrwzYWeff2nvIvGA5DIJriZh6aIyFZbebCNOE/FiNKFXyAgQbVfWP
	 pF+tgbOAR4zzGjGqMcIZ7t+jSd2VkrPr6H9vlg8rDCo1u7Hjj7LkqxdH4ZYWW56MV+S51
	 fzdbPFl3f870XMk6pQkaPfgl7WmgpUIMG2LrVKxeX7isqCJZXJuMxqEDisgVma9peJjV1
	 RLHg3rq63mRkWJr7rhsOtKpjNoiTpetPeI2mS4eF2ZyPPntudAOz+XShagAFhun/lIXRA
	 znKL/Lo2Dtk9C4zal5/MZEbjteiwIKf86Fn4hUtxNq4CG2lWggNeJSm/xdntZrd195A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsPIauqA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8BA606A31E;
	Thu, 26 Nov 2026 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsPIauqA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820191F00897;
	Thu, 26 Nov 2026 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728203;
	bh=1sXQoOr9ufXdRrrO1fTUryvUg5uBcvBK4hxZ5Qgo9Yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OsPIauqA5mBp6YEjqZrCzVJaPsdQswVDb/Lg4Pj5LPubLn2mxe4JFO5NprC47it00
	 3RsLdYQq6lQmW01OpkMM6LSCx7kr83OfbOUl3e4y3SPvLinQY+3sxbhLQB4smKYxf9
	 BlozocSCOht5oOg6kgIxVzYPOJFYhqsWvW/2fyDq539LGgvw9UOMoQ7fnHxPFAwQfA
	 xjUvWzKPtV/PzrTBebjpx3945G9D09lIijsRI/WYanm1WefLU7BakePvzNzzWO9vtv
	 ZITqx5PVuyU5EPogV35n/Y4I5Zd3V8st0XoAa1tb04ABVoXhK383QTYnXKI2quj9hM
	 PDB++I7qAUypA==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, Suyuan Wang <shyckless@gmail.com>
Cc: linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 kai.vehmanen@linux.intel.com, tiwai@suse.com, 
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com, 
 linux-sound@vger.kernel.org, perex@perex.cz
In-Reply-To: <20261121-sof-mtrace-wrap-v1-1-9798707c3439@gmail.com>
References: <20261121-sof-mtrace-wrap-v1-1-9798707c3439@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: fix the wrapped read when the
 user buffer is short
Message-Id: <179572194440.838304.17974974734455095165.b4-ty@b4>
Date: Thu, 26 Nov 2026 19:39:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o5/im7gci0kq6votsJ3qcT+TFypIgwB1i3d615Dn0Yg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5FrtfcNPr+b3z4xc9898pvWbiKtO3WJ/SO7O3aqNwz
 sV/mU4uHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIiv2MDC38L5faPJ94tXB6
 0f89orNXX7eb4Dn94he7uhJmgV33TmxkZLjk+FnfbLm4XnQ0f6nfMenqjJ/FIXUlHhtV3jyperf
 ZngUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Nov 2026 15:26:27 +0000, Suyuan Wang wrote:
> ASoC: SOF: ipc4-mtrace: fix the wrapped read when the user buffer is short

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SOF: ipc4-mtrace: fix the wrapped read when the user buffer is short
      https://git.kernel.org/broonie/sound/c/da96c8b9ebb2

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

