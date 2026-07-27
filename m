Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66DF42A140
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192932; cv=none; b=NkX0FIPpeVghHZaO1FVaCsEzwbE22wejKGtN65ylfAYOmFQiShV1WEExwXmAmoHFAqffGiX0GhULdL+iXJD2uWWxGooxGpHVL1dsV/TFEI3dtq1AHa17m09q4PXXslGK450tv/2AALO1iCFFKQwIUkEVftceIE6J5lcVExy4Si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192932; c=relaxed/simple;
	bh=/cfapdwSVUqmp7Rzv43EM1lfGnN9EOUEH/NwJeRqJ+A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R5RfCpUodISgz1O0hcSRl7g5MEW4Wur/1lvd7duMoIgxXuE+8OMSFieFME+Mev0OhoJXNOguA7D0O/t7zjk1JKF5iPzRITSoMe/okxO/6NKGtAkWhSILr/rnUQizfoKKBWbC5iq1ykLfZS8+VFq4+VMenKAVqqJzUp8FDbwqNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMrSrmHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMrSrmHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74E41F000E9;
	Mon, 27 Jul 2026 22:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192931;
	bh=GCkcEwwH7VxujP3VUxnHeNG9U3j954ZVrkzsSOJ9V2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XMrSrmHz40437MdB3GeHGO0iI/eQbuAVfINap2vGpndt8nA73IMMtH3oLIxZdd/ik
	 db4zACSGzvt7hFhoG+ILhlBIA5M9+8hJoqGtpCvkx40+smpT7uIshoUngVFevNcag1
	 lJrtiK0z1H7W+6ZLkWQcXKX7i/yCztCq9brSctfGg+vEqyHACgT7nXjbNtbkKDmcs8
	 fCMFAi/3bQQr/qZna6EVZJY5vsx0MV8zoz0jQEBF2qNMeT9fk/NT2Nje6fEjs8mtRm
	 vcMNU4BOgM+pEM79mW7nDf3EfFB9VPFkkwBpfCgILzBjAiW+THvUPGzUzEtOvxo8RV
	 wvr3cQcXqejFQ==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q75jfny.wl-kuninori.morimoto.gx@renesas.com>
References: <878q75jfny.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: atmel: atmel_wm8904: use dev in
 atmel_asoc_wm8904_dt_init()
Message-Id: <178517237674.50339.17551142051620126263.b4-ty@b4>
Date: Mon, 27 Jul 2026 18:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/cfapdwSVUqmp7Rzv43EM1lfGnN9EOUEH/NwJeRqJ+A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+HgCwQ01y2VlGTYmr6+lbbbGkduZPo3mf+wr
 FUqbpFo91eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfh4AAKCRAk1otyXVSH
 0Nz6B/9Oml5nHRTH8qyS/+yO+VRYWbywKs1WXx06cz1fvrOPyHcuLQvx2D7D68xFT3VF3/fZPq6
 J2E6tVLQsmT/F5KFuDfz4jGwEMLbjhEgBk6LuHAHqkU6ZSKLR93yZ8boW3yR5GfnVBPE+WpvS94
 PyZzBXedjyWYBJ+I3tnWVm23DULiWh8B2pKkfUSsMITc6RBD/2+oxKc0Zr3Btb3irUKS4kaaJR2
 wSh9o1B/Dx6ApVBU8YDNjdpDF1+jtKezuK8d7QV9Yb3iahTLpelIuw6FxXJ7vrWsiPlW0uKOI91
 8ic2mosKubuwlvR6zBX/KXdzUwqJrzIZpcr78x+zej8lFqIy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:27:14 +0000, Kuninori Morimoto wrote:
> ASoC: atmel: atmel_wm8904: use dev in atmel_asoc_wm8904_dt_init()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: atmel: atmel_wm8904: use dev in atmel_asoc_wm8904_dt_init()
      https://git.kernel.org/broonie/sound/c/52ead5e1f111

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

