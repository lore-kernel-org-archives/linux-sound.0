Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7B9378D88;
	Tue, 31 Mar 2026 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980935; cv=none; b=t3sStOhHqOrpv4dVw5rIHpb6NHArunGlbEfcTKRIZ6S3Nb7PMBOTmjEmEO0YvEM/nR8IzE9KiG809foqpm8NnB+gFPutqLpglrhj7iSzCBX5Q9X8+M6+8WQpf8mzd2qb2RikwkRbFzg9jqC2KSJiCjiu1/zQpBpz3PaiBGJJOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980935; c=relaxed/simple;
	bh=HEt2i/x+noO2xvklQYGFFrHXzXwtZVD0/H6BOyL5w5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BtR2xqrhwTp/VwmzXNn0+pp0yevHbvTLIT8VKs9UpeaDhUW6K9FzExoVg5S6+WJdT9hSgtuybhGzPJQh6gxILOzTfoE+ZI/HaWTpV9vqltTbpAJPZqOTSSZedDyoVIIpyMyvmtM7ePSVe23vJVYwummtL2b55kKnTSshaFcmlfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2Ap66tT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2Ap66tT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B058C19423;
	Tue, 31 Mar 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774980935;
	bh=HEt2i/x+noO2xvklQYGFFrHXzXwtZVD0/H6BOyL5w5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s2Ap66tThMBTA1HIZGyjMebB3hpaRVd2KdYIbWc8xrjwkgP+btG7vKL4ZNtRnz/uX
	 TQEqM7LJi/4ubkYZsbxhHBYdCr/GSoHn+Bbk5nYA7i6fzyB++x/lzzqTlCTcNU7+HT
	 bGepxkeRf2jbed5EndoIFkHpzKs0/rsANxRxd5O3ZNgWRTM+H7AEDO0gSDsARA1TM9
	 ua+8WE8MWSPPuTbhPzdRi8KT9rrStt+OAQYosAdtS158qUhU+Ym/JN8j4OlknQdZPJ
	 rdoRyXiWB9KVokIwdmFH0i/QiS0lu7sjbPLrTy5zUyUu02jV9Bb7GcbJmA6EzJ3Oym
	 Cq5HRnWrwQcPA==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Colin Ian King <colin.i.king@gmail.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260324173830.17563-1-ethantidmore06@gmail.com>
References: <20260324173830.17563-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Place check before dereference
Message-Id: <177497249635.515155.5473291093205276400.b4-ty@b4>
Date: Tue, 31 Mar 2026 16:54:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HEt2i/x+noO2xvklQYGFFrHXzXwtZVD0/H6BOyL5w5A=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhswz/M5XeX/HvuFy+9xxbtIvLr4+CQbpEq41vPMaH6uuY
 f/1JGFSJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkU0b2f9721fdP2v10730
 S5JYdpaPx7aSekfPDdm1x0J4Krr81rSv9c54k3aXWV590ZTFwVJM7GxXjX4wPN3w8FTVb5cnUqc
 DE95GnH1ruMmHu9FtWb6cvm7Gqrec1g29DNkVmqr7+O34O6vOLV18M1eYLVx4ZYVIwNc70xwPvz
 5wKCe8/9oU1dcKNyc/nJBj9nXZFz7FoMb/nW+4pvwT2DSn+uaPtTL120u6M9wCpdTlVeUXnGY9X
 ZYn7Lm/9WdFikV41tQ+KQeO+A/Mv6tD3dYvb9TYecOlyzPirDHXQ8fsutY1Mzxj1xQXzrVurtEN
 q/+7eamPyAZ5ATu79c8vR/nc154yyyT0lsBch00MVvUMAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 12:38:30 -0500, Ethan Tidmore wrote:
> ASoC: SOF: Intel: hda: Place check before dereference

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SOF: Intel: hda: Place check before dereference
      https://git.kernel.org/broonie/sound/c/6cbc8360f51a

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

