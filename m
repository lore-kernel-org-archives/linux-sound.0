Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746153;
	b=Zz2uoz6OgIl3sYIPg0X2EAOpFUpSJD3WY670QX3Y6m5Xi8qWGrtYcM/0htwhJLZBs6rR
	 OFhCQ81hdqdUxtXSMN9XbUPVx2QnzcKwGRTxJipCuifZ+lOjOsLeQinOM6/PYFVc2cR6n
	 WKo5z9cWqTs4PRexnbl5rL5LK4aR5imVPKJSYdFdbVYoULm99YOJgNsgAG6jfmusgcraP
	 Jc+z3LzgHKdxPclGZ2vXoVIir/fELVx+iqT5+e53nvgj+2l1ct4a+b3IFGp9jYbrOjN1i
	 XmGj7JAPeXLjj7sw3AiTec9GKLoaHpCtkgEXkBRq6OkPd/3FaUgmyeC/gJdZWVrCQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746153;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Vy6ZG+09YLnTiHaSt0gRCvCg94Pb2Ap+42Saaiwoac8=;
	b=MWU+wuv8FhtMZMRnTYDG7CWPISCRfNzD+TwiG5due7IF9OtVkGF5UqtowwZLaw+B7aq7
	 Hzls8uhcWf+qUG/yhKZ6fHrUwRCdE1SUrTZvNkmUlbxrSYFteothuH6oJ1P2XDLZRQZZL
	 lUI79k4Wg28/z3xLtdSZTfILCF8eaSUeW2u15Yr4g1+5Y/aJit67y5Mr5ri+xNpm5TZnG
	 9cKoF9oJQP4v5ULPY63p06qeWGbJTCLC0qYSCgzkeARcsVjHPqHLwCR5vVf0Z5kp1WbGu
	 TDjJXlI0GQcpEdXErq7rI2LK6VHmWuulVXFAE/2wHi63FNK2b4L17gqsdjSi4yi4jsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIxhxTl7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5E606A31C;
	Fri, 27 Nov 2026 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIxhxTl7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAFA1F000C1;
	Fri, 27 Nov 2026 02:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795746152;
	bh=Vy6ZG+09YLnTiHaSt0gRCvCg94Pb2Ap+42Saaiwoac8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mIxhxTl7C4efxcTIApPgOOt6rDsQ/zOreXsRUZcFd9Npmd7bbAEdWXIUlTLlLFSCV
	 +9Rb8aBYw1ylHdA3bak9vFwWf+8GVl2Cq0KlSUqOdjRz2Bc52i5Bf2ok2mHWnKTFk8
	 XZz4D7z3+dpV3neNrWkWFcKoVU/jdhZMbRgQsD5BdbOz7ftZYZuD+Vns+iVfaUlQRM
	 16eOpT8/nPbgvDBnCsAGgcusp2jXFj9p4XGSEE+vjGfTdmTR51Inflkw+AkmrsxbCO
	 qHQIF1aeB1SHKfjulQAPFhhU+NFKIGJCjMaIjE+GEQJcC9ddXk0iPORvmGr5ZxgQk2
	 idUdP+Q9JutgA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Manuel Ebner <manuelebnerli@mailbox.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261126202107.1776233-2-manuelebnerli@mailbox.org>
References: <20261126202107.1776233-2-manuelebnerli@mailbox.org>
Subject: Re: [PATCH] ASoC: rt5514-spi: fix comment notation
Message-Id: <179574317119.838304.13024379537765654449.b4-ty@b4>
Date: Fri, 27 Nov 2026 01:32:51 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v0Xmc9Iq3fXNmerdD1kqbdDgGaCVKfp3lYD26FxGif4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Xqbuzkp7HBKRHB02w3/J+1mmwVU3f6tZOT3pa0n7/
 4Yp2Camo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOpvsLw39PMcL/DlIvn38zO
 k/s46X97SN3Typf55WdY3S4+vHr6/1+G/0HWE2zOylzrO2IeXHfSrfPepeu86rcnbGFnb3l5yEd
 cmAsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Nov 2026 21:21:07 +0100, Manuel Ebner wrote:
> ASoC: rt5514-spi: fix comment notation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: rt5514-spi: fix comment notation
      https://git.kernel.org/broonie/sound/c/2b978906a878

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

