Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BADF423A89
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936911; cv=none; b=FBITP8/xs8gfK7K8sZ1BHPYAM+jHQho69u1R4nxx955YOWZ57yM9vhxv2IEhdSUF1+nFSU6SeMVEyhLjzHGDEOH7EKUnHQb4IVfcNmZcc+a5BSmN1AvSjHnuONmo7juTFZE8Ju1DCVoHXPRM7Zi9EWEx54QnC4PaYSQyLkV8JIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936911; c=relaxed/simple;
	bh=eIOfd4EFCZamUH4ENm4qumH2il2RjMPjuhy1GyX5Yq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kRYEfIH2aDyEDelrT7kQnuPbj4CvPzhCPdrwcXw5fcsUTcV6wP0EqGr43j04WlKiOGfDPDOA9XhD2nE2tAO8KaWVb8tryoBeCes4PzV+3rcHq6LZKjOM6Fd2fmA//cVEhTEThp22OULXQegn60a5DdV/OJWAy8B4TzZ8AEQ4S6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUnE17zF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUnE17zF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E446EC19422;
	Tue, 20 Jan 2026 19:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936911;
	bh=eIOfd4EFCZamUH4ENm4qumH2il2RjMPjuhy1GyX5Yq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QUnE17zFK1LBjNLz8ClYarX+mr3UyFzuATd7DMUbrYOI+fUwmhQfGehSaqGHjIMq6
	 YceTiCvH2LsgSzdQDRkdxzTeVgsN8ZCB+FsiVnat9+0KyMNW+VW5k4v87B4utxBTdh
	 y8a2uagDXpTrpDEe7WADVH4zP9qDRuulB00aZIg5psBiDkZUHXXGozX5PBlRlDt3J6
	 ImCO0S6k5Vj/cxIQpVR8/64mo5Cgc3BCQESo3cuw05yHXx2OKlqPG8g7Accz9K+4i4
	 IK1EDDZLgkEOUtzt8LBC/k8RQw/m6oxdM1xwiS7smFB2JT26LUL2s8ClbmoJs2tBDo
	 zRylyOKMjresg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20260120081935.11005-1-peter.ujfalusi@linux.intel.com>
References: <20260120081935.11005-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Remove MODULE_SOFTDEP for
 snd-hda-codec-hdmi
Message-Id: <176893690967.777973.5891883296045500288.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:21:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 20 Jan 2026 10:19:35 +0200, Peter Ujfalusi wrote:
> The sofdep no longer works due to the reworked HDA audio stack and
> it was an incorrect way to try to work around system security
> policy blocking request_module use, even if they are legitimate.
> 
> Drop the softdep to stop the whack-a-mole hacking around system
> configuration issues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Remove MODULE_SOFTDEP for snd-hda-codec-hdmi
      commit: 00ca2dd431fa2acb07b3ecc6ce49fb9a0a4d72cb

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

