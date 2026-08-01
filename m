Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC6397B09;
	Sat,  1 Aug 2026 01:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785547071; cv=none; b=r6TIJN7jC3Q/pb3h/pkuoM9Mt61uvEygFQAr9gVpnW9HwnvhU/PF3y609pv9X1MrL0NJcW9CY5WvH/5VQjHGnPxBjG6gLONgnnCQ21VNjmwWPj1l5abawc52imUJ/Uesr2Vz7XOnFW0fIKiZ4S1Xeh+wGFPiJawzrFnh5t5NWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785547071; c=relaxed/simple;
	bh=SwPDAoeU037xPo58rLcX+aECXWd1vWuGV2UGFu50lhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OqpI+TqfXF0YnjM2lupjq8DFrRBqyPTXEbRaUPEVvcLOWC6GNz9wXfU3SygEUqyO6qrUhcZV5k2IsQDGrVuFSFuwbbA6uxcLRknTKTgVRUL04cxT/I1Q5LYgH9CwJ+fnmRyZzhEmXOXtaNW/lLeyVXti3ioW+j9I0xUJvteElIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFY1tMN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFY1tMN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EC31F00AC4;
	Sat,  1 Aug 2026 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785547069;
	bh=4nu12Z1cbpg0i6QeTePRneIGup/bhcIlGxwtVh05btc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KFY1tMN1OfjylJA2PAYGrJcYuPpb0yS/EnwUHrJNdHbTyCDG8N3IvH0Pu1WNF3SXy
	 vvMVFrhtEd6zQ4uknn9lzahhfYq7ysq+qPpoZHv1x9p+yks9XOwz/pBGXJrZcn3Wus
	 ulOztwCAmMMG54ckGMLJ74Htxjx2kJ/whrrNyMx+22Fl/5uquSPha+dbIY7YKiBDXM
	 xrCry5RQ8kugjsKtaT2u3EsRgnom6ywrI5ZuKt6rncpVaxDZUq3EyhIgmT8RqnCJZO
	 7ns+0HBU/ytcE8mujn+Y8dIEIvoa21o3sm2+keWk1jNuBWJYEc1GKrG0F1ukginEgl
	 aktMcZUlDUqjQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260729073532.56468-1-phucduc.bui@gmail.com>
References: <20260729073532.56468-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sprd: sprd-mcdt: Drop redundant error
 messages
Message-Id: <178554615191.353541.15678757928325468570.b4-ty@b4>
Date: Sat, 01 Aug 2026 02:02:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 29 Jul 2026 14:35:31 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sprd: sprd-mcdt: Drop redundant error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: sprd: sprd-mcdt: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/4f08e2b88896
[2/2] ASoC: sprd: sprd-pcm-dma: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/595201d39108

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

