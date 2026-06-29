Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209A3F7899
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818275; cv=none; b=EV5XH3okiPWLXYcjJT5YQ1R+4qrzcmxPh0T0CJdsSL9onFO76+WaVpISKKCIg8u/rzXOYjYAs+FXsVs7PZQ06Et1hthoBzNTkJORztakUFISZy3te353wQINZ/af/GATZIFBYwiftzHs4iTdM6i1J1iFnCBC9NUijZ6nbbwAaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818275; c=relaxed/simple;
	bh=cxSgezucFcg4TOPtVVgNf5U5SLXhHSTwOds8LOiS3NA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Am5Mzr+RXcHNn/ncEmjT1Mg8rrv2/mkQrk7w+yxOp8DWt95thBx9j983S0OS2FWGQMov6j4JefoCXWVQm7rzPkm5plHBKPZSS341Eoe0blcjEHwSWcumgJf54DUEjT1njKtXu2iXti7LaMC0NPB3Zhr3tXNHqdZq5l9ljPGSzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1L4AnmJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1L4AnmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985B61F000E9;
	Tue, 30 Jun 2026 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818274;
	bh=COPJQh0pWsgUNUU0oWwnVt+psIeToOpkO8Jnl4MLjwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C1L4AnmJ/WUyxjPEC+IDqdd+Lbcddlh10VcVv23+/UZtZ2gSqHdLBI7RdC7QmUFiW
	 F6cKAqreVhd9pwd1KwZZCi2E/b48Pa2Y14hCF9TDQ94rYgCi3NTbZIG5ZwFEE6feLf
	 N8FvHzFKzfKuACgrE8XRch6e+Tr+rPIk47JXCsrX9QId7eXvrnXgmigYdCk9yEChvV
	 y29z35KK+dpbjIt/8V9XAm9UW34pA5WNh4bWslXMNRVsZXaBpXO1gX7auAmcaSmTnu
	 VeGHIYAX8yV1JsjapLRqnimS0nsFEk8/i7KVAWBJ0Ftm4P/+4PbTFf4RnIwzV/LPW0
	 bnMoRzvQqegGQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260622091139.2183297-1-shumingf@realtek.com>
References: <20260622091139.2183297-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1321: move DSP status checking into a
 helper function
Message-Id: <178275825177.47562.18353038077451639575.b4-ty@b4>
Date: Mon, 29 Jun 2026 19:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cxSgezucFcg4TOPtVVgNf5U5SLXhHSTwOds8LOiS3NA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6Xfn5hgzg+QBJmJcZFWBDHqPSx67IZhEzEHB
 rhNDgeqTMSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl3wAKCRAk1otyXVSH
 0OQsB/9mOdicMDmNotD7aXc5oMTWOVCIzcHkeH8uqLznjk6bWGn8nADUjml7kL9XrJqmQsU86ov
 anXgL3cRzX3E3g6D98M89Ld6hpgzq7WedKe8vmD57vOfoAfqnqIajC6n4OGbuYFCBlefzC92wg7
 8aPKVpxpemi0oDARFJ3JquMPBNXSj048mvRe96KIotrijL2G44x6Y9YiyoisVN/QII+mqNz1tKE
 oMLsUgIXO7cA85fIXqWJudC1VVrk0bC+c2tSbZK7IznXQrwGCZ1xD00hRop6z1ku0uT0FAlWaGF
 LgztyR1IlljnzB+gmkKKvRrkdsjUbh4OBIJHYSUBXJungVPM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 22 Jun 2026 17:11:39 +0800, shumingf@realtek.com wrote:
> ASoC: rt1321: move DSP status checking into a helper function

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: rt1321: move DSP status checking into a helper function
      https://git.kernel.org/broonie/sound/c/84eb7c8e59cc
[2/2] ASoC: rt1321: add support for rt1321 VA1/VA2
      https://git.kernel.org/broonie/sound/c/d79828f380b3

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

