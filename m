Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513935;
	b=dXngNqCmYUnsyCwyYBQp3oRcQSkt/78dN7jHWYDeCenRVITlHg48omU8/WVbkCa7h+FT
	 OlFjakElrZd0dbPWOUwIOKa80hd4ZZcTcP9FnK6ib1l0de+rYzp/8UU8oLJybmm33U35z
	 0L40AU9zeeLttXIxGgV6Xvl6+6VtmOJOJIAvzRxMeuJgZWCDkHDtRoRZzpny78KPEurSm
	 1xDEXZakLC2giIuTBIi+q47YgAMkCNya9OOsEaGlafa4iiR9P0wDbrJ2vyk3Ln+iAIU39
	 lKyJaSwLcvPAOk5DDiB+I5Xf60Y47qD4JtSn6ScJDteA6g3XAznkUBw0GajsRzlGJEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513935;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=LN1nBzCRPuD75wAm71ph4QUgv0Pd2fqP4sOkDcmJsTw=;
	b=Gax6+cmYGlng7Iy9fgI1Yb0tTz/vJGebGMiCuatuI6kkckWDRdD41vO0h5wHQJEDvGqg
	 nckNVleWIJ63ox7ZcANH3pS8s3nMmeNNhC1Ln6Rc75lY7AOTSU+QEMSEGar2CJjok6P3H
	 s5tC//EYlxBU5YQLnOv27PHKgk0Ud71cG9Ul6qFSXT1PDcDYsrIBiOcZyEcsKplLAH7Uv
	 aVcSOo/DPlmvxQG+IpurvgI40r0JiQ1bs/gnysJNACt55cq4dHJNnuZf3qKLoqNHhH15j
	 OPFdnWNkJS517YBClSKvoI3ORCPiEOYojigQDBkzYSxhwvp2lrydpEPpNJNTf4ZXLIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEMmPDHB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB1606A68B;
	Tue, 24 Nov 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEMmPDHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF871F000D4;
	Tue, 24 Nov 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513934;
	bh=LN1nBzCRPuD75wAm71ph4QUgv0Pd2fqP4sOkDcmJsTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QEMmPDHB4VUjyGWLEADzRBYlVU0rem03qOd+BBdPzZ0MFBgxFEN+z3r2s21upvhLn
	 09kRpoazKBo5O3+wsYm5ZbPu/2FFex9o+v4FlturPOQb//oWPXVMWI7J9iTZpZzpHL
	 OXBc/NpA6foNwfMqcB+zHveuWM+VHIotkFZZIYBK6EXlvEIRa16NxBWGoalcvahNsb
	 DwnjoeCAx4ZCCcF6jX5h/rr//+4njJ2bBPVBUcwFlisUXACztDpgYvcMqPqNt21AaA
	 rbcctNquuGJiLEz5qCYqDImC1EEVOYR+aGX4BtKU4HbK55kIefwe+wJ2IXO98VFHGm
	 9ZCV3APGph3Bw==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
References: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/2] Update handling of min and max channel in DisCo
Message-Id: <179551393290.362684.5465656262480376461.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:12 +0530
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


On Wed, 11 Nov 2026 16:24:43 +0000, Charles Keepax wrote:
> The DisCo properties "mipi-sdw-min-channel-number" and
> "mipi-sdw-max-channel-number" are both channel indexes rather than
> counts. Update the kernel code to more accurately reflect this.
> 
> There are a few Qualcomm drivers that likely specify these incorrect,
> min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
> should work fine as the number of supported channels is equivalent.
> If people feel strongly I can send another series to fix those up.
> 
> [...]

Applied, thanks!

[1/2] soundwire: Improve channel min/max comments
      commit: ed601f5d59a3085b3a519ea3ad58879a8f2e6023
[2/2] soundwire: Assume default maximum valid channel if not specified
      commit: 48fe747f750b78a3a124c96754a48ff81e207a43

Best regards,
-- 
~Vinod


