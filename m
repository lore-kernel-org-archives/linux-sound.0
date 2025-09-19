Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3B23A9AC
	for <linux-sound@vger.kernel.org>; Fri, 19 Sep 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286444; cv=none; b=UtIcTtc1ejWQ4xBasFzdXPKRbN0bPPtTS6eFL+/1WWh65LMiQE0kydpjzDGW4b8S1RWye4P/ur9KiE5IJ+KJ8fjxPufBq8HzhgTRP36PGYy1eXdKBd1lARX+PMvFCKr/Rr+WTrZmGv/VxNQfo9ITvw/FUG18E3C3M0SIXPom87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286444; c=relaxed/simple;
	bh=M/Que8Y1VHneGokI/N/FcC+Hs/vFDaJecNLR4TcJeQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HQaII6rS8hhQ4RIly/LA7cRioJcndrJOcsEjdI1GyxXe5B+PqlZ2IdnoqBknCc8xBML8qbK0/7kM/tobEdOwhkylxyYHnSl2c7GFOq2FgeHgb9MX4NxRB2evj5IHTQQlActNkMUl7vJ3wF/tocifUWXx54q3uLOwHR55yNZrsTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3Bn/jTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3Bn/jTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E62C4CEF5;
	Fri, 19 Sep 2025 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758286444;
	bh=M/Que8Y1VHneGokI/N/FcC+Hs/vFDaJecNLR4TcJeQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o3Bn/jTq3RhtaU6iPYF9FGTTZOI/o0jAnq62cM83URJUTJpPHKkH5Zdl9ulVDzEsJ
	 M1VnuE4idmsqen5XFSrZ+hm4uhise/MBMlh/oUGXDsStNu8uOxs3lOxcKhKCdhvNYo
	 k70f8HISKvDB1cUALGmwcyQUDkYmch9U7Y/i++61Ur7dNiiXyCidyIoqtyroNspVtS
	 Z/hiDJjUvUzp2KgFHcG9WPhWF7Lwf+wmi7D9hXL7dd3DMe1gbjcFEaDG2SiPK8Wwfc
	 oOqgZKghuuMqZzAtVMIqXGC8RQK0nZHCkXcb6W4ORFD3n804VFHjSkD8JDG/qvaOgs
	 MpGKwSE8jgkOQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <0c001e0f7658c2d5f33faea963d6ca64f60ccea8.1756999876.git.geert+renesas@glider.be>
References: <0c001e0f7658c2d5f33faea963d6ca64f60ccea8.1756999876.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: da7213: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
Message-Id: <175828644283.102649.16755407849600303058.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 13:54:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Thu, 04 Sep 2025 17:31:42 +0200, Geert Uytterhoeven wrote:
> Convert the Dialog DA7213 CODEC driver from an open-coded dev_pm_ops
> structure to DEFINE_RUNTIME_DEV_PM_OPS(), to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7213: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
      commit: 2aa28b748fc967a2f2566c06bdad155fba8af7d8

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

