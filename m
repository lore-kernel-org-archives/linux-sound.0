Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F53C3428
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926884; cv=none; b=Xkye5qUQUO8Z1pmuI8TKt108E61X71c7NkLVliFqHwpehv5BVGOLYSKbMYUKISUhvrJq31u1VWl33rHD6C/J2QVb9MtiUnls4ERP42V5SMoEmzkZrLlXLvtGy1QGvwKRe1ooHyKHK4y16RDjcUNdnE7CFVX5ZyUk4ityvlzgKOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926884; c=relaxed/simple;
	bh=ilFxC0H6O6u611nSKHK6oBMJMWs5ipeUicuMUc1Ms7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GfDa9VMNcPFo7EFPeMZsAwoOV54bq6GpXr72JIY1ItKzZIq5+1QKOgb5tNpapi9VI24Br2+daOlYdmJeWC9bPMc4wtbPncsxq0a3v12YK4k+rxThLgXAF9wE9XMF6o4ESDy1Cd57xFD0+3hTM8LrMhRUlOBroR7Gfj5ymJ2a0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlxrnW+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlxrnW+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA821F00893;
	Mon,  8 Jun 2026 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780926883;
	bh=4PPooc47SIssOsjr6WACf48tzTHmuEGMUIVbnC1Md0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IlxrnW+C5YcgwlKbYNcFe9m6H74VC+rTgM7x6B2uh/TBqD3A3gtmmbOxy1QK8VYZF
	 5vlUCAqgkaZUfOS/yD1gdirKyVXCAnjB+ZY3mOBTns7FNmJYivj74GMS9gBIrzGJSN
	 WrMjdOX0Elw7nbaTLGieq8W+F8LRfago0Q1eS9ExMeJnvzAxojxHTBxFboGkKHt7Ck
	 Np+tfDyS265ajaLGDMgLiGOzfcSkf7QiId5steaSiziL8BwgLl63Hjz2Ek8I6IXxMe
	 SK2fdyq0By1532JyrqVhePqTw8FkFk+o0zCru4fHB8lggijpOJcwCvRz+YdQLrPPA2
	 RaRYE+wGmuw7g==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 0/7] ASoC: Intel: catpt: Code cleanup
Message-Id: <178058884333.53724.12410643514620540112.b4-ty@b4>
Date: Thu, 04 Jun 2026 17:00:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ilFxC0H6O6u611nSKHK6oBMJMWs5ipeUicuMUc1Ms7Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJsmhPdu2AH+EV5GlziQFh0df0Q9zbcFirX4Ix
 MJU8Vdr7JGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaibJoQAKCRAk1otyXVSH
 0CqhB/9upk4tJMuwlcnRL8lfU3mOAW0+YypD7wJ0IsVun7kQroR6ZOZrgC0W/31JIJ19WcO7slD
 r4bAcM+7XAFCPZRBptbSs2MxdhpjTq8Hs10jJoUtO3pQwhtUARKQOACowaNitv/Le2plzOqzapB
 cZdzuTVDTrLK1m9KYhtI51E/qJAjakOHP5+pxAll0UEUQ/N0fN/eZLyNLMZH+rs7/6T1anig/d7
 QHmKwOwsptLiFr2T8TfKVHR9y+ErlSKwEYZrtSEwsf4Mfj5naMjuk4WhgcwFQ50dXpt4I+wjz3T
 W+n9lGE2wIjojxfiBOVbkt3jsnF3wM/Tzb3tYDOvnjQblfC/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 03 Jun 2026 10:58:20 +0200, Cezary Rojewski wrote:
> ASoC: Intel: catpt: Code cleanup
> 
> All of the changes found here are cleanups and from functional
> perspective, have no impact - either unused code is being removed or
> existing code is altered to use helpers/macros to improve readability.
> 
> Collateral of recent fixes [1].  There is one more patchset with similar
> goal following this one.  Before the team managed to actually fix the
> problem, a number of changes were added to make the code easier to
> understand for people who are not the author (me).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/7] ASoC: Intel: catpt: Utilize lock-guard helper
      https://git.kernel.org/broonie/sound/c/36685d0b05d9
[2/7] ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
      https://git.kernel.org/broonie/sound/c/a88cd88eee75
[3/7] ASoC: Intel: catpt: Simplify the RAM-navigation code
      https://git.kernel.org/broonie/sound/c/fa55ad6079b0
[4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
      https://git.kernel.org/broonie/sound/c/f40e7873cd85
[5/7] ASoC: Intel: catpt: Remove unused WAVES controls
      https://git.kernel.org/broonie/sound/c/89f7afd3e26e
[6/7] ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
      https://git.kernel.org/broonie/sound/c/f95ac7d0c7bd
[7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
      https://git.kernel.org/broonie/sound/c/06152e336861

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

