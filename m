Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C62C687
	for <linux-sound@vger.kernel.org>; Fri, 15 Dec 2023 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iymA4Zyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9578C433C8;
	Fri, 15 Dec 2023 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702666608;
	bh=hjGPVFMGtnhy+9wzaEe+Fc3QyqTrWQguYhQ1wetZgJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iymA4ZyltnHD1SxTe1OUv1Xhkt6LpLTdTmHJ7g9DvuE5oa/KiYLfCKhJ56DdkRQzd
	 jpQPg6Q9cBCALtYvZacQAMU+peR3x+wXDlVYhnktgCrB5nEdlmccmgxcmbrIjMfLbr
	 tiqpG+DMZXaDLkzF7MQfxQQmhGcdMBSvRZJZY5AzMSTXWLgvZ1GS+oq0LhRvVK5a7x
	 J5JXAyNUfIoRn++RxsDuVf2gi/sPkDkJrDxoOUGPQc/qQlzHVvkjIaCOffdj4ni9TT
	 mkTKN+uO+qxloRkHQ2OjqJ5wfIGufqwbf/XvRjQEcA5Rgu90xxJxxu5/NDd2nIxMNR
	 B9+w/5lEna5zw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
References: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: query FW config to reload library
Message-Id: <170266660660.116831.16876414164881492487.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 18:56:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Fri, 15 Dec 2023 16:30:59 +0800, Bard Liao wrote:
> We should query FW config if context save is supported, and no need
> to reload FW if hda->booted_from_imr and ipc4_data->fw_context_save
> are true.
> 
> Rander Wang (3):
>   ASoC: SOF: IPC4: synchronize fw_config_params with fw definitions
>   ASoC: SOF: IPC4: query fw_context_save feature from fw
>   ASoC: SOF: Intel: check fw_context_save for library reload
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: IPC4: synchronize fw_config_params with fw definitions
      commit: 57cd29a82574b0e9d99ed5789801c96f765e8fcb
[2/3] ASoC: SOF: IPC4: query fw_context_save feature from fw
      commit: 855a4772be9dc777cbcd580c8a07d9c54908219b
[3/3] ASoC: SOF: Intel: check fw_context_save for library reload
      commit: 3a0e7bb86f8728d94d55c56fb73e86be7976c163

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

