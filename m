Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FF33D8
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871320; cv=none; b=uV0BDZuTqPItC03t20A+NU9cxMnHwYjDmT32+UvUWS0CJWv/FPBYDAaP14Th47SbIkppX6tF5aMubb2u+TbSrnbigcyrPMjoB3HthuZSGyyC4Nq2AQoumk8mf6GC7gKu4T7MUYXvNVy3aT3l9Op3Ud8LK04YmVYIzpR/p94NflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871320; c=relaxed/simple;
	bh=OP6ka+mTZ29L/nQ6JO/PVZssEVYRKCPVCxzg83N+5CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WhJUc2nkSyTDDB7ThxZ113yGCX50wHoADui4wU/u+am2jdrpoZ81LAe8hsmCc54rMB2zK9EOILdkSZoD507bwz2pEbL0UTb30MduQqlYup6r6F9NyXK4mDspVJV2eEviHltEf/QfZd40PocPWW7Z4SwHCj9D4PgbtgR5ZCBgRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAFkIyKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAFkIyKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A3C4CEC3;
	Fri, 25 Oct 2024 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729871319;
	bh=OP6ka+mTZ29L/nQ6JO/PVZssEVYRKCPVCxzg83N+5CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SAFkIyKC3khwyjlLXQjRUDylNTFn8Urg3QESbMRLhxq1PBDr67uHSb+tVzB7LY5+5
	 QvXoz/A8gagt84Lbkr8Jt3bhVTPM9f/rTxbVWWRQd9oXysYfJYF4IaT42PaErWX0lS
	 wF7z7ngUmaJBH/2/IydDHBDtj9zHeonR94UOaXAbUCGwd4y/QQkPQ2vSUiuPZwvUQW
	 //VSGTRymNYb7IXGeG0JgYZTLbrCxycfjo5n3fhFz4PrHOX6IzD3A6rOKXeDjEzhjH
	 YU4Dzzy5iKldTlQBBuKQOoG78FHTMQbU+qTIDbZqNoD7uSfd/HavYuOclVOd6Q9avB
	 sCYbgvVhzv/8w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20241025081259.1419518-1-shumingf@realtek.com>
References: <20241025081259.1419518-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: add mic function
Message-Id: <172987131725.67736.13803768567583296381.b4-ty@kernel.org>
Date: Fri, 25 Oct 2024 16:48:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Fri, 25 Oct 2024 16:12:59 +0800, shumingf@realtek.com wrote:
> This patch adds the mic function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: add mic function
      commit: 20079dd9b364483db613186b289fe372bddf41b5

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

