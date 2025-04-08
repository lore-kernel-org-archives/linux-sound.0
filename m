Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E2266EFB
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104268; cv=none; b=JduNi6g+GVpU3o/JayJduqJxCrdfrKiATh1la1mG2w34n3Y99hDA+w5xDoGq6NCa+9+3Q98NtUzdA12BYsaiRe7GRTul+ZN5q9+nHwuz2cp3+F5+QDQYjwp4RlooNx8pTokpWrjbfTjNLBLG7AKT7YxI1kWLIhioaYEOVjPdi7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104268; c=relaxed/simple;
	bh=W4IPc2IozK8iZTGToRHGc5fg8jBvxD1hl7eHLFHFV00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j+nugH2bJRzyXGiN0JMJL22v+Tdh5T7hJojOARPBVQkCxGc3S1kXxbcbBEx1iZUVpcWNe4LCPAB1aIcK2/HyGiTb/kS6YXEro+6ZBjxpYTqd/skP4nrHjTa/jE7uXYsCp31vnBqSvGCTtzrxXIEDsFgC5IaKQA2B80hKzt4R3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3YVC9Qn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3YVC9Qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D54AC4CEEC;
	Tue,  8 Apr 2025 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104268;
	bh=W4IPc2IozK8iZTGToRHGc5fg8jBvxD1hl7eHLFHFV00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V3YVC9QnPW+bK96xGn3Fh9Nb4hKVa1MUd/ROJ8qqJMlgyfkFecq8MMz5hPpfcOWAO
	 7lcxbMoCWO6iAMWipkXEYb5PRB1jLUitFTymEr6lkDXkP5QKGtoYCGqszombSBNZEm
	 Ni2c/lR7MUjId4Lyq7d9JxDvZCYT2QL8zYAs520blBzJee4xtRMjcxoMavHhOKH91j
	 v31KZ6aF4caJGe3o1XxKv3pXFXFLquZwKn4bNGXokc/vjOs1tMYMQoVLC0l0Pln0hp
	 uygKZDPFXbIRhzSReU/egKBZxBebdybo/U1shX1ADinifCmPkUNlyyI1GjvOhPLbIy
	 pxWm287iKKGww==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <87cyf4qocw.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyf4qocw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: use RTD ID instead of DAI ID for
 ELD entry
Message-Id: <174410426698.1933566.13269205414676269234.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 26 Feb 2025 23:26:39 +0000, Kuninori Morimoto wrote:
> commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
> "eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
> have duplicate DAI ID on same Sound Card. In such case, we will get below
> error. To avoid duplicate entry name, use RTD ID instead of DAI ID.
> 
> 	proc_dir_entry 'card0/eld#0' already registered
> 	WARNING: CPU: 3 PID: 74 at fs/proc/generic.c:377 proc_register+0x11c/0x1a4
> 	Modules linked in:
> 	CPU: 3 UID: 0 PID: 74 Comm: kworker/u33:5 Not tainted 6.14.0-rc1-next-20250206-arm64-renesas #174
> 	Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
> 	Workqueue: events_unbound deferred_probe_work_func
> 	pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : proc_register+0x11c/0x1a4
> 	ata1: SATA link down (SStatus 0 SControl 300)
> 	lr : proc_register+0x11c/0x1a4
> 	sp : ffff8000847db880
> 	x29: ffff8000847db880 x28: 0000000000000000 x27: ffff0004c3403c98
> 	x26: 0000000000000005 x25: ffff0004c14b03e4 x24: 0000000000000005
> 	x23: ffff0004c361adb8 x22: ffff800082f24860 x21: ffff0004c361ad00
> 	x20: ffff0004c14b0300 x19: ffff0004c14b02c0 x18: 00000000ffffffff
> 	x17: 0000000000000000 x16: 00400034b5503510 x15: ffff8001047db447
> 	x14: 0000000000000000 x13: 6465726574736967 x12: ffff800082e66d30
> 	x11: 000000000000028e x10: ffff800082e66d30 x9 : 00000000ffffefff
> 	x8 : ffff800082ebed30 x7 : 0000000000017fe8 x6 : 0000000000000000
> 	x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
> 	x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c15b3600
> 	Call trace:
> 	 proc_register+0x11c/0x1a4 (P)
> 	 proc_create_data+0x3c/0x60
> 	 snd_info_register+0xd0/0x130
> 	 snd_info_register+0x30/0x130
> 	 snd_info_card_register+0x1c/0xbc
> 	 snd_card_register+0x194/0x1ec
> 	 snd_soc_bind_card+0x7f8/0xad0
> 	 snd_soc_register_card+0xe8/0xfc
> 	 devm_snd_soc_register_card+0x48/0x98
> 	 audio_graph_parse_of+0x1c4/0x1f8
> 	 graph_probe+0x6c/0x80
> 	...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry
      commit: d639e7fd9aa038f46728206bdb23cf7109b3b53b

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

