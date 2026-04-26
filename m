Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859A315D53
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245744; cv=none; b=Ug3A8uUVzj6PZ3g6FonSA+E//C32TwACKJA7GzWlXkQB56sZ8+DLLlARGI55YyEJcUSqpys9fpiTvTu0qTX3KjWuHlsqXLOs3M2z6F5nNszSd0nwsTkDUxX14YBEtNK2sBMjsje6Imq/uKt+uoRA04vlFysfwo7Zphh1NsiPigw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245744; c=relaxed/simple;
	bh=S9dBTChFIlnYvDUEZaETK0hIKafFubYQ+1rcMFkVN8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UWVryjoJ8C5DA/o9xK7vHTGTYSbmv1bl3XIBbQr/+YmZPwMzYmVbp+cLkPdqjdNQBOXu0M9siqfAw/xwXHiQXTyc6o2QXmb4ewY0rjUC8I9tuLGV37nXW7Gj/jN9ypmLYzC22dJpRkVWYg6DGuAMQVWFsTJGyAvW/wiON7fEF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om0ejSB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om0ejSB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266CCC2BCAF;
	Sun, 26 Apr 2026 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245744;
	bh=S9dBTChFIlnYvDUEZaETK0hIKafFubYQ+1rcMFkVN8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=om0ejSB48rnF07FqWKyOsSodsGu7SU/3sGdOBHyfvqGV5T18gdUnVa8Qh8rkRiRs+
	 mssiLicxFZWKcMOraKuR61UClbLosjDoLhg3vKe1FgGKNDDm5jPCMYCAqxXch15bxD
	 VVCCeo8V4J6N5nN7/Ic0UmRZuYHtzWJuOe8kCJk55FFn7tjePtJoArZVjdVTkccAe1
	 QGygaTQIDBBX54VqgeVRVJE0DnrJjS7yT8CrgIlsbgPcfZyDFME7M2kw9nJXUnm6IN
	 En3h6PLZJqCN8hvWLV8OopfC8tgNEvhDZ0+OaTY1G5JABM8sP6WNXUkrlOkQNHSRgE
	 DFo1aWZ2li9tw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 Gabriel Jacob Perin <gabrieljp@usp.br>
Cc: carlos.albmr@usp.br, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260421193113.1060213-1-gabrieljp@usp.br>
References: <20260421193113.1060213-1-gabrieljp@usp.br>
Subject: Re: [PATCH] Change manual bitfield manipulation to use
 FIELD_PREP()
Message-Id: <177724043581.266775.16077702022130631965.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:53:55 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S9dBTChFIlnYvDUEZaETK0hIKafFubYQ+1rcMFkVN8I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4t6CI4Rcq9kTqMarTJ4G7FVZB3M5EfMwoOn
 KkZAF1QL96JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eLQAKCRAk1otyXVSH
 0OSsB/99y9bUzrW42ETTKfIN3VqLin/KgFpythZJnIH46o7vyOsUQjO3KLJllGqDYfZU5LQOdzt
 6c2QTn3l1nG4xUfDpBuxyh0qpeUBHN6E/HY7+WU1DvH8Z2bNvPa1Hmyb1MtJ5pEnu8i4N/emBSQ
 upnyNLlRP/64wqwDIzWWdFQlrn/NL3OJwhreyWUuicRyRs4+X3nrRaB4feOI+B82G7YuzXj/mNu
 eM5vRywc48TAY+LILEsorvcLHR+xr4FxwpJOkhri3R+ir98aEDGFxWJx4AtXSiGKswX/7qZ4QRD
 +JU+hdQ0qukg6vxi0sUXndNd7DF16faD63QLAfpqCUbguSU2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Apr 2026 16:31:13 -0300, Gabriel Jacob Perin wrote:
> Change manual bitfield manipulation to use FIELD_PREP()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] Change manual bitfield manipulation to use FIELD_PREP()
      https://git.kernel.org/broonie/sound/c/ae93afff9818

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

