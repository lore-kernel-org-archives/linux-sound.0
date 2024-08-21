Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15D41B2503
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724265767; cv=none; b=eX5ark3QVayYUMkTnFbhpcs2cZ7TkdT7h4kp2myAD8JVoO9sftxIueWscE5FDilGErRWIxLLayZ9p3sS0dHK+8U3Ag7YAqdr2dFT9Dq7qGaKpOcJi138ZJJxfHL1mFk/i8Ok7ffFFqnpEKA9Y3ugYD0O8WxBwSPKOrc/m9D8k/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724265767; c=relaxed/simple;
	bh=7y5qiN/fEqaTyUgj31oGiDU+qH4+TDYljn2LDHdyK8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ljq+7lMSS16hcy/6ZkG71f4kyQ2aUvC5J7qzT3ncA30k8QN6YJVYUaTfvMQ4zVbHz6L7lGCkDpqTzi0ZZ6aBP0Iir+QCFLPTM5Mz/FmeqK0Qxzu0gFzHzwhTM9y7w+j2S3EfDsv+4T5x9xXr+r843kYlyfIQyRLuRu0xr1kQqnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+qSxbE1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+qSxbE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3529EC32781;
	Wed, 21 Aug 2024 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724265767;
	bh=7y5qiN/fEqaTyUgj31oGiDU+qH4+TDYljn2LDHdyK8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L+qSxbE1CYCz4+eCXAyEThVZHGfl408b8otx6Im1yVsbVWBK3cQjVLNtccvQElMG8
	 Hj1SLT4NcrATTMGB3DBNV+6QAEIjLLYo3IELzZEt/UJxpFqzHUl1/ktmA2QvLvc1TA
	 6ZmcszMqllUdnSqDbjhyUDcCLqlUKk8jX+TJpcJWeCzkASSsbOL31qCXDy5XynIqOb
	 6D4GIy7mob5A7ZGijRE0dLRr5GDZ6NWnaUHZOmp7v4+w18la39KchzIFhFMs1NRwxZ
	 +s+1oJiPlr2bCb2/r1ZhTXGRkHghUK0Cc24yrl5YTETuI3EUUA/QPtnQBpggJWtmDi
	 CY5pmBnNlONGg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Hongbo Li <lihongbo22@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240821061955.2273782-1-lihongbo22@huawei.com>
References: <20240821061955.2273782-1-lihongbo22@huawei.com>
Subject: Re: [PATCH -next 0/2] allow modules autoloading
Message-Id: <172426576594.1741722.16905114053596153030.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 19:42:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 21 Aug 2024 14:19:53 +0800, Hongbo Li wrote:
> Add macro MODULE_DEVICE_TABLE, so modules could be properly
> autoloaded based on the alias from of_device_id table.
> 
> Hongbo Li (2):
>   sound/soc: allow module autoloading for table db1200_pids
>   sound/soc: allow module autoloading for table board_ids
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] sound/soc: allow module autoloading for table db1200_pids
      commit: 0e9fdab1e8df490354562187cdbb8dec643eae2c
[2/2] sound/soc: allow module autoloading for table board_ids
      commit: 5f7c98b7519a3a847d9182bd99d57ea250032ca1

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

