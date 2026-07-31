Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31888372ED6
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528526; cv=none; b=Ai34wXLlqehyAIEZuykxI8Yu3T/cH5ikfLAIsIrzu+89AvLEpCoaQU0gU/TvtvLyPsTicSLBZ4k0DD3USCgdEn2/vgYpSrJOxSFip2+d360tC+6vlVG7ocC07c9v4yRldAo8bgO31mgNZrvl0Lnl927MAbpwiHbSwmdLa8cbzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528526; c=relaxed/simple;
	bh=EAEh3x/9txuFl7OqleTMTdcj0QQ33Zl0mbfPzIJwfg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NnCFXAWp29JhTVpRTA5xANOuhgOFBn4LdYI6MorNJ1iptXI5YxOBFAdBR4PUCnOdJ2Y+8LSvBYnLHPXqAkUdZ6aMLi9kV9k13VI86L9sZN/zr3/byrNH3BMBj6XjCu9UnNUIVIUCtlpqRnnZYEF5Rf6ZPNAcrdZvqEG7E6KTROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrF0z5Tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrF0z5Tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5691F00AC4;
	Fri, 31 Jul 2026 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528524;
	bh=Uq8S718YPXWyyq94hysBDqVG9ijW4xwBEme9bRq3WUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KrF0z5Tk+00AFkiGK+UPVS5OOGc1i5OZbxK2QOvtYey6FKN+Jtg9wH4TwmlfnNSJQ
	 IevJYrwUXINX27KBoCzy3cDC37XVbjXkqXbmJImz0s1RJOs6faJDjLOa2sNM3B9AxU
	 kWCERDlXOpoEN6zS26jWAvZD7fv7aVK64WkCCmf4nrxtukUU53793gEAtjybvWCSWz
	 dFWT+mBk88Xk8EUahzI9NjGapFeQens9IW7aiWVNh5q2cOh8LS08z/1mS8qAuwXYZa
	 J6E3RFAsVr9HJQBw7mKXisGb0O8bAPTCdi3ufZHMSFmF6fCHQRpIZS+0gTm4vmgVn/
	 uaaAfTLD6OWLw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 jyri.sarha@linux.intel.com
In-Reply-To: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: ipc4-topology: Update the memory data
 building
Message-Id: <178550915043.352272.1291735907793519666.b4-ty@b4>
Date: Fri, 31 Jul 2026 15:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EAEh3x/9txuFl7OqleTMTdcj0QQ33Zl0mbfPzIJwfg8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQDKR5NDkuWcjhIqM+0L+LEVJO6HNnZG21ssV
 iQuadESpXSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0AygAKCRAk1otyXVSH
 0IOoB/0cwyDGm3x8bsXodAWDgN8QW7AXMOznrcDw7cIfgwJ8mGlc8Z0KxzXF+CZSqNfrh6qM6i7
 kYDtmJySwWfvfwKbkQkw7FqFQtoGyMjskKSJp7mFOPqhuF7GT473Ussrpr6QbOXaP7WRR3pY6OW
 dFDW0z9/cHkmMwPMKSj8JAkk4ZgWjIfboIQNLtQHV1Z5LuWFL9QYsjmFdrA8lyoNyDoCvZvbm92
 APPeNJ6geXkd5cAA981BfNtC3h2mFpiUCbYT9oS9F4VBj/KTZo5HbLQmWaDqpiXGzNqdnDQ3iM7
 Q1VPmWrI9e0TDwUr3ufoQe9I+jWgyteNTjnVzXWrq5KfETRr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 13:41:35 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-topology: Update the memory data building
> 
> Hi,
> 
> This series fixes some issues left to the first version
> sof_ipc4_mod_init_ext_dp_memory_data payload building code. The
> payload to specify memory requirements of Data Processing components,
> running as independent processes in SOF firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: SOF: ipc4-topology: Remove dp_ from all module memory attributes
      https://git.kernel.org/broonie/sound/c/5a25f27f5118
[2/6] ASoC: SOF: ipc4-topology: Fix SOF_TKN_COMP_STACK_BYTES_REQUIREMENT id
      https://git.kernel.org/broonie/sound/c/18d0619ced26
[3/6] ASoC: SOF: ipc4: Add SOF_IPC4_GLB_CREATE_PIPELINE payload macros and structs
      https://git.kernel.org/broonie/sound/c/52db046c388d
[4/6] ASoC: SOF: ipc4-topology: Add payload to pipeline create messages
      https://git.kernel.org/broonie/sound/c/0244c162d1a5
[5/6] ASoC: SOF: ipc4-topology: Fix sof_ipc4_mod_init_ext_dp_memory_data comments
      https://git.kernel.org/broonie/sound/c/e5b0daa6f974
[6/6] ASoC: SOF: ipc4-topology: Refactor sof_ipc4_widget_mod_init_msg_payload()
      https://git.kernel.org/broonie/sound/c/221f3b29366e

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

