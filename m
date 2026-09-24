Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984B485508
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331296; cv=none; b=Kof14V/d09Hh4/zZHUFtmCRkTEe+fxhy1e/+pAxeEB3m2EGmGEBR9m6dkWXoKo7yRUAsypZNw3vBMG/poH680n7mxrDTy+HobJ4fQhwSj+bbdeeiI0phMDUqZg/KTouq5zaHpYl3c45z3Q3/kufwhZi/8uTQpoj7REbyJaJqe5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331296; c=relaxed/simple;
	bh=EETDxRm6McrrWJOAIVoUoBhN1hvwididz9XoysGyKWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RIg+fElhjdPRUUHuKox3MbsUkeRb/RVaqmpHNW7F30+6y++PPENuYbDGOHOqwyFAG7oAu11EfBlTea34JxdvcLDZy/cnJsnbURiZk2DiwY2U3UVDKh4pIM8D6+ok/B7gG2VV2NipnAxRm2Fg3Fi6gL1xRw+s2ifxir//N3qebMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/PU41Oq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/PU41Oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862E11F000FF;
	Fri, 25 Sep 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331295;
	bh=XSl70QyDTNY9WCgP9965o4oSA8JZ9DtLeIeGyLHCvC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X/PU41Oqwbj3Ix7yIiIK4CN5qB4/QCxc6/BHnPcQxZZPZtrKQ3sk+qvdbX3vm8Wou
	 DAj8wrgopRzzeR/lbuG/os2iYTTA8WbCzU0a5rpYGUpy4gxBBMYJTaBoqKPcMlDsij
	 GP+gMNayKnv+AU/nV6mWNrlMjuimb0AQ53clGIceYdyruA7JHFbo8adMJ3mydR1coV
	 rjWr/0afbJVphtGyyDxEPtoZ3RnvU/V7+FPasiysA5kmSmvFUMA7mSxKriohDM88Zc
	 R+FBQYFrUZzaQrSvtOZzV1UWmcfGGEJcWbCAhgtziY1roed1uN7pNQNKhAr5oEXqD4
	 iboqNPtwbUy1g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Shuming Fan <shumingf@realtek.com>
Cc: derek.fang@realtek.com, lars@metafoo.de, oder_chiou@realtek.com, 
 linux-sound@vger.kernel.org, flove@realtek.com, jack.yu@realtek.com
In-Reply-To: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
References: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
Subject: Re: (subset) [PATCH v2 0/3] Add ASoC machine driver support for
 the RT766 and RT767 codecs.
Message-Id: <179027559554.149798.2544933409817982256.b4-ty@b4>
Date: Thu, 24 Sep 2026 19:46:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EETDxRm6McrrWJOAIVoUoBhN1hvwididz9XoysGyKWo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtkmbMS1tQVatS+efb2/qtny45QqdKT64UnkBF
 2Yv3I5hscSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarZJmwAKCRAk1otyXVSH
 0EQGB/0RZQk1wLNJia9RSVpza7p9FaiFMc9Jj1hXCpy06c8jp4H+iSBtJf0Am5cU9nwbOzVVvdE
 aDjSSK8nju1gFa1qqYG9WyX2TNN3NZK3pnEo/7XsquTVJwJ29tmZ4WUgzhqrlCjmFlOP25qaaTX
 Es/igyF5ve4vRaGZedjNZiY+Im9XBqTMdRc+IeIiByN+nOMV65zbv/m9nc6pgu8Or8Cj00jeYcf
 qHR5pfP+FLuZ0F3Lxgh96ZzYfy+SEMAFQZSZGb1rmPe0Iy50bllAog30svynhOfq/9CDFSk6p8A
 QiJ/vT+2rDBiAoUI4w+GL++zkNm7oV/nPPscXeQ5t7prAh4Z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 13:53:01 +0800, Shuming Fan wrote:
> Add ASoC machine driver support for the RT766 and RT767 codecs.
> 
> This series adds the required codec information and codec-specific DAPM routes,
> enables wake capability on Intel platforms, and avoids re-initializing blind writes.
> 
> The series includes:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[2/3] ASoC: sdw_utils: Add rt766/rt767 support
      https://git.kernel.org/broonie/sound/c/8eb2b0c88286
[3/3] ASoC: rt766: avoid re-initialize the blind write
      https://git.kernel.org/broonie/sound/c/be190d999369

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

