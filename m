Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B948EC71
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 18:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408983; cv=none; b=kwK6l2r/BAZFlmI9vz5K8SK9Bs4rgLR0GfNffziEBmbIVcYyJTnqQffBZXZYH+8Qy0bNLG2IOWsrXf4FGJiCjwXaVoLD6eLFEYaL9PpigG7H7eBva/1bs/yKlOIIWJ49EgfYpDJxvyF9P0WS39GigPHcyksYWwAVw8JaTK2bfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408983; c=relaxed/simple;
	bh=/rNHJ3rUR46A985iAA8ylJTVsYDxIkoL/TtliUeXJOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oVkjtVvS1YTpShv6i+fa7rykEZR0q82SwhNCXJLrISk0U/Oz7GBzRf4u/MBa3zH8bmSBRvF98LqfLj3E+CzmIO8T0LSUfYGxJXXgnCiaovcbNAUKgv6/0wcuyy2IHok4rOeRLTlU9B+zz591ryGuz+/WqX9duS1juBnkkphwdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLUM04VL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLUM04VL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26ED1F000FF;
	Mon, 14 Sep 2026 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408980;
	bh=GebP2Fqx3bL6Dk2JHckmMKugy4bvrHoTzflhf4l2Tr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mLUM04VLMWOBgAl5D50n+9v6JaQ1DxZyaTTBI+WcH26XpUJNpaMKp110fLizTyli1
	 SROF7/qLxO1mwBpxExSx6oJUWQSfkjGkS8PvN/9GoqLerp+TX89bdYGq5F80B5pZF2
	 rmBZRQSzPs4hQtIvlTfFhCK4Ldmj1DOyLmb+WK2JyRL5m+1pe8M/Fduq4JdIhoUOSX
	 vtqsY/sN57FCmFOrEIk8yQHaUCUxYGSsfDDrOCkfjzTMnWwWQExGSfUs6MQu/mdCnW
	 Db1PH+Sgqc0Hyd9ZMLC/V26pSpoat5F4rGSSDL6ct7OjBo/53KfQGWguqWulI7sE0a
	 ZhPDQS9slqT2Q==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260914101917.2969665-1-cezary.rojewski@intel.com>
References: <20260914101917.2969665-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Use list_count_nodes() to
 simplify the code
Message-Id: <178939581401.1239410.4823195178770792521.b4-ty@b4>
Date: Mon, 14 Sep 2026 15:23:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/rNHJ3rUR46A985iAA8ylJTVsYDxIkoL/TtliUeXJOI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqDbFGCdbqaXUgoiPNhRoGHHLw+z539Ak1nDvB
 gPDYCiAhoyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqg2xQAKCRAk1otyXVSH
 0OjaB/9wRb2F9G6l7TR28o2MFFV+pmYv5lLfwbz5DmDj/QFTy7In/hdZcRomzxxudGRQw7hKVcE
 fOeMhS5fYnhDKyqEAQbBm5c4ThDGtzRSLBYfbF9WLqYBpTfG08Q4FGICtV+LBc1ODwr0ds8663X
 kylQEVnPyYcrZJ5bNA12GT+jVX8GMgPrjsHmfsqJEHLtQQTl1RkU/0it9uwblitVns7TGNIxq2i
 TuBwTLwek/0ZnNego7ItysmU7GuwcMj3W+tGsT6TyLMbhso1McEQ35AjzATX8lgqs4B/at+L8P3
 9KBcIGvTN1JtZwPgOuniAszIql8G7G++mJrM5Zwp7wA7H+Qo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 12:19:16 +0200, Cezary Rojewski wrote:
> ASoC: Intel: avs: Use list_count_nodes() to simplify the code

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: Intel: avs: Use list_count_nodes() to simplify the code
      https://git.kernel.org/broonie/sound/c/bb1719bd0caf
[2/2] ASoC: codecs: hda: Use list_count_nodes() to simplify the code
      https://git.kernel.org/broonie/sound/c/3411fcf7e1f7

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

