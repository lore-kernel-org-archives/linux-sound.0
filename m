Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29122DB794;
	Sat, 18 Jul 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375503; cv=none; b=KCbpjSGYPW/4q1PdlUddEKOcBlSU5ugCjwefnkn6FFi69dFFWzVbcguLoynU95y+Z1m/O+oyoYuSkYvs86tfd3mCpAwxQsyMFgPPImLunzMePGtJ/YIP4vVZthttIQScAHwYIcGK5zPCCKOs9ttH7CU76DAekOFxwXxfMqtP4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375503; c=relaxed/simple;
	bh=iiw/mcB5pNjz5VfaoJM5gH+SelLv6eHVRPQXQy64EiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WggXgZuUWC3wue8PwdhAyF0v7GqkddO/16SiHuKCqZZBSiIjjjtcVHRhPK8iCVCH8Pdz+Mf1BVhKM5I3vQY9dcYAzEx/632FK+JaB00BmH0jMnxN1uM0ZdBN0AIT7e4/NzXMorKOyxhjK7PbRrkOpzFVjpiIf0+RvMyxEaY9pZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+RWy1Ot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+RWy1Ot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A61F000E9;
	Sat, 18 Jul 2026 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784375501;
	bh=OmlASOSbFcJxUSSqtIMS8xDLwmBnoHzjjhpPDvSZZ/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O+RWy1OtF+5yGh3myArYV1DC693sunHCScFBgCqyfXVn1YFqSE8y+CUS9IMZ+EFe5
	 zuE9TYw/r6NLZ1Xrc6LOxxn+WIpnt4YEzexv062iMgvjGbEjFOcS86pW4KrlJyG0sc
	 EgMGVaN+D9TM3n21uCNsEqxHRfR5CGT67rRwczBrh+/aObJTNMl+SAAQBidb4UCd2C
	 7nT/vuSUpI9cK+A/x6RN3+PQ2xStf/Q+Hv+n7QzwDIUSgC2EoaA0Z0sE745hiLeHYC
	 0fKlWgfvT/o1IvR6SCTp1dLIvHUf7iY+kuErtI4OG1Qr2nMEoP/qrrUf1xH67g3dPg
	 JZvanVspDKx/Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, david.laight.linux@gmail.com, wangdich9700@163.com
Cc: wangdicheng@kylinos.cn, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260717091542.721877-1-wangdich9700@163.com>
References: <20260717091542.721877-1-wangdich9700@163.com>
Subject: Re: (subset) [PATCH v2 0/3] ALSA: Fix compiler warnings in sound
 subsystem
Message-Id: <178433424139.61249.5529277845421219821.b4-ty@b4>
Date: Sat, 18 Jul 2026 01:24:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iiw/mcB5pNjz5VfaoJM5gH+SelLv6eHVRPQXQy64EiM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqW2jLJg6MqlKVd9ciaiykBqT/0NeC9QQvhk0P1
 YAs3wptoVWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaltoywAKCRAk1otyXVSH
 0NKBB/wJ1nU2pH3WcHr2JbV6x+xWK6InTSCjUFGa2PjBhqsx7r0f6GovjGoP/Ek7GC3+WNcN81D
 ijzrnuH6G8un6axmDZptBpQMMDCt4adXyYLQRiMxdywj9CNmcq4bfS85qRJFyoDHkwXychMdSZJ
 ccFsY5C1QgezqWuKZv1Pebr9ckXUXeEgyg5SRl2nJnz++yB30yRy5FS/KY8MZTilZbXxpqW5h4x
 LJxBmP10GVS4n+NOiEBAf8guspGaAi+3oDmsjoY+jIyqvjKGy+8xn366lJZPXztcGxlcRbV+jhA
 rMlsO/fU+OQbZ88eiqnolsl3ErrXcH9H7VhIzgNWzZGPkx67
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 17:15:39 +0800, wangdich9700@163.com wrote:
> ALSA: Fix compiler warnings in sound subsystem
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> This series fixes three compiler warnings in the sound subsystem,
> covering both logical redundancies and a potential runtime bug.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: mediatek: mt8189: Remove redundant else-if branch with identical body
      https://git.kernel.org/broonie/sound/c/fcf2a365da23
[3/3] ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division
      https://git.kernel.org/broonie/sound/c/a46ccc71877e

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

