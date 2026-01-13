Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4C2773CB
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312202; cv=none; b=kZkDRK6FU4qPi0p5zljov1vQsfQRU2KzuFa0qQfeiMS/zzXkj0xTj4NETa/dq0Vg8X5nkoJPnHxn26MrNU3R/a9XNX7FCzOkIwlmeNBxdbVzHPFD26/WI1tqvPX4NWVvjta5KbhLd/GjasaDt4dSdnH0wdPoce2Y98e7jthqrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312202; c=relaxed/simple;
	bh=hqaetRvQD4qhULKHtYUFqOYEdt3AnJMeK8O0snX1XB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gr8RGWpRI8NuzNND0HHgT1Rx7bfKmSbdCOJ3Kopz6mQX+/GodHO2lBH9GN4vMM8esIjOE/3fqIm1IZPu+TjTr4MXDIUFL791NVpak23gY8V1bB4npBhN5Nfix8MHXoA7joY44TMxkQVjBFTzSly+1EGmSaXGVZPxJL29e4Ac8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOk2U7Vp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOk2U7Vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C6EC16AAE;
	Tue, 13 Jan 2026 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312202;
	bh=hqaetRvQD4qhULKHtYUFqOYEdt3AnJMeK8O0snX1XB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gOk2U7VpyV49mCOiS7iVHKf7/5R+fCXLmcUpd3YPSNj4x2G0hrVwetPpM8cHNo2Od
	 iNwuayuj64KKodFcBWS5QT80FCLcD06AHUBl4Jk4F26YXI7VF31GrxStIm0+gFWYsz
	 WywTQ6qTQsNhsCvlu0XM7lS6xd3EIZwMIW7PCMcuoiBSMYJI1+CzGuw//qr0+Wzydn
	 vQqi8RYPd/OB21rHMa59w/bnJRGUS1CniFUErsoKiObKjliGtv31t+7zqHaSDdqUu7
	 qnwkOnmaD3C7Alz3Sl0ICbMoH6HYtY+QXoK8FqwWPfnhq42C78v1oZWaWEzWIkUD4f
	 m/qhFiX36KNag==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, guennadi.liakhovetski@linux.intel.com, 
 jyri.sarha@linux.intel.com
In-Reply-To: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
References: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: ipc4: Send heap/stack bytes via new
 ext_init
Message-Id: <176831220029.70484.584104329560112456.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:50:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 12 Jan 2026 13:32:17 +0200, Peter Ujfalusi wrote:
> Add new module init payload (this has already been partly specified in
> SOF FW src/include/ipc4/module.h) and use that to pass new topology widget
> properties to FW.
> 
> The original ext_init payload extension for this is already already
> supported by the firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: sof: ipc4-topology: Add topology tokens domain_in stack & heap_bytes
      commit: 0432fe32c129780f89fd5426059cb1ddd8e50858
[2/4] ASoC: sof: Add domain_id, heap_bytes and stack_bytes to snd_sof_widget
      commit: 854d4389f20f07b646981ebb1ef44b7503658e9c
[3/4] ASoC: SOF: ipc4: sof_ipc4_module_init_ext_init structs and macros
      commit: 1cd8fbec6dfa9a9c25400b775fed887b59153afd
[4/4] ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it
      commit: fc6ceb7e4ea746e663ff8c5593e67ad8ccbee34a

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

