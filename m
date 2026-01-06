Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453F25CC6C;
	Tue,  6 Jan 2026 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725288; cv=none; b=UIreJETVRwXlCOaUBXGVdp4nkPE117mjsOxf/L/4lDmhWD0RSDMN7uuUzXVbbjJg7g4IaPRQd2OuYsYcwyr/scuiM14zJ7H6XBGKe/D5NLqst566bKcy87d/ZAGzddaRpIck5n0jG2Gpl51ykYT3tsFBkL4poxhQzkfkhyxPPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725288; c=relaxed/simple;
	bh=P8QVf4RwmiEyYwK4R5BmmRR+t4Mw7nxfknqo0NSszvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f1LmaUHcnH73TivGiVFip90J3JX+VPMdUdkVJCshaqn0jD/Qj/P3TNM8b/Fz8qFkZyhdkfnN5qt/hAeawW+2W1NBqysGtFSP1ieSmONKQ9D4hUPbX3VDFmsGbe1GQTUZe+WMeB82uEdoeCuCCkSOHoS28HezouMmjn0i06WIZ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lzc7cu73; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lzc7cu73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63D7C19422;
	Tue,  6 Jan 2026 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725287;
	bh=P8QVf4RwmiEyYwK4R5BmmRR+t4Mw7nxfknqo0NSszvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lzc7cu73pVxkIn0xafyLc1jDq46RVxpqDP4hShUVFO120EabAza7DSu60JxIiGhce
	 jH3co4TJ9muLal+SuunnlVnPnh79Lt+MOEingnphaSrmJmS3Eo8LpFWzVLhUPJ8fOQ
	 hLOZwl21x5RRAf8+p4Z5K/H4HxdysSCf8NIV2Jb04BbBABW9O01Zi8EMyD4pW8UL3h
	 CSjZ11upK4Wuzh1uu8V2FFrUwmlK2q76519ZWl3BwHdMnIKBOPoyY1hdYPQACMNEQN
	 vzz2roDfYm65h8OOI28W4WDVhKVs+NFpjhpJSziFx/U7J73iX/T5WdHMgCrfJOFSOX
	 aOjc406i0CpGg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20251230143429.179643-1-marco.crivellari@suse.com>
References: <20251230143429.179643-1-marco.crivellari@suse.com>
Subject: Re: [PATCH v2] ASoC: SDCA: Replace use of system_wq with
 system_dfl_wq
Message-Id: <176772528461.317829.14450147757093125866.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 18:48:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 30 Dec 2025 15:34:29 +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Replace use of system_wq with system_dfl_wq
      commit: 04b61513dfe40f80f0dcc795003637b510522b3c

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

