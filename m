Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603351;
	b=VuoK2UP77CBdJwMOA/b6BnfjhgPJVhkdpY7deLUEsiSdL7YhdiEkgUE4xLY7XLBXyC6z
	 bYSqVKEzkQ3cLxlW3eR/wmC5biY14PJ9HkWZGc9Ep9peJ8OKdcMm+d7wG9NJQzsq720va
	 aos4XHQ4jsGzi0yi9KAiJYRzWF3UI9z3wogkytEbCL1/b2BHgyT6hoS2dvfNrP/Nc/5dr
	 BTNnevp7IGmZ+9bzqWSCYx/FSuILPQV0uRRHinkd5tmR3GPBf68xka8gBeceVsPGrNoOZ
	 R2dijYQIOpR8X18YwQfDQZIatj4Z6TzYGq4c/5LYiD+PqXuMF5V8nYfIDclKCAdFmSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603351;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9KdlW/b/6VWvZj4owgy17CGEdvfFPr2YNvHguWMgqhU=;
	b=FbrLweFd2Cz+b/dFHeLk6nZ03/yonlAzC4c2r0AEzNtcoClye5fm3lS5ROeadFW/ICn7
	 3TtV1zyDCAEn2je+AVdaY6E947H7ZZ+8ZlDqtdzvxW365SXstTT0erYB6TcjEiHkE/bff
	 UfvhTO7rQVsUv0t4U5X93oU8FQNOFgoVWwJv28XRfQd0LnQ9qk23ilMw3vQkLW7yoIOZD
	 xYuClDXoGQtXWUvS5F2axqRPKpWjeAE+sKGk9/0Ka9ejHtqwc+YVbuTmdN7AY+gq1pbpj
	 js0N7tPeluGY/kjFH//WNCUQta7CiXgGWvHEv5rZATF8/wHO/Cc1DkWEEjaNuY7yt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4anuCq0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39750606A31E;
	Wed, 25 Nov 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4anuCq0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BBB1F000CA;
	Wed, 25 Nov 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603350;
	bh=9KdlW/b/6VWvZj4owgy17CGEdvfFPr2YNvHguWMgqhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y4anuCq0CGNKTGasl5DSlYO74JjhBQeUZ5EC6fe+ZBzxepeRp2IUbeSyMHEDpSUpf
	 kkXIJbzHB2Xi15T5AQeRvzbX4gQC5RlPKuSAOIlqYo91R/BdstDpEoSTqpUNnzA69L
	 MTJKlVSoi83RR6dr1XwMCf8hSVix/Ia38mhjE6CQCuU72JW2yJ4JUFIqIZ4V+8dNdB
	 PBOVEIhyy5b86paKp+EnBkgeMs1bBwL/X9rzTp8sx1sA6oAZ3rnVEUtWAyyOgBLDHt
	 ORg+AzUhsz3KkD6Vqluf5SKGeLhL0Ahtqr3Fl67znhGT2xDb6OVH4tcIjd0JFDPLI5
	 VS/nWAE2XeTAw==
Message-ID: <8e015118-7c96-4270-a969-6d91271adeb9@kernel.org>
Date: Wed, 25 Nov 2026 10:42:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: skip DPn_BLOCK_CTRL_1 write for
 unconfigured ports
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <CGME20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf@eucas1p2.samsung.com>
 <20261125091150.2145177-1-m.szyprowski@samsung.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261125091150.2145177-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 9:11 AM, Marek Szyprowski wrote:
> Master port_params are filled in qcom_swrm_compute_params() only when
> qcom,ports-word-length is provided in DT. Otherwise they stay zeroed,
> but the SoundWire core still calls dpn_set_port_params(), so
> qcom_swrm_port_params() writes 0xffffffff (bps - 1) to
> SWRM_DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register
> range. Since commit 55207a5b6959 ("soundwire: qcom: add multi-master
> support") this also triggers the port_num sanity WARN in
> qcom_swrm_port_target(), e.g. on RB5 (sm8250 WSA):
> 
>   WARNING: drivers/soundwire/qcom.c:1170 at qcom_swrm_port_target+0x68/0x78 [soundwire_qcom]
>   Call trace:
>    qcom_swrm_port_target+0x68/0x78 [soundwire_qcom] (P)
>    sdw_program_params+0x374/0x774 [soundwire_bus]
>    sdw_prepare_stream+0xfc/0x310 [soundwire_bus]
>    qcom_snd_sdw_prepare+0x90/0xc28 [snd_soc_qcom_sdw]
>    sm8250_snd_prepare+0x2c/0x38 [snd_soc_sm8250]
> 
> Skip programming when port params were not configured.
> 
> Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Thanks Marek, for the patch, I have been fixing this issue along with
few others. I have cc-ed you on some of the patches, which should also
fix this issue.


> This patch has been developed with LLM assistance and have been tested
> on the real Qualcomm RB5 board.
> 
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---
>  drivers/soundwire/qcom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d74986a3dab3..613679be4b21 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1205,6 +1205,10 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
>  	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>  	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
>  
> +	/* port_params are filled only when qcom,ports-word-length is given */
> +	if (!p_params->num)
TBH, setting port number should be set irrespective of word lenght
value, some of the fixes that I sent out today should fix this issue
correctly. Thankyou for looking into this and sending out  patch
promptly to fix it.

--srini
> +		return 0;
> +
>  	return qcom_swrm_port_reg_write(ctrl, p_params->num,
>  					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
>  					p_params->bps - 1);

