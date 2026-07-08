Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4AE3F86FB
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599564; cv=none; b=rhN6/sTdDbBuzO5KlNtobOpyk2NYXJcX6n71CIcRtn2pWg8iDaXNYkYsaMXbBuGnLqn0Jllkjq8UggS+vb6R7vFTOI7/86WHtjcPtxMGiEaxfxKdieTwZDxlz+T3GZF0yCP392XPxALKKQfedQfLO04UYk2OFZJjiTqC6hYp8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599564; c=relaxed/simple;
	bh=wC5jSExVb1Y/71cR+3j9+98La3wCQrKg/T0TqBjT0U4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C7E1Ke6BCKRhnam+Yagu0lsM6IEAMsI7LcvwG7tV19Kt9sYVSz2gWs18wR8nkyuk4nIpyQ/rmd8PkNTBvoIo4b0A2JzxCWbxeALTR1VEGJVTxUdJ6mJ44gNgY7cKteqA4j4OHAzNPRyAKl9VQhmxKoGyr6MQ9lChanYhfiy0Q0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHRkBJ+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHRkBJ+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A16A1F000E9;
	Thu,  9 Jul 2026 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599562;
	bh=J6BExS555wf3TiO+ToVCNRBH5UDGPHfRZlb6d0PZUUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JHRkBJ+VH3vPVJly+xA1f0SBuJw7M/npsjUaIf48sMQPnqTpuQzO27WRaovVPbQp/
	 G70G6Dmx1m0TR/d98mUgqIesxixtstbKWh2Qy/hGGSZhnp6qSyzOpyllcTNuArmD9n
	 mFpWIXLIBechNHap5qwO+lHV+O6cn9CafZmEkkdNXQ+aiwPWrZu59VhzvUo1arQmuE
	 sXmvsGJ+PI3tAXaPZEJQm5aM5jsvxD0nkCNX+kzGlvbY5sLT5dbrvECLP9jQw7EyRQ
	 u41ZElpidRSI7oEOdvIXeZquk9t5dv7h4sw7yxNHLpjvBZxPQWJmAu/6PgCaFnrJQy
	 ak4+mojfHfwIA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <874iiageo4.wl-kuninori.morimoto.gx@renesas.com>
References: <874iiageo4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: amd: acp6x-mach: tidyup strange alignment
Message-Id: <178352959219.26140.9663551497110962003.b4-ty@b4>
Date: Wed, 08 Jul 2026 17:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wC5jSExVb1Y/71cR+3j9+98La3wCQrKg/T0TqBjT0U4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiz/iSfKEpQ05ih+Nvu3VLMuTu7NX68/kSVndDfEJe9q9
 rynelOgk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYCPsS9n+GySdX14pz2Vw4
 vCl23ZL1S1JzTnNM4sr+aRRit/5A2Yfjm+8fjmbS1PQw6tIzEdl+4JagwOJPkekMRRsfKk7uENP
 z5BUN/ZUuP5lZ6vlcHmanS3Uxu6N/2dmv1pD5O1f/8iyBjH985SluxoyNpt47ubfI9WrprT8cqv
 usrs3cU8Gg+dwZ3ZdHVl7S11mh38VUbLUomTGlRznVw/FC4JGVh7eGvc94qFF1ukhTvc5uSVlRx
 qXohg97tsfvbGYPaLHfOYWj5FWaUlnMBha1G97J69teSnLPK31jmRkyy0O++ec2ld97c4J03x0L
 0ta3ki0ydH/3afvZNJuYO6I1bJeNPQPfLn1/RU/3i6cFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Jul 2026 06:48:27 +0000, Kuninori Morimoto wrote:
> ASoC: amd: acp6x-mach: tidyup strange alignment

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp6x-mach: tidyup strange alignment
      https://git.kernel.org/broonie/sound/c/cb63976eac60

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

