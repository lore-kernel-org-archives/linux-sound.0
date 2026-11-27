Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795415;
	b=P2GASZmEStT2oR5hkYAqtIlaIrrGnlkOsflLCcZJw08slFI224j1xxFDi1mEtmFtlWl2
	 eTd4e5jfKIpSZw0QUyM/KvgT0lsSku+hu9XAeSgV7M5qsNAseUMlzjl3rHYhBpdhVGXai
	 L7X9EsRIUwJRV9fMx7YPbpvoeF0BdXljrLP6WAe+radbYV3NDu6/VsQRmLJFvPHI2cY42
	 Y/+px/VjT5oFqKIHRx9RTmgUQYzRcxA702YXUL5cs/MNUvpkGN7TN66QC2NttRLfyZeuK
	 FDkvxXH/cx2B/boAJtV4pbT4BLS2St9qtEKqkB6kWpFgpsHuL1Qui5Id1Uq8xHbp+PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795415;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ke4ndCOLUx/oK+pv7zfO70W2UHjwjDcUZFoIoIFqfsU=;
	b=UuZ7nT5uetu3RiYvATCKcRm+0kiC8nYeK2b5gaz+1TFKTvhCqtQFHE04mITDNjVqevF7
	 76bBwWE9c7cBBJxctJ5amKmYtq39o62ebQbAFoj0SVeIFCOTRhk95F1y2qlJp5DXjbnUR
	 RBuj7IFBRoN2Nu0lL4SsvYgGOi3UO7FRIATnd9LN7c77FKP44t5a5IdzD28mDyZMlog1y
	 nLsFOdKDLAA5qRG5FI+AtnFiaAwv5aOFPEnxdk69gxrH0/kSC5e+PkIbqKzI/Vbcn8xd5
	 8oX0X3WLZHfMX5Ju4ZXXeWMUFs1PvBokqJ03k4h/ms/oAmkMweGfchmp04ha/v2SAnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyuNEpdo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5B606A31F
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyuNEpdo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DD11F0089F;
	Fri, 27 Nov 2026 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795414;
	bh=ke4ndCOLUx/oK+pv7zfO70W2UHjwjDcUZFoIoIFqfsU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QyuNEpdoXGVqT9WH19i5877oRd1ZVDcWqpHgb1mCEVKBp0d09UHVeG9le7jva3Wcx
	 TkyJpT8gtFsG0y6Aw9cZv5Nj7xrfdOpr2TBKiNfwTqqy/vRpdieI+stEmdiFMvwziw
	 Xi039q/5jvdd393hCNyYf6E8W3KcO4kqiOPP5y750KhjWECqPR+jCmCbRqT41Sa6Nt
	 1EQd3v9BISrcjNAFiz2KEhryfr20EoMpEevXow6PJLppA8VMR07SkO2dQWWgU6lLXR
	 s4k+oq3Z73Nb0jjnG1eMdBmt7p3/7YzRd19ZpJUVm05nMVfIU03fY7j62KQ/wc1vgM
	 ERtQ7VuwmJtgw==
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
Subject: Re: [PATCH v1] ASoC: tas2781: read TAS2573 status registers by
 entry length
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com, perex@perex.cz, 
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, baojun.xu@ti.com, 
 k-lu@ti.com
In-Reply-To: <20261127042856.1672-1-shenghao-ding@ti.com>
References: <20261127042856.1672-1-shenghao-ding@ti.com>
Date: Fri, 27 Nov 2026 16:03:29 +0000
Message-Id: <179579540991.838304.12941896797247364748.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=624; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xcLiUptVtNNVIqRdibSpYVilq2C1b4ueH1tFhUY9AIE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5V15msuvaaTtZyfIW55yPTjZFRvdtJm68FaPMHxZyn
 u94GeeyjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkHDMjw/yfz81WZnQY7q+I
 Un2dqR90Z+ntd3kZBaYThBc/UTyyPYKR4c47kVeiF7Vjeeyneh6aknqRIXZewfPVu86eY6z6ndX
 XzQIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The TAS2573 status kcontrols read registers through a shared descriptor
> that assumes the first register is one byte and all others are four
> bytes. The assumption is position dependent, so a one-byte register can
> only be described by moving it to the front of the table.

> +/* Register Array for the speaker calibration */
> +static const __maybe_unused struct tasdev_reg_entry fct_status_regs[] = {
> +	TASDEV_REG_ENTRY(TAS2573_FCT_INT_LATCH),

Sashiko suggest sthis should be TASDEV_REG_ENTRY_B1()?  There was also
another thing that might be worth checking out.

-- 
Mark Brown <broonie@kernel.org>
