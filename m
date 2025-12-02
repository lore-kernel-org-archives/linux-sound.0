Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AEF2E62D0;
	Tue,  2 Dec 2025 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713292; cv=none; b=Psa84c1Jr9aBTN8XO9+5mOH+B6kZGdfNJEwmak5cAqV13i5oHssRfUu3e6aqYTKuSWQaVFLoOUcRYwvd7TXArg5WIeOIqCcl29Lnuj3CpvGp1yJld3wR5ZCnR7ZQS1Ica8lcF37TVJP9fV4sO5aIjNo+MPt9at2Sm0N9GLhY4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713292; c=relaxed/simple;
	bh=h504TlD4hkfWEx5CxoUKhaX/q+6HXNdHKNnpsA753es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=re1gFl2iZcclBz5NHdJRuDlzPFXRYngA/bYb/kfYI4iEUkJuFM6pqUpKi4aDmYIjPlZKjRxuKCdeoF4Rjt+U3hBnGIx0E6mop6L01hRSZ543jzv6I34vTs/G3JOqRtcvQnxqV/7kyhQqRyLsvq52jcCE5SaPbbFIM/yK/dhPhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCRlYw5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCRlYw5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743A8C4CEF1;
	Tue,  2 Dec 2025 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764713291;
	bh=h504TlD4hkfWEx5CxoUKhaX/q+6HXNdHKNnpsA753es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JCRlYw5bmZNXcaX2ZPvhkXNTAqKvGQwmtBoY5BOnrG3H6DX7K5Mx4Bs4LXMb0OFAR
	 zmkCm0lvdmUSCoeKti0VZpVDkF2vx/EHgu38bsLRnmxZl7XjW5JJsDkdKdkZ18Jc0K
	 r77io/RyPRNrERAYgoPcBLdN+Jmi6rH7AC5v1FuXbmDW2EmAhEQfM2fYmq6yWL99TN
	 1JphVlu2ex7DhDnKMgMIEqzyfWKrTz/6tTLurAUQB3T89DyVqzDshZUqIQU7Mdovah
	 3K4buQHHFvp2cTOgUCsMyQHfkTmXoE90wIS9D5kDfRIuKgyeKB71SMGldY2YghoYiM
	 8gMNJHYd3HXGg==
Message-ID: <9070b032-03d3-4f01-85d7-d55918678659@kernel.org>
Date: Tue, 2 Dec 2025 16:08:09 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
To: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/2/2025 11:56 AM, Raghavendra Prasad Mallela wrote:
> From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
> 
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
> Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
One nit below.

> ---
>   sound/soc/amd/acp/acp-legacy-common.c | 32 +++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
> index 3078f459e005..da80c761d657 100644
> --- a/sound/soc/amd/acp/acp-legacy-common.c
> +++ b/sound/soc/amd/acp/acp-legacy-common.c
> @@ -208,7 +208,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   	struct acp_resource *rsrc = chip->rsrc;
>   	struct acp_stream *stream = substream->runtime->private_data;
>   	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
> -	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
> +	u32 phy_addr = 0, acp_fifo_addr, ext_int_ctrl;

Why initialize this variable now?

>   	unsigned int dir = substream->stream;
>   
>   	switch (dai->driver->id) {
> @@ -219,7 +219,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					SP_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
> -			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
>   		} else {
>   			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
> @@ -227,7 +230,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					SP_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
> -			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
>   		}
>   		break;
> @@ -238,7 +244,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					BT_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
> -			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
>   		} else {
>   			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
> @@ -246,7 +255,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					BT_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
> -			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_BT_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
>   		}
>   		break;
> @@ -257,7 +269,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					HS_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
>   			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
> -			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
>   		} else {
>   			reg_dma_size = ACP_HS_RX_DMA_SIZE;
> @@ -265,7 +280,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					HS_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
>   			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
> -			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
>   		}
>   		break;

