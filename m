Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516726B764;
	Mon, 16 Mar 2026 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625124; cv=none; b=qxLTd2Zr//HHahT4TqJrbiV5LJAFWK5FaCXIR5H0S0fyZRnH/5blRe7m+0iLSGXWBF2NSx4wJIzsKfcsiCTJwzcSZB/JFWmUk86TkfM/ysBeV+znCzTjC251DlBtDe7J0GhSY7hMbIKVKQVN2JQgbluOBgPQ+xr/ffT9rRZM/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625124; c=relaxed/simple;
	bh=kmfRTQjoXdPjacqjD1ZgPZ0QaWqPhPBOmyHNBIJ2tlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tmoa4AuOVdv6e6P7jWD6raA8QfGktouttZ48uVCsF0fxHzm2jF2JZDafAYpVlI6UwX064xjAOwg5JJ23wIpEnJO98tOdBmC6z7oPaPAUD3ayyWKtvyQaoBt/NtPwwQNy+FMmYSHmMtu795pim2anRiDWibiDMacsKuxG9eoG+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgWqqNSZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgWqqNSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5933EC19425;
	Mon, 16 Mar 2026 01:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625124;
	bh=kmfRTQjoXdPjacqjD1ZgPZ0QaWqPhPBOmyHNBIJ2tlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NgWqqNSZTfLHUVvj3bqBicJWCziwIdN+c/7mPCAvZLGkoj8nem3+1THbCx5buCXEy
	 Var9o+7V1q7qt3Vm+5i9vDW8Lvx7B2Ke6KbbxDB2PhUfJqxpnQ0DjFETpC6p4UDt77
	 1X1zTs8P3BWGUNkTOCAfjUGk5Mn6OyA49HDdj+lVfYKrjnIFEehJYZwN6cflXb6Hj+
	 Mb0aNXnbikMKc2lIiu3VOhH/ZuaWVONgaodbj8fa5equsPjd0aiQgEfeChD0d2/hK8
	 36EOb/m7y3Uqpr/7fUmycq5XQnQ5Q77AKKp37RWgUC5iiNqWrwvIPyKKKtomMf1Ri9
	 sytwTg4JdqUDQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 akshu.agrawal@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260310024246.2153827-1-nichen@iscas.ac.cn>
References: <20260310024246.2153827-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Add missing error
 check for clock acquisition
Message-Id: <177352552725.149922.13268331420372930788.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:58:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kmfRTQjoXdPjacqjD1ZgPZ0QaWqPhPBOmyHNBIJ2tlw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18hGHjb1owAfZjt5fqS8bF+aW9C1PSj40sJI
 jeE3dAIFPSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfIQAKCRAk1otyXVSH
 0KuGB/4w0cio4vdOk3HdM83UhFhBswlhHVnpsOwEon1ukJPguaaOMN1Rcme7JV3PjB2iSn5ihGv
 1cqBlWVdeRa4Od6sw1SdFhTRlbJl4jWJom3Dy6ICiE59Sfdq+dw6bwy+DaLwQ1jZ2zxaFqA1emy
 03K51E+sVp8JhfnBfvr+z+lQKoS/VILUwuCWxNS+sTYShUygTnz/LPSJRI7b0HP/u77wS5UH5Pg
 cp6dULjzmfj0+tWOQKs/9FJg4TT8yWsvssfdSXEVJsag8O+7SOTu8vs1YPkuUvfalGfN/5TEz4D
 Rm49b/NcdoHctOUYuy+jNWiHaqv1jIlAFxJKGXGHfGa7UZMx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Mar 2026 10:42:46 +0800, Chen Ni wrote:
> ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
      https://git.kernel.org/broonie/misc/c/53f3a900e9a3

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

