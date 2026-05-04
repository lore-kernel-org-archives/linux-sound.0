Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE329D28F;
	Tue,  5 May 2026 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943317; cv=none; b=EagSH64Kti2iwlb7wjWdWASPQg2urPXuOzvYf5ovykGhLqsspeHqfNZsu9aJlSwYHtIAXtSKmlKg8LZw/7vjqNsBxTSSoVRrrxL5Ho9PtAIpzHGwYfXcbxkdYrVB11prSSgLtGbh2O0OeGmjarUfrwlOJVvwaxg1capOfehnssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943317; c=relaxed/simple;
	bh=bnoOXAL7xTORjb/8Cu3GUb/QlzVJOk8dVBnhb2EZjIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PM+y9uGkIlVGEkYNUj+9++rNEVrt7mZqtVDhmSkq2HKWrffHRwdwzAPKbHu/CvflUS48m3j/B9r+GFf/nvEfTpOy44TYlSC75vsACUbpw80u9UVHQzCnraLtHBUZqC1RB7gbI9i2qBC+O1+gAs5ZDIhvIPPr+x9tm00oEcfAN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLtrpj6t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLtrpj6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4933C2BCB8;
	Tue,  5 May 2026 01:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943316;
	bh=bnoOXAL7xTORjb/8Cu3GUb/QlzVJOk8dVBnhb2EZjIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PLtrpj6tpLe/P5dS48tbmxJy8LOJtrVcoByRGz7+/zNMIXnX7s0sNlcD1NJmYlrZT
	 XMV66c2mik7e+EbutT86A0yYl/xsKPsD7g49wMkI9ffi7BggXNxgVr//+5CpSvG883
	 8hHi/LS+MMQF5+9V1QdNcGOHHvQ/3cs7DmCnzL0nTe12eYz3CI+o4IvxYELcpK7ol/
	 R15tKkQwjYB2sKAQ9yApfsaukW4TW1HMrz8BSaZllkccX+YGYetmfrZHgsvXF3TgkE
	 JYZOi1BUlddNe6z2VcO3VX0CmidBKoEQ2kw+4YSHQ248EKm7MAbF8gGLdrvKukVCBY
	 mIDrUnWeZgsNQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
References: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/3] Improve SDCA support for duplicated features
Message-Id: <177790108888.458539.4416980890401632439.b4-ty@b4>
Date: Mon, 04 May 2026 22:24:48 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bnoOXAL7xTORjb/8Cu3GUb/QlzVJOk8dVBnhb2EZjIw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMR+Tl9WZHopHpNuiIktHhfjtFmQE3y8eS97
 XnrO0e7K2GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDEQAKCRAk1otyXVSH
 0FpcB/4g8YGGs6/kfIw+uiyk3KtVcG93w1mUH6r+EMXlQaptUSMua59VeU/IQRCd0/7sQ6zUWzJ
 RX8WNrpKIkvMcm55X1Q9LHAN0wCOLWX6wFLEIJw98Xjax0qHoPYhExZKvBWxwxBvlpkXPJ/hmDi
 uJT/DcjdAGpxotFe20cCMH/I4Kv9gn4zQGYNJukm6AOY34gzgGUayvbV6WYMD1q68jfuzEd0z/y
 ZW3Bk7LK4/xe5D3iVQIj3PVJtN58E3aFsSjfuNUuVLi3mCHBduUyOfqAoTsEOSFq0KwFoKLWo9p
 TYA/Ccq8glPgCf9zgCxT+nfRgyAoWrelE2zkpBxMErGRP2A8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 16:09:28 +0100, Charles Keepax wrote:
> Improve SDCA support for duplicated features
> 
> There are some short comings of the current SDCA class driver with
> respect to duplicated functions and jacks. Fix some issues in the
> reporting of jacks when there are multiple jacks represented in the SDCA
> topology. When a single device contains multiple instances of the same
> type of SDCA function the current class driver will create duplicate
> controls, update the code to fix this. Finally whilst working through
> this also tidy up the handling of the sdca_function_desc pointers as it
> turns out some duplication has crept into the code on that front.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
      https://git.kernel.org/broonie/sound/c/cb3c257e0824
[2/3] ASoC: SDCA: Remove sdca_function_data duplication
      https://git.kernel.org/broonie/sound/c/df036250d7d5
[3/3] ASoC: SDCA: Support devices with multiple functions of identical type
      https://git.kernel.org/broonie/sound/c/250922577ed1

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

