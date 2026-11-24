Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528030;
	b=VbMirQgoYu1byu5cX8gPV34Lw4W+rfIizzqNuhKRxi1tMGXMyUUwh/TftZ3kaAcStF2+
	 qzv/5+iZ/anBoT59B7LSySxEtdUTV3PLpapxDgwhgPvlvRXYguHqkOwzqIObnBZBsDOhG
	 ZyMuP8NWsN7qOlJFLDYS2MLWOFxKHBY0+b8un8Opx05ctZWKYHNRsWM3txQNdGk/NqL/Q
	 Mc9xFz0CaKFDiqYnst9QhrDt9FhH0gh1ZaL0jwxYtS0Sfhv+Jb0Wn6RF/ltt5dYBbng0T
	 iij09IShGHAzXh2a6o2CQM/Rvdlbz3rYYKMT6IS9eG3XL7YkiqzL4s/rHmuWoeB3XmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tg0zMB5eEpG0cAiHRBnmI73X5OIw9/2Pzg/TlvDRYuw=;
	b=V6e6EUwa6vivZp1x1Ubo8DEyOpji6RDBg5T749QKxldfdXSs+plriKTbg2zDfQIUYtvc
	 /fArbC9QRSxDQPUVOFy/2oCYs5T9hipnrUMqHb+04lGRycMJhy6B9jQzdMhiMBkJ2OzDm
	 wz0ZXvimmtqS3oaicHLgM+BcdD+UWUZCa9cWNjHu2lB05csjuzSoL4x8hFj1pf2ORMIZR
	 DOc2+LnuOuknkgx7jCFunjodKsFEbvx5F9jDMmN8WqBBBGi2hypSDZWNS9sUbQOhmAwfb
	 tDcoLHgoFaq2GgtphlVrhBbLB/ZMII/ka7Nul94a4yM8WVlj+Gbr4aVq6t0JMh80vCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b="YgNUc/9e";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kFdAjdte;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A46606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=YgNUc/9e;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kFdAjdte
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CEFF77A059E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:47:08 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 08:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795528028;
	 x=1795614428; bh=tg0zMB5eEpG0cAiHRBnmI73X5OIw9/2Pzg/TlvDRYuw=; b=
	YgNUc/9eO7aMZ4+ZZWprwJEEVFbSpmkKtFhB7cc1smw42D/aYsr2ZVacCvL4eoOu
	aq9xbuLX9rWfEHNmMxB/1Db8s1NTl1TyVIw3yQkAFiAJvD3nGg3BaSyfpQexRZnM
	iDUIc6kiTvqpjNdIQvj+9fsLJambPYUZw/ojZn6Ak8s32rATaT2Jn7dsbGE2UtxI
	pXXqfVx1QWs8ImEYP4OaxNpZr/Dbb+GIRXBRQakeDZIfbAZF/SWzt4qPng4dmP9b
	FlsNec9i7HjlAZEG7kc21lLTt6cHSrl/vSjrtfsINah3FnNvXMVEiGOMmt3DVdjF
	s5YJhiX4sTgCtQsi6MYA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795528028; x=
	1795614428; bh=tg0zMB5eEpG0cAiHRBnmI73X5OIw9/2Pzg/TlvDRYuw=; b=k
	FdAjdte3NVzp060HLS0mrddHI6i3/a3hIbgnDvAW6+sEieOgX+4I5LUeJOz8Htk2
	DcraaobjVJPLcHw9OptxWp7wI4iOxEqljn1QiOgMg/ssYtItaISCOziQm0CBn+Br
	BWAvEKBdnSyqs5yXivPmV8jIEr5ZG5laESby0dQYSbOVePyHFSr/M1ar4osvgHGB
	Z9q8vK8bB87fAxyqPtlLBpM6r9kY+d6Y6NGgTyA+r7CHSs3vWUjaPRkhtW/HyM0W
	PUhmeKEhm23cB7H0x2KRvkoHvbzyFuh7qAfIKHHNF0YWMQE0S7jKS19J2stwPIad
	YZ0CE63Mgclb9mUgMPdtA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795528028; d=pobox.com;
	mf=PG1sb3JkQHBvYm94LmNvbT4=;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:dsw+ZcRwkBO+FyXxtasWhckTYJybXLGZ7jIf3lM0ONNvRA7
	eaR+g2EVXp6PAXmNGKS7H/mULnnbdfimQAFFJN3OXdDXAUEkL56uKaAY2bktFqKh
	nDMoSIHyQfjpwCkBbHLtqywpS8o5M+++Vmmk32GFeQzd5bxY0ry5edtlVEdDhQTk
	o4huduZHBoF/3TvpiK+ZlEciL860Hex6VoetMIrxcuNsgLlDLX/1fgRTR86T+OJ2
	rIf5s3aJPsqf3yejDAsNrMlMlAdx6EJeZxXgGkOyJpMl6/BtzJC0Q2z/gfdIGpcA
	oPLCW1764MCH+v9wCXLo0u7OMvmgm1zu+YjOsdA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:roX98h+LEn58XArsesbs81QcEGUX5SJVC8AhgcOTjBM=:JQSgFo3L96hQdP7Flr9DrC65vPlCgR75Hf/Gtj50Nk4=;
X-ME-Sender: <xms:XJUFazYL8BlZoAz_jjI2Q5P99A35eQDXI83KFo0Y8BaUPtOP0e6S6Q>
    <xme:XJUFa51B4ZCJnpVBsqEwu4_Ze-uxPql_bPOHssKHAynvl2nJ_tiGCG0AaiauTAGuY
    M7iaWqJX--lT6_0Ym_o1_NaC4wM5YtP6tfoCv7wos0dB_03tWccUuE>
X-ME-Received: <xmr:XJUFazUGFuiMjHXibAG2QppBcXtYW3IX1Loko7uKZbyKGq-6VOlTIVt6Dtg>
X-ME-Proxy-Cause: dmFkZTFFfX5Yu5k4oAZaid1NpKspMPcXAXa1m1GKCg2U2LiQb2C4n+N/Eo2TFNXcqTVgDu
    oKrOKJVtitmlHdFNn5vina7zk3XneHcuASQj5P9EuQNnHDnlB+YKSzoBwK/Fm0FrhoSrNn
    JEXG56lRZQY6IAcR7xMArg0mR64IjYtqj6/jv0095K/AHc+ys16Vduj8437QTCtXL459VB
    14bFP6ayXQJtxLre00Mz1QjWaWA2JIo3+kuiez9GFjHTipzoVt90csj2PWsbQuPqlB+ybD
    MfLHoppReujmCL5HTzTwXqIioClPvZJPz77LPnDvPCnXTLf9d/7onw8hO0rdSESmZxahfN
    hDzTqsbTSiggNVUqnLpmW/h99DEg3FFTBSHXFfECjo8xN24T60tJwHOOKAGa6FXCJybrqn
    S5WumXlnpCxY9N60H003zkLiOBym3JRpdqioZXbSxKuG0RdNao2LGgPTBkhPiX/6Nb6VHQ
    Rop/hXK2pD2hta6VbZFVHJ7ZVpi5jPul0N+XJkua/Bl3yHpK+MzuIVDs7HMQiR4x7DjPs3
    MTWv/zikj8MK84gcYJ1Bn61y4dynSJS7HqSOlN7TkJkG5zM+KgGqTBY/RsPO3IQx0pef/L
    WP6oUyyW2xJY2MdGR8d4M4UrFzSaJmGPRTdTmiSx+IzOvTddW1HTm+/pD2AQ
X-ME-Proxy: <xmx:XJUFazXGmjJelo1NDFwsTopAILiEcL427Q75jU7HDJQR78aGrHL6Lw>
    <xmx:XJUFayd-N7PheuKdILW1GkszgsqZv3wv0YGqxleh2rKOyh91odm8kw>
    <xmx:XJUFa8VBfVKBmr7z6JhEzFbVVsFrGjCK46YeG_AuB_DPd9wx_AwPig>
    <xmx:XJUFa7cI243AqAGocsgBL26ohg9eQGqIeTtwpLkONeaFcON1ADNRPg>
    <xmx:XJUFax0y2XJkyX3bkZokheycS0jFTXDJACB6BP4FOsJsjiyqcwLfF386>
Feedback-ID: i55d94976:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 08:47:07 -0500 (EST)
Message-ID: <d406700a-4a14-4f47-95e0-72704544dce5@pobox.com>
Date: Tue, 24 Nov 2026 08:47:07 -0500
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: Cen Zhang <zzzccc427@gmail.com>, linux-sound@vger.kernel.org
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
 <b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
 <c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
 <87ik1ndgkp.wl-tiwai@suse.de>
 <0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
 <874id7d336.wl-tiwai@suse.de>
 <64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
 <874id6bdsx.wl-tiwai@suse.de>
 <E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
 <87mrqy9yfk.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Lord <mlord@pobox.com>
In-Reply-To: <87mrqy9yfk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-24 08:00, Takashi Iwai wrote:
> On Tue, 24 Nov 2026 13:56:23 +0100,
> Mark Lord wrote:
>>
>> You will have to be more specific about exactly what you want.  What commands to run, which files to view/return, etc.
> 
> I also have no time to guess your system, either.
That's why I provided that information up front in the
first messages I sent you.

Tell me exactly what you want, and how to obtain it.
And I will get that information and provide it.

Cheers
-- 
Mark Lord
mlord@pobox.com

