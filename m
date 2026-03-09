Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB9364026;
	Mon,  9 Mar 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039937; cv=none; b=lerqxOIvw5ExKwD9RqGJwLH29aNl6Xz4yDD4LWM6B7VmklSsbs/QH7wnyOAa87H+GoxgIUMksOqFGs/jGq6DkDoByZVyfJYN9wOj4ZLmtIW4bxVlUoAsgXVVVbpRZ3w5CkiX+V1Tc4cAtlCbhqyajaOMA9pefG1790m1p1K2NPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039937; c=relaxed/simple;
	bh=dMUZA1phAE6VrGhd2PGdMK3V3gWyr+QHqdwId/6ppMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KJTw5R5+8IryW/ZRCJW7gBD1KwUU8xQYp1XglcKhtzFVQ/YcZq6tQyCPkZDDSF/8SSuzutBG50elKlS9SRRd22JtQecde7GKuE8HFqlg5UiG6y19IKtOkAsv9BKKpzp4QHWm+eU38mNu0vz1d5I9hwKInUA2/N9DNIERieF4+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXMcz8NK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXMcz8NK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8309C2BC87;
	Mon,  9 Mar 2026 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039936;
	bh=dMUZA1phAE6VrGhd2PGdMK3V3gWyr+QHqdwId/6ppMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sXMcz8NK8TTVgFJMnDaCNbFUKJ0DqzVrsoyBlrWnkNmKL3WXdE6bokSmj5TfMoNUu
	 3rN5CVy51hXydN6UqLZu7hXembdfnsxYMJ3uKJ8xrI1SAUVs//LoYECIxqlj5EHvaI
	 xMDO1jponjYHts7vHvhiS8CmDM2cEX4qL8gr4sIIvU/JKYa2gR9Th0Hu2Dp2zhX4qA
	 BeXWjD/21jGeYQESNie/vwMeBJpELOWgK44R2dqE7b9hZMDWrpdHhrn6kK0ThmFDLS
	 orTZfdSoo38rYY7G3sflTwtgHU8aygYPsQG0Bw7lNYWc3Of2Sq1lIPi9Kmd6xHEvJa
	 yAx4t/x/rqPPA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com, 
 simont@opensource.cirrus.com
In-Reply-To: <20260126054045.2504103-1-yung-chuan.liao@linux.intel.com>
References: <20260126054045.2504103-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: Intel: test bus.bpt_stream before assigning
 it
Message-Id: <177303993466.65210.10532084437729459880.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 26 Jan 2026 13:40:45 +0800, Bard Liao wrote:
> We only allow up to 1 bpt stream running on a SoundWire bus.
> bus.bpt_stream will be assigned when it is opened and will be set to
> NULL when it is closed. We do check bus->bpt_stream_refcount if the
> stream type is SDW_STREAM_BPT in sdw_master_rt_alloc(), but at that
> moment the bpt stream is allocated and set to bus.bpt_stream. It will
> lead to the original bus.bpt_stream be changed to the new and not used
> bpt stream. And it will be released and set to NULL when
> sdw_slave_bpt_stream_add() return error as it supposed to. Then the
> original stream will try to use the NULL bus.bpt_stream.
> 
> [...]

Applied, thanks!

[1/1] soundwire: Intel: test bus.bpt_stream before assigning it
      commit: b2c9f1d5a7eb50bcdda607afef1378e552bbb490

Best regards,
-- 
~Vinod


