Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51D13473D
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265346; cv=none; b=YiyxhKqqa7OXCVpkN+BTS3ndvaVhTMrtifNZfuqPgBIZGVPycq//YxLeRxekgyQ+JTJOU8J2Pdy/Nbsxzk3avB8S/G/yDPPlKIJuJNsQuaRy90p4t2G7gQXzVlvD3VpQh2epmWaDNaTO6IIfZwcTq1Tc4eQGjK7AgUZBXZHdsQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265346; c=relaxed/simple;
	bh=uX/FefJ4JYkPTBG/D2ssJWr5b5+Urj6OYi/6/YubfV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q4M041z3VeXyKJOyHbxmdI7RuwLsPp5469ki8yvY5bJaWfrdI0A9YbNDIvLiQ9DlZpgRfyTpY3IQN1G7HxC2NkDIIOenS7bimsXU4XvOr9k5nK8HnLGymLPnDtQy2sNa8g3FjQPTNklZcRMcLf4DhoNhQ5AAWqaq2Bn1L7Lb1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhzV83xX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhzV83xX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA51C433C7;
	Thu,  4 Apr 2024 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265346;
	bh=uX/FefJ4JYkPTBG/D2ssJWr5b5+Urj6OYi/6/YubfV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AhzV83xXjP0IKWgHm9lZm/vWx+biK1Lv4aZhc7DYrU42bOmgfqiiHsTHLybJpuD5m
	 vuUmvj7lPhock+aZax6SwH0O7jMuk8QkCQLl6cOohAhrIEXD8cqBNghs62RVl0wU6M
	 KUB+Se3qQZDNrPL5c/2oJ2lljG1D7VdZF+uKIlt4hDRSD4ihqkaAiLgHVuWgx8sKN0
	 GpDvnbKTd1Dye0UDI+hkrEK0Kp9fWsE4uwgXlCDM/1PLaP7PgpuOJEmwSQrkloEKyD
	 2QidfZMFIXkNcq1T62fVwyZsS79ppP7bLxTKSLMr0nW6BQOEQvxwfDE6Sb5smOuK18
	 rhFZf8RlC3iYQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20240404184813.134566-1-pierre-louis.bossart@linux.intel.com>
References: <20240404184813.134566-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Core: Add remove_late() to
 sof_init_environment failure path
Message-Id: <171226534441.231632.18370880660879691313.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 22:15:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 04 Apr 2024 13:48:13 -0500, Pierre-Louis Bossart wrote:
> In cases where the sof driver is unable to find the firmware and/or
> topology file [1], it exits without releasing the i915 runtime
> pm wakeref [2]. This results in dmesg warnings[3] during
> suspend/resume or driver unbind. Add remove_late() to the failure path
> of sof_init_environment so that i915 wakeref is released appropriately
> 
> [1]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
      commit: 90f8917e7a15f6dd508779048bdf00ce119b6ca0

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

