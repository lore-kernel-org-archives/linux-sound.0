Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1F21CC51;
	Tue,  6 Jan 2026 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702069; cv=none; b=j+AXi67ZkU44nirKM3gKj3Tea+vU/+YsVTnYT3deDVgkMPC4ufUfM8iL3GQNquUpwjNQ6io/HT5LN+yxUp4Q6zKBVjwOf7PHJYh0/FVDzX6GZXyfJJGgR4J6w3H4cCaXugNHAP3XytEe7vcHWMjWY3xNsrA9j8kqAbrh7lIroK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702069; c=relaxed/simple;
	bh=0xGhuZ9BpB6bO2r8s889CeM37MFZ1DO13Mv1L5fSGhU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ErOkN3xjN+xcPoRIYukP3slOeK7l8kSXS8N9RQZVPzZ9Sv3Aj8Xouv4+lqUd+ekirOGTDo7ZT6PL80GVUQj3XRldVY8I8qljDt1PF0A/1XYRjvcr8j6kv8OJViX+ZozPbBXjvRW/DzkHYw/irHrlHFRRrH9YGSsJesWN5BmBpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8fHAJYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8fHAJYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE0DC116C6;
	Tue,  6 Jan 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702068;
	bh=0xGhuZ9BpB6bO2r8s889CeM37MFZ1DO13Mv1L5fSGhU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S8fHAJYiPSyBG7nLnRBYEOhRSLuPYMkEGGjRfeig7hApQ9KDTZuj5ThmMCVAnKrHl
	 +1h5KyBWvs6MgO4d+G/rMlnZEz0wsLNoyjSYQXEVqEFVkt2llM8GupgoM4C/f9/wny
	 EoqVcmgpypHHT3CEEYZJ5eeRhtHhkC6J7vpu8vAf/CEBYbmZi1FeJ1aFpo3yl8mJxR
	 WzZbE6MS1h4EmnoBwBzgkAZT7tvc3tSZzfkbsRZZLMxv/e5IxvvkNOl7Mu7Lmg8D4+
	 dVYN7jNsbvV0trSoaAzCpYlmjTY/8ilwp5lsF/rR1DnTBW+/g6VgOmdfN068y2QuJS
	 0vWC0veHWBRxg==
From: Mark Brown <broonie@kernel.org>
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251231084554.265916-1-hungen3108@gmail.com>
References: <20251231084554.265916-1-hungen3108@gmail.com>
Subject: Re: [PATCH] ASoC: es8328: Remove duplicate DAPM routes
Message-Id: <176770206664.32636.14212285684486375827.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 12:21:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 31 Dec 2025 16:45:54 +0800, Hsieh Hung-En wrote:
> The DAPM routes for "Left Line Mux" and "Right Line Mux" are defined
> twice in es8328_dapm_routes[]. The redundant entries appear after
> the "Mic Bias" route and duplicate the definitions found earlier in
> the array.
> 
> Remove the duplicate entries to clean up the code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Remove duplicate DAPM routes
      commit: 52ddc0106c77ff0eacf07b309833ae6e6a4e8587

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

