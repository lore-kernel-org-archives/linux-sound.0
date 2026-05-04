Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF630146C;
	Tue,  5 May 2026 01:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943312; cv=none; b=XpnHJvk0oDdKb6izq1IaEGFOeC8LERjhUZRdJFPxiUdewCQ8Darn3EyqZT4arV4wOT4xVZD8dZau48iZ5rzQ5Mt6xXYYaUAn71QUm71rWLRSo1NqbZWNK//5lh8p+bG8WGJBSMDeP1pWkDuCDRiMHKejG07feeV/kuxoS22P0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943312; c=relaxed/simple;
	bh=sExGztjbNjK53NIWW7HhbL2VQMKB7jHq+Mz4VXC6PkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ncSgmMyx3xy8MC0I5r9M3GURvYdAa8QLwNrhkIZsogAaVWCjbJar2FSQBr9+X9Xh3LnG3J9bSACZH0DQWvsjaptes9QtZGpKBqs5wrmY0no5ZMWPKArMGhEjvMezr8LtUg8+9w31fsTGe1/gMAbtDETT2IY4/juBe8unlLn3PKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsBWl9IR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsBWl9IR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B39BC2BCB9;
	Tue,  5 May 2026 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943311;
	bh=sExGztjbNjK53NIWW7HhbL2VQMKB7jHq+Mz4VXC6PkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JsBWl9IRX6wu54VWJu+VVWHSnPlJ+63UqA99BB47VRXwaBZOhyJb5l87NrIcE3ZX+
	 C/IsSEpd4bL305xpYWDxnWQ/z9+tn3LGPlQv9bGuVKjX5exOTQclCxnURc08Y+aSLz
	 V7MosTs5WfYQt602Ggc/a3Hj240w3g85vkes5kVlQfHhgJll4U1c8NCsa1JqKq4MH3
	 lFbQyn/VF6PbasvlEYbxKV6YC1vzcFd4WPav4Th4i4U+Hxl+6EOdYgiHaTQCJZZPUv
	 SrVTp8Kp9yxe+wn4CzS53NzkgcBL5E7k5No3iBEnZ113XgijD3ZcZ2mbihaXD1T3qc
	 p79VVkD6xCV+w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Viorel Suman <viorel.suman@nxp.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428-asoc-fsl-xcvr-event-generation-v1-1-f21cf0812c4f@gmail.com>
References: <20260428-asoc-fsl-xcvr-event-generation-v1-1-f21cf0812c4f@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Fix event generation for cached
 controls
Message-Id: <177790088876.458539.12321460496657732500.b4-ty@b4>
Date: Mon, 04 May 2026 22:21:28 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sExGztjbNjK53NIWW7HhbL2VQMKB7jHq+Mz4VXC6PkY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMMvTt3S99ftFabi4GLdy4UvAT0nQ4UKgBvn
 JxAe8Ni9USJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDDAAKCRAk1otyXVSH
 0FUHB/49evf8kQJKEqAWNgacwWUapt3tQu91CD601pBBjvaqilub/Ub72fuk+gwgnGLGe6Z8tjT
 2N7Q4kLLisrsPoBy9ULO20mhCtdwhTEK/OnaUFcc0GkNHbjzNCl8F6evKYkdatVVe0UFsayAdUV
 eWfXWlck4vXPzGo6f/R8Nlrnzn4IDKekzMotXrLrAN7O2sHWC6goOG+wJ02aRw8CjwWpYnJzE05
 O6vNLez2PRFTsLYNEX+qnRt2E0sUdqVAajml+rciu+GUciOkoOrUuVw6cbNK9x+7qVWlNSkY7Wo
 uM5ABcRc9CVByaVD+EMvoqTdq/B3yF1RS4p6va6K2iZO8p0+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 00:07:08 -0300, Cássio Gabriel wrote:
> ASoC: fsl_xcvr: Fix event generation for cached controls

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: fsl_xcvr: Fix event generation for cached controls
      https://git.kernel.org/broonie/sound/c/e8446a4a574d

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

