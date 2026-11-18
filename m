Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096144;
	b=UUPHYWpPlPpniKy0hy4EHLw96PTAeVEzs75pmvaWLs0UkG4qmBowhfdXdtLvk0jRJa51
	 WDlBUJ4lhwB5SPSE4tAFDuDOL/jYZAzKUfu27VdNis7I00TS/fHi0gXCyuLpl45kxw/dm
	 tzEkapYvO5RRVtI92oBzs/TeAY46nMFd1/Lph0jetUNAJYACMPo25N6X5TrTn/VXYfeC4
	 bxxiIpO+26upqojx+428sWRcUzf01QKA+8lsiiLyQHmwSnJ9WnUxan7ph6/adGeiH8aag
	 8kux4I6ym+bGFUmzoxbtbE/c5eWqt0Dv/BzFp9Ova6ErPf6XXxZN1M1K5K0Nla7OWmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096144;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RHIJc1ZvM5IUGhVoXeitNJ89r1xtXyRqYi3xvQXKSls=;
	b=yj+YW8kaK5sdjO3XoLN4uTpEwGYKaLK6rzz29JYVLWjIep+XrhV5VR26K/0BxBtrh5jB
	 9Kv4M6/ddT45v2YgAFUvdRhiig24MxFcVAx36MN5vAYagTc3++fROb8N7WVWSZbEfG9bJ
	 sn4RUQ1jZPT+alcifVJb4s5lg/LI8wHyF2hf+K8GW9botOXbYgauVAHtnXYF/gfMBL437
	 l0pZ5lJ42LEyIxnV/gNeCzrKd0k8ZbURxt2AMASuyxlG5fPLNcPmoy3kOfo3Av5ljpTbO
	 c/jsA2KT/sDdCZVMYa0IO/izWrlcGODq2p7Qlf/fOstQJ8GnViJp9P9qDr3dts8FrBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxDtlnbt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E6606A332;
	Thu, 19 Nov 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxDtlnbt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C2D1F000C4;
	Thu, 19 Nov 2026 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096143;
	bh=RHIJc1ZvM5IUGhVoXeitNJ89r1xtXyRqYi3xvQXKSls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CxDtlnbtdf3FiIrpS01bif1eJxVD739dNZI/DLLPKAcX2/DFt4CScsFalKfdzYq5e
	 TyrN+ijXr2Xz19d6b8Ol2HKMu+c/dr9SM+bC7jd4h4zCiNaRa/0ZZfa6L9d/oTsw8H
	 9ikigWXxN3/c2Vy1uIpSCMebHfmfzpNfxON0BkWWxXq+nc9TvesCJzk2tBXSJFWk5L
	 VMe3xwrNhL7l5NuSFlHzvPwLIS8YLmx6Z/nps3YLnWLGSa18P84CYO0eNLp3DZvE07
	 6fYD2Q2lVh5ahyN3eIP9NdObvojPD2P+r2GvMtEcglhgXM0+WSNMzyDBjzAhAo7BMu
	 BWgYENtJ0Oaxw==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, jonathan.downing@nautel.com, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20261118100631.26658-1-phucduc.bui@gmail.com>
References: <20261118100631.26658-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: lpc3xxx-i2s: Fix error handling and DMA
 configuration
Message-Id: <179501192655.349622.2821526031939514716.b4-ty@b4>
Date: Wed, 18 Nov 2026 14:25:26 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UtT14b3aDsCNas90DxDGlsVK8Y57ng2BypyV6PRZCHg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/fMRrl7HyBCzT+DPilnTpLq+neFTeisoHMuvoBfc5
 ef/rFa3o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABMJkGH4p17w6/XxrQXvjNQM
 RCL3nJxXP1P76oaLX9c+mrT1OuvyA78ZGe5f3Gh26l923YKlh5q+eD3Zt1xiWm7ilaNpbH+LzoQ
 IsvABAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 17:06:29 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl: lpc3xxx-i2s: Fix error handling and DMA configuration
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies error handling and fixes incorrect
> DMA depth macro usage.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: fsl: lpc3xxx-i2s: Simplify error handling
      https://git.kernel.org/broonie/sound/c/f8b9931f96c0
[2/2] ASoC: fsl: lpc3xxx-i2s: Fix DMA depth configuration
      https://git.kernel.org/broonie/sound/c/239eb443bf6c

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

