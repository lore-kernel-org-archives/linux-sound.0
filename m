Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01B927FD6E
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957814; cv=none; b=lq29Je6M2KksK5jHHu+elGBrTrFOjkXak3yYImUiof3HpDjyY4EoSElhv2X4YMiQlsLZKpz56t921LmVAdmgDz5y413If0kXT6haFvxbdjpeRIfWMcgFaAHwAwRbGI5isUWu0JfLTDwagFZzl67SjmTrjvSL5tiJysdMwu2yk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957814; c=relaxed/simple;
	bh=uVyCcSk80+6CQWhuFDpSpUGfIwjib02oUQt2bJulwIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OlOjHbywD9pyfNolkEBRCeqhPdcWPjFiCzUDujc+erxbvhPeW4syMgd+Ofc6pwsTL7X8Jqw24cVdTM4k71bHVENDgqImT3b+OzDq/JYSkgraQH7ThZ0lZpB5sXN/yuoOhIksujPlhbVirb1mgolp0Jwjskdmj+Yi7asq0FwXSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmEJLMgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmEJLMgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7E6C4CEF5;
	Wed, 12 Nov 2025 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957814;
	bh=uVyCcSk80+6CQWhuFDpSpUGfIwjib02oUQt2bJulwIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qmEJLMgHpFXMvFZ0v5BSKjvahiVJwUBOnbr6OIAG92+PY5pkUDA+WzY5Xvm21QRAh
	 HObTyVPrAS6FVxnk8b0HybRGSUxqUg31iZJlFDqQbIKY5GvT7aQZEngN1mZd6ioF6X
	 esjXfwtM15zLow3pYwDD10c9kTQrT/OqOywHKeoLeoCNFwU2pr4mrOBi7bhM2SfOpM
	 t8isYkRd1uBU89Pcynv8TO8gN7egt4t/WoIKhCyV15iwUKhIfMaKc/aFLxxMJFIvuS
	 O5WLdI+GiHrMYr38dETvdCKuNRqPH1mlLAds2KIh7OeLl8lQ1WihH0CF6cemMcMyyR
	 J58Ekdr5oFucA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251112115045.337062-1-yung-chuan.liao@linux.intel.com>
References: <20251112115045.337062-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: boards: fix HDMI playback lookup when
 HDMI-In capture used
Message-Id: <176295781305.39513.12357351119521912360.b4-ty@kernel.org>
Date: Wed, 12 Nov 2025 14:30:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 12 Nov 2025 19:50:45 +0800, Bard Liao wrote:
> In boards like adl_lt6911_hdmi_ssp/mtl_lt6911_hdmi_ssp/rpl_lt6911_hdmi_ssp,
> HDMI is supported both for playback via normal HDA display codec,
> as well as PCM capture from HDMI-In over I2S.
> 
> The common board driver function hda_dsp_hdmi_pcm_handle() has an
> invalid assumption that "HDMI" is only used to identify playback HDMI
> PCMs on the card. This will result in failures if HDMI-In PCMs are
> defined in topology using the string "HDMI", and they are registered
> before the playback PCMs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: fix HDMI playback lookup when HDMI-In capture used
      commit: 4d6e2211aeb932e096f673c88475016b1cc0f8ab

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

