Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035444052C6;
	Tue, 11 Aug 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466827; cv=none; b=h5kMTYVCvZ6oLNdDgcbva3wwc2/55OCtNbdjjT/RdlVIR0aVkd1ShzxxkodKvMedaU+8bZYT2eFOz1iNA5xkEaDl3BV4U+TGdcrFNj3QlyWsHHHfFdksozlK6jY5TgRqZbI0nTVdSGU806gRXr/udVmpSYN1dKIDYKdPgAgwP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466827; c=relaxed/simple;
	bh=3tV7MfYa7gJ6oSUX19YCgxpALZXllP5jOwzBz3hFmDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ckhNWfEdo12WSgEodCkRudGc3LQXiFV3K7COEphJi5z33WyVrUI4IV+RkaDMFtWHWu0DXpt3hLH4GrVhYQHzfFqZKOTO9JDGfX17LHg9VbtwaRSWFY4g8VCLire2EU5H/WvrHc8TuVOZdXQ9MYDBE99EuIT+9r+2o16z71/LT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAZ192fY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAZ192fY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71511F000E9;
	Tue, 11 Aug 2026 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466825;
	bh=Bl/vxLGHqxqRCrOUeydMhwI2+voQmuxYqMRKje2cKNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cAZ192fYCzaDs69kLGOWo4K6W+spDVrvLanZmThbEjR5pwUNa+pv0h7E+QiIcNeL7
	 CAsyo+UF1hXDzlVx0MHvJc3bAc+I0COPqYwwbLcLWXZSuydbVuiIDZO427HWF2k8q7
	 i/2FXtWHty9RkedOXMkAKO/YV//fz9xR9kCkWvVQExWxxQ954kwOXVJO/r7OHchIBB
	 8rzaBL+F3ZU0jYbE3uvdyC6ZBXbCI+PJ18JDLPyUkWRUT7Vf0lICr5LRkaUOfcklO0
	 hZMVzmXnHFZdgCf2SQJhC3kZ9PqkK/q1YkhAgFv1grFjkUuAEkzIKjm0GP4j1nPWR0
	 qhxXaDafpR6lg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260806233231.30631-1-rosenp@gmail.com>
References: <20260806233231.30631-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq
 handlers
Message-Id: <178645931337.119683.6038147153748849900.b4-ty@b4>
Date: Tue, 11 Aug 2026 15:41:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3tV7MfYa7gJ6oSUX19YCgxpALZXllP5jOwzBz3hFmDE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe1IGwpAHLJa3m5QOQyv6nFLxMLlWEEN0RACZF
 8FGR7NKyoGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantSBgAKCRAk1otyXVSH
 0CBDB/0VARELchOepwc6+vT7mCTWQIxxFbRfD6Fe3UatvZnmoMFL3U2yuN2zhv9tA3ZJtZLeWNz
 cX2QchWKVeqPD3uBsnaeJeGN9BVnOac3y7uAMSYqJXRKlWUJQm2E2Z+wMbCkG7ONyHnEbyEAyRl
 GtqavfWI2EzbDm6KkmYPhhJZoLCBj5yb3ttrJcH4qBltUZSWaEUnXrRI6HNgDe+BQrBMke4xVn2
 AGHt0OA1gea7JjO7SoqexITh9ksR+5MHsMZd36zp4wwSRu47SZR2et4DEHw5BfDH0anyHbM+ddd
 eYlDJ1gVzf405DXlJlCEZ+QVASEsgm6sltlycmj5WSExJ2ys
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 16:32:31 -0700, Rosen Penev wrote:
> ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
      https://git.kernel.org/broonie/sound/c/f12afefb7b01

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

