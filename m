Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530238;
	b=nQTLlzpMkdyGtsImUfXIhp9Q7HBA93ZuB+D60XqyZk9ZuPcAS1/RQClyUayvN6t8Enyt
	 eqHRN7rGMba6+G2GfvuDNIKjK+ESAfYpJDl/+CuLqArLJKAgE6bQLNMnKCqjrn7y6iJTR
	 WnHQn2Vw88hKQxn4tPvANNAQcheYW57uI/ndt5qJAtgCd16u201g52fnk7HfsTNjOYHww
	 AIWd/RCiSFprI1fCs1zue1tLMNMMkD7NPHhQOyZRFynm0o0d6I3cwBcoqcbFSvdDop7a4
	 JCwwVP4NjwkvjLv+rmyhYekOvP4kqceHg35gQ5y9HUSz/Z82LWeojdxcA0MN6qFfokg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530238;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nZDOUwyEX3ckWETnq0livX5FdWDm3IFYxQpcuyKeRbw=;
	b=fkBKI/arj/3+UL/Ojgg+rtNfEX0LM+wCtgi1nru0fJI97djwyRWTVUsaa++qEkt3qaBb
	 pq7/Bsyq0EiRfFU4oINaWTAoUEcrUpB6sjsiRIJlvfh7dZbs/gJ2x7W91qr21Fcdxvsaz
	 FmXK3hFBCvx/tLL/5suDN91yNM+Crmd1ynwWkYPQ4WpTrarGOK9KGuhy0Ur+CUFRm/1hB
	 +JUf07SojefeE8WvKes9KVLT5RG2xsrdL7lQua8tcrtZlvizhlxSvDI2g0dTrx8hMGE5/
	 dDH1ZNPY+vlKYGkUAubJM2Y9DbifChUF1uGHMq7NwOweE2M6kxAN+4pZu/HUVe8WBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IIAJkJgz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E22606A31E;
	Tue, 24 Nov 2026 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IIAJkJgz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F521F000CF;
	Tue, 24 Nov 2026 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530238;
	bh=nZDOUwyEX3ckWETnq0livX5FdWDm3IFYxQpcuyKeRbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IIAJkJgznIH2V7j14r2fxrcqXnWasdjh1eRyvcdIO4VxxUUpJvElCxd1niwSicpGs
	 AdMOfMbtt73bI6OSKiw/UpZGu68Fd2tH/iKInWjMGPbLnx51FH396VfhAMaW4gNtMK
	 pDxSAkYL9yP3nrBlNkzLGtbBzbmw0oOhKdls7N2rYHduZxEkjOFAESVEe80JOq1AQ7
	 u/kKs1wVbUTy3Ereaq1/1N1oOa4tQf2uacNyD9NW+xTMoU77vLzU06iQX8DrkmQ7Ar
	 NzY934ID4z0Zq57r75q1LpP751GPQiqr1I+//cyAKNghUq1kiY246HvwEXS0yis1RM
	 kVhhTLzOgPnwA==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120162807.1568409-1-mstrozek@opensource.cirrus.com>
References: <20261120162807.1568409-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: SDCA: Use Function Extension info for FDL
Message-Id: <179552705489.264265.8821788507436900391.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:30:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H6eGDdSwTZjuuxzB92HyHwty5fWs6Yn9RNV5Gt+z7Lw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ5/5KuHn3aW19WPulc2abtlfuDV3D3tuzS1Vm/pVtz
 0qMOE51dJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAic/YxMhyOc9j9+//CrJln
 f3zIiHkw/1vXS/3g1gCmR64dSrqt9QsYGVr4Dv+8dUdug7n23Lue2k9/Lqheyn3LJm3R6RMadeY
 HC5gA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 16:28:07 +0000, Maciej Strozek wrote:
> ASoC: SDCA: Use Function Extension info for FDL

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SDCA: Use Function Extension info for FDL
      https://git.kernel.org/broonie/sound/c/97889ef32b77

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

