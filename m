Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B23101A5
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150979; cv=none; b=IOAGpxdSckKks3p7itGhmS3an5cUHb0AquOgt2woRqZB8a5kGpH68bojMC/YCT7ak22Yn5vXa4U48vTeGik+Kp4ixLyMOUxDFcKjsesZtNNSxmQ5aOmnH+fTu+ZngTJCHVFXb4jvwuiirBKhPcC74YtNIGW3XDPLln19GLjChvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150979; c=relaxed/simple;
	bh=jN5LJi78RhLD4l3gXcgcgFpviTF/5+q3wCcOiWnq/74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j3oi4a/SuB2qY036zLilglvzLB0mbC/Z7pmVIQz+NyQirnsPyhxadhFZo/b2e8tmTOVPZiRBGl2Teb8yV3rVcuD3U1BzhdzzHmcRX2nvuds7YZVoXQa+QUG1cZvwMFukrPlyc2IQDAPZn4Fzhkrkv5E0y/UEhjejKEPr3w6+mNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsDKodlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsDKodlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CF81F000FF;
	Wed, 23 Sep 2026 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790150975;
	bh=K1bfegONpQWDDcu7k2q3zhJ3hx+HNx+Co/OQK37AJac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PsDKodlc28uC+kYVrft+/9Xrzza4mPQT1ov2GUQ+qb//71gpP0kJEB4Q0kv89y8R7
	 di0+hTpe9/4fJDPtP8JoLyPjfxTVX2mdeVW7o6aNg/hU0fweU4DCJ6MwW4FZpLaMm2
	 y2B0h7MEbmftv8rJ4oP/a5SlxrgaLcqE/yl0tt/BsYv6kqDwTZ4S3q7/s01M2QwrMQ
	 TSEYmzZm2x1jG0E41J1W01NJQV+0tS49SQZTng5jAt8E7MJmAt/idqyBEXWvIwkUpt
	 UuJe/9hcLaEd80nEbAE2L3BAnngdWBF5eSgR0whz58sX0mZloybJVUifLW3IUpaC7L
	 1NkiIgH2IWzTg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260917090120.2506160-1-shumingf@realtek.com>
References: <20260917090120.2506160-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt712: add GPIOs for LED control
Message-Id: <179008505990.322763.3440285058526382665.b4-ty@b4>
Date: Tue, 22 Sep 2026 15:50:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jN5LJi78RhLD4l3gXcgcgFpviTF/5+q3wCcOiWnq/74=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs4kyARpmXTWrh7riEBsylEJSA4Z5iycFjZNM0
 hhEAi+wwmWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarOJMgAKCRAk1otyXVSH
 0AaBB/4hcdZL2DEGsfwUG1lDGERS62JfdOOy+hRHdoADOj1wiuYXGpEkwpiZi4dK4TOVZgJaGMv
 gqCWgiiv5+dWyA1bT5jcPLExqx/VPA/yeMq7CeM9U7Tnrvt6CkhN8IMtGICWXGeZ1kXHjtXbNcr
 SJrhhD+o/R+AY+BucBKoraRh6pdqBhiyGttyDcBU/ub2MUeOyirF/UYOrDhZrT2v3iF/QDfIvey
 dDTmwUDmgImNe8UF0/3M/5IOLPPo2mkSzAR8TT//kKNxY1vgplMYny+TtcZcvn/MSR+yrCW7Pi6
 GesVE4c+uQtk7fjopIM1x0s+DDYQzbPEnVR3NahxD97anENd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 17:01:20 +0800, shumingf@realtek.com wrote:
> ASoC: rt712: add GPIOs for LED control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt712: add GPIOs for LED control
      https://git.kernel.org/broonie/sound/c/e845b86c58e8

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

