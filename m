Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170B397697
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566972; cv=none; b=lJGLNiu4ZLWGEEnvRrimLhwkngCjtKHDJbACarKXw+pxmjOOZurd6nZ4WcGdtkk6Tbo40LbeB18RICbOeS0332k3JneG0uMSD9+5fE8oc78X3JTRJQq4jzzbuG2l9tPQ1j2EdRThDeBq+riaTtACMG2xiQt0JHzsvbVZ+uhHjpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566972; c=relaxed/simple;
	bh=x2X8doQkr6oiZSi2ptWQpH8Ts73QJJT0w+wFwWNCF0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V4bbZDqhuUMIgcpG7fcCxs7oAdnHJ8bmR0+KEd0cn+4arD2TfsTzPNWcgJCsxCgRDo0SGH2gk6+EAy5fKa8u53tg73KU6kNpilGw4YJ/xvHGGf57/0092HYUR2cOZXoCYPJimRm11Ap5o7+Pq8JN3c2XChgtiqAjKA4kYqVZU/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ8AfnQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ8AfnQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36344C116C6;
	Tue,  3 Mar 2026 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772566972;
	bh=x2X8doQkr6oiZSi2ptWQpH8Ts73QJJT0w+wFwWNCF0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SJ8AfnQAIsa6N5TFizZyO1hlKlrUP2QunVm4LNMtrO//v3flNie6hhF4cc5AK4Ijn
	 WvXfJPgc93LIqjMYz3WwysWTVLMXLBTT4EqLXryvCOvxVIAhod11lRS77UWjYOPgGU
	 IIAWwrTCX2T1QYIYse4+mzWJ1wGh0xFs5VIGwWfnOK4Iq/YYTbUMxWsL6dPEvLicYF
	 +vYOgaqojOTCNsLOcfvZb39d7IGKYUB7MxO+HPsOgVsWAwXtQiqfu8cvDuBqX9Ix19
	 5fJ4cmTWv+sO3VwrpLbHHJpc0k3bR7SVcVxh/AsfpWThQwYi9hzaXPJV8F5mbCDhi3
	 hHl59YHpdqCKA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260303141707.3841635-1-ckeepax@opensource.cirrus.com>
References: <20260303141707.3841635-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Add allocation failure check for Entity
 name
Message-Id: <177256697093.629341.1189246307301093388.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 19:42:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Tue, 03 Mar 2026 14:17:07 +0000, Charles Keepax wrote:
> Currently find_sdca_entity_iot() can allocate a string for the
> Entity name but it doesn't check if that allocation succeeded.
> Add the missing NULL check after the allocation.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Add allocation failure check for Entity name
      commit: 27990181031fdcdbe0f7c46011f6404e5d116386

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

