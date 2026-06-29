Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372FA3ED134;
	Tue, 30 Jun 2026 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818211; cv=none; b=jGY+x5aMSP1kMx9Rk2KKSpq9J21lu5lqlLt5VBMobDgYna80RwXZEv4tE9GPWZnAouIuS2W0G6WaiOrq2vpBDK/Lz2XAHwFaD32nXvJ6a96oqEKpHdU7GzlGl6gaNp+SR+hnLIb3sZvdBJOBQg7TAPgEMCWkefzwI350M3QWeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818211; c=relaxed/simple;
	bh=kNBUn8rT+RFaQnXYNDxPR7BLf5ULtBxHAMqeGGfbjHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zg3OzmRaX1uTmChR2vtmGpwZbVk07ceRX8Z7NJIbjT8FESXvM8jDqPqJojIaWaZe3XlDNuzYgYyI//w+PksXs5L3U4i34zkMsRFMg5KFXA2GGrLRGMnJDYXcHZaTD+Bts2B/Q84GiN8V1RMRwawwaTHd1IhGp0UNlUBQHppV38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLf/K8kK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLf/K8kK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBAF1F00A3A;
	Tue, 30 Jun 2026 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818209;
	bh=RSMbFbTzq4ulumrspHa36pS2Ns0en/hN106wWRyfdYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oLf/K8kKToLElViOu36yBsKxGAPA2SgsdrqhA3f2PYIkiYjV7IpL+/2uUSyTFp6me
	 TOAvawxi8lZEE0OA7KCOSJYLyiTCCbzN3Uo1JjS45srEgmmN3Y5C+DVuPusxBA6Eco
	 IwTUQdGIO7wP5D+gIydfKS/dT3tCps7wtwNCdiKg2DkqB8483pk1h3Wg0zutfHt9nG
	 2PT7dAnNh2BPJiBh/77UOT/PddLRIQLdDZQJWT6bW4L/iIe3RrG3RNIRXggk9TynBW
	 Xq10bqYBzhmooekQnaMjtkebPwIZUjet7wu6Ag/WvQstJjhyRvQlieclXjv0iCgHkR
	 5iA1r4L0XdGvg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mert Seftali <mertsftl@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260614124019.19259-1-mertsftl@gmail.com>
References: <20260614124019.19259-1-mertsftl@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Return error for invalid
 number of formats
Message-Id: <178274658315.47562.2304868642667629912.b4-ty@b4>
Date: Mon, 29 Jun 2026 16:23:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kNBUn8rT+RFaQnXYNDxPR7BLf5ULtBxHAMqeGGfbjHc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WeTUZafms8tyzUHKrQFM9m7VvYUgP0nOfPm
 4vUa8IvgnOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlngAKCRAk1otyXVSH
 0K3ZB/97sb3FtlkkqTFlk18fvNRKFYPrbPvBS0Q3bwS0WtuK9yGhMRciEloRDj3CFHNFR7Swpc/
 JmZIfiyxjzco74zETECes0PERuckb5mdoJPUViNkVyK18VCj9yUfB+QtAVHWePprAsI4ML3Jv8M
 Qt0o/1jX7RiPeS1fjAVDH+8Xd4zMtQ0pDXu+Q3/1oiOS//B5jRopBHit7YdijNNAjwJ6gDMdA7J
 MOew/nyhzwJQRPSoIOGOwZCt80rcvvBw9f6XY/+NVPs+5108ap0yxowYK6PeVW+o/1/WujnOA/d
 D71MU3E8rENOnW6BWhRWaCCXowZ86oDoTKviBO8DWGXkHxuM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 14 Jun 2026 14:40:19 +0200, Mert Seftali wrote:
> ASoC: SOF: ipc4-topology: Return error for invalid number of formats

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Return error for invalid number of formats
      https://git.kernel.org/broonie/sound/c/11e828cd6b0f

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

