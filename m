Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F1218580
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549934; cv=none; b=SKCQnP5RjBi1D2PnGxXJM3BNffpdJbvDgJ0uNuyx+oIhkraU18w8nnmBkETu2mAx3fswCAg+FznzQ83F81Xu6W/8lvJ3WBi9CzJFRQKMSZR6053RTv5eDwrparb7j30PQiTWr5QOddiW2gMg6FDQNXCvWCP6r7aBMgDzVy5gAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549934; c=relaxed/simple;
	bh=iVan7a+iAsBSnSu5TZeb3vNIb7W0ipDdhwGzXYRzRfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lsZq0fB/NKrMWKccVBSaYbUj6nOgrSGj1CTh56ThriJ9vFsMPN39FdbAbRtYmnp+iomLrLAD97cWH4FYRnflqxlsHMBW+srfbkVTTig7SCgou1GZ+K+eRstgIIipqaSutIqNz7QnFmXwlsPayOgtav1E7Agw47ZsuCCOM5Ahua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7MhiNYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7MhiNYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA84C4CEEB;
	Sat, 30 Aug 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756549933;
	bh=iVan7a+iAsBSnSu5TZeb3vNIb7W0ipDdhwGzXYRzRfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f7MhiNYNH0i7pj3fUmChYhihnIbuO4wD8pMR16bIx8NJwmXhCY8Iz0Vw/H6kq2nrj
	 ZYLWumtWO06A4naAOhhNvaeq4rfFA8vCGBPEGiLVyw+m0fw+5hL2LEGr3hMx1kbVwW
	 JqBeugHjsOEx5H/gTJ1PXzvFkSsCOxRBO9Psk5cvHOZYRwTMDgwc3cEYLcIo9x7Swi
	 yDFaQ0L2OQYPPPgXGbYYnLMuqaTTOIaeZ1gJV+KLsW4HnxhKZ+9OKCRq08c3XG5XPr
	 CNDO797eJE9aegPwV481E7O5YRMWSZOPGVG/gufC8f/93f8ly/gRy1n4Zhj5vE7sjF
	 r+ehnNCGtslBQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com, 
 jyri.sarha@linux.intel.com
In-Reply-To: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
References: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: sof-client-probes-ipc4: Query available
 probes
Message-Id: <175654993020.400773.10656289618599647178.b4-ty@kernel.org>
Date: Sat, 30 Aug 2025 11:32:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 29 Aug 2025 12:30:17 +0300, Peter Ujfalusi wrote:
> This series improves the IPC4 probes implementation by improving the
> report quality and adds support for querying the available probes
> on the firmware side.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: sof-client-probes-ipc4: Implement ipc4_probes_points_info
      commit: 4f17845526626deda2cab181db7e19cf9265a0b3
[2/5] ASoC: SOF: IPC4: Add GET macros for module id and module instance id
      commit: 782d4613171e271b1e28ee1db9616beb8e6ad8a1
[3/5] ASoC: SOF: sof-client: Add sof_client_ipc4_find_swidget_by_id()
      commit: e6cf5e44ce1eed7aa72e7fb0cbff054e3f1dec0d
[4/5] ASoC: SOF: sof-client-probes-ipc4: Human readable debugfs "probe_points"
      commit: b6082647f7222c05d34db94455a4e81981c51da1
[5/5] ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
      commit: d57d27171c92e9049d5301785fb38de127b28fbf

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

