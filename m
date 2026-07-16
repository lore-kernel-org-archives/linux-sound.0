Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93701DDC28;
	Sat, 18 Jul 2026 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334208; cv=none; b=uec2MgW3V5iGNwyMalLrGgtVbfe0STw94dBnOpMIp9sj9XSkh7+0CwP/CnxQjj6M///pAjjE97eFUDpYhg2LSvW5sz0aSwW9jGMeW1S9uYT1LXA5PBLY4F2F6f5B+jaMQUZBZgOunZy5ds4E6wJGAi9r8FCSNOC8/ytnC3vra4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334208; c=relaxed/simple;
	bh=44GbwXnwJ72PscUm40fhHLBC2NqCEy6lDduZ/2RLMKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ay8ncHrQlgoCEtBS+kfVoPlxAE8C1emZLpA9MfDKOg1Vpk6MxN6J9gemgJvbroq4f55HJjFt6SdVrCrYo3IKFnwtOsptCsMD5T3u5sQpAInMt+04AERGQtgl/4MDH3a/KTMdGGnqTBpeNJaxBkGzBeefEYpSPSfeBAza45pYejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcQskO+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcQskO+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFC21F00A3A;
	Sat, 18 Jul 2026 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334207;
	bh=1vJsfB5ejcNj0lqJxSVM74wrmkacOH2s8O8nO73nZ4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JcQskO+oP38kgczt/Uv54eoXo/r0E6TDUBcasITKiLegiMht5JH3hJnosIljqaTbs
	 Rvg65vgOnS2NHhwQQxIXA97HykzHEED4CxtEdTdBGL8oEYyMBlFQ21ZDIx08zfHB6x
	 XOAt94c/vp3FmyKsCjT36tGpish7qyxRrtr9V3g3+McEJvbFZvSmPko+8H4Yuhaych
	 aabWRvLSGEitcjcgNIjzuDCsL0lHHXwueqeVdbF693TwN/G4ZEQzjymSeXromoqng6
	 l8MKpNE6FRqTcu1JLlVO/Vts1Hgb6x+/w8qjDlAeeVajZyUtM8NsrA8Pkx4gvzSowc
	 1ZUn95jwRFleg==
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260715-asoc-fs210x-fix-resume-v1-1-dd81d9c62c05@kernel.org>
References: <20260715-asoc-fs210x-fix-resume-v1-1-dd81d9c62c05@kernel.org>
Subject: Re: [PATCH] ASoC: fs210x: Make cache write through again during
 resume
Message-Id: <178420330248.63368.7211296198030101816.b4-ty@b4>
Date: Thu, 16 Jul 2026 13:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=44GbwXnwJ72PscUm40fhHLBC2NqCEy6lDduZ/2RLMKM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWsd9UcTgr50+xeVuTPQtMjE0yRfWkpXHJCrj+
 ZiT+20McxWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalrHfQAKCRAk1otyXVSH
 0IrfB/48bN3h4rXm151UbfrCI7EhZdq2ux7JT3C6jVs0LnUQnj9w+jfxDP6fQa1aT1XFTygRkMW
 kv2VBZcNOfR99+NBBwK7/eJ8T6IO1eRmgjzFdOMqqclkBpeFj0icf77pshY+HnBvDCemE1eyoMl
 DsfRw3YcblefNKRQpxu7l4BLBpc1BnzFZQZCQIsKjEdxgMwHKc54aUJX9AOXATLjhWbYGa5Jfdl
 2If9I8oOeshiHEHCTd6D6tgGOvi9KSEyxyNyaDMnaVZjNZQqOtPSlEn6cDvEBFCKSxKYSyb7+9N
 hkEAhFCMuQTsEiaZb9Dj6lP05Nng5OW4ykCLecSG4lhrm8xE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 21:16:48 +0100, Mark Brown wrote:
> ASoC: fs210x: Make cache write through again during resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fs210x: Make cache write through again during resume
      https://git.kernel.org/broonie/sound/c/7dcf091da4b4

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

