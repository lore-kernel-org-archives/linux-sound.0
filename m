Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B22F2905
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203914; cv=none; b=NnbjpKSQYu5zNXGNOBr0y2YjCAOFpvK7vnRnOHBY7hhRyAgNeyAllKyqwIFAYqBaH1XUmk/YIywkFsbOUk9omDm6NjcqZOuEEDwNUxJwun9SKiCi47K69rCxfDtlpV1v9PdG8HSQsidYl9atNLTNmMmnnAAIsR+1xDJ6MlHrGvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203914; c=relaxed/simple;
	bh=ovATUJh3lAqSRCOWqHFu7st6AqW1G7GktfBtM/Yo2WY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b9wRWJAUZ82DtPloWwv+EgEH1VyIZv3TqvCJLeGop6Yz8+LCSoJli0BRzUE1EP3AxUZybXSNxo00qyNJRmS+Lekd4b6lPkXZMQ4k/O17GQ7pUFd11tK+zL1RJ4lipQ8a89D7GjXUyjZ0rEWuvp9fQ7TBWm8Nloc4MOSRGg82cQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSbw02z0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSbw02z0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88594C4CEF7;
	Wed,  4 Feb 2026 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203913;
	bh=ovATUJh3lAqSRCOWqHFu7st6AqW1G7GktfBtM/Yo2WY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bSbw02z06BwcIvR4haZIlLLrw2kQNmHT1QbIlGEVhzW2JFAqlhIlmwKkeGtRRXfTx
	 9gF7WSe5BFR94VrPKfqpMmO9rSua+VNTpA8ANyUTW8HTZ6jPygIEKiE2zxoLw2Ols+
	 5YMA77/rUgOk7Oi/qOM9JDwFWS9nFkEt0Icy5FDb+VUARjzzNqOdoyx5Z8P2TTOBrc
	 DHM9C2i+7ILROr3sz9RfPj4jvGeEEmtKsYIbBm5Gj0jZy7znPQGlZXxPiegV7hoV91
	 8TeLhqDSt1vbQMkJAm9+5Vr8i78UVTRHayWw8Cnjx2bIG4wG/Y7tukpLlPZ2NOZdfO
	 CJrvdOFMJFfeA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260203111545.3742255-1-yung-chuan.liao@linux.intel.com>
References: <20260203111545.3742255-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: allow module parameter override BT
 link to 0
Message-Id: <177020391229.33145.15843035082190270866.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:18:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 19:15:45 +0800, Bard Liao wrote:
> The existing code test if (bt_link_mask_override) to overwrite the BT
> link mask. This doesn't allow user to disable the BT link mask. User may
> want to disable the BT link when it is detected by the NHLT.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: allow module parameter override BT link to 0
      commit: 023dfedec1478d506ba42d45f7993578fe38fa11

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

