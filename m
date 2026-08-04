Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0DE3E5EFE
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925431; cv=none; b=XraRYDEqBicTeuptPIR39xBFgevbvBeBllSzjGD1k/jDiAy9dQ0JmwrzBLnmIdU1rIkDp+8IM/OVw0df2RZoeCPqJXpXeUWXSG3/RK4sVtOiTxNL5A/f/eKUfgYb2tLSsJ8VG+Mfwv8X63jdsko8GNxyvxsiIUySq7wr6BAVTBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925431; c=relaxed/simple;
	bh=KvcD8qlhnQ3Kv1rKTON5cPvnwd1a51byGlQrHTDGmKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YF76jOk9SPV0P47TkBlPtVhJNxLDV3Xyc1GMf9g1LRxHQi02ezh1gz5+qY9KlsFHpWduWir7E0isEAQ+mWeHZVwMj2HB5ge3dGKbj4t6AUB3u0aWwjFABingyBJ5Ql8y6PNZnITE3RiowRaMeP6cyFy/B+MbAk3djp6vTZUJtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLb/bmP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLb/bmP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045AD1F00A3A;
	Wed,  5 Aug 2026 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925429;
	bh=KfQSM0yh2drzhBERl12xBQZym1QIcQR3eg6Nn/wPQwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NLb/bmP9xDXct5xUjKC4yvDJdRc+tWA+YJcQQBP2S9/eCtTlBKeTvsZQHjeZxR9yL
	 W4G0OHgRqHqwzcICjTm5DnhIkcfkjUmp6n7JCbbST9jwjiWI7gdZLxKmPbo5qGXKYm
	 2Db6KNJ5Me83ZxZ/XkqOE1kOWUVZGu7SYJ38T6QA7JmfhqWUMKJgJ54S2IxJnWnhim
	 /AZdQs9fIyb6YV0WUPUJ8PMuQ2kFoLPlkq1Ig+EUVd+dd46bW1lhErHL4nEqndqoW1
	 jVODA+bgsDY9hJ/ocL8AMR8b06MWg6ZQUYAJkBc4KZ6GbqeeiFqQe3Ru/ArS2+wn4Q
	 ftoCJa0TtTQpw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260804111433.1148-1-shenghao-ding@ti.com>
References: <20260804111433.1148-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ASoC: tas2781: add capture_profile_id field and
 update the tuning_switch function
Message-Id: <178587174123.111355.17874416357790440059.b4-ty@b4>
Date: Tue, 04 Aug 2026 20:29:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 04 Aug 2026 19:14:33 +0800, Shenghao Ding wrote:
> ASoC: tas2781: add capture_profile_id field and update the tuning_switch function

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2781: add capture_profile_id field and update the tuning_switch function
      https://git.kernel.org/broonie/sound/c/431c15610d01

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

