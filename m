Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D33B19D6;
	Fri, 19 Jun 2026 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781888699; cv=none; b=JTPgdyd8EoJb7F+7KSIxmy0op+J+yhDuJYU1c/u60HsujnsfdEPBCjqEFMDFdm/+iDiZ9o4ViAUVTXUbUk/LM31BidXwoi0WptPUxq8EpfQVyG0DN4GMPObKwS0S36yOPocJS2jSz78Q2VfMhkwIcKizWeWCBw9xTr+Do0yyRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781888699; c=relaxed/simple;
	bh=/npPzbG9Xb7rNRHLZJ4eTN96H02/K1jS2R1ymSSSdYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OgAcJ16YAkrAOF7vuutr1N/Ok6H5HV+RQMmigtRjXTnb8cMBz8GkFeU6DpXW/cpS34X0w/Pwl47jkjUBNt1OjIqXux7wOFz3jdBjOCP+WWmTCB4zjx7iDaqqCCkTFGBdHbzdbUePOv/36CXWRmmvzM4x96sLQk6zAUcyMXJny2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J35I2OVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J35I2OVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB2B1F000E9;
	Fri, 19 Jun 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781888698;
	bh=1/BPoHGaWNjEvfwwjMJpP+QlJMB/0HrMZ30n8lI6eX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J35I2OVo0DEXHKYokOFO8i6ri5S3dJVhfFuLpi1uT/tChGcuKr8+bz8gzyBBeB0iz
	 UP7nWxotK9QrDYqJ36I29qtbTLWYqRK3v7u1GvOTXqWuS2vjBargFPcs3DjDnUp6km
	 9BvKpkLVc7bnmePIq/yt0DBJbfUaOhzDFdKfw7O59+6LJxnxCQGNwHdC4xENjD8r8B
	 zZyYBMB8/zSKI9FYx666OWpx14IhFadOnwSHj5DTIS33FKopVUO+CevExz/m0hLkn3
	 6tGIUlaIAFkqDfhN0y4UUbXtGjclhQrInAcH5RCDQ9agKGOC7Nuw1RASdxFwRt0hQu
	 V+lKfVuhcowyQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
In-Reply-To: <20260617145508.327213-1-alvin@pqrs.dk>
References: <20260617145508.327213-1-alvin@pqrs.dk>
Subject: Re: [PATCH] Revert "ASoC: audio-graph-card2: recommend to use auto
 select DAI format"
Message-Id: <178178708785.62759.3023344002883714292.b4-ty@b4>
Date: Thu, 18 Jun 2026 13:51:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/npPzbG9Xb7rNRHLZJ4eTN96H02/K1jS2R1ymSSSdYw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqNXa3q12xyQEvXSN0G7P4eiMcB7uw+c0lGxZh3
 vKK9Qb2ecSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajV2twAKCRAk1otyXVSH
 0CDBB/0R1dIhf/d8JDtt6FJC8b6dmX5Xx6lUj+vd/PnCTjUIUGHTp/zdYWy4hDX0jhBpH79MQPb
 nDKTtPc/1O4F1Q4/j7X8QXUG3klU4Wp1Qr+XPFvcYWo+hhkC4hhIM+ualyR78qbh0nrWc8Hi263
 PrDvoCAz4D+ScBZnlxPzTvrhDnt/4lne5H88Kd5dhbNddJqIYCNIg9CVnyPNdUYa0A6dNSgJRss
 gvwHwK9M91OghptTIhMlcnb1RPvYRBhWMxcgkVaE0ckvYXT5iebfPPFZTz34/ogO06JJoEhKxpZ
 2ERhP0czXC7TPoetrzpdhVYcmkXeQCY0hrXass1dgvaWtQR0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 17 Jun 2026 16:55:08 +0200, Alvin Šipraga wrote:
> Revert "ASoC: audio-graph-card2: recommend to use auto select DAI format"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] Revert "ASoC: audio-graph-card2: recommend to use auto select DAI format"
      https://git.kernel.org/broonie/sound/c/e6fa716c9d72

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

