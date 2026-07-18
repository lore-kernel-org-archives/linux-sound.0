Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC142374E45;
	Sat, 18 Jul 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411811; cv=none; b=dbFTqTrQqa2D0ctH6ClFEqT24upD9UTYoTK1gERVB7uNPOvRmfw2s/rMS+R1xYAVwN0V+yONK2oMukP8fV6IkTHTaBdGD99aclTCRhiXMcqqaqkVDQl7rUxXRYDSgxjVTrexPQqYW10t78SIttjDtqSopK3FUUInFDX0raAyPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411811; c=relaxed/simple;
	bh=2FrkQ/p6UzC3chQCE8Dg7w1WziNyTsHsey8A//r01m8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lom/e0QwKJ5YFdDL8gpBFEq1Nn30LY/D1A0IEddtCdcSA3JMblhbL7lOo+T4enm5jY6+DHYT1UZO8cbNvq3mszhzbvWSm4+4ARiVE4fIQOJAHA+oNWysJEPKpDYSd/eW0PeoOqZQvqLEIw/8qVZC5/IuTlW+R3y3kF62cJzBWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOFUEqXQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOFUEqXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E162F1F000E9;
	Sat, 18 Jul 2026 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784411810;
	bh=10oGB3VrzbrtIlCOef/6xP4X3AULkySSj7RwG9TLI5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GOFUEqXQhP4NbKR+0+BNv2CLKqzy9ZT2DXvMC58oN52wYncMk3f5Z4lsfnaqS6BDF
	 es94pmUBQqJ12EiYNKcXlpvB1okJzqATgkJNoF93byyFp2Zs611S74szgoI9higxIF
	 43Orka18tWfVsJgknv/j1uOdEHH+2LD5P0f0rJFTEgT2CGs7bYLYeW3CZMdErBRTta
	 jEz8uNcabyrvUJb8WpFTvK749kmpto18ouI+wIw0z04uQCb+KUppo2zaVD8xoWkjAt
	 TRP+5kwPIXZLcX3fbDCIh2DWfpiOUao9MhIa9SuVJGCDe69jTj4z257sYI7tnvNVM6
	 JBUclT9ezC6+A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <alsAsTcQrpnnR46d@google.com>
References: <alsAsTcQrpnnR46d@google.com>
Subject: Re: [PATCH] ASoC: wcd9335: switch to using sleeping variants of
 gpiod API
Message-Id: <178437727464.5332.13969598032885249230.b4-ty@b4>
Date: Sat, 18 Jul 2026 13:21:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2FrkQ/p6UzC3chQCE8Dg7w1WziNyTsHsey8A//r01m8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqW/afmSWP8OmzZKPfpbQY8UIaakfxjb49hlDW1
 brFnwTpF6iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalv2nwAKCRAk1otyXVSH
 0JP/B/4xF9oMDPMmNwmqU34ENnNbX/0KV4QVVNXQ0LQQw3R1zlgxZIgDTOFAuAwfpWE1yPVUhnT
 e3WzO8DCE9mJIEFKfcEKCjdNOyQmAMv9LQDjvDp47fyCkoiP6a/pktlqMgtmvdf5GgWSnpJRDA0
 em/jRcDa8H2680sqPt+3/KLDuu2C2qAabWZ6wF08w3n38dbR2fCT7rJUkSVCnuHmaoz0i9TPiq+
 PDRFqc4K51tHVA2XK4m/Zm1CnmP4UtssW/wd8k9wKnxlrmjrO3pROJ9h2K9kRnPCuSLaGvnHNbO
 DDEnZCOUXPoNmY1GLzG+IzLytaEoDUMPFUYeAVWYssX0eIOC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 21:28:55 -0700, Dmitry Torokhov wrote:
> ASoC: wcd9335: switch to using sleeping variants of gpiod API

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: wcd9335: switch to using sleeping variants of gpiod API
      https://git.kernel.org/broonie/sound/c/50b2e4bfb4d4

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

