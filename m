Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D345BD6F;
	Tue, 30 Jun 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834527; cv=none; b=l84SOCOxeXsvKbmqXyEF08E1oMGsVycDVZDJRzKQlXQeqEXKvfuDTFA1EvfUaaHv0wrd/Yj+whAa+YzKOLFK8wZOVR4dsw8RBkYak9G+h5dDhb3uxed5As9QTou9m/p08RNmt3+KEXeeW3hZkU9df2s4YfYgp0H3+vlpG5TsYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834527; c=relaxed/simple;
	bh=wrgw7PEI2SME0SIe+/+sf3Pgi5LbBZiVWr3BFIpyt80=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jyUM4ATR68amJlP3C64707VevojKWGfSsvxF5OLcfaaPOIrDZn7M1dp+ch6wihKdZrdE/RqqF8EmEhp42g11CKRm2Auo8Snwp4rgPMqbCJf2BZ97z+bp5VOGoqTn0YIxcx6tqRHQ1SmzzmHRguIedxIklQU7ew/wDknKTHTIM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwuIfhQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwuIfhQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563351F000E9;
	Tue, 30 Jun 2026 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834526;
	bh=JEdAb7i3p9jcNPTGjq59Gx81l9oGmp3CfR/lob9t6b0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=PwuIfhQYn+oGld/V+jRk3xsLNzI8bNAFWxJlR7K+EBy4uSefqDaMqfNLyEd/qX08I
	 Wmpyolexj/uS3hFcwpz/c/YInNWjqWdfrKu8sGSN1Z8gGgL2FhDtRdMhUE4YO8sAkp
	 DFq+hdi6c2Z8hF5Yc3o7q6y7d7/fGJogKo/ehs7jfOV2cOyWftvOajjB+GVfHe22Xc
	 b9x906fcC3K49QJaozPVaIwmKgR7qfwp7fF6YdwdB71jnbtdwmQ0h36IYT9LUQIR0j
	 P86PE/xEAxIyfenqcuU7Mm2EZ9MgmCrrs8EDhpwuUW5a1KOMDJvuvouTuE8rQZYYkg
	 KT7IXvcqcpSKw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@oss.nxp.com
In-Reply-To: <20260618023818.31618-1-shengjiu.wang@oss.nxp.com>
References: <20260618023818.31618-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH V2] ASoC: fsl_audmix: rework runtime PM handling in
 probe
Message-Id: <178281881655.79320.11807000273254095957.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wrgw7PEI2SME0SIe+/+sf3Pgi5LbBZiVWr3BFIpyt80=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VbSQ0f1/l/eNXE/WsYXI8ysXU8AzJYP76Gx
 qvq40ZQy8SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlWwAKCRAk1otyXVSH
 0JjBB/4/XirGMLI4edb7qrYmO0Fvcu+gMGCaxbbH6s7GFxHarKHpo30waD5sDH5ZPNgHMmUc8MA
 qvAcjn0+8HPkdB1y+4nySvW8XIb7d/cNpARrAHiq+J003dquAkaRVdPfYCUmIK2zvMTfLsowAbM
 MyHqIfN+EzDUL1vEBjs9M2wMvNhDfLYtLOYuFHrpRu8XPMhb4/D/wZGTyzC+OQ9SRIPR2yc9xY/
 YHyoVDATs+nIKZ+gv4nJKuesZ6UkrHU1FaOqaIzV5T8ugGe9++1C806e3+Lt2L4rcTdNCg6ol1h
 bXSbkrlc+rX7XU7fmvBprqPH00qgAZYhpolFT/6khTk6f3Cz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 18 Jun 2026 10:38:18 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_audmix: rework runtime PM handling in probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl_audmix: rework runtime PM handling in probe
      https://git.kernel.org/broonie/sound/c/3359ba93d01a

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

