Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48067499F30
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286780; cv=none; b=nhCWSTaHOxC92ULMqqC4rrikbBWS1pNQPYNC7SGuOFQHZKN7Mm4sFE4z0EhMy6o+j4XIQQoxWxLijjkhimsnff4HDZq5n8bI7Xv3Imwv2NcOnHnF+PXGYJPGjM2Eg3W2Up2ZcR1Uc2WkmKJjYcBEA0i4vyM2ECQWnLUhzW5T7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286780; c=relaxed/simple;
	bh=HrZKe3HTv2E9OL+i9H2UBkmPh3qvELh+gW3Mvn1ANuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uyPv5BVIf+KPGq+GClCglVMBrpZHjScrzG/H2TqqGMY37vEzMGBtFFF6jz+Ss69zRGBdd/1N3kLj8YA6Sd5FsoN7yAfNGXIT+tIESY2ud2LdHHIFlUAFTpnBhbEOVM6UcEc5D4gvjmtv5I5L+CrSu+Fhaj1DWbMrNiLQlyvrOfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq7JhXWA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq7JhXWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F6C1F000E9;
	Tue,  1 Sep 2026 18:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286779;
	bh=WtaNq2UvqQBpGh6LnMZrkbOKw8II7lTG2tggnekkpco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gq7JhXWAABdtPD0DGtdmZuO9Wwk/BWjW5/D53S63zRJJuIZ2kGevT3Bf/828wv3CF
	 woafO56ETFlmDejIOkf26Dm5mbZO9zXvK9d4hOS5OMid9GvpD02lFR5HA1iopPSeK7
	 7rQvAo7C1YKSdfJsh+Iv2+AUg+wOojb3pbWxVhxZk+ZCCicBHvoskY3ARBCCZzqOGn
	 1F+nK5CpcMBpl5bDjFdHFiMxqc72WMuwzXB/o+vm30VoRow0NzYgZT+MpzTg9R8EcD
	 alANZJqsCz4gg6mUarG7Ng0LEqb/bROLt+/04tz9bXZI+U/2sT+t7wBsVd2NsTeZfX
	 nk6mS84ZJ+skA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, jairaj.arava@intel.com
In-Reply-To: <20260901011951.230315-1-yung-chuan.liao@linux.intel.com>
References: <20260901011951.230315-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add support for
 nvl_max98360a_rt5682
Message-Id: <178826836351.33904.4775441254069625520.b4-ty@b4>
Date: Tue, 01 Sep 2026 14:12:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HrZKe3HTv2E9OL+i9H2UBkmPh3qvELh+gW3Mvn1ANuE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxc3fF3gBTv1p5OwMfry1nVJ+4N19ZvSGS4mx
 sfQukSspCmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXNwAKCRAk1otyXVSH
 0AHcB/9lDSHfRX5arHETCPFAml1eHUeImmFEwYu6mamlIe4aPDsrUfDHws/f9I00Q88I48FVCK7
 kCKD76uO9ZsnMKjVJYQ3oQzCwvvcVmkQQIePmasww3GIJWrXVbNDm6JcoIJKu/XTOdSBSdjkAqN
 hKLbfGSiX/JDjsNX4Mi9xeKaJcOILpgZbuSEO+sLrPpYpQhv2rp8WxQlhGOjxq0zlP5kYTqgfC4
 foaryJINBlxyWbWN9X8MF1BFxn7UaOwBiLGeYS2Mrjh23fugPkRHOi0kAtzekydfh1catpVCx6G
 FBz/5lom4UW2tbseb3+FnoCf5po4uyUzDLuVfNdCPV77RD7u
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 09:19:51 +0800, Bard Liao wrote:
> ASoC: Intel: sof_rt5682: Add support for nvl_max98360a_rt5682

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add support for nvl_max98360a_rt5682
      https://git.kernel.org/broonie/sound/c/4ed5bfc41071

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

