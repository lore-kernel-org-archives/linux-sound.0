Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768981;
	b=4VSozSyRgVcvk7ZuJ4tB9tNqlrEAXbWvJhRjq3mENFt5DdwCib4mrmndKbwdXQESPDRl
	 TBk6VGAUZgI2vhVepoR3QlbPEIyj6vsXXBmr5u4gHj0XaB8NaeJ4Ct5tk7zm8fgq3DAn3
	 +NxXptEKHSFs7HObfh0Yu8vE3YJeV/3zPzEnOkDg4xhqKaLATNgr4Ly7fI5yao3gksE85
	 tpk4sLr53Mf4KO0KY9t/cFAY1ZRv9AFue2rdfEu/v6nHTfLt25GDu3g+ZJsFqr1OVW+V8
	 xIK8fHwmFGQ5A24d2QBpb2z6717NrdubLrFN3bGb5zmYrUqOLpaP8fCt6aFzERZUZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768981;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=juvjpO8TO68+H6+cyYV70oG23Q9tvM+l9FESY+YMx8E=;
	b=BhvsIgdXgQ/M006v/5IDsvSM3jE4+rKxxBO/z206ynDIGMxMGopL1L1xUFOOsmsHpSWL
	 WOM6gBHbSQ0ViOud8rWP0Dn+RMowwls45t0TZea4JHzJLLk+UTk/KnCvN1RPyp7TfyN/V
	 OZzQBS/8joYsX0wnVo6iIfe5f9GVgzHQpxgp4RrFbg8JztJFYwq/RVYGlucmQMk4mj8s9
	 yTpN5kqPWxJ72iMb70+IOmnYDvhTTPOdcZX/XCiYx2VQHGMu/zu8pTbVZOxhOFxXuDGiA
	 1+cqt4LDsn9S1NMVqdf0PQtrsH7XcZ/P8rb/tMEQKmE0kLiHv2Q51E5NQcS3qMQYKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hLr+z1wO;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C6606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 05:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hLr+z1wO
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ti4s4pmcbtPE8dHuQ0ldlHt/Je4MRoPTj/5T71M3Rpg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793768977; v=1; x=1794373777;
 b=hLr+z1wOjma0FE+Srnn3Ffday0zxYKou5dnu8xjQP/K6DRZHxWarvWQ4WIkrP39Mu4t4CexL
 7OpvWE/eS/h2Fu1BpHJauJ7TAUKIgAmgqBAXQO361AbwS1lFQDOpZULJpOvGY4pzl/6rl0XVVJ5
 DxBqjjX9pbuJR+2jUjyqROBR37qw8AL71/ClXoHDHWLE2YQ6NPFwAQSYLgWjfnA8/mtSgnv/759
 IL47geQ06OhCADS47Iv6XrwQg2axvPPMyERmT/37faQYcGYXTBbAQ/xb3ReATERwBpi+n6BCS4m
 QZPDhK1Lm+wQHKTtnTeNq8PYzN+r3auws+PvcK97IDAyQ==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 11e7a3c2bffe42e8;
	Wed, 04 Nov 2026 05:09:37 +0000
X-Mizu-Trace-ID: 11e7a3c2bffe42e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <82374fa8-1511-4da0-8270-6c4b1c85f2ba@packett.cool>
Date: Wed, 4 Nov 2026 02:09:30 -0300
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
Subject: Re: [PATCH] ASoC: codecs: wcd939x: fix device node leak in probe
To: Wentao Liang <vulab@iscas.ac.cn>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261104022814.1484303-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261104022814.1484303-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/3/26 11:28 PM, Wentao Liang wrote:
> wcd939x_populate_dt_data() fetches the remote endpoint node to check
> whether the headphone lines are routed through the USBSS part, but
> never drops the reference returned by of_graph_get_remote_node().
> Probing a codec whose audio port has a valid remote endpoint therefore
> leaks a device node reference.
>
> Drop the reference once the result has been used.
>
> Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   sound/soc/codecs/wcd939x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 2d463f062e6d..595eab8e33d9 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -3214,6 +3214,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
>   		wcd939x->typec_analog_mux = true;
>   		cfg->typec_analog_mux = true;
>   		cfg->swap_gnd_mic = wcd939x_swap_gnd_mic;
> +		of_node_put(np);
>   	}
>   #endif /* CONFIG_TYPEC */
>   

this is already fixed in:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=9003f8ad9c4ea1a9f645874ccba6eb77e923120c


Thanks,
~val

