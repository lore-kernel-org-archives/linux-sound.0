Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513941;
	b=MtoOCiJ8LHwDKn9QXIg/JLZkw7UyBmEUUMZHC+vBjAPs1L/qdEz5A9Lq6NJzke6SwRVp
	 xzxpE1dBkM2tYOk+Hs1yu0DVvUrcf9YV5Iu7BgOmQInjhmT2kh1cAMIqmnqUp7eJquig1
	 zC9louXw3IYasLmgd8i/xJ6x0SYosU42kKyK+sGldtaLU2L70PCPIv593Rw1RTVa3Okvl
	 Mn9CFINejpLiT81jXm+70MurYDJUBA/D3Vcy8F6ehH2qJ3qJNJPY07NhJdrkl11MdQARt
	 yraC4dTXZaRengzs/NAiXpyqifDqmtJOYD2GPFPYz8CvLiWcnE6XWPI5+MhaHgyXJ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513941;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=gKRuW/URc/vplOcDdSOqmoSxOzAUCKggcNkbZ0AJDek=;
	b=l/2Wifpx6vYn5EJtWLyFghTJ/g0dWSprK5+DnZpMmn7/WOXyH2xo4HnA9ggqFnKvi5iG
	 KLl9d1pJRal157JsbP8lMKxRf/obQzn4oAtKwjHRE/xkkjy8qZ+gj7oWk8QriCso/84dG
	 AKYAePNfOD3oGy64cSxuMPj4PW+cluw3ScHhIo5F0afr4+Njl1w6A6ZEJnzLr58eD7pHn
	 JhPElRTlHRgnRktQQpfbJzD3f6O78x4pp00uEuUXQGFB7HSYxnwswNrmknvp89n1hMEK6
	 2IH5tf58YD3IOnObs0fy1iN3A54uv1xgFPgcV74m7vCAA9dp1CiMXep2bOeXQCRPX6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="asbO/In+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25096606A33C;
	Tue, 24 Nov 2026 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asbO/In+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B401F000F4;
	Tue, 24 Nov 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513940;
	bh=gKRuW/URc/vplOcDdSOqmoSxOzAUCKggcNkbZ0AJDek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=asbO/In+qqiYeP27uyKJStijMI7a1uMRyD1cljKduDKTWv+8jy6wA2Smg0uBDt6Or
	 7Lf5pwh3nl7D4/yJFSfiq3rDWhWO53ShIXDC4fGmDM6zTB0ojk7EdIUHILewP2ihiJ
	 U2Jkblg/TeBhQgE88oTCBLQxuELwSUjsF6daLtwnxYy+kFX8MvdMU977zI1pbI2163
	 ChodkrrYg/EbkTu2V4kCE7uEoxvoVnvRX50qZweV1tpqMxI5navsRb7XGhEf9fd8CK
	 SnDHhN1amoQ1XSt+madOtv2znPn78TuxGiM8SCH20fte2lBENZjLbEOB7a8sK/5vKu
	 fcTabKJ/aH7sA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20261122114442.2140276-1-yung-chuan.liao@linux.intel.com>
References: <20261122114442.2140276-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: Add MSI Modern 16S AI+ quirk
Message-Id: <179551393868.362684.13517551260615840761.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:18 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 22 Nov 2026 19:44:42 +0800, Bard Liao wrote:
> MSI Modern 16S AI+ has the ghost rt722 codec in the BIOS.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: Add MSI Modern 16S AI+ quirk
      commit: 044b02cb3a8e2ea3d20be77b19825a2a30191a45

Best regards,
-- 
~Vinod


