Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4B36075D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698112; cv=none; b=NUon2Te+g2zZgg64YvB8S/KFpHpFWPolJmIkMAKRG4PTs6uQ7svh5Y2F2jpaOE8kLrn9YL47l4tretnetD/pk229+UsX3XJxMDihwMmMAyATl67mY/LNSYdmuP+8C7MI3ujAd/oUu0oUBl+WcqyAAQMErGsG2O2EyM+iphky1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698112; c=relaxed/simple;
	bh=whqLZVY9hfXuLxfsOARqs7yMP1UnrvsLKMcZ6BcmBK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDk9278xPPuxNNloxCtHklyMxYCman3t/xDBXNwY8j81H0IMph4x0nRqLn/+jMjFZrIUuEMjxSGe9Cj7qf25ff/47aC0cV4quLYxvHRIjxP2+DX9ZO+IQdVNh4cKbo4ilC+YkrxG6+JVoQg7mjb9Ive5B9VjAoM5i9xgYUIFpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYm1ki2n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYm1ki2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D406C19421;
	Mon, 16 Mar 2026 21:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698112;
	bh=whqLZVY9hfXuLxfsOARqs7yMP1UnrvsLKMcZ6BcmBK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OYm1ki2nOk2JyIB79xqju43kPLtVSKUniLKoghz0jA4Wg3kt6ke+GOKJuZrfyM0Aa
	 a6Fjw2cE4DqwcD7L0eHB9NnzsawwAuLoyZR/JsBno8K0HET9QCFeF/4c+devxnQVcx
	 2lsjivwgbtD0Ac/AUTPumEXhuOoHG9/UStBDqYNtJK3fphT3c/LkCbpd5P3UB0AaII
	 JBbtP3Y9G38bxnrju9pfCOWpMrFX0GWf7Gwz8qNZuMR4OWP6XvdiwFN5qGe5ROZX+h
	 lm8ZRO/n1zWV9nZ6FMyC4ZVPpOz0duF/7KHvoPg5IW8SJ4ZFQsFEZ+nklxcoSXpVPB
	 r4zkH7m54Br7w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
References: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Handle edge case on SDCA jack control naming
Message-Id: <177368677713.157385.350622983321230726.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 18:46:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=broonie@kernel.org;
 h=from:subject:message-id; bh=whqLZVY9hfXuLxfsOARqs7yMP1UnrvsLKMcZ6BcmBK4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuHw+nL7u7G5dH9pbkundWtIljlYGbNnow8SL8
 buui9wGAaiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabh8PgAKCRAk1otyXVSH
 0FuqCACD1wkPvwFgrse2IrokC6zdMB4MASQvclGz/Ecxvto52mAKOWerJhnwfs2ZmQvgsE4mUC6
 j8ZXqO8ePDujay3fozb0tFjSc6bJssgT2LlTOz7Be+LhsYp4dmGRoxeZqW86WTmMFWE570tmvZ5
 Ia5Chv4kdqZlCDvJCIftpnW5RoVtTQ5/H1FoiS5u57OgZASP7vY6bBXGHiGkfmq1GPxJ/AtZTpA
 a+IolcGis25h1z/FHdUxJuJyO0wD9nmz/SjeR8lTH6J4Z8b0WuXv054sa9CQU6IXiJ/RaGQsBW3
 oWcn28G0ESZ3uJl30LXm5Pg1ajrK1N0Y6i15/GoROvKTh5yB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Mar 2026 15:53:06 +0000, Charles Keepax wrote:
> Handle edge case on SDCA jack control naming
> 
> Normally the SDCA jack detection controls will be named after the GE
> widget that represents the grouping of everything in the topology
> controlled by the jack selection. However, in the case that the jack
> selection only controls a single widget the control will be named after
> the SU widget that implements that. It is rather confusing to have the
> jack detection controls change naming scheme between devices. Add a new
> widget type, similar to mixer widgets, to force use of the control name
> rather than falling back to the widget names.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: dapm: Add a named controls variant of a mux widget
      https://git.kernel.org/broonie/sound/c/e29d097ead33
[2/2] ASoC: SDCA: Use named control mux for GE/SU controls
      https://git.kernel.org/broonie/sound/c/b6a6cd3f6b5b

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

