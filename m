Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A8376497;
	Tue, 21 Jul 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642104; cv=none; b=Cz9Av0fpO8P40vWFKE3tB7GA7oe4PRTo5962WXec8ZuVePd4EgqO34dqR5vw8L98izVMSlebPn/1HtC60AcSoJXsLGGOPBGOXMxS2mp1qvTNOw47Z6bVPIVO2pYDSYL7MuX5MUcRpAtCClw1zPqLoJO1Z7w4iWPxRaRw5iMr/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642104; c=relaxed/simple;
	bh=B4LnVsS8kwwGsTVBlFUWnvG/tFdsLUnv1gl/KAFFDcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MuFMH+Icti4+9UO9qBcCbySDEtHWrZ77vQDp9GToz8T8sQGs/1luue0cTEaC9YYbkkTfsniJSOlcE6UM9DurMLQakUK3qljGk1i1+h2hbbkj9cB9YLEn2QGFqylczz/9f2KZ27NNyd9n8IGaEM7tN+PP26dnApuG5stiKGr7sNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4pb/7Yu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4pb/7Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E87D1F00A3D;
	Tue, 21 Jul 2026 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642103;
	bh=wbYa8NO9yNpjUssD2LttgHuab3do1KqP4VEGwT1SpqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P4pb/7YuV7AjP9mE5XvBQRxKZzZByw45mZI7TXk0hcnKmfhp79g8mVaS4hH87kkmC
	 +aPj/faFDj7SsRpZNURQStyGIXPSbJPdN3BqhTStTwAoU70rHMZqcDaMnrvx0CCGdN
	 WTaPV6Rld+K8NGm571UmacBg0JMU1Vl0cihSy9u7etLCX5L+Zu4mylyi2xLnVkoNoI
	 M2xWC+E+3MeHrJd85W75NsrIKh7UBQkVT6EfQsLkU7bPSZPLTYyZFjcJYlHuXejKC/
	 +tBNT2iqlFFAp79qClHDqXQO1HxVyxlDyBPx0yQ1uHyAaSnF6q/uWNKN4Al362Vlpk
	 okft8RNOWEhUg==
From: Mark Brown <broonie@kernel.org>
To: zhangyi@everest-semi.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Ethan Tidmore <ethantidmore06@gmail.com>
Cc: ckeepax@opensource.cirrus.com, linusw@kernel.org, 
 u.kleine-koenig@baylibre.com, lazycat-xiao@foxmail.com, 
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260719221502.536804-1-ethantidmore06@gmail.com>
References: <20260719221502.536804-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: ES8389: Remove redundant comparison
Message-Id: <178455388000.8049.243828046789905977.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:24:40 +0100
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
 h=from:subject:message-id; bh=B4LnVsS8kwwGsTVBlFUWnvG/tFdsLUnv1gl/KAFFDcs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqX3o0ENmdQA7LYPKejnFZBvT7DjDFmGuoEUt2X
 KH793XQulaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal96NAAKCRAk1otyXVSH
 0JwLB/wIFPcLI1KcCn4z0Kq+mO/A8o35tOx3rRMia2kL9ZmATqLI2NHmZo14FiyK1FhkvKtTQIy
 TZCiA7WO9JzodnpgZ29RYw0Yvo5EYwgA5Vt22/bx/MV9E2zK/hCwDDRMYzHllgQ8EYSCooROEtC
 4kFJTk++5Qdseo8q3eD1XL1GtSQgpngSAbetUfgRbIgpNKN1gz+bJ7oxEvA+DcAJbjLOIgdSjNB
 ZKqz3Ly9JhfsZ7pwPbBlhwEHiR4i28y+45VpUm18cavgmESJ5u8NafdgwVfT68732YPMB+9Y+Zo
 PFUyJ1kzsUkj2gJUHJB5eI0yVUpQmq8VSQsvYG/44VI+O5x0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 19 Jul 2026 17:15:02 -0500, Ethan Tidmore wrote:
> ASoC: codecs: ES8389: Remove redundant comparison

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: ES8389: Remove redundant comparison
      https://git.kernel.org/broonie/sound/c/acc414eda8e9

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

