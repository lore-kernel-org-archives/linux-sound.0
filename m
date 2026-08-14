Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C047FB10;
	Fri, 14 Aug 2026 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727988; cv=none; b=sI/ZRTv2P6D5WAck0bgoXzRVomiPMAO71jm+6uuFWOb2pLVf2+7aye0vmIZuBn5wfya6aRfnroOqOqQnZ2FDJL7rv3Wtr4w+nfPIDO6Qp4CppkTTVhHqYkjq/m616chDAPTndFWa1XmiGDt1lvUpeIYA0w1yLaK+a91R1zhPdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727988; c=relaxed/simple;
	bh=YVYNzKSm9qve4ydQxu17+fw89gJjlBL9izHQTAlLzbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dvWtxoxP+9+uHzoS/hTGLqxNUJJM1TjM9X7+XPTnp99SRKk5AwS6J1hefp7PZXwVl4ubdK4Rsq1D0rLHJpzsOKjMrC2Tq+Vm00MSXAimE/aJuvmXrr5LZp67ec986P13jgvuJ1nyTDomCarZTDIGvrfKHZpdf7fvIBi7MmTgRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvSzlRoz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvSzlRoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B02B1F000E9;
	Fri, 14 Aug 2026 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727987;
	bh=TpyiiTOVlrlJHEi3kDIcNJ4l9sQ8uVbenZHLAz6sMoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fvSzlRozZUoR6DQJK48u+oHXDA8RorRXWWbJlkT2UehQHSogIbbV70BSFfvfCJdC3
	 kbVxWXFbIeESoJmuUwtQ7aCMyha/uoXvICE1fmfLwk1BoN7ZPfwmwNkv/Jw+Twj+Xf
	 /KcfDQXVswfBbkII1GPqfV3RCMPCqt1nPze5bzP3VkcJ1HgZFMABu4UNA1nXWnLNXN
	 1Pb0HUl6mUuzxQxSHEDQs/fYjfTCXKPWDPh3qOaXVYvkpFSBTpuDr2A0VvggE/r8AR
	 7U0inxGY+9zqyjokPpZ2ZvLfpVUtD/hEYx1sR89xZPb27Rz0GcfTfIb4O0wsoXFWsk
	 3epDeUoezTH8Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260814081238.25434-1-pengpeng@iscas.ac.cn>
References: <20260814081238.25434-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: SOF: validate topology volume range before
 allocation
Message-Id: <178671768477.152149.15211243065621402828.b4-ty@b4>
Date: Fri, 14 Aug 2026 15:28:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YVYNzKSm9qve4ydQxu17+fw89gJjlBL9izHQTAlLzbQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqf04uTpnV0sF1K8y5/TPYTfzVZKKgIt9VgTbL4
 bYWe7zyZR6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan9OLgAKCRAk1otyXVSH
 0H+CB/95K+C6h3cBovKpchbL0Z9FIPArLpJUxoS/jyJTE+UL0c/CHZ7Hdy3r+YL4JZjHM9Dw5zy
 1yJqudgZ62jGP6jn46s8bWa8P42yjTKm2QfupR07krR4p6M/6sn+0wjc5sTeuDQBB+ootjIecmJ
 eu+hbCKFb/GK3iAL3S7zowVhU6a5wdnzTbcu6ag9oRr8q6cjfsL9KZLr7t/owGfLdOPLWbKaGn9
 ufqFX4TRgkeWR4H4WGmjt7WuigYVeeWgzblvGBoNbOBA6oJ9iEB+Vj+kYJRO6mg/3xsydEKUJm2
 icMFXtoCsFFbEi0SR6KQY2bJCdqV9GI4eMrmNz+AKIFhdfah
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 14 Aug 2026 16:12:38 +0800, Pengpeng Hou wrote:
> ASoC: SOF: validate topology volume range before allocation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: validate topology volume range before allocation
      https://git.kernel.org/broonie/sound/c/a698e4a60fa5

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

