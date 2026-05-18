Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A43644CF
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116924; cv=none; b=LIBL60+vD5zEfIj9J9c5pA9PVFuASRBUzYo+vNaJ45McgDm75hnPtP9edXOwwfoPlsCzgfMCIXZNFIEXQnvncfzapYC6/IVlCT1T2DruDW93taGBn+S282oYoqK6T8F40Nq8hc4Ggt/lRlHyxnUGjCp1Ayk+JttgtHnwkYWEhEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116924; c=relaxed/simple;
	bh=WP+sHSZ87+nPObAEvr2bwdKEV08t1+X9ojONE8MM9r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xq1VV+522A0iob82rgbZR0hhUzgIRvxF9rIiMSlMaS7iW4m46NLWYnlkymTalS1D3z8v/kr7JWw4OxfBGkZx0VvRswtPWKKJTN5MFWaP9ERuBjBlIBRRNyhhNcA5CJ/TT9m0c+ZVCEz4wtkgwAfvpe+kXT7R2xzDTAxxryelGSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oc/iELJ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oc/iELJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C200C2BCC6;
	Mon, 18 May 2026 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116923;
	bh=WP+sHSZ87+nPObAEvr2bwdKEV08t1+X9ojONE8MM9r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oc/iELJ68JlWWXHxGQd+ZcDCvi8DFZNV+kY3AiSBoHzWdxgT+kQ5GVTE8DykCQO/l
	 vM5oEn946VmLaRhiWsUGYubCh1QNEd1sVh9WrFCDaDTEPxKRsQh9vgIDHGl1h5pc+0
	 CX3VN61OCQrC7a5lYK/OtMyTtH0MX+gOLok+hzZpCziHep89CYnn4rzdLkGZzLXRMe
	 O1duiCVeGw0uk1z4efJiz49zzK5hCmobbwrSjJ3aHKnh7HTP5BB6+vXjAcJTiWBauC
	 hymLmlvQs2N1CjNDmz6dkPENAXaVRreBkOJtKz/4ks3JHnFNyQPzTE2kGLc5+q11NH
	 hgHathH9WdbUA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <20260204094452.33289-1-zhangyi@everest-semi.com>
References: <20260204094452.33289-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v1 0/6] Add es9356 focused SoundWire CODEC
Message-Id: <177911692211.295433.12727663393011380645.b4-ty@b4>
Date: Mon, 18 May 2026 16:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 04 Feb 2026 17:44:46 +0800, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.
> 
> v1 -> v0:
> 	-Modified snd_soc_dapm_add_routes in soc_sdw_es9356
> 
> Zhang Yi (6):
>   ASoC: sdw_utils: Add ES9356 support functions
>   ASoC: sdw_utils: add ES9356 in codec_info_list
>   ASoC: sdw_utils: add soc_sdw_es9356
>   ASoC: es9356-sdca: Add ES9356 SDCA driver
>   ASoC: Intel: soc-acpi: arl: Add es9356 support
>   ASoC: Intel: sof_sdw: add es9356 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: sdw_utils: Add ES9356 support functions
      (no commit info)
[2/6] ASoC: sdw_utils: add ES9356 in codec_info_list
      https://git.kernel.org/broonie/misc/c/4ff4fc6fea57
[3/6] ASoC: sdw_utils: add soc_sdw_es9356
      https://git.kernel.org/broonie/misc/c/5d03a4f35710
[4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
      https://git.kernel.org/broonie/misc/c/5d9cb740cd38
[5/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
      https://git.kernel.org/broonie/misc/c/25b905940832
[6/6] ASoC: Intel: sof_sdw: add es9356 support
      https://git.kernel.org/broonie/misc/c/f1e35606d618

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

