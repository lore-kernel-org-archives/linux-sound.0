Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3E30100D
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500975; cv=none; b=DzvUjYjVtPHf0LVT5MeD6YyxGRYoUA+yNyWo50210gp0KeN+McHfojPlMV86MovHNgBKmHeCc3XBScJ8ch84gZkVbRJyxTHzFSUASPpGs5e6a7rEPkIMGd+B/pRgpKzEdzMigt4WGY+j1BaIdsVPnEFgrva9Kdm2EDHUzBhFYiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500975; c=relaxed/simple;
	bh=4mzuvkJCdD+2UIfnS/GWR8pt9M3h6/s8+5KCVK/Hf/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j9EhnPxsUdLW/k5zmRqfE3iVuML+w5EWqC8EyTdw6ch0NZwQN7E9g799/hzU6AQLtImJ8jMzuIxr67BOS6t3bUZiSHlhG8Ym6zfINCw9f3FohJu/QFLu6ei9V7h/P35q8/9vpPpshNIPMJu1JqzAw232dd9nUE0dLWpF1Hd1wKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaYFusdA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaYFusdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E607C2BCFA;
	Mon, 11 May 2026 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500974;
	bh=4mzuvkJCdD+2UIfnS/GWR8pt9M3h6/s8+5KCVK/Hf/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oaYFusdAiwYLjcnMiveb0qY0wMpnJawsX14LhfcbvuxNPenCSeK+a7AMhrYMz/vS8
	 CulfDXaFTXW8bEAkC7ZfCvW8FJ7GeZ3SVnQ104bql2P8AQB/5YqjLlgVnEZDNzmSPb
	 kPmgkZ45OnYsBoCZHvLaMnK2CXbw2mOABNB0rsvlg/WiIffzYHOMadnntmKWgyZqEU
	 QFk0hu+UzYq81BJyUMEhRDREiQT/7GW9HKjVRHXXh4lgVvmP0L9IyQPHxLnFsWm4c9
	 /shoacf3QJC5MuglEaF5+cnjyKtv9Y1zo42O43RANlkMQ5SYwRBJ1by+rplmBib5MJ
	 yDwez6Szf36ZA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
References: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: soc_sdw_utils: skip aux device if it is not
 present
Message-Id: <177846153955.988959.13564365690973884915.b4-ty@b4>
Date: Mon, 11 May 2026 10:05:39 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4mzuvkJCdD+2UIfnS/GWR8pt9M3h6/s8+5KCVK/Hf/M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVsx4M4bfbIGzephDhC2NIde1DojQfyZOcQi
 TSr0PLC1UyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFbAAKCRAk1otyXVSH
 0OGUB/45AbEsyrnUn9LdEdWtUrXxbTHZUe3u0ZD1MtUwmlBWT0coLOzHt5eDvXccoI0GyZSk5mP
 M2J+E4eO7UhHw0A3xNuPyq8lixWSmfUOxTWbvnINXDZkTHFoedL9XogR/gfIqFWslZx1RzXEg8r
 MaNI9wzjJZb+FQG3uxP1Prr+Si4Iz/kMRA528Rd1UMazyftE4ilRHQbG9n8rakzdxMS3/WqZEXF
 2+IJq3yqeiZOcwRNmOKgxOrk64YqVlB104HR5SqOYmJUpVq+6hA2/sJDZ+PPrLzlXi50ofHi8+N
 4XsAiWbL9wMxqKc2iSdrkFEbOf4pgqpN7zTTfLKVpXB8mgR+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 17:47:48 +0800, Bard Liao wrote:
> ASoC: soc_sdw_utils: skip aux device if it is not present
> 
> ASoC: soc_sdw_utils: skip aux device if it is not present
> 
> Similarly to codec endpoints that may not be used [1], aux devices (like
> HID) also may not be used. Hence skip aux devices which are not present.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: soc_sdw_utils: skip aux device if it is not present
      https://git.kernel.org/broonie/sound/c/954222bb686d
[2/2] ASoC: soc_sdw_utils: Change comment into proper kernel doc
      https://git.kernel.org/broonie/sound/c/21bcd34e70af

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

