Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106746;
	b=s9FL96zA7JoynzdR0Tk1RlSJvEY/KGR4XDqvYuxMCHyMQtzlfY45HYmE08A8ds9bVYJv
	 uhdTMntZQ/ZmQIluQ0IaZ61WK//q1iLZ3xy0n21zNWt5izLd32aAUoo0wciig8nAsTHkn
	 DE8nzhDTH45PyTn9SnGpZe/1ZplAi+VwXUbnAT4zQbczLRiGfd0Z09vJ5EM1K+8pHNOVv
	 7cGAwQKKCPZiQ7MkJuBSQfG7F8dGOTVHAG8oEENSI9QXcPy/N2umtjrxP/Pf5+e0wmtX8
	 L0kDJs/lHE7T6udnabJkHLMcwzbjdZX+BmxphSe8hH84tAsAVHANhyv/+FcsNhQH7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106746;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=teBN3u9VFLQp1xigXBoBdxmacTll6U0dI+yoO1tpfjY=;
	b=G2BB+WTjMtKB6kIARVZnCtZ/IwjoTgqQZKwL1PxKUFQskdr9fp2eKvNdjkaHAXosQobw
	 lNDnSwn4UyLnT10QVtL3N6lm3xZ7Rzi1RrYkxB/ozJ/CPFTxbX7Fu8G//OUX9NsZoVE9j
	 6vNibjrhRfgkjfXVb30vHX5EWjs0I7bah7yWyEEw0gGwYUdcwOQtYxMCh6at8Ha2QHEzt
	 UIU8MEYdVN4Tp44R5AO/pRQFVekvTZK0L1Vc54UIEI2vV/xjfzJvbyPvbUn6mk9CNTVNt
	 L+ryMunhuRg45sLrku73YMqfZlduYB4Wy+DxIbuZzc/NKoVkA2qIyX9FzXSXErUGASg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLmdEj8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9C606A337;
	Thu, 19 Nov 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLmdEj8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C4D1F000C7;
	Thu, 19 Nov 2026 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106745;
	bh=teBN3u9VFLQp1xigXBoBdxmacTll6U0dI+yoO1tpfjY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BLmdEj8dcnwiLUDfl7hwZxyTbBT4dKYYO1s22LzWlXeNUtW6oagamn6lK2dY+vkFP
	 84RnVDZ1YRn1DUacVNtXKzmMjlTwpNY+epuX9TDGMuUJOTmHOaeQ1vpNW3b19g1HSY
	 w+L16heQ7EpB79bwA6lNuCV8hDqypVQMN5jovvBfhqlV+CpirIM53fWUbwInwUylJx
	 Pa2gxZjJyYzL3sLm8qvOk3tHf5whlUqoCh4N3dnpdVlToc6S+/5M9ihZM72MyMHnKP
	 +++Cqlhdh1NtoheMbscf2GthLcwR/iME9R2gkeX8Xa+cPtsc6gVKve6xdIoJegOim0
	 NJuaFIIY3GT4Q==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, lee@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 patches@opensource.cirrus.com
In-Reply-To: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 1/2] mfd: cs42l43: Add load detection
 register needed for cs42l43b
Message-Id: <179510674408.77674.4732953853855712916.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:45:44 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 12 Nov 2026 14:16:49 +0000, Charles Keepax wrote:
> The headphone load detection procedure on cs42l43b is slightly different
> and require a register that wasn't used on previous versions of the
> chip. Add that register into the driver.

Applied, thanks!

[1/2] mfd: cs42l43: Add load detection register needed for cs42l43b
      commit: cc29c6e45db7b4306efc7a76e7a64d549229d4ac

--
Lee Jones [李琼斯]

