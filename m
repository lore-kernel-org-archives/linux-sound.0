Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED7311956
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863201; cv=none; b=qUTDNp9vuIL+SugGkKDNwC1V9w4j7vp0oMcbPi71AO67gkYuCockabrMZ84SF9S6qGfWt8hRt5hcfQOJCIqXl+NTMrMtPG3QfWMBYC+Dyk6r4Ct5YrFIbAwcs8TPQmtPLEHZwqBV2OYNqSRqVBsc3op0BQbSLIRo9FClsIZ/IUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863201; c=relaxed/simple;
	bh=AEdlpjfdeE1kXvQXkCDbjTzQPU1teCfpBF9aRheqiOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=grtBZvU30ErCAiZJzB4Fyr/53OWY0YegSdlH2+0OBd/bdDmOo2sIQcg+ZVX0PkYEbSnVdX6bXbUOriCmKZCIsSwBTyOarUbPJMELcMpnERbkr8Sh7uF/4Q8X4K5Xm3bBPnBcmgQq/4cD4UsaLm6u7tzXDP+m6G/ilHEcLi5meVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7IRoM6Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7IRoM6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216CEC2BCB0;
	Fri, 15 May 2026 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863201;
	bh=AEdlpjfdeE1kXvQXkCDbjTzQPU1teCfpBF9aRheqiOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A7IRoM6QMrVxpulyz1oYDSVh1ukxlSf4rJW9Cf/n5Q3uUuLP4mTrPod5aGnD5rrRl
	 Ed3nLHwmN0YhcQsr2JuMGkwla3bOWqOGgCfoO76U3b5ZC5hpHCGb63CLyIxauyvpk1
	 NTW2gh7KUoJO5pKvVS6jPCBxW4p1Dbftd6D4oaCRpumNUPljuiC1OVYy7mxxxbUfv3
	 gJ5m1MaMxkkRZTrFoWSVGBluDOu3HT9TqsXVuzoOZdu3xQ6yjuII35KaihO6IvWadD
	 X7gL19xSG11EoqLiXNIMRl41Nx0Nao3Qz3PNl2kmwTXtiRAZcOdg5M79XZ7e47fut6
	 Tec/j5LBH6HwQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, Deep.Harsora@Dell.com
In-Reply-To: <20260515083043.1864426-1-yung-chuan.liao@linux.intel.com>
References: <20260515083043.1864426-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: append dai type to dai link name
 unconditionally
Message-Id: <177885261131.1136679.1490958477399198548.b4-ty@b4>
Date: Fri, 15 May 2026 22:43:31 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AEdlpjfdeE1kXvQXkCDbjTzQPU1teCfpBF9aRheqiOs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0xfPiSR1QHOheaTtOj2AmMup9Fo29pnyA9t+
 WS2LpJsuZOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMXwAKCRAk1otyXVSH
 0LvfB/wOcGW21aPA2D2mdQHXh+iTJ1gX+hOsuYJQeDL7NwShzzq1zUHgEGwIr1WaEudQSrFFraK
 dqcGsTkVaO9LW3E5IWlGhSDJjvqlI2yzZjyWRrlVorhhi5kEBW3iShR1ACJhO/E3trU1XricsbK
 8RhGZPmf1pCc9HCV+Z0bGCnuYHd8fl5DZgUCV5S7N8ouA/mLkIuzBkydPpwvlk25KZlNlW9e5XW
 LLkoxxf68ZM6fnMDSlfuTu39irF9MpR1tyX4fH0F9HQI5VkRuiGFTBMwlznhI1bfAMvj6RZbCF3
 j9cbBSpUtSUt5YsTn5TXvUSAGxfoSfWcciQubPjiq2ErBS7j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 15 May 2026 16:30:43 +0800, Bard Liao wrote:
> ASoC: Intel: sof_sdw: append dai type to dai link name unconditionally

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: sof_sdw: append dai type to dai link name unconditionally
      https://git.kernel.org/broonie/sound/c/c84179a1d36b

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

