Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D293AE706;
	Thu, 16 Jul 2026 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236786; cv=none; b=Okr5oZbBncaqbycrS4pt0vxp/JHzM7QODTwryFjkyZLEoy/6XnodDyMn96JYxpDX6T2mLt/U9g7i3JS1ZBHTuJdOlZApGyJjw3/eJmrl+miOYWH9PubbhcN+oP8CUkkpXI7nrILlFCJ1565upr/rIq8cP//7JXjr2n3/WVhyfH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236786; c=relaxed/simple;
	bh=MS6FwCuSxAuhiLhjVB7+YYzuYlT6h0We47x3A/dnf+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h1Sa8x3+pvr5xiEE0g7xe2PlLwILsuJVhpgPK+HV6bDfgOluEyQrIeWP41LQ3ZQQYCsx6eefDrCM1lViPwFXjYYfNdTauToVWcPLIoTKD2vu1tSEQhO1FwT0/xUnWEGHXzquIsiuzuJD56TkMS23m5LlBCPAtcl+TeKSRAT1akU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJJ2nbSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJJ2nbSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EBC1F000E9;
	Thu, 16 Jul 2026 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236785;
	bh=yknx+PKkocjFFTxFwurrO75UDnBnh0LucC5puBj0S+o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=HJJ2nbSwd+9GqTks7QKSKor0I02ntIxRV9hhaEefJhbpoqaguhCqD+4t3DoLbiRMh
	 Ei4OWseAzMS+wLLopKSI7oyGUL61GyKecgYdfoIDcY5CxobIQsx5En7s9fPCpAE/bG
	 XxzDeLaTuO3brCJ8C9pSbSxO/Olan866La197PDIDkw2qkBspbgLPALhInsy5jY8vq
	 2vM8heFY+URZZcb8L/k94xA9OKa6nKI2WoFBwMjufDTgg0xmolN73OE+3IQLmIcH3i
	 Yq0MjTkPRoIhipwSzN3mPJKTo3uZKKoLoGn1kn7uWnta8SrggWx8nBsAW6rynuiwhl
	 ih/2TLiVV1GwQ==
Message-ID: <75bb19e8-a96a-4f58-ac5b-3f5556386e3f@kernel.org>
Date: Thu, 16 Jul 2026 22:19:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: q6apm: initialize graph refcount before
 publishing
To: Ruoyu Wang <ruoyuw560@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617182150.959983-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260617182150.959983-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/17/26 7:21 PM, Ruoyu Wang wrote:
> q6apm_get_audioreach_graph() inserts a newly allocated graph into
> graph_idr before initializing its refcount. Another caller looking up the
> same graph id can find the graph and call kref_get() before kref_init().
> Initialize the refcount before publishing the graph in the IDR.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 2e5b25b8d00fd..1953e8ca8777b 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -65,6 +65,7 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
>  	graph->apm = apm;
>  	graph->info = info;
>  	graph->id = graph_id;
> +	kref_init(&graph->refcount);
>  

this is going to break the error handing further down the code.

--srini
>  	graph->graph = audioreach_alloc_graph_pkt(apm, info);
>  	if (IS_ERR(graph->graph)) {
> @@ -85,8 +86,6 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
>  	}
>  	mutex_unlock(&apm->lock);
>  
> -	kref_init(&graph->refcount);
> -
>  	q6apm_send_cmd_sync(apm, graph->graph, 0);
>  
>  	return graph;

