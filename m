Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9743B3BF3;
	Wed, 10 Jun 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081553; cv=none; b=La2KS+xX6SY24P9cpjr/KJC3BUY2fLdGnXfdnJcY+2FMFFwc3lA5it4EdNmBUu6gD7LXFiBze+DLTthRxcvg5S4svJ8tVbtYh41hyFRPuO4O/nmyZJerZZ1To0cH9+cnx94QwXcJZpDreFaPfKP39LD0SyW0wLbJ7kZ/uvjcyVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081553; c=relaxed/simple;
	bh=u0LR3SYBuJwgYvGP2OXBUhsRu4xYAEjv/Q7ZAW6n3Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLuesfTARL6zaQVmo9mfJYueQSOZqKIcmG7rWT3tV0R0+GOzOSzFj5THCs5EnE8t7JZPX7VVdAvgjYu75n49l+k6bHHKdf+BkUVuS81SZh+LqERna2B+H7EtMSZ4g/YNc76VQ6cAPePwxaViduSlECc4FbKHSnPAaptuNsCKDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1Sg4Hv0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1Sg4Hv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1EF1F00898;
	Wed, 10 Jun 2026 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081551;
	bh=5SzetJXMUGhRXQho0GH8amXNhAhLSHfKjTR6z8oRNaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1Sg4Hv0x1UnnI0PXZYe2GZxhEJoKoru2hzNyElmeTI/Horl+nCScUhAWcxMV0CMx
	 hD2pOgzlhNgpEOTriq9KZY20m2uYsoKT9s1zrtcnGVGsfe5PerGkn+GRw0ryu6aCDu
	 WCqIuUyohZz1x/M4DAXL4c63Td06IIkfTrU/RSBAtmh3xkG/j6qHLc3K1YwIEIh4TJ
	 WMlkZsaaXvw3Dp4djKJNVNp9nbCf6qVxCaUi66ZUJ1u3T/2HF1ePegzde9Es0ocbV4
	 YSD4NvIrLpdDuUMfbmzdudc9VK9em9nea2ylUoqCDiEs0KCbl3++x1L0/ihn7fARb1
	 t7RkNiB9nT5UA==
Date: Wed, 10 Jun 2026 10:52:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: Re: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Message-ID: <20260610-goat-of-pragmatic-imagination-2ee30f@quoll>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 12:10:38PM +0530, Ajay Kumar Nandam wrote:
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb4423f..15ca51ce33b8 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -71,8 +71,9 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
>  	}
>  
> -	struct gpr_pkt *pkt __free(kfree) =
> -		audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
> +					    opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID,
> +					    audioreach_gpr_dest_domain(gdev));

I don't understand why you are making all these changes - code is not
readable.

>  	if (IS_ERR(pkt))
>  		return PTR_ERR(pkt);
>  
> @@ -112,9 +113,10 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
>  	struct prm_cmd_request_rsc *req;
>  	gpr_device_t *gdev = prm->gdev;
>  
> -	struct gpr_pkt *pkt __free(kfree) =
> -		audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0,
> -					 gdev->svc.id, GPR_PRM_MODULE_IID);
> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
> +					    PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
> +					    GPR_PRM_MODULE_IID,
> +					    audioreach_gpr_dest_domain(gdev));

Best regards,
Krzysztof

