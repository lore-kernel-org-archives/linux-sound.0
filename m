Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A72ED872;
	Wed,  8 Jul 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549135; cv=none; b=NXEM/hLyjaUVxyBwgY7pon1RaYz4cOsC8JhbBTZHlYhTnY+54TVhuzv7L+br5njyjKEE+GJ4PasxESOnk2u7P/a2vM9ddZUZ89yeEJ6LDcu9NLDUxdBdiDBixLFi3kU7HoL8jynD5kTFNCqNQWcTcU/6CfpT0STV8NmkYOlmCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549135; c=relaxed/simple;
	bh=5c1y+Gi+3+hEIvTwpgYmR+f/hxEgfE0AAwzl85lqSQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chPtWoa5Ic7Z58VOj3VnwceJiAIKmCpUTK2mYax92Zuq/E4jSAjxbx0uxHM6LmwE0cDLsJS7j87b4PxZhVC916070kS8Beg3ikT9qgF1mwhfka3HI9BDCKUDw0SwPD0Tvm40OGF/JRcX25kq4eHfFJ6EfhZb6aK5yX1cFWZqY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAY+qoxD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAY+qoxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B671F000E9;
	Wed,  8 Jul 2026 22:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549134;
	bh=PM+eFOE8ZHCtOOG2WRlqLg8EKnwhzl9gQ4XIUHylTTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iAY+qoxD7Za5NLV6OSaCryJQACFPLcFNWmufH8zmkEJyN0dl2p5qSRV7BcS22fKnd
	 bbAb10FqZntF6+iho+Jc50cC3sBmTl9vLQN+hPd9888WnT1z+6cOrNa7YNUUV4eVs4
	 oOoZm/1+XVO1+Rc+LoFdYBde9rLsJrCE8mlZlrZoTxAtfNY1nDzztIXB/WiMCqN9rW
	 vVgA79lcbwLnPdVO5L+RBIa7xWrnfyXA/qiNIZ8q4KjMq3wGoGsM2MgxmOGHRu3cRo
	 3PtckWLoPLObLBkrQFGjRF6QQmHT0+t9qzpwWgEFPAvl8sYP9blkXLq4KlKpN41lSd
	 NNq2WKv6gV4AA==
Message-ID: <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
Date: Wed, 8 Jul 2026 23:18:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Val Packett <val@packett.cool>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/26 10:55 PM, Jorijn van der Graaf wrote:
> 
> So for v2 I would keep the two behaviours apart per interface type:
This is not going to scale, please try to enable the required clocks
from machine driver. Pl take a look at this series

https://lore.kernel.org/linux-sound/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/


--srini
> start the graph at the end of prepare only for the MI2S DAIs
> (q6i2s_ops), where an external codec like aw88261 needs the bit clock
> running before the DAPM power-up sequence and where q6afe has always
> started the port at prepare. b54a38af7138's other point - that there is
> no data transfer yet at prepare - still holds there, but for these
> interfaces the early start is about the clocking, not the data. The
> trigger-time start stays unchanged for the DP/HDMI DAIs (q6hdmi_ops,
> where the prepare-time start is exactly what broke) and the codec DMA
> DAIs (q6dma_ops - codecs clocked from the LPASS macros or SoundWire,
> not from the port). That also supersedes my note under the fold about
> dropping the trigger callback in a respin: it stays, as the only start
> path for the DP/HDMI and codec DMA DAIs.

