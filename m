Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E03A6B61
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551578; cv=none; b=hgYWPMdLhemmU/JZZzSnO9xRpl9Do123FH2GqphQy5hWRjLoHOFCs0SZaLGpTbQnEWahXAQH4x6H3Y1yFhxoByFzIbPyWxrruOMIHYvW+ESf4/9ca4wiJJbzrAJfdAivH9XQB0FuRiWqBYKXL57Kgy1DFsZP5BazW614+Ma+3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551578; c=relaxed/simple;
	bh=c88ptu27QeHn9d0PP6i/2dafD2PARNcKeuqHG66ikGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AL3xS+Hd9IkBb0JS7WugZCf/SA8qEyFTuEaHcsRV9SrhoXLhGqJEo/XmkPezEW+kaJxO+3nbLX/dlQg32RSzXeq4CW047ziSgHkO1Vcggz13HPhHzYyRCqazpWCP8xCjia+4jW/UAe4vhVX4atkkruNGNtukwi8IVdSb0vD9ALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN0PWIAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN0PWIAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C44BC116C6;
	Thu, 26 Mar 2026 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551577;
	bh=c88ptu27QeHn9d0PP6i/2dafD2PARNcKeuqHG66ikGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fN0PWIAJttL1y0I8XGCJQfA4fAvJzM2KQ4ihNWIwdKJVphbhX7cpceXfhND1fZTjJ
	 mm5Zrd7307UbEo9/PQu5RtU2f5YdEHe8ghof/8sFUdXSVC/7T9ae7n3L+RmkKl8aDf
	 DrOiy+4I2vnTaoedr06jSuaaxyvilSMQDwoOUjdimON708On0fkNQkTtAnJyRBNvMA
	 O8Em6BbTP7ucFBAfKpr29KRTO1BR4bCrKnMMoeKocPT1UEEinjznlEQ6kp69xc5pyP
	 93v7+h90mXUm/mlKc/bnBr/m1P+hultF++9T6w3hulcsvZjRK1NP4Tifb2HHiodwbH
	 Wgi1da2+TSkEw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, flove@realtek.com, 
 derek.fang@realtek.com
In-Reply-To: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
References: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: add rt1320/rt1321 dmic dai and fix the wrong
 name prefix
Message-Id: <177454219425.201561.4651580783763280266.b4-ty@b4>
Date: Thu, 26 Mar 2026 16:23:14 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=broonie@kernel.org;
 h=from:subject:message-id; bh=c88ptu27QeHn9d0PP6i/2dafD2PARNcKeuqHG66ikGw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxYIXJwWmy2c+0cCR6PtycJG6iDJ2X4QNCL6Ht
 KWY7L+PMxeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacWCFwAKCRAk1otyXVSH
 0GHXB/0RUopGhdZROb8dypXDuFDwvc/hEpCt4MKh4jCqmpy9GBrtmVRRoXwvrcVCfib3DWpv7Ne
 CmznEhhlOalA5sVdAEYBSntTzDcF9t+PDYKM5Oun8WAmTIQsuJixr2TTLVXsA102FbmMl5LfUu0
 MKFjoRGudh/y04WnNWbWz+t2VCH3crozeX4ylw1o/lCO05YUHCHuaMLkRVDZZ2jImahw7Kcl3g3
 SM1X13JJKhVrSjfdccMtdAmS9aE1iDd1zBwbV4B1s7sH5WkxysOv79y98rO81IjSkVphzWBo8yT
 fr0CK1wRT5TGbEmon8a/OGa6dNcEwA3taZNzH92sCW6kd+tY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Mar 2026 15:52:59 +0800, Bard Liao wrote:
> ASoC: add rt1320/rt1321 dmic dai and fix the wrong name prefix
> 
> The new rt722 + rt1320 configuration uses the DMIC on the rt1320.
> This series adds support for such configurations, where the DMIC is
> provided by the rt1320 instead of the rt722.
> 
> Derek Fang (2):
>   ASoC: SOF: Intel: Add a is_amp flag to fix the wrong name prefix
>   ASoC: sdw_utils: add rt1320 and rt1321 dmic dai in codec_info_list
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/3] ASoC: Intel: soc-acpi-intel-ptl-match: drop rt722 monolithic match tables
      https://git.kernel.org/broonie/sound/c/9033f7b7f27d
[2/3] ASoC: SOF: Intel: Add a is_amp flag to fix the wrong name prefix
      https://git.kernel.org/broonie/sound/c/dd4a1963ddf0
[3/3] ASoC: sdw_utils: add rt1320 and rt1321 dmic dai in codec_info_list
      https://git.kernel.org/broonie/sound/c/ae2cb3384337

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

