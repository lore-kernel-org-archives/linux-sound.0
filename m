Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789030;
	b=EynTSNzAz3ZiN6zywEQuqjCN4mw+2lIk2w3gIFEGu/rZwNzj++b9kx+NGsx2M+MnHWfN
	 n4RLog3SAba1A1XOUjoq5+K+887RNxMvRvor5irzyKtQxafO4deJaAwRNqdpGyJ9oYUpx
	 SJFAihmdMNpsHVC3l75eSZ5ozLSwgEhDn884eFA16+I4iyXwnU21vTBWW1/VIks25M2o0
	 SbsyzEwYi8It1AWOfI1chAMYz0rY2MENUYw5zpnN6JHBB1ZKVlrmn7fZywi0VzjyKGzFk
	 pDqaJOTeNoXqrZdsmnooqf4FvIKE8sQMAjKhIpppTaq0NuFhmMXTfoo60PZH8zUskEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789030;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jtFW2Z4D9v5PYabAjWKZegOLBC5+FNygrH0PfJg3j60=;
	b=qUunUvBylG0tLFkcYyxg235gJyekEXzKnpzc/LwlQOmeE6X+Lt7jMfuY1UuTCGdQ1CFU
	 VvKdUwIOW7wPr/QIj1XAuK5L//PDl2MRG4AilX/GpqveAOfPcKCnpJ/sI3CMj1j7+xg0a
	 gJK0CE5CTmqTFjJIiusfsCNii9shyoDJ9wCnDUpzUjaPu5tlWvsOiPa++XyfTqmADYz7c
	 HGjSfrvVR63hdfQwDY3JHSJn11LRQcqObF+4G5AjZPdLjc4GKEos/kY0LOJBo3I4EnUhh
	 1oLnwEgHs33Zv3b7UEYoHy3EdT32B/IjYERc2H9JIwAXHckhrsnT3KDC1JK8vN+btHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFEMRo0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE101606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFEMRo0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CF51F0093A;
	Wed,  4 Nov 2026 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789029;
	bh=jtFW2Z4D9v5PYabAjWKZegOLBC5+FNygrH0PfJg3j60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QFEMRo0xnAFMramP6LxxKIiB5tXaZC725HQJrjfJW6fZaEMOMjJIkEHh403aehpeY
	 2Wi7B2UxnNvdYFkwD3LXavGLriprQN8KGFLEnbi1f2fcfxHBYM9pG2vCP5+6GzuqfG
	 Il2L7jorCniHC4Oq7bDItozmTBnh0ruDfW47KTvExGH4nbn89J8EUSpG39H1kG5vy+
	 YyYnP6UUYWpzuN3C4JNEq7wgbFAv6vbKFFg1F6TLu288I+mXWZ+y3LCae2kAjp2sNW
	 sgQazdNQI5gVgaLvVJ7EC1m+Rq+jtTrUqldhGGDojg14Dg5eTXwApUgRSEHnGmbEkZ
	 jJ+tMkKrG4MWQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7C17125D8BDF;
	Wed, 04 Nov 2026 10:43:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Qianghua Wang <qianghua.wang@senarytech.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 alsa-devel@alsa-project.org
In-Reply-To: <20261103064123.115057-1-qianghua.wang@senarytech.com>
References: <20261103064123.115057-1-qianghua.wang@senarytech.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: use dummy topology for SN624x
Message-Id: <179372792116.2270148.12182339528895629863.b4-ty@b4>
Date: Tue, 03 Nov 2026 17:45:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jew7XJSxJQqaOtdnSxrm64K2PlOc89ZbTn38/2rmJaE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8yTvC9E0q76cYxd9278tzJ7/re/Ght01HXJm+202K
 /FprNbsKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwETeZDD8FTKWZ199R+1fo58F
 V4LG9R4x+zN/pnE+1plX3Xl7UaPuc4b/jj90b5b1RtSc3CD3rLvnLFNO84LDuj771YLEJL9ejpX
 iBAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Nov 2026 14:41:22 +0800, Qianghua Wang wrote:
> ASoC: Intel: soc-acpi: use dummy topology for SN624x

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: Intel: soc-acpi: use dummy topology for SN624x
      https://git.kernel.org/broonie/sound/c/97d5fbab9e62

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

