Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419D13ADC
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zzqe7kj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D82DC433C7;
	Wed, 29 Nov 2023 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283976;
	bh=UGgJf+xDm6TeaMGLjtQRriZZTl6p0lxp7AxmrXcux2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zzqe7kj9oMc7/5iqHUZGIH/2t2lng2nWwIqOejlb2it6VjKIH2QUf4wiZVqVGzrz4
	 7Co0gUNwabPBLVCZq7fVh2OiypyVmtCbhqdp1NzGrfB9hJvlxlxaaqQ1vDXhzwzQVi
	 jPlUR6kQiXHKTXeDAtVIavInxUKwYpUb0YEmmL4iA7bPEjfsNYglh36K0iSfMoVrh9
	 jb3+3LYRgQBpMkkh7nlK73/MIsTFYA6MNbbd7hIqP76XWxQmnQlVopf8FfjEMCYcIH
	 UB16FiHtXaeFUV1QQT93iReMZa/945VmXrqnZ39ij3GU2GLXfaGsN4uBiMO9OLNP3U
	 tzdcpJX7sKCaA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
References: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: check return value of
 snd_sof_ipc_msg_data
Message-Id: <170128397409.290371.3042450357579316139.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:52:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 14:20:21 +0200, Peter Ujfalusi wrote:
> snd_sof_ipc_msg_data could return error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
      commit: 2bd512626f8ea3957c981cadd2ebf75feff737dd

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

