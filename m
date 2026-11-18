Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096405;
	b=I47xAwJ0C/1Rt9ICL8wpXAYNjFv1Yxjwsku0iNVtC0tVmTace1F0J4WK1tF3sYa00daw
	 FS3mDdvBaAPov+aYwGzSpkj9TzDLz9cJTllk5k/FMqNEqhQZN1eaumZPb+tIgW5UqfX+1
	 RsNt3XMkLScum8K90A7jOzXUevYW5xPikl5kdtmfvT9pRKxv2RiXvRrbpeuhjDD7OpM7e
	 vsYVNIMJUmcYNUY1cXQqeLsGLuXHcuWzpxPijGAvHqORKKiV7gpBtxrX3aDg0FXa3kw/2
	 YHEyuxgNlRjQEb7/oXUFZOpmjJkpRySw/6Y1mV2A05N1LmS/Gt8cah7ts/6C4eDT90w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096405;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=T0bn86HcpHWQXGeNcFOu7GRmmy+fpoEc98lLv3CZD7E=;
	b=WOTxU9Pwiyeo6FkyabBwSTKE5pzm967+AhelPZiyTdE2reSPdc3EzQBdKBv0MwK10L+h
	 7km0zlonkmmgZLBJ09u1GE5VjqlbdNTlhRo7P4J+RW8Jx8ATvBG956XTOHFVxk7fLl3e8
	 sOVazlCalKXdrP5ZDyYziGU/S5pPyJfMgYndD9JPCQY5v5LR3LMSumoDmu9EeKmSURYIj
	 eBJ3DUlenLNsxz35p2kcv9dzlon2MtIYFozmG/55h4gPdcvxBEO/fvWB1QKzR96WWzOWS
	 HoDnQhZkRZt7vEqIsbw4FmlLgI03XQ69NloJte7n4YtZEXnf0gym8HuOODAyGNbrZ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maRWzJ0R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E6606A331;
	Thu, 19 Nov 2026 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maRWzJ0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B971F000C4;
	Thu, 19 Nov 2026 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096405;
	bh=T0bn86HcpHWQXGeNcFOu7GRmmy+fpoEc98lLv3CZD7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=maRWzJ0Rrd2qeeCEcu7Sivu1BL4YUU9qBUIlTTZn1HCA27h+RRDfA9UnjZqqzZ7VG
	 sdMzuiFABkPctZILbzAN2V+ANfU9t/fCMLb6V2jb1dEYs69igUJWBbS2FpGyxIaR0v
	 AZm4jEg/RTDRx7zbYUqnxPfEcES50toOxEnKPXpPmBbnoFABm1RtZ4TZ/9NE+kkKkB
	 PGV4NgqGJkWtZevGIXFTJtv9CkJWGjj0GrJxLgqX0nwpLuF5veOrrFMPb7ATYeXeTK
	 JhHTn44Dr4GJaKX2SvTkKWGtsqX9nUovJffBOpGYtbaQVvXLZ88VzRr9oiFa5VmY7n
	 bRD9OxYlI5LaA==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4E11793720037898+20261117062253.3611273-1-tuhaowen@uniontech.com>
References: <4E11793720037898+20261117062253.3611273-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: ak4375: Power off the codec on probe failure
Message-Id: <179502558431.810609.10867481075428638630.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:13:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=c0nS4Z/s88/pbs12HMcF/okuSoJSTJbovhEEPVf2/mQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/Q9aO+vU7QS7bX13a/ZsYJK+f+Aby+qlr3533fexX
 CEonWXI3lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJSM9jZFgu1xq8z61gYn7X
 jYTyORtn7DVS2aa28tms8/N33GmbtTCe4X8du+ZV4RUnpB7wW5/grk+7rxUV8MbFuK2IdWUyyyK
 Xk2wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 14:22:53 +0800, Haowen Tu wrote:
> ASoC: ak4375: Power off the codec on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ak4375: Power off the codec on probe failure
      https://git.kernel.org/broonie/sound/c/3775f1e4d7bf

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

