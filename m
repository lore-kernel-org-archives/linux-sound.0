Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1F401494
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818283; cv=none; b=hkRCeIqsHwV6z9YQk12fcNoV0dz9DunzrhdtgBN1/zIpArIVKrMqZ8EHy+olawFlepM5HQZveTaer7I/aDzai2twyXHmrMSCVNXZXFGcSdDN4h4sdoimlihIVhP31PPhILTTmGKRU8RzV4jKDdjwHPgtfvs4MZ4jjKvI5ZlsE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818283; c=relaxed/simple;
	bh=BRv4D5HXu+6YSbs/I8JujyFvtmeeXzrgmVrXwIm4TlU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=csj+CCUAUtw0I5s3gUYnNECnkUyxG8fUa2nT0XwygsssA92uTroe4CJXaTAESSpFp/Ip8hWXyZb24KfCpAli09ANzYZQQ6WVj6ODkQgOK+KcjRcf0K+jlxQjU1SSpNM2avFVgkZ1Dx0BIAEO+Kt86RkFqjyzV27DSUO02blAYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DO5079/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DO5079/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9141F000E9;
	Tue, 30 Jun 2026 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818282;
	bh=83LmPhIDWhw5xHlGqAOgDAn3G+vpsiqnM2JUTiu7lGw=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=DO5079/qvjNrcBneY5LSbibT7XuxThwpEkQoHyOUdIo0lh3hyRDlbSRrY9hkVSfoi
	 CaHw6lBBi5SfpzY6Pcdsq82x5iwK210ugcBgaOsFk95HrKXVc0To1B4VCO5RdSO4Oc
	 9nruYRdMCDD3o+H8XDjFBWOrL5kKaok6RlMjji2PzeAAESl7eOAiOak/M4re29ackY
	 u3Q7nTzpb1KOfT+dlWm0ZzSbxiyJe3DUII+L0d9EN63JztcIgM9Qmk6SO/dj9O45nO
	 fMZKJeMliQyfWBGamzjdJd9Q0PYYEZDIXZ5lL0PyGsCrkp3gIPavxJBD+SLN/tURf9
	 vkDTpIwi28JDg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zf0ids7p.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf0ids7p.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: max98090: add missing describe "data"
 for max98090_set_jack()
Message-Id: <178275557772.47562.550574669396940999.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:52:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BRv4D5HXu+6YSbs/I8JujyFvtmeeXzrgmVrXwIm4TlU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6Xob+t5VJfK2NfzLPTO4vYDcmqgvwaDjoyRo
 23iJK75CqOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl6AAKCRAk1otyXVSH
 0BrTB/45pVLR/F6FUnYsd30vXD/fH3qPfThLcyWm/nrv+JQfM2baQ82zRZvYqSQN+pb4RptD5Qm
 UyKdgA2uc/x7VDHrXF/k9Z5FvU7RML9zXse+om2gr0AeX3evcHRomksw40B8MI8i37keJSnAoGP
 RT7zR4D34GPzp6r1oBbvU5ePiaXVdnzRHIZv+HFwXRw1pI7YfYBy4jYSXaaUanOqCrN6hTJpYQp
 XFqdn0Kr0LK84SqHh2XfvxFFjVkHFWlpqpu4/KQJ5rTNyYOroqQN949kKj2iwDpe8d3IR9eurjr
 c5LlHd/BdhqhPqIfTm9rfHWI2x/lEKiN1IMm8/6S2JgfOqW/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 01:07:54 +0000, Kuninori Morimoto wrote:
> ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()
      https://git.kernel.org/broonie/sound/c/2e5bf7f48bf1

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

