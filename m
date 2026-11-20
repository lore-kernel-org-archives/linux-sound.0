Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212076;
	b=HsydTVag06XBb0nznvwA3mMzTITXE/+KbHpNlmSUYy101Rr9YC1ui38OsckTGkMmQlRf
	 DjZtUJNR1EagVOyW/fNXt1AKnIh9gmzXiLHMKkkgg7FzM1z063UvTHxy/PCwEIQ3joBKb
	 wz+56Q8m19f66xPoqJmEx3F2esWjIVoZJaKDKRBt5n2VzKUhWUHbbNQzS+r/ig5ombegd
	 eBVpiv1+tKkYiO3M2I+CXp4qxzft6DA/yczPfSRHWHXFL9RKUctHmK9j7C5Kj9S7ifmBE
	 GQD53q9MmOKNtvlxIoS0ggplotTSPeWi1UdMOZ4VCQO4APBbKA8hqW+mRHFtycmSbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212076;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9rTj/Hsf7/blB0smhozP76uLMS6D9uHEay7jkKOComA=;
	b=gQ/eb/cvITmjrdRKFnDKKy0UWasN+Gl676LVC2BaAVSpvaiZM0jxs1AL9AKakH4iTDiv
	 XT0IQw34WsaZIck6LohNdk3OKXRa1tXFtmwQVvgdWyKYn+w+bTSFLFmnrtCr0+hRUVpOi
	 DUPMKQykTXykj6NFgZsKHcLdNXDXbOPMqpRM6EwB6anucjx7SqEOsGtoQgVFgQ3a05brK
	 w+/9zYymbCmJwXk6CVWrnNuwFtxtT24kpEQNoEoN1P6AvzbLfZQZFnc74wlD+IIf+wufJ
	 E44cv2FvR2Mwu2H+UFcbyP+Oqr5AEe0GQ0txuKsyvT+U5zbXmYThtydHMGV/KR01GWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zm/BEWaO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D5606A6B3;
	Fri, 20 Nov 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zm/BEWaO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2F81F000D1;
	Fri, 20 Nov 2026 22:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795212075;
	bh=9rTj/Hsf7/blB0smhozP76uLMS6D9uHEay7jkKOComA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zm/BEWaORzKt7k2wbMUvf3KuyB5wEws2400EMRGmrTsrYtyPuFDX0K/zJael6bOD0
	 QsKnlljFjhbNrpidBM64By7FYZ77St63kbRa5G/nKU1ceXMRVZklmmIpyKMQFKo04w
	 hSMFjP74gZjUEyabYFpspY5pqMOkVetly++4ThW+bbz/9AESnp/CyALJVlUO3AcuW1
	 Y4gRMfya8h9MDlVQzrd2+lOX0xZrvfDG4IsdAnLP/SFR7vI+aEEnKNbYQ2Hju9j9So
	 eohrXiNxM3qfT1mWDVnkVAMiIzCDR8G0Xzs9DnM5rvKkc4KZRMZtVn1IHmAuRvskdJ
	 fey2U6Lfh3EAw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, mr.swami.reddy@ti.com, vishwas.a.deshpande@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075728.50125-1-zhujun2@cmss.chinamobile.com>
References: <20261119075728.50125-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: lm49453: Use DMIC2R Switch for the HPR DMIC2
 Right route
Message-Id: <179519987054.6016.14876471583863133439.b4-ty@b4>
Date: Fri, 20 Nov 2026 18:37:50 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t3ssu/N68Nkzqk51plBusWiA5FaDwK/ppVg4ZvYfZqM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZDmvmrbDcnsby9PPrOSxv+ZQeH1rVdHb2jjk/nsrOX
 fruwJMtTR2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYyBd9RoalHzS1Zv2Qebg+
 t1QjLnlpMDtD3+OiusPe1xVmpUmrb5zGyLAhZ+OFNysfHE+fNuu688nwV9E28/4osIstkKt87fQ
 2cRc3AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:57:28 +0800, Zhu Jun wrote:
> ASoC: lm49453: Use DMIC2R Switch for the HPR DMIC2 Right route

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: lm49453: Use DMIC2R Switch for the HPR DMIC2 Right route
      https://git.kernel.org/broonie/sound/c/57e564a1cfbe

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

