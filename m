Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E00631A044
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903584; cv=none; b=VwBQjPUZyOwr3G4HiH2v72Bkpc8D/sWoPSxY9RCewVmdGHXJyEJ/Uwk3ZjFa3IWRkH+Pojtu4NaqWKuRsg0rg6uLOfR/HivN5u5i6JIvbZpEvY4ptDIdkp5TO8Ht2dkgCVHutZqC7LeFBbut2RfruwdBZRkNS3guPH0eiDa9W5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903584; c=relaxed/simple;
	bh=ALH+Byyly6ggjK4xTicjh1uLjgJD+Q5GsHsKLyMNysM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MkAGhYUW9KzweZUINE1U2a+unQqjJBcfPUhlzhjEfopsXll+cUZ1BgsP22iz1TbLATHhMSjlyMKy6tl1rmWnHFl/j4W2kl99Lig5GTF7eUb9rFkR5NF0Bxr7zuExa1oSeskh1T571AxRP0k0XW4J0VTpwKuGRTVzO/HGv0rV7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3NtFuWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3NtFuWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC0CC4CEFB;
	Tue, 16 Dec 2025 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903584;
	bh=ALH+Byyly6ggjK4xTicjh1uLjgJD+Q5GsHsKLyMNysM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b3NtFuWt8DYg+AuwsUR2uvoXe9WXL2ehzmtnUZkwysG1dpoPyJGMwOk4zoX5Iqpj6
	 h3erNbotVFx8EeURB47eIKDxy5vF7ZWhvXTsv6ticpyGsmo2yuZD/FEyMWXfG4Rx/l
	 771oBdTdsaiZOD/V4ywzKw2vbhIfoETH3YyPX+4FSYcR7TQWhp6jaUn1iWT1i1CPCJ
	 lkbd+BYn6Rl8UKgqiNVLMY7qoIpdrIDkvy4wpwNxJ5Act5VC2TDobZ3rfBh9tV0HhJ
	 C+FiggzksHlFCkDMrdzh2baK2Ljr2D0/i7H0cKvNkO3uxqFpDGJci6nGw/9J0jqat1
	 dKuN8k1j8NAyw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20251215130741.31106-1-peter.ujfalusi@linux.intel.com>
References: <20251215130741.31106-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Add context when sink or source
 widget is missing
Message-Id: <176590358152.182908.14432269810744138002.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:07:41 +0200, Peter Ujfalusi wrote:
> Add some context to the error prints when sink or source widget is not
> found by printing the name of the other side of the connection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Add context when sink or source widget is missing
      commit: 84085139290a38c5f8a14e5bba60936392c17c7f

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

