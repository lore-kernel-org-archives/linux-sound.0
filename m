Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513938;
	b=4GEU0ReXC89NCjFuK5DhRYIPH1KIi3GZtKQngHtNgl5NMuCsOER2PPtc3pcZtxiFt6WK
	 pL7v84Rk/K8nYVC5TyTM3GiSAO7T4syztR5/bioM2dk2y9SXO1e9gjGV6Csns69Ql0+S5
	 ssozJVjzMYl9dkg/85ByBoakzbre6efYFqi9SG7LSJRjp+Fh1lS4vQowVXZp+txs394uL
	 7f6jmLYfiQrQ7ax9+dHL0PE+3II5OZ+d4igUrY4v8NnOYRVGpDQAXRtoFVxrZNjCFCr72
	 Yh1jH+DEt46Nb2V5dgVlGWpO6KbSZhs40JH8W2yCTTCeR5109nj7O0Iaxlhx3TcSEcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513938;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=mmItOux6gbXFDiG1sj4aWGwqr8TzaeFQw0Lbw1W3I94=;
	b=ZwYfDBk0Uw8tULvTJ04VXx4au5YzKXPeqHcMKNHP1fgwkxz4tkvGXgoaOG1/pC2RA/Lx
	 EICsWPOodgBOdhqJj1MIKUP0snwufvd2l2F9EmHO/0fsaLzA4b8Rj18AP+1sNJgl+7/P0
	 u4wjIeN/bVh/vdb82Kqj6j0E9jDi1/dcjq1FwqUVvhL3N24xrkSx/88M75cISSwyV7A5s
	 cwbkdvPba3GtSAhT6w8zyMRzGKYKMSHMuKi8KFqI2YFLp7Py12RpvwuONZPmhTkIILTBe
	 +VfRdYbmvGmtLn1qFwONeo1qJVDcEATfAJlAp85bRUTHj+RtWswOsTPtVMw3fcBamFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e8+pQLSi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C03606A681;
	Tue, 24 Nov 2026 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e8+pQLSi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A491F000F2;
	Tue, 24 Nov 2026 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513937;
	bh=mmItOux6gbXFDiG1sj4aWGwqr8TzaeFQw0Lbw1W3I94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e8+pQLSiAYt7nJTEt+xOhWi40KfiLC8uGFaByQkpY6tJqtwxarIXSJJNR0fpULIH4
	 v1yjbBQaDTHHWScHDWMwvDmBXd6koWOER52sinVFdAp9KkTo4Js+sSGcdr9PVfumaw
	 3vlRcRQc0fDehQtBQM4s/hLz4Q9d5IcQRyoTIwMgrNGMiDEZL+0UB8tWQg5/zGHWc9
	 FL6giDD4zKk1WEuvaoCh+yiKnCCh4OyCmsulJjLCd9btd93Qebi//b6ygUSRMj3bjx
	 682KXDxKGferLxZdjbRKojanEXAD2ERwEnjP8Ht62BdvhnRU3Kp6bCcgIvzyvjERQN
	 7UXqjJOYzDYlw==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Ivan Verbovoy <ivanverbovoy@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
Message-Id: <179551393550.362684.3377982334908921216.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:15 +0530
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


On Mon, 09 Nov 2026 06:21:11 +0200, Ivan Verbovoy wrote:
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: enable CPU interrupts only for MMIO controllers
      commit: ae0f780d10e3b8782e5559c22e0360c76c7bece8

Best regards,
-- 
~Vinod


