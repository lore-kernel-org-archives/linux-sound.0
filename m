Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511614;
	b=rTqT8mo/6l61zKiwE5bk4QnEEXGYvjrmhZlqhSnryFcNAE7wLb3B02Zy0j/PrZSIhA/u
	 pmc5PC2LeHWwYqKxRKFYZH2Dby7QIf+YPn/Q+OM4pL6SkEmC2XJTTfCnJEY8E8GVTHd8p
	 8m7K/PH/d94TYaq0P0xopLYzyhD54qMaQZwfQ7DJiUy8d3V+Szva4+/iuJfRO65xFKVop
	 xcstDTBwoYxq5nKE4ohF6f4d4s0hCu591qgB/eX5vTIb6uQiOeVSZt1o4ddgnq+qp6P5S
	 A46/Gimh+SdbOvJfcvn4jHr/HzXTsWt6mvSHdE/3NmKxHaDwy/Sc5zIPOFHaP5mOwZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511614;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EPHeCuolQff39FHQJAZjbP/s3qpzbOqrKtmo80eWN3g=;
	b=UBTYmC5oAmSs3dMfYTBtSnXqzD2qGxlpqBa1SJzgPw9hRQCW3hlPR407G0d9+G/DUALP
	 liINfkVRSxXyXPNhlqp9+oSdxfkj6h55a8UEAGegtiz/NJ4BC4Oa/8yqM4BtDrzcFAg4s
	 NzVwdDH8/wgTSmDnd5X6ErW2kH8R6xsFiiKXazZPjSORPfxwXoIerDQ2yFnyIguhh3xvb
	 XHm2ihfcGoNF6838Sh45wACYKivPHLdjkY1406gW/nL8KZT7e0o3d2HwJLzb0qC/oA0we
	 CRiJD2IlYSqjQ7kTi3DwU6SIRujWWBCHjZ31QWfr9uMiPPjdijZ3n2lfUo8ckvkzQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxwkj8nC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08891606A31E;
	Tue, 24 Nov 2026 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxwkj8nC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5101F00A01;
	Tue, 24 Nov 2026 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511613;
	bh=EPHeCuolQff39FHQJAZjbP/s3qpzbOqrKtmo80eWN3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nxwkj8nC2yARScRBJjWKcUUWC249hHmOKTpuwQk2qBuo8p29cQMdfEanVbDyhGCMV
	 rFZRiTvDV1BD7rDBh9Trt1dndpniJS0axmgkINHPaaLKBPxDRoOm9GbdXCYa7j8XaO
	 /6NE44QbMAstc4Rp1DXGgF4NniaLoS1w1hWmGImU2cSQ8l8MqSs1Ml3v5PpICveI8t
	 KH707edyrPa7w7b8XPFI9Bm56uD9bSJ+1nmuyB9NZCd83PBntSwDrcpqZDjUv8OhcV
	 TGLB9vylfQe+DkwWXKP8j1C1pxVF2/jVNGX64gbSdxEAu1wT2DYzS9DX7tXXiHw3xc
	 zrSKeAZk48Fng==
Date: Tue, 24 Nov 2026 14:43:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Carter <yass27106@gmail.com>
Cc: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tiwai@suse.com,
	perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable()
 return values
Message-ID: <awVVOpAzR5YAZhoQ@parshuram>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <c15d3417cda640aebc7bebff76b0448e@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c15d3417cda640aebc7bebff76b0448e@gmail.com>

On 16-11-26, 12:55, Daniel Carter wrote:
> clk_prepare_enable() can fail; unchecked, the driver proceeds to
> touch registers with the interface clock off, which aborts on arm64.
> Check the return value in the interrupt handler (returning IRQ_NONE,
> as the interrupt status is not read or cleared on that path), in
> probe, and in the runtime resume path (returning the error without
> unmasking the level-high wake IRQ, which would storm while the slave
> keeps driving the line).

This does not apply on sdw/fixes. Please rebase

-- 
~Vinod
