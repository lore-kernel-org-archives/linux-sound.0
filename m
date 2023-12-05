Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200645F1CA
	for <linux-sound@vger.kernel.org>; Tue,  5 Dec 2023 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZG+vwoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE80AC433C9;
	Tue,  5 Dec 2023 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790873;
	bh=FbqY5X7xfWp3OI6ffVQrO6USxCEjnlbDGZRLMNYq+Ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gZG+vwoTCJowZK1z31KB2bOyszMPed8DV0xMUkbno5VJvbG0wRDzEEnOpbt33ciiQ
	 VN4pvUI+8af2zVK8fUQJt5BiJX9Vu8T2hPDqXF0GzVGWzAIlrdATeEODK6W4bt50gs
	 EXWg7XvGbbSzNdHUIRzNDrq7G7FAXF3zygRA5GbwUxvL92aOSLGkIG6Ww2tnYksUG/
	 YaC+jsWsupdoau1GRbKtIe4LmkLxhSO+4uEtEemEubWCRDPNY0RAWMSs2SsYp6qwJi
	 eSs8ycf49gdrvL36+PgBEGemaonOUHikC3jYD3zkNpbmmTEoCFUOlU/kwj0RhrWR8k
	 g/fA7JNKDGCBw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Rander Wang <rander.wang@intel.com>
In-Reply-To: <20231204214407.208528-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214407.208528-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: lnl: add core get and set support
 for dsp core
Message-Id: <170179087243.845405.11410284191685588806.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 15:41:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:44:07 -0600, Pierre-Louis Bossart wrote:
> Driver uses get and set ops to change the power state of dsp core.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: lnl: add core get and set support for dsp core
      commit: f31c166a5027e927e5c032d40ef2e484d9ecd612

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

