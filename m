Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FE3D3CEB;
	Fri, 22 May 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445337; cv=none; b=GvfvZpD69TKkzNwctRT1J1g8KT9eQnVUIcYIUqnMu8I+7XGf3/k9yklDUbi+SWu4bVI8HvVydLCdvnHOLOvBtLsZqnH192tB/0oLoAzZkjN63fLzwzNDQVhNNcSgM6ZN1DMeCqBI2MHt1m9I4UvQ5BEs2gH6ssrkiWeZ4MALLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445337; c=relaxed/simple;
	bh=zU1ZTdInS7v8dlNCVqt9e3yRV1qf0fb+J7YMGxaTnmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JHRqljnhmCvLZu0Hah79PdzBStm18BJNaA1ulieCjhZJIUld62ywE47hAyDVsjS+sDUmCIZPYW2QM468PFdNuCqHpwE78+CfvoMGTmXK+z84cEnWbG1MiYExR/z5DmVi2rcfDwerttPAY8g1JIgOHh3xn/BBy6VIPidWkmAFd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oA9PKrSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oA9PKrSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1C51F000E9;
	Fri, 22 May 2026 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445335;
	bh=RTzrp6JgTfWGuvDw+q/RIfCefcSu6tVUwoW3RT1JrBE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oA9PKrStEw7c+YB/Q6ObmQ8PyaijVmBKoBfnqkI0GLRqMaifHJQLhNOJggUxdJLc9
	 2QvPDw4Rp9gTWQT4sF22pi8ODcjN4agy0CNjpXc4oQkdnsoKpw0WU26h0a7UvpqHwl
	 ZW9V9kvKglrgPTxBWPZXWQMDx/pQAySCO66rcD1ebSHQPVrK5UU38vsEPYXEinjhV3
	 PggUvTZ2MUWkd/bsr2GLoJoncV6849IH8YY6Z2PLljiFahmB47B9u+g7FZPpjvjdEY
	 eWn/RY9kzjhWJCwJrkpCKcCRp454ZN+jPtwDTbH6mGTuqp13bm0hFyYVYr/AhjRQEb
	 jPM1DqcTorW4w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260518051706.1027500-1-rosenp@gmail.com>
References: <20260518051706.1027500-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Allow MPC5200 PSC audio compile testing
Message-Id: <177927897897.56665.4121896240069425548.b4-ty@b4>
Date: Wed, 20 May 2026 13:09:38 +0100
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
 h=from:subject:message-id; bh=zU1ZTdInS7v8dlNCVqt9e3yRV1qf0fb+J7YMGxaTnmk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5Vvz8RDSIdnU6vm5G5FerHgyXyKlg4OIbkb
 v8lD0z4+E6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuVQAKCRAk1otyXVSH
 0LNpB/4pk92MB9OHcLnyPwWGrOAZ7QsIRChkrnPl9svDj17ZazMu9v/bNVlyxDhX2YSZC+4945I
 /X/es/Rfsz+9hkC1Pf6himdWn2+Hh+omnxG+z7RvNizhUk/s2/AWdUoOigrzeRfbbdREWWfng5k
 JvuzJL9QEWfaW9pn+mhl4kXJZ1qEKygS5Hy6hnsxsona8e/OAjUOLmgOjND3ik4uUEe1JpBPiXH
 FKcp06C4uSNoXy+U8+fyL6JDAym7dopljYT6h+J4BVNgO+9KQoeZmMDRZfENW+NPM6qx6Q2h8Mt
 IuT6CtLvReSwAycDEaZC1Rf1VN7N/Wvyt3KWm7J1Gf+D0WR1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 17 May 2026 22:17:06 -0700, Rosen Penev wrote:
> ASoC: fsl: Allow MPC5200 PSC audio compile testing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl: Allow MPC5200 PSC audio compile testing
      https://git.kernel.org/broonie/sound/c/8ab3536678a4

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

