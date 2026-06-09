Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384937D133;
	Tue,  9 Jun 2026 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046358; cv=none; b=JbDTy4hiXaukSR1C9scPyfVgeKBdl3HGnuqRkwJpu5IU5nll6f4UHYmZekt+hHvMrRpn45knOZlpCRcI4j7tATXkrp7pDu9IkI3sMn7xTAmSsiQOVGFaaUbDnuipm+TksZQrnASi3GsHd/n6qIT1K7jTTiUZiUsNCHmKZwZFX4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046358; c=relaxed/simple;
	bh=5LQl2WcwuFKTToxd1V5X1FZs0pTpkmD0XLN8h5jNSro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OrhjCF+0/KDanh3vU9gA+uZvlgMZJGkoeiRHQ70Y6SsU7TeF0AOuefd1F2eT2DIRQI0u6wVnoV+9f4YBycRVR4olb4UcuRCa1y3y1aq1HKV8ahRr4LMPQP0i0zCUHCdFA0oFbvs6BssbjtFkzvOcl3TrRgUUddhWS8jMBv3t3ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNiuNPlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNiuNPlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93DF1F00893;
	Tue,  9 Jun 2026 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046357;
	bh=Z5PHncgUYR0EhNnHfVHTNQtEn3DA26zVbU6SYmpvpQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GNiuNPlPiVy4elDjLB4fCAqAUSbbnnQt5DYLfM/gFgbj4F6IUjWdEbEL4LMwNcdPq
	 XfFYNHL4nV+lwM3wxuLzu17UB/sYT9g8lhFAvxNGeutPf+xYmD1LS0SrP4/OIO6QXp
	 1K9ASD6aKetikVBBRiscwoOFT9W60mz0fW10VMpRbVS129ufv+F1K+Ccku+dpjHgqf
	 u3JUz/vggW6OGLR6BgBhZ1CJagRIsRUDg3hJ2jsdYmOHLFxyGGI+U3nWtLmMReNrci
	 ga6aj3u6K1GATSd6f4cUdq7Lf/Ni2a0bVDYYFjzb+EL7EXUI1fEYiu22Q/XxvmtAVm
	 MS9KQkXiENi0w==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org
In-Reply-To: <20260609-asoc-sma1307-uevent-leak-v1-1-cd7f5b062ab7@gmail.com>
References: <20260609-asoc-sma1307-uevent-leak-v1-1-cd7f5b062ab7@gmail.com>
Subject: Re: [PATCH] ASoC: sma1307: Fix uevent string leaks in fault worker
Message-Id: <178102691249.34323.12823495616641820887.b4-ty@b4>
Date: Tue, 09 Jun 2026 18:41:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5LQl2WcwuFKTToxd1V5X1FZs0pTpkmD0XLN8h5jNSro=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxRHlUE94DsF2nKkgv0oc2aP99Fktg+JI7HZ
 IQsOtoGbDSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicUQAKCRAk1otyXVSH
 0CfsB/9jGUUYkGaKnAs9zslQrk55xub1NI1cW8Igg3w9HJk0YTHXSItgHQqltfI7jRbxxaPSSxF
 Dz2x6gtj3mvngTsA/1hdZHCcBiqXvWsTqcz9bKhEPzPVotgrVF8tprjZbpohlC/rNKO+nxlyLQ2
 4z/e6UZf+Rk0jYfeknVXlEwn2IAjE6uP87BAV+ow5A9iOpp0psJbNkqeQNgXOsuh1uOY4UzBpAw
 EPdHgq21pq0pGo2jWtT0raEEqJwul74OTv51tX2gTevXrh+WBvOuyWs2XwxxzFXETZIlcsf86o5
 rCpJMtjhOjL4Zc0l9u2ktL6Y51v5E3k7qdoV7mYxErG2GUog
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 09:03:56 -0300, Cássio Gabriel wrote:
> ASoC: sma1307: Fix uevent string leaks in fault worker

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sma1307: Fix uevent string leaks in fault worker
      https://git.kernel.org/broonie/sound/c/a750ca72af72

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

