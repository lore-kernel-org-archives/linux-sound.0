Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84787346E58;
	Tue,  5 May 2026 01:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943380; cv=none; b=X9oVuEeOepPHs67I3I3L0lM8bj7fjPqWH5EfbXOJQpuIxUrrlBuvxRJUywBDwUMgAtwtsgmYPck2/GBOjQYFzvemV0tl+qR507S8iNoFs0r0JX3rUlaW7ocl3IcqciGPZPOBIYyslgSacN4pquWO7+e7nSqc58pCDkl4tx6Riao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943380; c=relaxed/simple;
	bh=PyPW9JvGtHugniCp5Ek48Owz4tEZkSZDAD+jHbavAsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VmylUhAbeg5urtZDMI2uV28vUwkz4R+rr8EhYCF5/sRZ8oY8wC6BUqvlW+ElcniqGftyeB1EqWrbQJkI6Lx6Ytb0YjgI8RSN9Vf3P1snK2+rVlnGs5tbp8WzLe4+o3FrAF2ZZnbnx3X3XYPPdzw0lsjq/uy5hwxvudMUSb31L0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm2S52mN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm2S52mN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCAFC2BCB8;
	Tue,  5 May 2026 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943380;
	bh=PyPW9JvGtHugniCp5Ek48Owz4tEZkSZDAD+jHbavAsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bm2S52mN73U5KJ9atxpU8kR1R3GrJq/mqM7/x54n3PbV/7roPX4ZKq8PpgEpSY8qA
	 fDg+3BlqN7CXH9ogGYG1lVNiSDFiDMRJKApyF5E9+JEORTbI9/OnvCBF8u9uR+WReI
	 gvLiHzbHlpmSMwNO1pPY5fi6/jW0Ts5A1WFzVd2c2t+ZiBVSs6p8Os6bgXcMc6GZoX
	 er0iqG0K9hnl01kZx+3818OYZCDet9LXc11vVzwQ1OX4EvhpuhmSDehcOi0j+nFtYd
	 OvAQtvVthgz3ihcdefabQO9kNYypmvU2qiX4UwVYcM5ZxwTb2sY8aQHpEsCxF3vgzh
	 72yFkQOHbianQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260430101134.2655938-1-rf@opensource.cirrus.com>
References: <20260430101134.2655938-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix out-of-bounds in dev_err() in
 cs35l56_read_onchip_spkid()
Message-Id: <177789989882.458539.6790355415542648893.b4-ty@b4>
Date: Mon, 04 May 2026 22:04:58 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PyPW9JvGtHugniCp5Ek48Owz4tEZkSZDAD+jHbavAsc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UNSduu8MVKtYvVvKWGnJ2zdygF1i6wW/RkzB
 I335GXNJ5iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDUgAKCRAk1otyXVSH
 0N9EB/9Zx8tCDsXTKmG5h34mzmke6m2L5jLei5Y/aFZeydpo1VL4cwPf3LKLR0Iz8sshhjgaMVB
 rlxeruggfHj55NZbg+lI0NP+Xu11a56UAQlbDorcmIxKzHGyRJIWxQBMk0jbM9zweQyV9NnHYIe
 kSjHSFtCQ3okSySaPOb5qvTQrh338zc0Pd+COF+K9ieMtA8GpW9juVsnVgv+21VE0a5/tfNgniR
 Y9A3kOTUHjioJmN2TsXAonQS7pFiGGEYettDOkL8zkaImwaUGeBwOdJAEIjh9cipKbO4e+5SMhy
 y81jwqtOj72YzlsJALcYWU+UG9eGzXOX3zVa3nl95UV1WIOL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 11:11:34 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix out-of-bounds in dev_err() in cs35l56_read_onchip_spkid()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Fix out-of-bounds in dev_err() in cs35l56_read_onchip_spkid()
      https://git.kernel.org/broonie/sound/c/0f9bfb84b3f0

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

