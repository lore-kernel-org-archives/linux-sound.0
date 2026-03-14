Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81B23EA80;
	Mon, 16 Mar 2026 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625139; cv=none; b=EfgKi0QInpzAw4xGuSoXNaGS1DzusqfzX7GMmcbx3cWCkeAf4l+jhGYoq59A3Q5Zb/ucNlxwZCK9GOyUUyorn8adKV0sLW0lxtTRP63iz9IWDKnXUTwT70FSS6Skas5isOcTMFbNGZmLcdMQn258mQg5tA09cxeKTEhozVHUFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625139; c=relaxed/simple;
	bh=MD7PYojK0kdrI2wvTKCzdYny9c0QA8HlfzgZcojibUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TRiC25vpPvajAfnJKT+BPdeQGvnWcQV1mu4EOA0xMM8OQB32eZtM1Fw3OHCh+Kj7YXdxw7rzMYKJU2KyjxxahXXkCJd3fXS8O1NsSqtMkUt3e5DQJanldE0AgCR5vDcoLhanols4GChmifgZAMr5c6tVPkpvDhjGtiKSlo7GADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgYREm/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgYREm/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476D0C2BC9E;
	Mon, 16 Mar 2026 01:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625139;
	bh=MD7PYojK0kdrI2wvTKCzdYny9c0QA8HlfzgZcojibUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GgYREm/IvhN1zsen7mIgPTQGCa8VH61yv75VUsrJmPDYtI6MAYIntDH5ePS6+Xkd6
	 TzyCo25V6vS/0aWDJNA/LqrgAX5JvtAHAk7CtPwRqa3FJpyxpAUt0U0JQgk1G4t9k+
	 lwHrsKpSBaWB6yNrMvXWyvQwWtL303UXAkQshXAg1D2wqPt6/KwKow313xKrniIrSM
	 peVjYmOQcia1D74pdnuhWlOQWtKE0KWxWfE8Isj/yLBfuUEc895jjQSTlu1lKEkGKP
	 n7G7IU1VR8391hzPez9j8Gq3zeLfCwaN6dZqyASpA7aHKs8ELIuTKiNeBdHQx9F9kC
	 NDPLlfHp5M09w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260311142153.2201761-1-rf@opensource.cirrus.com>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-Id: <177352551542.149922.18380269151089936245.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:58:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MD7PYojK0kdrI2wvTKCzdYny9c0QA8HlfzgZcojibUg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18xrlzT050Q4u85wNMRLpw6gH4buIDq/ehj6
 Ta5md3+TDmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfMQAKCRAk1otyXVSH
 0Ml9B/9pXWRVwNvvsR8kWofGz9/c7WA0L6SfQN7iY/JDvvnK95u1Gn/7U5vA1CdfPuQUfM4Bn3t
 /WuzGcM0kLAtqYnhJvSzeeZ2LbytCml9EGFnsXBJ3NajKCsTmJ0XwDzs752yelG9sq0HtmoX8wR
 +53b4LurjPpwsmq5zweTCA/DNUVbUfOp7MyPYvEFAJljXntMRypx7PSHGaCCpxJYs44RPsVCsi2
 kvc4rmRtN3nlAGbxNZKLKQ0yzsWk7ncpemt2CiWebb73teMAt1OHxiosUid7BEO/mqCa344EUmH
 YKBXkrIz/t9yDvQYtBNSwXMPol/AEMRF7Q9XtmGp9X2KidVY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Mar 2026 14:21:53 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Support clock stop mode 1 if enabled in ACPI

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Support clock stop mode 1 if enabled in ACPI
      https://git.kernel.org/broonie/misc/c/48863104d2e1

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

