Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278B455193
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521325; cv=none; b=itm70lSf0EGWiU+fKK4oYfc5TOmNDhs6cvza/l80U7Vqxt483snweNwKwTyqxG1w1s206H18oAy8HeWS090+8kvtO1H1Eae8eXdlQ5wvu+mddJ5jwNw9NCCzH/vmDDwBYL6lu1d8X25j39Gy7ii29s3E4vGib0rV/ydjf8Bn0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521325; c=relaxed/simple;
	bh=PkNODvyahaVSqDblzIYFeZJfxtTXssFKSdT8/q8S8CI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Daip4HMX5vtdwJJI9Kxf/Gnkv/uhiEuvfj4b5hP/jjYHmCQXqFVzHfx30psGUhDgKxcwf1HezILc7fmCuP9ESOkNuidHix5dbqwxlzy+nY1gYYGxkZzILI2djL0DYfY0U9DqzZiv2kgr+r5X/k/1EehQD4C51GrUGVM3fZI+RS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr48A5fq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr48A5fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C4D1F00AC4;
	Fri, 31 Jul 2026 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785521324;
	bh=vEwHyXp14HnXHWBPDfm2srSpVVHbcTFaSnH8OWJadPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cr48A5fq2VBtXr3nI1DOA0bi34v338t6uNvQVk3LPhilrypdToiW1JajcqRgdotkd
	 UaIPoA4YWfxAHMi1QCCDveczFIy2AyHx6Hw56nv0QmVUe7JnuPrOKpB4JX2SPvp6Yh
	 MeUmXKLktgMur+NkNbgOifvVrDLqXbMiITj4p2Xw5DjbeqJYRnwJ/Y/Bvh/w3tvNOj
	 bXtIrFx2tPHfnv5fAPGz4VbGbgXHKNjHE5jmqjvk9kjHGlhpV6/hZUKMsJflZ/eDg8
	 WsgN25MTpyEFRqogX+Cxp/mg+0ByzLLfq+OTOfByHyTW+Wka/Z+ZKz9/mlSTCYtyAL
	 jBqqdq+T/zZBA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260731084114.4142106-1-shumingf@realtek.com>
References: <20260731084114.4142106-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: reinitialize rt722_sdca_jack_init() after
 reset
Message-Id: <178550306934.136247.5553168362758891439.b4-ty@b4>
Date: Fri, 31 Jul 2026 14:04:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PkNODvyahaVSqDblzIYFeZJfxtTXssFKSdT8/q8S8CI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbOSpd0WKjputyBsHOCB4AUc5fk6Swyt1p4dKb
 6/Akx3OV5OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamzkqQAKCRAk1otyXVSH
 0DvvB/0VUyJ4w4O4fXtziuuil8IWXzNE+dgFNBd3xlh91insgoBpV981eCLUjSXCkJCPt4ztFct
 9WpTEmoEj8ckJ6MSWHyfep1R5FpTNznLMsGFkecJeIGRIOfB2PUmbJqLz/hjKN6oUfqttPlpJWv
 Sx2jnnEtvM/RAwPXea7jqFozwX4GHw4MqObzT0Mgagl4YWVzqyQQ4lWFxyYOoDAJ/RnbrczLHm8
 ESIMuyi8f3AULpESkYtTkt/8umAJGx2K2os4itXiJ+KqZeHWZHNnSeGuC/lk9+TAOgOwy7OaYVs
 hZ+0WK3xfLpxlLtEqzzUKXuOMpG7EpymtRyshp1uGX4XS8Y2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 31 Jul 2026 16:41:14 +0800, shumingf@realtek.com wrote:
> ASoC: rt722: reinitialize rt722_sdca_jack_init() after reset

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt722: reinitialize rt722_sdca_jack_init() after reset
      https://git.kernel.org/broonie/sound/c/74a66323e148

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

