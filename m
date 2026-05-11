Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335812F549C;
	Mon, 11 May 2026 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500961; cv=none; b=k15LrdtWW5hDyXkPPue38BtIRFOb1zle9R5CWFDIS7X7sUrHJZMIb0okSCXlVfOtd2JeSMS9EVrh92aQVyvhjtaAht2QQwyShSbDqxFySRwK4Qpa5QC9L6fPNDwf1goADLA/AkajPLowUSny6P9bkQPSdSciM4oB4fQ7P40ynXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500961; c=relaxed/simple;
	bh=BQK8j9J43FkM0+J57yXeLk8IzY7cAqbFG4vJy4Hhq1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NviFyXXoCx/WFLX0/NyU4+UaPrUkeaSX0oNE4V+MAtvDNjryCsMl+sFFDhBQOPCdLFg2gkxDHlpqgbHaGylahFTqA07hqYM1SI5Q99SccmhLCWDF+OEV+8F8pSmunABTpMlz31ep9cCCUAi6R9NBSuBl9uqILl//s4z10B1VyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhA0fY/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhA0fY/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04D4C2BCB0;
	Mon, 11 May 2026 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500961;
	bh=BQK8j9J43FkM0+J57yXeLk8IzY7cAqbFG4vJy4Hhq1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FhA0fY/qnEUetUFg6pUf4Ad6IM09WfObH5e7W2FcIwdV2Dtj4rUVVbl2bTlwo6jzY
	 b61ujzPePk7JV3sC8DNqE93rBgnBBM54giIGJB+CURqCFl/iHdOlZV/33ccuVSD5Iv
	 eyP3SvqtPfNOp9R0K9fN9MVqhNN/Ix9lovUvQa1LAdPyWvCX2x/RsZ8hy5j8ixpw60
	 NNSlJE1xIysYcg8fdgpF4pJ72ijQyRKPnV+osIpuk9TGEfiuRFApz67kpgevCW/sqV
	 ryX4+uYGkHNoOr3GWKA7gnFg+Pj18oULEXwyo871BZ+qge9ucYM1oGTkdC6rNKYlTQ
	 8tVi9qG5KZgpw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Oder Chiou <oder_chiou@realtek.com>, 
 patches@opensource.cirrus.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260508150327.351779-1-marco.crivellari@suse.com>
References: <20260508150327.351779-1-marco.crivellari@suse.com>
Subject: Re: [RFC PATCH 0/2] ASoC: Move system_long_wq to
 system_dfl_long_wq
Message-Id: <177846077642.988959.10334055002931155522.b4-ty@b4>
Date: Mon, 11 May 2026 09:52:56 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BQK8j9J43FkM0+J57yXeLk8IzY7cAqbFG4vJy4Hhq1Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVcEpoYFzpIxDYBxGPHpcN9KNdP5Sq2nP3Q0
 2hbBOigkvOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFXAAKCRAk1otyXVSH
 0Dn/B/97U3zZuCpSbinTQu7xXvYdxapuuPiA9j9D5Hjozv/jp2cyGur1ih/z895lQoE4euiQD+a
 tkfFPsb93R5aQ8KAwhPkyt0TMgU8KDkJATicxIg+4s5ohaPLaUu8AP9OqQgU+glf9/WKn/e/oiA
 MXVTg/csZQLk2nYhgmYtx4hrC3Eo76/n4s41dXQh6QrfhxSGN7MbYVhOAoQA79jL/pEW7Yt5+G8
 pAPa1GwE3vj7EhBg1NV05i5d9Je76N3mkX3ntzIQdjt8zj+01hCBCggkDwhowcgm5DRia12dKhX
 0MSh35xmHNK/xavqbIqAENO0VJXp6MJi7lMJzYL2KyENMc7b
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 17:03:17 +0200, Marco Crivellari wrote:
> ASoC: Move system_long_wq to system_dfl_long_wq
> 
> Hello,
> 
> Currently the code uses the per-cpu workqueue system_long_wq to schedule
> long running works.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: cs42l43: Move long delayed work on system_dfl_long_wq
      https://git.kernel.org/broonie/sound/c/45f7d7af0eeb
[2/2] ASoC: codecs: rt5640: Move long delayed work on system_dfl_long_wq
      https://git.kernel.org/broonie/sound/c/11b92ac8df44

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

