Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651931814C
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903587; cv=none; b=qk1U4yMYt7CrY/mM91XXvrkxy8Iru15zOzmqnlDx1VsGMHU9NaoD3uE3o7BX1N86HsPMpPE/LxGlFSNoNI8NoSO6ahqeJScJp2VhQsmejCUsglyy9VjVp2uR0qoWksFtEFBkYBQv72lRPPe+eLk+b3x/E2SwK/6Tjps7NnrHCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903587; c=relaxed/simple;
	bh=6cuOb0nbsAkXClKe6JCW7mUxHjB4gm3DoELzG5cTpT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HryvaIc/tE9L+fksy/ewYBlDUQQ6YmNQ0SEfcm7rJTT0fpA3IHkSA5fyhwtJDWWdVFZtIaQ1BogcHrvwKRMpIVHp3jUvXB3Dy476iXOm9+g1hROT6wJNxk1uFWPsnGHFiWpc4y4rXKOK+eNLXSzXCPsvgI0YUFNIlVAVYV11NgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9grqE8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9grqE8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E4FC4CEF1;
	Tue, 16 Dec 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903586;
	bh=6cuOb0nbsAkXClKe6JCW7mUxHjB4gm3DoELzG5cTpT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k9grqE8s4CKo/WiHU/1p1ZXU9TKirpPejZU+mzcsikVoXWweUSSa75HxKNROlzRII
	 CKBY2oXW0ZH+sfLEylaAi2aQuwU1CJk8RsXNj9sV7QIqZOKryU+uNUjo46BM5Hw2KP
	 kDj9GTfgoL8nV7ck5V/t7LDVMbzxoxDTSKbUnruIjlPgJ6yNi/Z+5DrMENfKaWmcPH
	 Gh/cREUQLZQvJCySstbi5EClf6ea3VtFCHo5Zyc5CGWIbVceIkvqRVt7j++SbryCuT
	 HbfaEENq2JYq+S59D5LKHEL109kjmfY7F1s3mBjB4HiN5Af/gFr76+/IWksZjp08BA
	 uzzy8S9gH01ZA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20251215130805.31146-1-peter.ujfalusi@linux.intel.com>
References: <20251215130805.31146-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-mtl: Change the topology path to
 intel/sof-ipc4-tplg
Message-Id: <176590358357.182908.10012950115674100757.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:23 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:08:05 +0200, Peter Ujfalusi wrote:
> The default topology path for IPC4 is intel/sof-ipc4-tplg with a symlink
> to it as intel/sof-ace-tplg to support old kernels.
> sof-bin has been released in this manner for almost two years now, it is
> time to change the default path for MTL family.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
      commit: 544c0494cdb3732281e1f2e279cfa561724355db

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

