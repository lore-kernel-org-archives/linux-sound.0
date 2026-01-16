Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E9339709;
	Fri, 16 Jan 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576102; cv=none; b=M7qr6+V5ozERYyaDzbO6jYvl1JVV7UDZygPcXObd8Ts5OLjzu7MpfLiHGNn4y7lYEyFd92WaWVo4FPDjuk0QP0N3eRzxPR9MpcYCTjgBE87X/pgmQHkGkMf0qH5nayZQERsRHLFtlusNROBqHvKrhO3Y0JNlR7Qgh06EWt7fuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576102; c=relaxed/simple;
	bh=L/HOSpJtqEp/e3nyMrq+9QjC47mSPiJ2Yziy3NYJolc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMPHm/WrCb5f4qi0uM8VxYzSDd4+ZgYVSkjpfx9S7H4NMd2Lj+xPtQ4kVF9uJD10DuEldTZN7emJH6SoHvzIqYbEO+PtNguQvh4LTVzIjY3XnUjzBMvDxFRz+v8zbNoVt5HgLUzSoKGSmyMST/L9tefMs/WFfraC1EGn6qKeIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d16C+y/T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d16C+y/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337A6C116C6;
	Fri, 16 Jan 2026 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576102;
	bh=L/HOSpJtqEp/e3nyMrq+9QjC47mSPiJ2Yziy3NYJolc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d16C+y/Tumd22i1N3bhbuh6anO7hRSMRvfqsosQvfyI6puDbKWSdeAMoEmifacdPV
	 h9xDJLP70dxRnBDSPEKx3bBXmnlCLss2YRLbSL8wnmgqMcnScfX5OcmZIcfBughyF9
	 PKE8T7dtdo4k7s5BWWcEJRIs3X53HkgUMNG3satOdGM9L26bKTa46VM2oTzt3Nf6Nu
	 Iy4fp5NtMrrBWrgtfvO4r4svFtADUNVnmSkYNBGwazaLMc08aFKJQhdO7l290lUsjR
	 r1Jv6zkZ3vkqXcqLWdSUl1PVV0XCg5yRRcyOg1nQ/y3z4GWg68Yzeu9Ustnz+StorA
	 UbTj/lEbA6Uzw==
Date: Fri, 16 Jan 2026 09:08:21 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com,
	broonie@kernel.org, matthias.bgg@gmail.com,
	julien.massot@collabora.com, eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm
 to audio-controller
Message-ID: <20260116150821.GA1576159-robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>

On Thu, Jan 15, 2026 at 01:56:24PM +0100, AngeloGioacchino Del Regno wrote:
> Device tree nodes should have generic names, and this one doesn't.
> Rename the mt8192-afe-pcm subnode of audsys to `audio-controller`.
> 
> This commit brings no functional changes, but resolves dtbs_check
> warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
