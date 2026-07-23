Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2EC2E1EFC
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 00:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854738; cv=none; b=DtEaDmJ25VkYmqyWUJ5G+Ai8RRAhbr1zcQlpWslmIOzyEzVF8hG/gZ6e/OmIXzqbyrhS2Xe7FaV2n2q2JD3YRkLEdrJBvA8bo11GfhRP1H3ZKtHaxABClwjyT6vXB4DBFk4629m7bWNoJpxnreyNhprt6XsFLMd7uB+fJsLTanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854738; c=relaxed/simple;
	bh=/J/6h+D0VmAKhxARJazX7lwdAuozYolYT3KXxjQPIZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lYfKt8LXlHEPB3VzYtexp+cwYxLkyK5IXOO2Hrvl4dMMrAPqzn1gSZMRcauqIcuN1aQYpjAUbvwCJ5j9z5RmH/BRzwc7U9A4TJr47FQOLRqLQSQ09wL9s+Gn50eoa0PuVYZetjk3GXpbeyeCgXV44rV887xVjOfjWgq1beNEK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJVnVlAG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJVnVlAG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF71F000E9;
	Fri, 24 Jul 2026 00:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854736;
	bh=hiKris7HYIRpR+Komj28ENPt0b8rY1LMTenhCMiH1iA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jJVnVlAG9h5vuazg9+i9ZM6j8KIBhQcopDZGM4clIXpdxyLlsihTyYvlf0PPTjHJh
	 +xoeaXyz5qkkjNQG8L1IlskFBcTjkt5RfPfroh88ILme79bDy+zR7ln0KP0K0aLsQB
	 LN3vZOMJ9rkOEuw0vyRwO6cpOmfRImPmr4alYgw91VmScTOJgsAdsrj6H2Ujns9Ab2
	 CaR5JOvNBKRxnAhpGxWaprUOawDzDrQqK0EUqgUwjFs8oLOQvKCWRTz21pUQ+AyeBk
	 I5dytvgy1NFe4m/KVHp1vSyNSuFB0LY88BVe5NXAFUp1pmOMnM1/Een5q5uWmJUZJM
	 zmriCU6nLzHWw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: meson: preparation for Card capsuling
Message-Id: <178482430714.53486.303953655618538220.b4-ty@b4>
Date: Thu, 23 Jul 2026 17:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/J/6h+D0VmAKhxARJazX7lwdAuozYolYT3KXxjQPIZo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjNymFE/Mui+RSYfZnhir7yM7AXdyRkq565Z
 GcjiWTIcr2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4zQAKCRAk1otyXVSH
 0NXgB/46dsP7sWXpK2rNuHKOAQzVL/WAAwU+CYqJ4L+RMQxZQvrjOdEBgty7xgfxqNG3BSYio72
 NmPcqHMtaK5Ewx5Qpd7sm76ySPPtOzExFaLmj7SF+0x+7tmThr8Iudd9fj6U4mFmBV02RByyffC
 vl7jlRuCa2heTU5YaV+Rm3XzmdIH9Y1wTtoYcC14+scxnAR6hH65AlRD8/RE5IzzR3r5LeBBbxw
 HHlcsafMWta6XT+bC3gsFQZfVs0jxaKN6sNsFGulNFtnG1PGSN5vp10ROyTsIG/5PopYSuXyie3
 1Im+APWjo/gWgSGeqjjuWKCEKYAj+jYbyIp5MtCHdrnVqruD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 04:11:32 +0000, Kuninori Morimoto wrote:
> ASoC: meson: preparation for Card capsuling
> 
> Hi Meson developers
> 
> These are v2 patch-set of meson preparation for Card capsuling.
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup meson drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: meson: axg-card: tidyup not to use card->dev
      https://git.kernel.org/broonie/sound/c/13651ae6548d
[2/3] ASoC: meson: gx-card: tidyup not to use card->dev
      https://git.kernel.org/broonie/sound/c/138a0faeaca4
[3/3] ASoC: meson: meson-card-utils: tidyup not to use card->dev
      https://git.kernel.org/broonie/sound/c/6c3042f65f20

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

