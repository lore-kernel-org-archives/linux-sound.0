Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136574;
	b=YIL9zr4tUCXmFnUUUQiJRoIB896AbivhrUa0yoRrp2vqSNu752jctg8YoTO3ELdY1fHT
	 WrSiouqSFF0brVNQTcBiz+2ZmPc0GbIoAAqGi502Jk1W9EDvRth07vuTqqBQ490engvaS
	 y5vFJMadcUHFwlNSqd0/CZn88hoPwdNJEpEXuvqfZXfZ1RKM172SbMxEraDPReP42NGee
	 KeENpbv/1FQaIaDXvSSXSeqt6GUcFgcN8oaA3ReWOXJ5of5ZkRnOIrW4QRN5mRdz4H66T
	 Zd5+fFarPWV5ePGW9ETQyQtQD0flahckpOIABpho+AmFx+sVKwjhZ0X4aIfPDUmKp7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136574;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=E+Ki+iX9/zwFBTxTmeCGmxXRFb0gJE2MLuoNCYhwcV4=;
	b=aRN4lj7d7DidTSdgtJxJU+GKq1bGIOuajsO9D94LdOLj9agoPKQb8389AYHQNsoO9Upb
	 lCRuFCQTKOIOnWC4ZxD5b8gUPwKb6+cCbmBWcTyk5Lb1Zf3xiDLWgUjlXxG/Lru1BsT/2
	 8pNa73h0Y6fAQHcP2+ZZzL5xpJ3Hshg4BFB8A/dxVFk4Pt1XggmfXEXIWMydu5NNVg0D/
	 UgPKhwD+I8jd9YaurmRtdW4w3ySZk6JGDCwRrrAcbFGKg9g/WI3ZpZh1A65uJjhoC9xOv
	 MOC84S+c68/uiTuXXtCjDAj0W00AImycCmldjQivYre7QKipZDA2nGIm+a8DHxmltIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgqkkdiB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4014606A333;
	Sun,  8 Nov 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgqkkdiB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544151F008A6;
	Sun,  8 Nov 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136573;
	bh=E+Ki+iX9/zwFBTxTmeCGmxXRFb0gJE2MLuoNCYhwcV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CgqkkdiBk+83M/OvDEvLduJccBldDUNMH9cpMluAjDG23RRgCghletfbx1NadNPsi
	 hoQUhfbPBZQXLLqlmA5UWEkrhpRB7m31UXGv8rYXl3t8LNYWdt8RBQempPUM1Gw2Ja
	 x+zkuADB7U/P10vkctbsZqPi+Cpu0JPhtxgtl1KBKl+TBCIEkCif4hhGlhsTwg9sc0
	 Db8PwZXGDt/Fxb5/3+JR2EWkTC4N+ufTWi/oPYLU8ULmC/nX8lf3KYPTKb3cY/PL36
	 sR/ihREgSG4zc6PY02OOxjZWV+dLG5tjTpO3Uw/u4QVYPlOVvayr3LdcFXbnA38bKx
	 k5POAuMCoVMrw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8834C2BF900C;
	Sun, 08 Nov 2026 11:16:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261104024046.1508566-1-vulab@iscas.ac.cn>
References: <20261104024046.1508566-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: close the graph when PCM open
 fails
Message-Id: <179406080772.3424803.5454336014051919262.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:13:27 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1Hcja+YQx/uMyDxpUN8zqmZdmByoz5Npkfv6q9fwgd0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP5muXggYc3ib8XdPHPfPjw0o0BzqubG7EtP0mRdD
 h2VvntAo6OUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATCQxnZGjgm5PxRdF1U8q/
 2Rm7GwJP+S0/vTrJ/6Ttyz0/9LVZH5szMrwvi2baKrj2MX/2i0cPDb0uHV20fa97r+Sby2W131a
 vXckJAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:46 +0000, Wentao Liang wrote:
> ASoC: qcom: q6apm-dai: close the graph when PCM open fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: q6apm-dai: close the graph when PCM open fails
      https://git.kernel.org/broonie/sound/c/2f85d1d2779e

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

