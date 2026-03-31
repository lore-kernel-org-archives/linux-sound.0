Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9C375AB2;
	Tue, 31 Mar 2026 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980929; cv=none; b=C/qru+cZd+dGuQAo82S6TK1MAxQzcGeAEawoYO1mf46MAWQhQpIm/PXcgKlGUGXQrGoBvVkrQ2r6TQ20pbxRO18VmVc5qJlz7Ae46NIDAY8VWQE1KvaaI7wXxa+M4FYONV/9wUdXtIgI61ayBeeWWuVMtwRDbX43TmnHi/Yz7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980929; c=relaxed/simple;
	bh=dUpWRpVD0pZTUEgLbvqfOYoiQMaDwcvBXt46TuC81zE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t/C0gPqpV6WIiEmWwubGBdyKYmh7gXBs8GrElahwJt3FkBGlau2et8tg2i7lmKiOTFQBvgfEBTJtLf2BeaicSHmTmu9f1O7PQIXp1Zv+cBGqgNWuxP4lX20DweHuVKLWWpOYur5Yj7HtEhOj4xuzKuQYGz4xeJlCKwvl6CNBXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkoAkYrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkoAkYrO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D66C19424;
	Tue, 31 Mar 2026 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774980929;
	bh=dUpWRpVD0pZTUEgLbvqfOYoiQMaDwcvBXt46TuC81zE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YkoAkYrOeHWFCL9i+RlO4XlbQ7aW/LYqBhrrXMTjV8+mSQ9e6rRVUp6O1n2PE2DoK
	 PaAQwa5BkHmJd72/hVaQ7HWCVbmOUylViW833Y91SkOi0KX8tuH09c/UFZ6NNxAcgn
	 XSNp3tch8nERPV+3Swmj4cAPllj7illHMu/6uESzHWX7SdykM4Pj/WfzMzO9TK5ag/
	 rF2pOHTNQgsLmj2jdqG1qPBpjb9yFwCa2dnEwMXoUPHU+lknMTqYNapa0bR/BAR4g+
	 6y+OEjm+ubGwhPSiPdsx2lLetaLueDqi+JvfhD97oSDiSkwjPx9Wne22+yt31n3Ktl
	 YZEyjgJeChYvw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, Julian Braha <julianbraha@gmail.com>
Cc: linux-sound@vger.kernel.org, liam.r.girdwood@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, david.lin@intel.com, 
 arnd@arndb.de, linux-kernel@vger.kernel.org
In-Reply-To: <20260325001522.1727678-1-julianbraha@gmail.com>
References: <20260325001522.1727678-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: boards: fix unmet dependency on
 PINCTRL
Message-Id: <177496232380.39905.10262216448463693315.b4-ty@b4>
Date: Tue, 31 Mar 2026 14:05:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dUpWRpVD0pZTUEgLbvqfOYoiQMaDwcvBXt46TuC81zE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzA89URBCy6uinqYVDMbMsoHzNtQH5Dow/qthK
 jHuLFUa8A6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacwPPQAKCRAk1otyXVSH
 0LhfB/0cJc2B+IEj9Iz07xxMXbHdY97XvnzQ/rja8oPnk5OKKq5BFnaFPxjumjh/PUEDzPBz1WQ
 N5byZT4EhNjeYQsqrJnydE3OwCvWoCFBvPO9pvd8+g+umRGdHJxHuZZantiQtd6o77sIQ/dLD+l
 kWIz2VLbythOh0Kuhxz8tVjCl00/r1k9MCrFsHJbJ9wReJBG9rmVJYX43jadBRPxxGAB9LWjHLj
 9Ax5WGDDhApiNzcoYWON55zttRaFYp5T9SzEwYVvOQRwlGwnLXg9MfLK7wfeXBJxEYijaC9+M63
 OVfQj5INwNc+zXu6BQOeVqwOP85d/up6OcujZw1q6ItDlggC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 00:15:21 +0000, Julian Braha wrote:
> ASoC: Intel: boards: fix unmet dependency on PINCTRL

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: Intel: boards: fix unmet dependency on PINCTRL
      https://git.kernel.org/broonie/sound/c/e920c36f2073

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

