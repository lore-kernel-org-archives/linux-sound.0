Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177157;
	b=exabZIaXXS+NjP5bdOnZXd4E4cDev0APKfh59hDlsFp/193doUpju7NpaOFYGbUjhcFN
	 I18dhljuf5PU6dE/Ih/SoCefA7+7zP9ra0NvFZBTHOvX8DjJpAAcIXfBcZ+NJONRhk1ZC
	 CUpV5mbzG9dpU3OOZ8S0IfV/Cd/vYvuDciwcB2INoyWrbhSatfVPFOPCHYqiwQedZX4/h
	 qyZ/kuZWRzjSNd94T6a0bp9yYpFSkyPj7PVAeXkzIznTKQRvTUJUC2AqlRM2A+Hi/t0S2
	 ypDjBIVPRV0stOLQ6BDC9S8yHqRyautqYS13BkPRpXn6jMMVMS/9EOka/Wt8q3LeaYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177157;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yqJ6autPf42TqNCHcqj3CPDE8lU7aJA8+oXBhABuOYk=;
	b=0T36Nm/sJGeX4uoaQwoXAHVyAsXJJSqUmW4EzDXzXAUuMyvjBayqEq6PjKu4A/Jzz4kT
	 Ha7yGhQ0zx8eTSTp5x2hTDL/XO7QJAm0aD9Gbh1YML5G53knYXiUL6k0I9aipJIUogpmZ
	 wj1/sekboaS6h52q7YLK0grVu7nNdyJderZZqhGLMcdKnnL9h9xg/SPhYxPMKzzvDgRhP
	 HJrK7V4USUrhvAOCugNTZSSgG93NDIFT3X5lvXn9Gyy/fVE51Ds/Ig1pLl2R3p1G9YYhw
	 QoZiuX3br3od87qazXHFbaEyflLl2TV9vm7NBHmPaNooWKSwPS0n5Uj2MJ4zzOF7eqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79GUPHd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1DC606A320;
	Fri, 20 Nov 2026 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79GUPHd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910B11F000CA;
	Fri, 20 Nov 2026 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177156;
	bh=yqJ6autPf42TqNCHcqj3CPDE8lU7aJA8+oXBhABuOYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e79GUPHdhEjJ/DCGhwHlIPFTpSAP5QgWrn/ZLbIW+LxrPMhMlw5zDSV0Wtn1SLRoL
	 HmqDYYsYMJc5jRbPKnlz+fiKYywxy7cPUo7pvv1CMW8C5Z8fbXBy+XuJi8aCO3GCSU
	 ILl1jPp9/7CCI7rwmRbzo0v2JMom7XFnlu2pq3RkNSHF+V0u+FaABsf3XqJgv6CILi
	 tccSoe/EQRslBzYg/DfOr973LKVs/bYdVZxHNjn0MQKJGbulaVaqv4BKPQJ7XKqdBw
	 FlmvdKQBxJX3GnR+UTcTrSVV1MVbfc75RhzP7z9g1QkjDV2kDpHgINfNXl/VZbpG+L
	 9bnmrPZs9h0Fw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
References: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2: Release multi-link ports
 references
Message-Id: <179512998731.116416.4021623671226003375.b4-ty@b4>
Date: Thu, 19 Nov 2026 23:13:07 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GAGdtZrnsp2smoBxMsIOhu9//Ifqn0E3k7jzouArsd4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrA4GCmjdvdZcH8iudp575o+FsZ/Ti54Ez9nHGPSg+
 +5NKaHIjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkT4WR4WPEWvln3EWej1m+
 nbNneW+cePLWv8O3atZGOB6YcuLWo3+MDI9OPJZxsndSTj+Q1djIkhB2mFdYNt8su2Tenb1xreF
 3+QA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:58:15 +0800, Zhu Jun wrote:
> ASoC: audio-graph-card2: Release multi-link ports references

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: audio-graph-card2: Release multi-link ports references
      https://git.kernel.org/broonie/sound/c/a0344bdd4636

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

