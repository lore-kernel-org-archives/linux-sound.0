Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773123;
	b=fcsLAzHFpiwAE282PRsYcHcDwWU6inKK/fjuus/GUTbK0fpcmNzYFCODoBJrPTajRBKk
	 xlkaciVf2cb+qdzRNxSSA4OHGb1shJ2ABtJ948N8jHHsHWDXwHbP7fJAsSr/mR7dCvZOe
	 dRHYdQ8i042dIr2gYHcI+sUTnZpaKeb25aghVCYmXJe36bPsDZaJhq2oPEI+OJ75kdFGO
	 U6kOHgOHZvYBl/AcNGv+wlrEYnn1Fox3+CsEqOTwJ6P1qdTILqfOtM5StQKAzXrZeH/w4
	 YUyibqaJ4Y/BIGC23+oMeKaRXeC3GmMebSpWqZX9y2Bc8DeIKzXmRENpIlD7+RFXV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773123;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=PjPTqWnvIamPM9Ups0KMlBv18X4d4v7KC1zyehi+ktY=;
	b=e4arJzEsaWSJwKnmwOZ9+t7L+ZkCOEWlIxTElgjs2wUojcWH+DsRs+52ahiEuy91yZb4
	 jj6UpyLPaCC0AveGONLz2R6GC+IHuLjyPNMam2XPIaz8qF9H3cN1yHR7Jy0xDfQM7lvh5
	 w29IjMMrvrH92XlmaZx/iQqk6cz2cDcIK5qVKQH4UI6uXp9EqQjDmlioy/WLyklh2MxVz
	 Syb6Wrqb35Ypl8izGuk4/7aF0AN4swdN5U7GkwUP/sUQmUVMlU0UVtWNcrVP984cr7Dqv
	 XnrFQNcKNLDyzpZolC0/0GPhhksrZkB+6ATRQuG++MZT7APfh9O2wnXB/F10zPHSYVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZrBP5ORw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0C606A32A;
	Fri, 27 Nov 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZrBP5ORw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5092D1F0089A;
	Fri, 27 Nov 2026 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773123;
	bh=PjPTqWnvIamPM9Ups0KMlBv18X4d4v7KC1zyehi+ktY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZrBP5ORwQoM0DziMdayXiLFW/01wWPi8Ng8JVcUqk5UweoHHHaiAcjNrBtPxInKtW
	 9zTV/SHgWhzErFgqz5eJmlTYq5W4JyMWa6FmfkZ9OY3ybavw2R72y+fu3dlu3YqdA0
	 3k5fbvOe191cMjwLURrHwDJ/tNtxRxpryjcTOXq/u0/vTTSHoNcREJbTYpjWRqkMTS
	 Uadx5+De7GE0733zJ8jXWPqaC1Dz/VTGX7EthFphtOsZfYZp8LxSdqS1gc4+KwrWOs
	 14nriZmUjDlyWf9PK/vfhXuegbczShKsYjGK9HRM6THUJnJbXV4n0ux8cpmLohNxgg
	 3SdGvzSlBUA3A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261120145115.2256537-1-ckeepax@opensource.cirrus.com>
References: <20261120145115.2256537-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2] mfd: cs42l43: Stop using legacy SoundWire
 IRQ callback
Message-Id: <179577312209.50005.10107814136641055755.b4-ty@b4>
Date: Fri, 27 Nov 2026 09:52:02 +0000
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

On Fri, 20 Nov 2026 14:51:15 +0000, Charles Keepax wrote:
> When removing the cs42l43 driver on SoundWire the core will warn of
> too many retries on the SoundWire alert. This is caused by the use
> of the legacy SoundWire IRQ callback to clear INT_STAT_GEN1. This
> implementation defined SoundWire alert bit is used to tie the cs42l43
> internal interrupts into the SoundWire alert mechanism. However,
> the legacy SoundWire IRQ callback is gated by the probed flag inside
> the core and that is cleared before the driver's remove callback
> is called. This means that any IRQs triggered during the driver
> remove process will not clear INT_STAT_GEN1 leading to the device
> being stuck in the alert state until it is removed from the bus.
> 
> [...]

Applied, thanks!

[1/1] mfd: cs42l43: Stop using legacy SoundWire IRQ callback
      commit: 597bd4ba343df842694bf0b761ffcd3e3caff985

--
Lee Jones [李琼斯]

