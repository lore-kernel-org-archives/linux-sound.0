Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A82EFD9C;
	Mon, 15 Dec 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807105; cv=none; b=QPyJkWLHiGNpHAeeIHN0QxbWvX2qJ/5MmdYxC51g7Yb1DlQ96kipURzNTVNSQVKaabDxIBjm4/vlN3nSI7Jjj0/CILpQnGeUmYPiKrIf2lsaqL5EBp1yKJp0rrWE2ESzMyJbjvsTglVlo9vIkiRn9K8kWFRxNQ8TQ4XSIrNnPbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807105; c=relaxed/simple;
	bh=aLXC20iOgY8dOkshT34/4p+nRhPPcT7pji7XoMlQxs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lIfw/jL9WKoYYWnBwGi84P/qgSg1ms/0+G97QhlGoBTslPm4fJ7FQHDVoS7QSRlT1SLxn4Y9bVYbwljT4qSBsBopPNLEKWS3zyzna/eqx6cyzWSn0Ko7n4RtEgT9SKQ9Jy1uY4BXxfzlK39HuyM8qWQRTUVD+9VEF/nlUvcGc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdPuUxlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdPuUxlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A654C4CEFB;
	Mon, 15 Dec 2025 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807105;
	bh=aLXC20iOgY8dOkshT34/4p+nRhPPcT7pji7XoMlQxs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OdPuUxlRLYMosGpu/XPicjlCsGbLvaCJbhW9DHE07zp88EIXHJ63JDXF+jasZXzBj
	 9V6OtavYbBl3Vp+MKB3CvdA1qHjcfTy0Gm8vZrcfi/+rgT7/oM5/vwshJJf7u0qfXF
	 Ht7jlhFcPQbPzwYCdz7jh2XJl9DDxIzW0hU5ZgGzWjEEZQXvIPmYSYuMRw5zRZcf10
	 WzFp1aLQb9sUVtIHa9qO8cf0H/VwiWRFwjewfirLEiLQmKfigk/YZRRRCL+2t2IqgX
	 uyEoCqdq6UiIbPjcblegBe5wSN1nn1YGDvugEt+clgYSqdnPzkcnFrERCMmzl/jnIY
	 q3R+5RAmzA6kQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251201160729.231867-1-rf@opensource.cirrus.com>
References: <20251201160729.231867-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Don't use __free() in cs_dsp_load()
 and cs_dsp_load_coeff()
Message-Id: <176580710392.161056.10162316021978707738.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:23 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 01 Dec 2025 16:07:29 +0000, Richard Fitzgerald wrote:
> Replace the __free(kfree) in cs_dsp_load() and cs_dsp_load_coeff() with
> a kfree(buf) at the end of the function.
> 
> The use of __free() can create new cleanup bugs that are difficult to spot
> because the defective code is idiomatically correct regular C. In these two
> functions the __free() was mixed with gotos, and also used the suspect
> declaration __free(kfree) = NULL;.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Don't use __free() in cs_dsp_load() and cs_dsp_load_coeff()
      commit: ae9ccaed3f6701ee0fe40ad919516e0aa0844f21

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

