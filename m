Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587B3D3485;
	Fri, 12 Jun 2026 22:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302772; cv=none; b=alpmqy/BotfV5yjKUk/9c5UAhFn1pvANslIFMa5qJahrRLr99/MzmLEs55QfzJrE+Ej7fMPVoxUNwIqcXvS9EHEKMhtxeqlC6gHQXs1ERMBTv0Kphfu5FLBSKcpl5qcQzFjUP+wl2a2nAW0lwGUwPy97dZU2UAsaoRRSI8+uVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302772; c=relaxed/simple;
	bh=0nfuYilesn0ALUX94XG4ODsBVFsJCyr5RQYVuJwQ2V8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BPQL00rQU+lrQbmf6b1GuVTKM2zw/ISW4gVhd+RfwJ1FD+UjoJWmUHP8hqwmvQv7d1WEsySBOyVZD7iN5p3VsGtw7XFs63ATb6+iex7swibLIAh7X3bEBMVJFXudVwzS0bepOq8YKEuIMRxnXEmnsCH9fRiozszh38bUNgtobos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1Eq4NZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1Eq4NZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D631F000E9;
	Fri, 12 Jun 2026 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302771;
	bh=LXb4q6Pd0CHvwHD4Dyww4qNUAbL4PLkcCBerz+RZCaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U1Eq4NZaR9MpAU5lxVW4xXYRVmgD+ClOumFhQ9/g+9u2Kn+em9gY5+tLNV1Zl2JcD
	 V7w+np+pXT/a+xfZrd7xAH4awKO0kQ1f/Q1fZdRz3BVmfeWimGmdMFk2VqAGj2Xgzj
	 J6FELu9khIphhwDZIA0dCGkujfW0j8QKs2XFYVSUhcgWeBmegDaIOhUCBlikWgHxiS
	 vzAHC1ViYCV5q8lzX46KUuDd5oEotMO2+upPTcMc9lSSeYahsHJNn608BWZrZNpTqq
	 yaCNjrfwzo9IgIjQNpMvIgfyH7uuNItQY0UMsA9XYlNK9qTH+Fq3DsSWrF3KwvO7xx
	 agnBM10E5XmmQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260611151234.1111153-1-rf@opensource.cirrus.com>
References: <20260611151234.1111153-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix wrong error test on
 simple_write_to_buffer()
Message-Id: <178120675005.467928.9455761736654352050.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:39:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0nfuYilesn0ALUX94XG4ODsBVFsJCyr5RQYVuJwQ2V8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXwg/i4Pi/7uvhqVRhXBpX2focH8eMAYHRTO
 nbbeKIG0iWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF8AAKCRAk1otyXVSH
 0KwYB/9y4J+PQNzwI4J0kWaOkLsEVXAd2OhTn3J01rsVlEKCQBCve/Zc5Mn8GmXG5+v9f9ghA4u
 Hul758oVq/dIhjfPrd2ID7adeA/8NQy4R6sID3sqjLMw8ugefgskVSuoawi89wW33i/Kx0gevu/
 UrHlvQOoWV8IrCjWJiH/+veVL7D0lsNalhb9+4oa326X9Z9GfiXwVm2BPXxCyCbi5w1JjwdGxn3
 qeCkeegVl8x9fRjpCUpT3xfcbdSwE0umk/blaMfYt5l6ZC/93stNXxcrLqz6jrgrcgFMGDJqIR0
 wTG90B0yov6C04dYdxey2QBkDMsRKowmJuuCARjB4munxtKx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 16:12:34 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix wrong error test on simple_write_to_buffer()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Fix wrong error test on simple_write_to_buffer()
      https://git.kernel.org/broonie/sound/c/3073eb1f1143

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

