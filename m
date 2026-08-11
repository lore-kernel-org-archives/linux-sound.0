Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBA415F06;
	Wed, 12 Aug 2026 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529781; cv=none; b=DbVHTNQ2BmDdqtHJqvFZTlGojR+ThU6jTeEZk7r8DXaemzhNQCU6l1i/VqDrfqejpfBEZLUQ/l9g4PhcwvjUtdeVdSLBmmpG7nbJxXwbiwWuVO21ZSaHjo4AIOJXsG1kvqMFj9KbIjfjyZO0d2ssDYrWkEqY4EGe1NFG0REMouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529781; c=relaxed/simple;
	bh=3LEAV7NwOG0WROZNojQ8GEkL3T0UbZNw3buVUn3pDXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kVd+ykjwA8ov/7D5sdcMLhgQO8RYby3KlNMBj2idcg4B5QZGix2wyUzaILkl2BdA+IgaD4mSOBMUSwZCHiSwkQYiYHGOz8JXGYQ84ZvnrGnJvdABbLxdbMGKnKtG3fHueTAZ8rw1Y4AMnhSH4rKBeL642y7jlmrgsUf0CeCfMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4HQhDOF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4HQhDOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCE51F000E9;
	Wed, 12 Aug 2026 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529779;
	bh=xxhSk15DQjq31zTmbuh6wzx2sERsw5dR3P5SZDQapAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n4HQhDOFZ5Myj3DlnK0nnW1cGhostOraWeJG3sLmKSFwwoFOURwzIG7gpyo6TP0Mb
	 /rvdVyNlw3f2dNvVN/307sYCo1R9lVr1PFqevJ8t9LnrFAyDa0u4EKPRzPqShGJAXz
	 lDbPXjo0P0IiAFE5sE+wv+tYpdL4PQ+/O9L2vzEzXSdSnSP60jl/DAd81TA3mew309
	 VMu9WB2ujfGt5PFruy7p/QlR+WWMWeEjLBzD7bEpv+8NurtXutnLpO5cb1B4gUF3eb
	 bim4tRmU/kfCGDStoRu6GrI4prt+kKQXw3XGfL2LOgSkbYAqZ9PILuZHeTgw+l925f
	 5mqMob1GD/xNA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260809101439.4798-1-wiza@saarinenkoti.fi>
References: <20260809101439.4798-1-wiza@saarinenkoti.fi>
Subject: Re: [PATCH 0/2] ASoC: amd: enable audio on HP OmniBook X Flip 14
Message-Id: <178648276445.390283.1674088497568553473.b4-ty@b4>
Date: Tue, 11 Aug 2026 22:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3LEAV7NwOG0WROZNojQ8GEkL3T0UbZNw3buVUn3pDXY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfEfx+MRj9bTJK1mw4ZDCiBrcV7gMg4CkplbA0
 Z32bLXhVFiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanxH8QAKCRAk1otyXVSH
 0G3eB/9ySXpHCYWC+fHSlAIoujsDJHuYwNe7/qJUrbMZCHpXKlFDeCSh4utbSDtrZW0o4PWZr4r
 VM7drSj4CH0XKSpScfxfODXgSMeab2kNrXijFbCr9wM2mqQ4vOlwmNSBSY0l+KiE7O+76zS28wl
 m/K3p6W8BpyW+7C5XcDtRFLHClR4J+4d1ZXQyev8fglTHz0fp9yZmu5F/DI0DXnlJL8RQLJo8h0
 7E6PH1/qnWrYNHdy8H1maqDZm/jCRV7JbtStiOSWOHqdw6hDzA+rnevlw5neleMqiCfmLJyzDa0
 f8zCO0+kk7ostk4S8bQzk84nEUctsaP6VTdhN960Jj/HRM6R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 09 Aug 2026 10:14:58 +0000, Ville Saarinen wrote:
> ASoC: amd: enable audio on HP OmniBook X Flip 14
> 
> The HP OmniBook X Flip 14-kc0xxx (board 8EA1, Strix Point, ACP 7.2) has no
> usable audio on mainline at all. Its BIOS reports an ACP configuration flag
> of FLAG_AMD_LEGACY_ONLY_DMIC, which binds the legacy ACP driver and
> registers a PDM-only card, so the SoundWire links are never scanned. The
> two TAS2783 speaker amplifiers on link 0 and the RT712-VB jack codec on
> link 1 never enumerate, and the machine has no playback path whatsoever.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 14
      https://git.kernel.org/broonie/sound/c/8393e0bf593b
[2/2] ASoC: amd: acp70: add HP OmniBook X Flip 14 SoundWire machine
      https://git.kernel.org/broonie/sound/c/b48466e4be18

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

