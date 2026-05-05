Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143A1B983F;
	Tue,  5 May 2026 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987396; cv=none; b=N+X0shfWtazcjWBJz4aEEG/19b1YP34WkWRvUIJnt+2R4BcbFaWCeJBEGQLacYhFljTrRu0aZCz8w6Hpx3SB5KT4ijpgVyoAkbtm3Qlwt0NrEUTZujcLV+XD3hxUhY1m0k5U+bjVd4YkwvSSGrNM05l09wDijMrjDDNR8LJVY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987396; c=relaxed/simple;
	bh=S/wlN3oZJOY3+0IS/cIVgAKL6Go+BF+Fq2u4Db82Vc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MXwE6gHIqxHCKMJcoc0nGd2irIRDO2WTp+N9JYt8NKaUEhpbGmFPKcsYHQLQn+pJvwdLLAaEJNmUaG+OI/V+c2yhFl2EnFaB9sb0XCemoIn/pxN2pM9cEkS0bAXusu7Aw/REDi9j884TCTyOFRExd17X98Eh6nlgSvQGatfSmo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZ/rTV43; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZ/rTV43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45E0C2BCB4;
	Tue,  5 May 2026 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987396;
	bh=S/wlN3oZJOY3+0IS/cIVgAKL6Go+BF+Fq2u4Db82Vc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IZ/rTV43QbPdWhq2gvdjydcMiEWm+6ygytQ7s1e984sFTTDruvPrcg/ctfKDJxD+p
	 JvEr8OWWUBwOZJZQwmbXcKTpa6gzdNBvXcCQzrIQ0AczbSLa0pvqvDJ93FpIWYfW9v
	 z8pbjcamcasDhXfVG8ERGg4n6HfdYmfnoDxNr0hb2z2YesNxDHe0s8IyRjaF5mbLR/
	 34Dc+SjMTFipTD1YWppUG/MR3VqJ3kAU1NgYfFaC3MTtppoEuLpP99wgENWbOJXqaJ
	 OrH6cbfiBG5By2I17HwVHKl8Ey1OX0F9imgJV/zTIrAtkNqJ7dU7A17XYqf8Xda6MD
	 cGcx7kNsoKFLg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260505105123.3539778-1-rf@opensource.cirrus.com>
References: <20260505105123.3539778-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: wm_adsp_fw_find_test: Fix a couple of bugs
Message-Id: <177798379702.568329.15084356197111828386.b4-ty@b4>
Date: Tue, 05 May 2026 21:23:17 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S/wlN3oZJOY3+0IS/cIVgAKL6Go+BF+Fq2u4Db82Vc4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+e9CdXG8Ym9DSeBz4e0U4XniIRCH8uRvEEaV/
 jf2QmoKEt2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafnvQgAKCRAk1otyXVSH
 0JLaB/9+zQoGdUUoLJfSmMnHXOETIJHmMWFPxUvjn2P5QzexRUSGsq4AzE0YfW7xxYAj9fCkvIP
 CeglM74jks3Hjl8/zSkFyrNALkmU0FoQ+/AId+FtwJ1BjLjbP9fqS5VGVtUtKtIOlKp1ELRezoO
 kxMBdDgvFKX+1z3LHkXg4Hihz+DaXE0y6Dx0p3amRUQpPeS1fmVtLk7IhFo3bd0ZuhQ0DOR+yBb
 jeOVayee+NYuvwpwdEwglI0q3o7CMn7wzkJQQes2G90/H6OiOp8XunUN1FtPlXyB/fc+bgD0ZMt
 y6dGvgpo6971LzcDa1B2OKl+NTHhnVzYo+K6Qdw17N179gCq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 11:51:21 +0100, Richard Fitzgerald wrote:
> ASoC: wm_adsp_fw_find_test: Fix a couple of bugs
> 
> This short series fixes two bugs in wm_adsp_fw_find_test.
> 
> Richard Fitzgerald (2):
>   ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
>   ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index
>     test
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
      https://git.kernel.org/broonie/sound/c/78538047717b
[2/2] ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index test
      https://git.kernel.org/broonie/sound/c/af64f7909699

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

