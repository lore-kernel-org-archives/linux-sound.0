Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA532D249A
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764362369; cv=none; b=a+8HutzjbaBafA1aqhztFDmpS2JpmqvwNeIYu5WlGa6hojRum6Yl4kyRnclLAPopZofRihy0VDpNn2pfXfe/OzPkoHnItBlFYU/plID0nr8ig2kp9IMtT0TRt6cDQMr8hoyxDnfTxOIKMjm4oLQ0uvKc7s7o+BXHR6vhVWApVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764362369; c=relaxed/simple;
	bh=+E5ZOQ6ljj+CsoWXVCY1UvTcLq7tZGXxyoUHm3FNWno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY4sgwW8hPXl33TZLttfHfmyeWju7MLhtbyP+kHpu59PoAvn/g0pxbzALSxT0/77msXXe5P3B7VOiHQXQG1bwQnxXDq0FZbqbEGoBGoap0q9owrEFclpuHq4Mvfno/ZENOyEP76OA+mx2nb49zptWpr1iBKDm++q6WsUAY041o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=TGxNMBZH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S500Z8UC; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="TGxNMBZH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S500Z8UC"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 03E0A7A075B;
	Fri, 28 Nov 2025 15:39:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 28 Nov 2025 15:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1764362364; x=
	1764448764; bh=mjSkL148KOm2SRMuQptLrI/5PbjnLJ0LKy1I2OiEPQs=; b=T
	GxNMBZHQORNNk4A6+YjnfGkFzXZ8goo27Jt92wDx+yoVdDFumF+XPfY3q94RIZW9
	dL1hoGpR1M3IU7rd7XJzAjBY6Kh11LTFLqy2dKVMAlgMdPo52R3FnqCWqgvAQL6w
	8zXLjTLMsK1RxfJ5wLeTOChyOpjkGvWT7dhp65UE9Mn4gFlwDAQYhwnUliI3ffnk
	/xzahhvQmYfvMd9EiSmz3Q+CQzlq/cwx8kiL8i8/bB6onigh5tNfdKilHIYq/aqk
	O5jg77cuZS2c5NTI4VoiNrnRVT1LTwIpqyiUgGJq067+mGNOnv5gfBXSoJO3q4SY
	ro5r14Avf82IBqGHmeIqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764362364; x=1764448764; bh=mjSkL148KOm2SRMuQptLrI/5PbjnLJ0LKy1
	I2OiEPQs=; b=S500Z8UC5friPBWfyXS/z0UgmbphhG6O48mZMfR+vuNB3Cy4QKz
	sAnusjdXhQuMtc0RULgfdag7VdZpr5nU5dkJVwRfrBhaSkmDxd+GwL4dRYNiK/Xn
	ph8hT26NA3RBNkFOgIkbQ7Q9V1Zdkpo+VjIgD7Cv5KLllLyVzKFHYBwQ1hmvDOwQ
	bJfo1Vnpfj7DULNROUfEfroJ+Ey/N0ERJY5E9Qcj30Dfv72I4ewtpdONSHctXSl5
	lWXBhfCClLeCknxLeivs2n4Sft/glcRu0qbRiEKtxNeLDscJxg7pR+nylhsbTOQr
	8Z46PD8YlIsDdQA30KUuHN8M6N/l43GKNqg==
X-ME-Sender: <xms:fAgqabPfXk-AWOTvJyK7W-6KhdbqnoBdWePSL4uyuW5EqAO2xUsE6g>
    <xme:fAgqac_Rkt72GforsbRbMqzvkv40W3BsZRWQca27GGszM-0FSojra8f3S8uybX19W
    ljwN_X-08S53Lh0HZYeuGdK7tf6lDk9iiw6qiuX9HUqxcrxk3SomnU>
X-ME-Received: <xmr:fAgqafRcwQeDS7SoO_hFrTgrZ4ZJWZD5PgO0OSDxIn5JVcXpzLnm7AkJe0ydVLe4gyAgX-T1FK_kizL9Tei_p1rX0rElzVmQDzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedtkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeeiieet
    vdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghr
    tghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhoohhnrghfth
    gvrhhrrghinhesohhuthhlohhokhdrtghomhdprhgtphhtthhopehtihifrghisehsuhhs
    vgdruggvpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopegurghnihhsjhhirghnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:fAgqaenZ5yhBrDIGKR_l-a57Kg1FMHzh92K5GzKI0fA8sEykRfzItw>
    <xmx:fAgqafRTjFbU-uu_sJBnpWgUWHt0lgSyDvUTf3X47yxLC1FhIrzlUg>
    <xmx:fAgqacNEszjYrVekhtUSif3enYTXn6m-71rwZzYO3yi6ZHuWZviBKQ>
    <xmx:fAgqaYWMyjn6mFTghnK_qJTfuO5eaUiQV-OMPIJy-NWAQEUEvMloYQ>
    <xmx:fAgqaY9J6dzQFEohtaKbaY8TCeE9GplqUVmALG_-VUfIWTHEXY7RXZ9H>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Nov 2025 15:39:22 -0500 (EST)
Date: Sat, 29 Nov 2025 05:39:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] ALSA: dice: fix buffer overflow in
 detect_stream_formats()
Message-ID: <20251128203920.GA106426@workstation.local>
References: <SYBPR01MB7881B043FC68B4C0DA40B73DAFDCA@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB7881B043FC68B4C0DA40B73DAFDCA@SYBPR01MB7881.ausprd01.prod.outlook.com>

Hi,

On Fri, Nov 28, 2025 at 12:06:31PM +0800, Junrui Luo wrote:
> The function detect_stream_formats() reads the stream_count value directly
> from a FireWire device without validating it. This can lead to
> out-of-bounds writes when a malicious device provides a stream_count value
> greater than MAX_STREAMS.
> 
> Fix by applying the same validation to both TX and RX stream counts in
> detect_stream_formats().
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 58579c056c1c ("ALSA: dice: use extended protocol to detect available stream formats")
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  sound/firewire/dice/dice-extension.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
 
Looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Regards

Takashi Sakamoto
