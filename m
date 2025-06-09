Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A8C259C98
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476411; cv=none; b=CtBh1NIu4O7pjZ7Ejp8mIz8R+VeCsiTr6q/xulbRuenySa/nZm0Edj7Wd28PjRwrK8jt9Ts+CBXaE+RU8rZC/Vm/2TQOAezc12PSYXCL9wPLMZIID61mhmMoyiGkxRFVYBdDOL2+2M0GEPcffOI3djAxLPj5n5URub+Rm+Z1y18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476411; c=relaxed/simple;
	bh=M6+f7kKS0qfeMmL8u8eZC8e1yxKQbj9zOHRpYRM9j48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSYokohNLEubM4PQvq+mXdzM/zzTdfWeNk136+0zLd00ap540zPtgoYLeF1xpnJ+m5Fbv4NUCpNwlJ5IU5XJUSa4w5IqS2dTpO+kRlvsjhshR5FaFEGBlNXod5OOago8iLNiDgtvwjrOjj3d8Gze22EK0K9kAyjthzXIFkS3fHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoKqI4rB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoKqI4rB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B92C4CEF0;
	Mon,  9 Jun 2025 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476411;
	bh=M6+f7kKS0qfeMmL8u8eZC8e1yxKQbj9zOHRpYRM9j48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VoKqI4rBtkO9EpZKBnWXW0DZHHkKYuG0unSz/krBPuLZYVJopDfYNScAPdpTQfkB7
	 8Td2Kd7yQ5eXsFxkcJtVSe4KkRDytBDvY/xXR0egjVeowHqzo5OjPsf9tkBIMSyMbU
	 WH0mVPx6VCEZRTGKY6xDDg+waSh6U/UlOL1sj1vXTtjPXA2S5Dcd7DWfCD6Y+bO/gv
	 yLWK6SWF+ed6X4YYW8pij8rbQ8ahObDzOQosISCDy4zDxuuG8fAwWg/sX3pq0Z+NOe
	 Q87/o7TlGvm79YCma+WXesnx/K+OvFs/EBQr8oWyNUTNn1UZ/C3HeW6OBrIiBd87ug
	 k4xa1CdIIpu9Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87o6v3j73q.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6v3j73q.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: hdac_hdmi: remove
 hdac_hdmi_jack[_port]_init()
Message-Id: <174947641095.126747.16949328350532141170.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 05 Jun 2025 01:43:37 +0000, Kuninori Morimoto wrote:
> No one is using hdac_hdmi_jack[_port]_init(). Remove it and its
> related functions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
      commit: 039de8f598dd7f060c8fde2498a7163315466f6d

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

