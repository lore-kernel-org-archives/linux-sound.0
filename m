Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023D15853B
	for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765677472; cv=none; b=WzxoxZ2LQwf9dnvd2t2ZGn7Cm8E97661WfwQwXWAQdwPs04gepbZDd6oGVP3WaH+oUpb3ayeDOV39Ss4CHakwrf+5la2J0leUNjH7rYi+OR6X8Ik+oCWn0paQMLQ4VsVCJBdsZUv+lGXKcgStlj7DK9pLa6ONVvZULpXhYe0rok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765677472; c=relaxed/simple;
	bh=Zsfhi9gWqJuZ58PYSidHZ1lXeTAowdvXUC+uq21Oy/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg3cFagMC7+GD9zQK+MbXg6eyllKORL+J13tcJ75WsgpKgNvE5VNgMhE7tz90adUNb5ceKX6mCIszBhdzQr7rhI1tVoFwcXhkpOpEK0A7897PafSWefEfypnO1d9R0rD9UCXzU0KTrofNDg538hBC7ICWkkb74rWPBMFuez7Cj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fT2l5ieR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=isL8x8Fr; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fT2l5ieR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="isL8x8Fr"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8482514001B0;
	Sat, 13 Dec 2025 20:57:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 13 Dec 2025 20:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1765677466; x=
	1765763866; bh=nymH3WPIjLSOjV8lEs5PXfaH4VxWELLaDBM/QZ6IYBs=; b=f
	T2l5ieRPJ1vZ0DLSvn7yckKlPhaedYd10ywZ3xAAyOqB1ngpq97vwPxTnH2xROIY
	2lm+SdN3tQjp8pvcOmVJ25duewqpHFVWJ0swYpeGEexv6eFARl0b3U+OF7XS9nGV
	Uoa1JoYwJEjfGm9yIHDjlrGzsb3JpBSxrwNH2+v7cpzTBL9l26KK6DJe8RsUyA8w
	mNXDeykmep8is8Jh+bwqcvNB7rXueHrn/kS767tn25TNO237BaNACJ6/GGWFeBY+
	XEq2my/PYcVD9UKBU2uXO5nq/vpPZqe7jGkjdFEGqZzipJs4dZ3anUyZO1yYFFIG
	JxaN9ovFYDPJQUvzsX2vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765677466; x=1765763866; bh=nymH3WPIjLSOjV8lEs5PXfaH4VxWELLaDBM
	/QZ6IYBs=; b=isL8x8FrNIwKlAOzM6D5Q7PnbsWFn5h9xKQJOsPGjdOOgnFD+zJ
	Z4Brwf+bnbH43+zN4XEKESWXn5cVu/M4OS0rnAqQnotZPjdb4j8mODN3oe4UbBJF
	JXhgxjc/qp6Q1eK28zNskslBwjwFidmqpa7Kgte5ZBpvZ3pUIMm63GqpJs9RIosB
	s4+uEama+EjcLWZl6jVACBhkuA3s3CFAxu7hjoewfdvkoO0nHcwInVBZ/9ZJNUkc
	XdcoSHMOKLVieDsWiBgN/khl2f0ATL+HRfFebb9iLr8B3EKiFk/auLmcn1N8ql7l
	0/jDuUa2PR2yj3oy/sAN22PlQoBm9gfnaDQ==
X-ME-Sender: <xms:mhk-aR_RnbQkJ-cjU8WDP5VmgAYeIKbaivbbm84THqV0Qd5dgMMGSQ>
    <xme:mhk-acuk1r52OpG1v56L2LT7F_sTE7nbTwrf_8bgqgoaXDD2O0Am5lG5mnrJDHG5M
    wF_jJOVHnM8gvAn8q04nq41jaqJS2BtQIFxmHBBpfCPlJuhQWgRtXE>
X-ME-Received: <xmr:mhk-aUCagHwjVSzMdAF6NOuLdWMzdDY2StKo8hgz0V2tgRlNksv4k8_AVMPKQhXNVOmW0-X3NYnP1v4raCNW2R5wuao3U6MiyLBc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhi
    ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
    enucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeeileej
    heejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
    shgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhhoohhnrghfthgvrhhrrghinhesohhuthhlohhokhdrtgho
    mhdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugi
    dqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihhs
    jhhirghnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:mhk-aUU7dxnwtpBEgCKwWRQFAccPjpqNBiV34OFzdSgk7xybfHJTSQ>
    <xmx:mhk-aSBw4R0PCT2_V1dCROjKaLbit_U7T5Q_mIBUcjvuCpGPVTd3zg>
    <xmx:mhk-aX_Lz69a_b8XhopyW_mbnD4ybok3lnN_sfK74E6VEXcL80qwBg>
    <xmx:mhk-aZHSTM-Hy4v73nsdshjnLveYi7tKQi-juXc_Ryh4MC6-fDYfAA>
    <xmx:mhk-aTuO_EykS0yO40-h-sH0Oq4xN25-uql6xYZIl6JFbEDh-kJC35k7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Dec 2025 20:57:44 -0500 (EST)
Date: Sun, 14 Dec 2025 10:57:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH v2] ALSA: firewire-motu: fix buffer overflow in hwdep
 read for DSP events
Message-ID: <20251214015741.GA665386@workstation.local>
References: <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>

Hi,

Sorry for my late reply, but I always postpone my review work during the
merge window.

On Mon, Dec 08, 2025 at 08:09:09PM +0800, Junrui Luo wrote:
> The DSP event handling code in hwdep_read() could write more bytes to
> the user buffer than requested, when a user provides a buffer smaller
> than the event header size (8 bytes).
> 
> In the put_user() loop that copies event data, when the user buffer
> size is not aligned to 4 bytes, it could overwrite beyond the buffer
> boundary.
> 
> Fix by:
> - using min_t() to clamp the copy size
> - Adding a bounds check before put_user()
> 
> This ensures we never write more than the user requested.
> 
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> Changes in v2:
> - Also fix the similar issue in the put_user() loop suggested by Takashi Iwai
> - Link to v1: https://lore.kernel.org/all/SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com/T/#u
> ---
>  sound/firewire/motu/motu-hwdep.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Indeed, I admit my below lines are enough rough. Thanks for your correction.

> diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
> index 981c19430cb0..89dc436a0652 100644
> --- a/sound/firewire/motu/motu-hwdep.c
> +++ b/sound/firewire/motu/motu-hwdep.c
> @@ -75,7 +75,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
>  		while (consumed < count &&
>  		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
>  			ptr = (u32 __user *)(buf + consumed);
> -			if (put_user(ev, ptr))
> +			if (consumed + sizeof(ev) > count || put_user(ev, ptr))
>  				return -EFAULT;

I think it is too strong when there is no rest to store the event data
after filling some events on the given buffer. Let us move the size
check to the loop condition? Like:

```
while (consumed + sizeof(ev) < count &&
   snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
    u32 __user *ptr = (u32 __user *)(buf + consumed);

    if (put_user(ev, ptr))
        return -EFAULT;

    consumed += sizeof(ev);
}
```

We can guarantee the space for one event at least in every iteration of
loop.

>  			consumed += sizeof(ev);
>  		}
> @@ -83,10 +83,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
>  		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
>  		event.motu_register_dsp_change.count =
>  			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
> -		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
> +		if (copy_to_user(buf, &event,
> +				 min_t(long, count, sizeof(event.motu_register_dsp_change))))
>  			return -EFAULT;
>  
> -		count = consumed;
> +		count = min_t(long, count, consumed);
>  	} else {
>  		spin_unlock_irq(&motu->lock);

In my opinion, if there is no space for data header, the overall copying
should be canceled in advance, thus:

```
} else if (has_dsp_event(motu)) {
    size_t consumed = 0;
    u32 ev;

    spin_unlock_irq(&motu->lock);

    if (count < sizeof(event.motu_register_dsp_change))
            return 0;

    // Header is filled later.
    consumed += sizeof(event.motu_register_dsp_change);
    ...
```

(In the case of failure to access to userspace for the data header, the
underlying layer for register DSP event should have peek/ack mechanism,
however I'm too lazy...)


Thanks

Takashi Sakamoto
