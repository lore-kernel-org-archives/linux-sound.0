Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7D4657EA;
	Fri, 14 Aug 2026 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707504; cv=none; b=c27vBdct4+2zY/ARfHOE60wcAyMGDjxKpI2Y/XmMSAWlWNkpYCZP7geUzK/U7+1wZXLTys5D4JJnrzmRZKDO72WCZvvooq2SWhJ8Meb366Or4JNRSokITB8y5ZLqu6p/kOAN5eyS/7EpW5gHAN0S1lV1v303r+jaXNdVg7p96qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707504; c=relaxed/simple;
	bh=/zHLYQSI4R4jNfkJnN0lpe2m4CYSoK7MZtGL3F7WzFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WIUJCL1xWg39AFfi9d52dEdPaewZavXNClkrPrO9MgYHehaxJD2SXx3peR35UzusadYxURwAzjFwHAP7USBYfRJXW+PNxdLOZwkUb9BV/flQkenqwwbgB7jUDFby4lg4s5NUMvKG3QIvNfZ28fttDzgUy0Ns3yf7zHq7SGHhiAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWtoCM7H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWtoCM7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841F81F000E9;
	Fri, 14 Aug 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707500;
	bh=j9SSgfVEi1vM89znQUmODgOus89Y5kuqP5ErzT8yGwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CWtoCM7HA6fwwRqJM9tk2/lXweInJuVzgexG2BtGQ1ubIVR7ZHy7M+Sy6uPmGkROq
	 LDfjo1udV5FUVQgIyppXcWYAEmluhCKZpnEQ0fPHYxr3oYUUedVWl8tS7W8WoLhFDn
	 VotkkpOTlvQCPV/QPQ+jItawaeJqj6etqfajp3b73r2h0/BN3rF80+fvO5ANrD8MBu
	 ULBQFPjo3A6Jce7+p9jiXkI5NtUZSyd1WXV/WGXQBnEjf3LIu5b0B+fk482hW79uGp
	 YFcwzTrttR3iEeBQrKh8r/C6tfSyD/d1ULabRiLnaWs4gGzkV6MNk4qQ9nkY5z6yXP
	 XcJUUNMa6GX2A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: hui.wang@canonical.com, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260810093834.1511749-1-chancel.liu@oss.nxp.com>
References: <20260810093834.1511749-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH 0/3] ASoC: fsl-asoc-card: Restructure to support
 deferrable card binding
Message-Id: <178663259608.110398.10677098110931666958.b4-ty@b4>
Date: Thu, 13 Aug 2026 15:49:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/zHLYQSI4R4jNfkJnN0lpe2m4CYSoK7MZtGL3F7WzFg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4oJGTz+OlIQjenOGXYeUenggQ/tuAFV1Uk7
 SqGjcz4RQ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+KAAKCRAk1otyXVSH
 0MUuB/9f4IPXJOVo2DMEnZrv+v9vZKzwkv+FwtAvGOJ3u6GHdzPhfDFsgry26eWVxzMZFqf4nZA
 QXBynbca1mEZQj1QwAcsWiCvclnt84uud1tP98j/9wS6Vw3OKPAdi5V2BPIH0hx2Y/ivcWIE/ar
 yXInRPw78NM6xAu2RCm1ckmN03QsjYJVk4o8SCtyDsrS0HfLJg3DIvivqdVsElyZZlsDWpT0chI
 113r3MHTeFFReXshkfb7t6fCtk+9Qc+zGrMxBl5qxxMOlcvPQu5zFBXErv3xZeEZm1HcL9C2uIR
 MPI8T7FTIUm0eHOMwE6x/+NHPYeOna/xIu82/94V76e/dTbr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 10 Aug 2026 18:35:28 +0900, Chancel Liu wrote:
> ASoC: fsl-asoc-card: Restructure to support deferrable card binding
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The ASoC core has evolved over several kernel releases to support
> deferrable card binding: when a component is not yet available,
> devm_snd_soc_register_card() no longer propagates -EPROBE_DEFER back to
> the machine driver. Instead the card is placed on an internal deferred
> list and rebound automatically once the missing component registers.
> As a result, registering a sound card no longer guarantees that all CPU
> and codec components have already probed successfully.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: fsl-asoc-card: Drop mclk management for nau8822
      https://git.kernel.org/broonie/sound/c/4c51a83a4fe8
[2/3] ASoC: fsl-asoc-card: Move static compatible data to platform data
      https://git.kernel.org/broonie/sound/c/76408e27e60f
[3/3] ASoC: fsl-asoc-card: Move bound-component setup to late_probe
      https://git.kernel.org/broonie/sound/c/de27e0cadcce

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

