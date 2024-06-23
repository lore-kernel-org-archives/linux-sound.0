Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D6185E4B;
	Sun, 23 Jun 2024 17:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719163325; cv=none; b=N1p7US4S0+zHIgBhSsEzTBIY9aF7EUqTgnZYnHA6vcIjPyPdzQJbX47XAsLn/bZ/HHhhkxdZ2wZg4GuxNBDXaJszyyrW+vuHSadYo+TcjlTRhcs/Vkwgol9NnGzlm1gBFnlYMs3d0W4Z8scBbOXWIU5gtauGCF3jMc/SXmo/wqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719163325; c=relaxed/simple;
	bh=TRbGWFeCLKRd0cFpsIbSPmrA/h59ure6jPAnng3Fphg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NGyNE5YF183tA6SIGwIRG0zJrcudIDwmn99elJ3+8PniyghyLojZxSEKin5MI7bS8fFERzxKCSgsrvZizzZkwlTaSrBRzpTsuw/g2QLY3IKezvny+yhrxXqMmrqlMmoxUXDj+cst5jbCWhTy03zcG0z7wuhQMZ+FzLpgeyAA+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNRtAI6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNRtAI6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB871C4AF09;
	Sun, 23 Jun 2024 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163325;
	bh=TRbGWFeCLKRd0cFpsIbSPmrA/h59ure6jPAnng3Fphg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HNRtAI6fVY+/RJameXqia+W2/lREWTnkniZqEDEFSp8ZGfWJuu6fwFRkgR/Tm16FV
	 8In9YcwKpYGaPKlE/YPXSzaUL5J7HW0FxnNe2O1IJ4v1NpRg5g/qRsJXqATIuwE6FE
	 JQoKbrRHJGlZdWrE4L/3GmFVU3wV4UkzvMXSKpfSPNNAZMdUbVxyEeqY3MilEmy4W6
	 3J2esyL7XRNvcYOEvOkEgk2gqqINYqh+AtSzlKwXEiolBzC2n4pD071GK3ac9jMDk9
	 VAgbeOwiop5yXm+Hy00HrGUFAhfCnWXWVEkqeEZQu0/LvfC4CimMAE++XuUL8rq7RU
	 dlPxui3I8YpFg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Paul Handrigan <paulha@opensource.cirrus.com>
In-Reply-To: <20240621151757.1661265-1-paulha@opensource.cirrus.com>
References: <20240621151757.1661265-1-paulha@opensource.cirrus.com>
Subject: Re: [PATCH v6 0/2] Cirrus Logic Family of ADCs
Message-Id: <171916332349.350242.18419664167891546499.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:22:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Fri, 21 Jun 2024 10:17:55 -0500, Paul Handrigan wrote:
> This patchset provides ASoC support for the latest family
> of Cirrus Logic multichannel, high performance audio ADCs.
> The devices that are supported are CS5302 (2 channel ADC),
> CS5304 (4 channel ADC), and CS5308 (8 channel ADC).
> 
> v2 changes:
> - Use sizeof(*) instead of sizeof(struct cs530x_priv)
> - Utilize i2c_get_match_data to simpify code.
> - Use unintptr_t instead of enum cs530x_type to typecast
>   match->data.
> - Use dev_err_probe instead of dev_err in probe.
> - Fix gpiod_set_vale for reset to the correct logical value.
> - Provided full name for maintainer in DT binding.
> - Remove | from after "discription" in DT binding.
> - Removed unneeded discription of #sound-dai-cells.
> - Changed supply discriptions in DT binding.
> - Changeed underscores to dashes for DT property names.
> - Added ref for dai-common for DT binding.
> - Changed additionalProperties to unevaluatedProperties
>   in DT binding.
> - Changed the DT example to have the compatible property
>   first and the reg second.
> - Removed typos and blank lines in DT binding.
> - Changed adc to cs5304 in DT example.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
      commit: 0e2407ae89b340c385afdca1e1c61dd651ae6b35
[2/2] ASoC: cs530x: Support for cs530x ADCs
      commit: 2884c29152c098c32e0041061f8327bcdb4e0697

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

