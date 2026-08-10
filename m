Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D242C4E3
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380505; cv=none; b=dFFv9O/qsX3uSJ/njFkU3q5fq1yjdYssrL4XYui8mbIQOm8UGiymYsjqXIRtq/5EdNLYFClEKwz7hfKKRSvHVd5dJiEdpwFOlym2442HSomgOREfcSWmH22SpsZracHLh51NeJGwxTQkkVsIjGaGWEYoF+Cl1heW0/P5YgHEuiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380505; c=relaxed/simple;
	bh=bWCqiYDzg+UCsgY+rUcpj+sy1fpvfgzvU5kGvelbjPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tj6Xc3m9bGSwLSCw1yic3jGdiSJsaIKNvBBfuM2A4ciZcEBsLuEeTlGnKGkivV3BCcOj375lKJWM5hdTxQ2wtmCnWmUBW7q/THp78/aNr95usnOu83sj59O1TmQs6ptmYkedD+4j/3hzi9McuV6xcyFse/ASGCEfvsKw8iVX4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPWvC5Tn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPWvC5Tn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CFF1F000E9;
	Mon, 10 Aug 2026 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380503;
	bh=r+AeOLPbrsL3yUxkJi/4Fdm75CpPUzsCo/edWcnsE04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fPWvC5TnYT/NFdt4KeTMCVB1of7HKnr96eABsIY78cF1p7aEX0X0egYJFtJGDS0QV
	 8UsSQ6wWd51Vf8ct822dqoCDPtDo9WTLzwJQQ5/yoFj+2E/qfXu/Y2s7okE4C8Gael
	 LFQTqvDdN+2YXOXJcxg6MOokD0wEUgOgj7NyTcl6uPtE1lSrXgpxkXuKDW2ufcgTf2
	 PxCope+/lsDnPLYeE0dZA5r1AMq1/l6+wxLfka+HcLCErrdtrlnmv6wKR7PDzqgMxe
	 ceMF2mtbFkx91iQv6nsRb0DDBHkHEbFBUpR0jyfMVI5rvtJPxhsRFm5BACRJ8OHvlb
	 Fl31lUT/pm1CA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Lin Xianglin <1021538027@qq.com>
Cc: linux-sound@vger.kernel.org, Vijendar.Mukunda@amd.com, 
 venkataprasad.potturu@amd.com
In-Reply-To: <tencent_428392223C2AD3BF23E7ABAA7521FE5C0C07@qq.com>
References: <tencent_428392223C2AD3BF23E7ABAA7521FE5C0C07@qq.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming
 Laptop 16-ap1xxx
Message-Id: <178636518244.155010.2458739450437226019.b4-ty@b4>
Date: Mon, 10 Aug 2026 13:33:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bWCqiYDzg+UCsgY+rUcpj+sy1fpvfgzvU5kGvelbjPs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqegDVEH4gF9cKYxy23rHAgZsJhB+3683JOrfck
 kIDfhWPnWiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanoA1QAKCRAk1otyXVSH
 0N5pB/91TKQ6WbrBegHOIYIFG6sBlGufHmnJ95yljpR50zBEP7hPTl2kI7cIWUo2eeWPzUeKo9P
 EL7HKVutuofbGOTo3eukJktQHe0bc2oIOA0+R0jXLpH2rNg0r5wt8WjZhjDsmhqmgqouwqOjKHi
 c9HFCOM4sTqCAg4sypxznTD/I9Lhpv4+RwRAfVt4T0EhJAHM26IW7LChTRcePnHrMBgOedUlhsT
 sbgtce8E4va13G8G8Yvmvd8KZA8moI4RvkeYSOsB1A6ZlHIXXEYpeb+ZDAHy052g3gMP5aM6SNJ
 pbifmgbe5GvVEmxkKflRe4wQbv5nKJ/LkxWikEE1FSFLzetc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 07 Aug 2026 22:19:43 +0800, Lin Xianglin wrote:
> ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx
      https://git.kernel.org/broonie/sound/c/fe21db8c5e7c

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

