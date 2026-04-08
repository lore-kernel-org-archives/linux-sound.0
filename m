Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C834DCEB
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671543; cv=none; b=DdAgvj85lYibyKVCH14w8jz+reeHESHt5jBVTfCCdDA1Rc5AKg39KqymzB0MK5BAU6oPTZyAb//khO0geKWDLdBLcD8L+o3VCBtev+3vAGKFTlmuhvtQaGUVAg4aNKlac2aeL9q/dxLU7Xc0XxVfrqkBBwglRrLOJfeaI/kJ3Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671543; c=relaxed/simple;
	bh=XRsHIsbG+DabxvwbfnSuo0FIxrS/9lH71+bibe/OCaY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i6NU+vOQ6uf3z0uNI4bl0T43dXH2z/++9rQp84kuWIKt4CPqVFjcl3Jwy06X/w2Y+6nFjBJwapHKO5GQwUAAB3zUQWF3sbXC0Bpwcgq8kBdqAN9n1sHj2J1kSLp1Os+nvb40EgHsr8ZlqB5bnsCP/IYNaR9eHI7HPuVrXZC58rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBLGDutz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBLGDutz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB3C19421;
	Wed,  8 Apr 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671542;
	bh=XRsHIsbG+DabxvwbfnSuo0FIxrS/9lH71+bibe/OCaY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bBLGDutzkJ0a1Ug1N7AAmOavn+vTxY4pZSKWpPmT3lR5sT57+oBaXDFJHOWzP4nRa
	 azJRyq0gU/9savDrLJ8vFp4RXpZ0UYbrQOiFq5IQTOfwZBV+fwLriBN3DVf1BkWNbZ
	 TvmTYbA72HeF/9/w0cCOC/+n/jXMtnsRK2KvTZJl1juAxrO7KFgww0RY5o6dAmOv1K
	 v6lGPzdoKnJxQ0CobytGpqm3pap6DEwXbNabfig7x5I1Inxach4Wlqffs8Dx3bvtmF
	 OXV4TTk4XOaL6L+OMpEEPyNOIJfyyCENYPLZqLBcd07w+Sc2lZ1g0I/xdDGA86TG90
	 +iJRfTLsnlLUw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5pmvxfm.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pmvxfm.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: amd: acp-da7219-max98357a: tidyup
 acp_soc_is_rltk_max()
Message-Id: <177565461827.101848.12621370599339618678.b4-ty@b4>
Date: Wed, 08 Apr 2026 14:23:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XRsHIsbG+DabxvwbfnSuo0FIxrS/9lH71+bibe/OCaY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pj0BUeQWliM6A6ydhFbAY1qHlwOF+RoGAR7M
 ikbKHAlb1yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaY9AAKCRAk1otyXVSH
 0OmaB/98Kax1EitzZf7J/ds7MlVSDs79VGQQ4pvAJn/S5zcQDxZRz4n6vfhBfRAivIXzp9b1ijZ
 uCS0zAJFo5yq7/Lm1CwXPLzyB4AVnowO7XsGn3od8O3PHz82V2JRbU0Us/tI4wZlRQQJ/wMKXWD
 rXhXn0ChvZ7Hg0upEOFlIhQx8Hk9c4mk17eDNgp5SbUlxn2hBSG6dU0VDSdtPbK+O8aY2hjTGBu
 uNaChsDYfMt/VyJbtVVof05ocVNDsiEA04ubLjE/CEmIzNwIO9zIFnfvI621rgaSQ2SU6Fg/dnF
 lwbDJ3TdJ01PvjNdfjaqNnEmMifN861k3tvKbwmVGK5Jp+zP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Apr 2026 05:22:06 +0000, Kuninori Morimoto wrote:
> ASoC: amd: acp-da7219-max98357a: tidyup acp_soc_is_rltk_max()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp-da7219-max98357a: tidyup acp_soc_is_rltk_max()
      https://git.kernel.org/broonie/sound/c/3f4aa994c0cc

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

