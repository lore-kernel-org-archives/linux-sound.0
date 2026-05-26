Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544B40C5A4;
	Tue, 26 May 2026 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820657; cv=none; b=Gy2cWacaHtqyLFuqJaucydZ4XNW+eXo84qfzmYUS/8Wp+Aitio4DkB6kwob0MCX6fb3jiOztEKy/9w/n8yLaTkYjX5vLk+JalvWsWbbu5PxOh3VLRmeuRMEM3xCMVt9Sqb2PnD1bJEd1dmCGL/uTpUzZ85I9IsETbXyQgAuVhRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820657; c=relaxed/simple;
	bh=M0svEo4p4k+vY7LRBh/nOoEhpkkwxeGk17EAc9by5rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l1w/uqx7ZeWpYYQ4gNi8n3e/XgSb7RllfFQFC4Z4fKfzmiqlRlVxwCTBYDcPB0szCRQmD8b0b68j3pL6sKXKbpsDvBh1ha39s8znqz1A3csSKbXOnEdl2Ln+1RfRg6tgGHvWxcle9YmWRIfhwu8ACWOOl6HBpyFTZ+GwLqyk5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJ8MMGY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJ8MMGY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1FB1F000E9;
	Tue, 26 May 2026 18:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820656;
	bh=O8uMluWH1rT3D2TmMNE1lsj1+n7K9/hcBXHbp1XlXyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HJ8MMGY5ECJNVcKOJFuPleHDRLhhoB27PPw/7Fef4ihXW/GL/dvJ+GSvOJT6EN0Rh
	 Twx9rbKiXK+xgPWCMz4czgJTvy3FAVw3ni5GD+elgs+hXWpN07KYbdHmN+b5qWfIJ4
	 2Is/Pc/ewC5FHOw+lNhLHa1txi5+zhYsnhHqw+ktbO8KTj/4THMVUJm4/uGhmjF0+o
	 4y8aTvh7RbRMzZw3bXI3e6Bz/LtMGgQ9b9ARGROONOi5r29Dsp1fx7dmdPSMWLH7Ll
	 ceL5NNhswVm27fQNdAubub9JVVvBnSOz8UzewyeJu1w2QorQV6bS+mjgl4t6vnTPdx
	 JthQqDwTh22rw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260523211522.522616-1-ethantidmore06@gmail.com>
References: <20260523211522.522616-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] ASoC: cs35l56-shared-test: Fix possible null pointer
 dereference
Message-Id: <177980990320.88748.14783511031850057995.b4-ty@b4>
Date: Tue, 26 May 2026 16:38:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M0svEo4p4k+vY7LRBh/nOoEhpkkwxeGk17EAc9by5rk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFehu15jwm1ZkgDxsctWTAxRdBdppDPLGJDqM5
 R2reD0BL06JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahXobgAKCRAk1otyXVSH
 0NPwB/9rMTRoGRsIt2XsHbl9lQMv0/xEZXfGor5FaN+xgk2c4+TUtgSUaKE9QviNH7ij9Gkt43X
 Ec/A6wqeTaoJACC2e4K960dfxKVmlzSYsOuIIwBj1emBnztHE5Vh3T6VoGY+2BRTiSykpRQ91P2
 m44AzN5Axa1z2wN7KkLKbxJqV2btJYtIGdoVbuoFr2IwMHcaMU259JUEfKm/sYgdDN40q72IREc
 74j+2GGrLuQaJd9BRxxpnqMIRQLKZRYkkeTwJ6X3b0RFLMuZW9ZtQgjmtStHuwBtz4p9gD4awIG
 KuoIhubWcd+QwDwQGY56LUVVFx4J9VHZZXKMy/uipLKA5nkU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 23 May 2026 16:15:22 -0500, Ethan Tidmore wrote:
> ASoC: cs35l56-shared-test: Fix possible null pointer dereference

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56-shared-test: Fix possible null pointer dereference
      https://git.kernel.org/broonie/sound/c/4fa26292e8dc

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

