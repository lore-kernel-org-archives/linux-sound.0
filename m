Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1505C35F163;
	Mon, 16 Mar 2026 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698359; cv=none; b=aQ6oQnPxY+fyWDB7Y6L4Ye11LMsrbOLny9DA3A2jfKpGfw3ugPtRam+SGmv3dM17I1WC6Bd7ktVcdpjZ+D9AgvH39ZpwfebphKFuaTLyVkKR+RbN6pRL+coP/85pkO9LplkN4++ROYljABJsu3PtINaT9IRpF2PHY+fUnDuLwog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698359; c=relaxed/simple;
	bh=vrGXwD9VlecmbNLvADGSQ8uQl6EMPYpezK4IXtmHLKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lp0DiaLTAdgvDvEMfEJPfGdz2o2ZcbX+E5FQ+Gp0VpLSwc7E0KziIDJBRUEQYpZ4dxIS37bProk66eGFQK8gFqycmzl28SDnEr086Wqxvx7LJkJKHGK32kWL51IMfjcnYJ4HEcdaAGNP4GvsN1Wc632FhESPc3W3cG/wKXTPHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iq/Dd529; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iq/Dd529"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B03C19421;
	Mon, 16 Mar 2026 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698358;
	bh=vrGXwD9VlecmbNLvADGSQ8uQl6EMPYpezK4IXtmHLKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Iq/Dd529dztjm3Q1B9CUOX39Vu88FW0SraB1cmznm2GVmfV1C76dBPSt0B6/3OaX7
	 RmpzmoEX82lBgBJ0GDjCbKWPIxNEwYC2GxDbDdSsTJwV7+KyeGrCVCaEUonZLuaJOL
	 PYiyvSyQC63mCKqiCW6rRPZjdBO1+J7ilFf9emRiLEHqKP268PWPbnH3Hz2NwuJGdH
	 on3IWIpfQVHdfJksdQhwjrOfU482X+ubOODklXazDywORpW95lM7VSZEpMYfILsGws
	 ciRHD/YnXp5EqKa/0lRCidsu0X31bwzELNrMTJdl8qRdo2mV3cHxY6xDxxigZdPw/h
	 RAQFLKhjXWgOw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316180545.144032-1-joseph.salisbury@oracle.com>
References: <20260316180545.144032-1-joseph.salisbury@oracle.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: fix comment typo
Message-Id: <177369833562.303905.16450340257083825887.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 21:58:55 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vrGXwD9VlecmbNLvADGSQ8uQl6EMPYpezK4IXtmHLKk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuH0zuO2xzmK0XXvCoGrRTsTY7kqNy2HySZXd5
 J0pYXnijlKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabh9MwAKCRAk1otyXVSH
 0KcZB/46E5feDUjG5Cgj6DMU4Zz+svPe5FGgJINy7Rd7fxaPq+4NQYDL9ec4/MQiFpw1JrgXx5e
 Dx06OFF8dkGEiEJ4vqRILo/c6pVj+PMeh2D+/s+9zKDDhpHbxw7xiVQPt07jQ/3QO0vr4qntLkE
 piXNN3NC8tH1KnmXDoKGMuaTKGFSVSqUxR9LvhC7cvY6BpEyoGtXsFXPOLci+KhRlzqDzJJWQ55
 Yhr6/DrcG3k+8Yth0pFqHAJTBSt1mwLxbiYbzUGlzQc8l/TaoyIz0JYQ6TKQKrDJ712jfUYMt07
 S1BLxtwJY9ULX/M8ojhZ9KUcC8rD++drNdgxqplMMu3+bE7a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Mar 2026 14:05:45 -0400, Joseph Salisbury wrote:
> ASoC: fsl_easrc: fix comment typo

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: fsl_easrc: fix comment typo
      https://git.kernel.org/broonie/sound/c/804dce6c73fd

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

