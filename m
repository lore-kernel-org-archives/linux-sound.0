Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38656155C82;
	Sun, 26 Apr 2026 23:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245722; cv=none; b=N0lnBIVg9YzeoxuM5ob641qYj6eeg+Mz6TpMBbUkvSeHZUEKY6dobSQu2kuQUooWUHmiApg7r0vfm07Da4cd3DpMxaE8KugJtWUMz92rxsVQ2mcWA8/FmBoI7wnlQPzUm6Mbcj3HwYQkvDW8ALY6Xa68n4AuRu/y1haTcZmOXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245722; c=relaxed/simple;
	bh=DNbyBiB+kR7DtKPb1naiFdHB1FjL/D3BXevIDYDiQy0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iGc0yd2ONxf+aZL7FBBt/Mzlcq/SMzRt7KuJgWQ5xJOCRF+wclPHTXuKMQDevXChY6szKIk3elMG/GOaVAwglP5TlApmG2LYeSKwbINwob8c2XRXdvSlRKFM2n9/LkDQ3HcADgt80zf8MEKqQRgrY4Dchch/vRgVaHZOd2UgW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkV90V9H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkV90V9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE61FC2BCB4;
	Sun, 26 Apr 2026 23:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245722;
	bh=DNbyBiB+kR7DtKPb1naiFdHB1FjL/D3BXevIDYDiQy0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OkV90V9Hh6JlgQBXjJbVZnjQGLpLyFDESzKVS9G3epcjpWZBHOF3uTcatym/10Q6h
	 2NorljMetwRsAx9BoWRB8B+sv42vjswefASSb74cUyriZBAY3FFa2ZyBjK1vrSb4SX
	 Xdt/rV6z+ICy8rv7pJfta9H/Yfrj0TrLRi8F7OKHBAgKB+J/2GaRh+p5vqdEcnWGt4
	 zFYzcgtLx4NzgvAkHB6zv7fMqKmlt3zQeDq9rCgjmRc7VRGj3T4a4Mbzl+54z8pQPB
	 zdY2K0LqWLCtBUs54iD/FnEOa42/40g3U/19AV4bxAQUDUJNxoaWV41XLUK0fvesr7
	 /rlxN6emIRGJw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260420085344.2081805-1-shengjiu.wang@nxp.com>
References: <20260420085344.2081805-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add DC output remover control
Message-Id: <177724018870.266775.2671015409036578113.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:49:48 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DNbyBiB+kR7DtKPb1naiFdHB1FjL/D3BXevIDYDiQy0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4WhB2Q7f/tY73pPKy4AHh5gbpCF2ia2cdk4
 UnFaUi9KpOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eFgAKCRAk1otyXVSH
 0DEYB/sH09HagHwadjLYVuAG9ec9j9nSdptX+JxgfXlJiTT9ICQo34hm7ymyoa4By6p+F5uw0WK
 pA6DU09UAsWGyZGbwPK3BavwUAc6Ks//Qe7xlPFjZqxZKh2vdkwQ8XHvZp4DlilC4Nrwnfc0hjl
 E7ziJjOtkSnvZPMB6m7NDGTJjgRihuftLOfVOuQ+KQlhQ1nSuuXBFaP3YpUfmCPoNjyQ2kOF7Bt
 ou6nHKCAhXsKV1cqjjvOfecsy78cKi63PYHEXBMuAfsC6uraXFyZ3dUWHaS4cGZRHIjR0PVuh3I
 8BSF8h6mWyxNYmDl8S+ckq9LLaFaVbIKU5kFEBWRNtke14ac
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Apr 2026 16:53:44 +0800, Shengjiu Wang wrote:
> ASoC: fsl_micfil: Add DC output remover control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl_micfil: Add DC output remover control
      https://git.kernel.org/broonie/sound/c/e9a6f077e415

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

