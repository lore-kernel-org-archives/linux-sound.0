Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54632882BE;
	Sun, 14 Jun 2026 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781433194; cv=none; b=P58DNjV/viBrxFUzcH93rwc2pgtLhLGrD+D7r5S4j6hkhqBuQyeRx5GBETnXmpmxfvzebkmOtaAOM4pMcXK/FS5qY+y+eiISEiY/SGqZSx00k+QLM32CHIcYFRmtwONjZpY+X4KqG69Z4zEFcQFBfdJCZmVqTGsuFk3w/FU3nO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781433194; c=relaxed/simple;
	bh=91rZC7eRjfoHrghCqA9YiaaHwcTyRV/kUXQoWeAcils=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qOk57jP1Zg9QCr7OrYe/3ubh0I1aPlagX8ZEdCswoOjYfcuVtGyWVlOKqJXvqzNTkiJYA5LHzSDUAcqUn+8mDkHKF1AmhD1BR/glDKFbvJLFT/aP3vF8t9derHME+ACd3k++gGrD+W7eXyUFcFd4nZNY0hdP2sob89mNDti5l4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hqn48KJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hqn48KJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364F61F000E9;
	Sun, 14 Jun 2026 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781433192;
	bh=5CAWX7Khbfdhg2hTGawClZJUL/llZb6ih9KuiMJqalA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Hqn48KJLQ8aBpBiUDBYQPcmOzCHiMAM7fnUiay56tkfLegVH/ZOUemtW98GfWJN3n
	 ruCicf28O8Zt0Y+nElJCYH/mTuCXIl9KsEcS5MlooR62fI0+MwTO/CjM81XIXR0K95
	 ye8TXU0CFa2sL/xWa5HmNIes123Y3YaA9bAAlonK5XxTeKuO1RjjhRtfYWkXv/gEQG
	 JLYIYb3D7zVdZGycs4wr6HXKbTcQ4LZxnwNHD/RSnXif8fbO0t0WaWJZuQ0yG852/B
	 XOhAS/jO1agtv6+4K2VzWLRF/x7mVz4YeAQ75U9cxaoOomjij+nxv1LEmtCLugbeh9
	 CZv/O40E8e+2g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260612214911.1883234-1-robh@kernel.org>
References: <20260612214911.1883234-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config"
 type
Message-Id: <178139542165.17453.5870015259096662229.b4-ty@b4>
Date: Sun, 14 Jun 2026 01:03:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=91rZC7eRjfoHrghCqA9YiaaHwcTyRV/kUXQoWeAcils=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLoNaEd5TK0M8972lDUSeOcsiBd/rpU64C4Nwy
 KfETVrmOk6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCai6DWgAKCRAk1otyXVSH
 0AubB/49DTBtPXNFlKpYVsNh1Is3R52p7Jjzy2fntg6f/q0f84G+BshNh7qc8tbfnbkf0R7B5Dj
 s6YPqaCNvUXZCIB+U7IgZsdCviPj85+0xeDIRaybZwOX7qpKbYNQwRj48gkxC01SBt+DzJchjT2
 PwOgacFEgC51/vqfDum+VDvkJbZsDwXB14ZYIe7bGoFlVWx2dGNH7QLrLIu//Pu8q7tbFsGTeum
 3g/V13n08ESasnA6drp10YfwrTwApD4sI4TxgKOOmrC/nwR+II86x7TWboDZ4qEKhxiatzGU6dn
 eQFsYFhRhllOM7JYb3CTODmwUGiDdzWgpEHLz2U96BAAH6AX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 12 Jun 2026 16:49:11 -0500, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type
      https://git.kernel.org/broonie/sound/c/4346d91cfa47

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

