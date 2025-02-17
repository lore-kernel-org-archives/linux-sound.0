Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBD621D01D
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799510; cv=none; b=e5K9uXayKDSsHD5ASoOpzt3J/2v0Onme1o+agzVvybQtBK0TR3jmnHqXzwcu6CxkwejZwT25tmxtsZ62+nwnfOSHWw8VKoMvNcE5nm4KItY4lHs7+VB1Z9G+0m9Gn/N/8fdyZOEjUUcGMrAQTT+aotxfo1EhIPiZLw+93OERuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799510; c=relaxed/simple;
	bh=iObqk2SYyxMTubpCChBFv6Xvv/Bumwc/IIdb2e8b/4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pDx9mjggrf7LSLlYyBSwuynK1F92wQEdXBRspxfmy/xXISZEMVHmLVNvacidWB7FBI7x6JKcpN91nnaOvE9khjKX1CXeIQJwIgQOGnaMxCSoqi3ridcGuKQkRn3eVsGs/M1eJIuticr4tfyTj+K7m/4acv74/4ROuZapPmxmFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJvUkouO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJvUkouO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FA3C4CEE9;
	Mon, 17 Feb 2025 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739799509;
	bh=iObqk2SYyxMTubpCChBFv6Xvv/Bumwc/IIdb2e8b/4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WJvUkouOcDHIdZbNturSpueTqI8MDwj8SHIQkOIYEZVT0t2LQbPuCFXbZP424MV8i
	 HNILOHOFwL54K9RDKbjf4if1KEg/ouX5yS6WbDuQ3V88oWL2WztWBVjAcBlyx3kQns
	 1/f1m6z6jyIyhXJ+uq6g5oS8Ogu8Zy2osTbX3yeF/XRR1Rr0l9L6Vj+MHccUaKyZr7
	 O5CsiYv01BBBg6NWo4R8LJCS8tvmKSJHh/FdrSjsCuT+Us3Cib01mOnHf5WA6sTFsx
	 dy7cY3QQuGXLLAp3Oz9kvInJ1LHJhdfj+LgTHd6lJhuwC0j1vuVlMOoFp39ZaGRGCt
	 m6nBkDfruX6kA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Luoxi Li <lee.lockhey@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>, 
 Krzysztof Kozlowski <krzk@kernel.org>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250212172947.38970-2-u.kleine-koenig@baylibre.com>
References: <20250212172947.38970-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Don't import non-existing module
 namespace
Message-Id: <173979950715.40079.1710107883732812775.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 13:38:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 12 Feb 2025 18:29:47 +0100, Uwe Kleine-König wrote:
> There is no module namespace "SND_SOC_SOF_INTEL_HIFI_EP_IPC", so don't
> import it. Historically there was such a namespace, but it was dropped
> in commit 97e22cbd0dc3 ("ASoC: SOF: Make Intel IPC stream ops generic").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Don't import non-existing module namespace
      commit: 9dc016eaba3a70febcd1db5f1a0beeb7430166aa

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

