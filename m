Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424190;
	b=2uKl0yFYk8ywJUB0VgFdkAdPFRmfHxK4pPRGs9VABX8Dh2CgJKFLzmgrmT7UbyOjLT64
	 v4wLPZalcDoYB5keGz7T5/Hwtf0Fc8sCYvX2A9KBoC/XO0zXWrNGeLQ55cgeJ8tLjlCR2
	 qei85fkixEmiZHAHkN7urcKwa+HMG+YCklB5zW1ztDWrk8EPeqcHqr5PH+77RJsGRsLu9
	 vv6R2SunH5eDBpCdmPVR6Fjk2tK1qi+tBkDWyXdovLx6pQvbJ0gtQHbGMwJ7//6ji0B0E
	 GRq4Zm+z7PN2U7S3Q3FuDKXRlz2usifAAHxcvyB1v9xxUR57FVbj0rtfu+QboazON/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rU/hwjUMOH2CmEX8Wobn0fbNPt1MtW8gAwRD4Wq+9wc=;
	b=kjDNIY254TgPdGhUtaELOgHsVXWzpm8U/GmC7cNG0tFdf5Su6GOMguPZgXrfcQgilToF
	 qKBFkQ4n5gUYutLTRZKkDQ4FcqIMWUyQRy8YJL0y4x1hYJcbcbYrjKq1Pnu4nLq4/1dOx
	 srelc0vv1rR7H4N7nnfeL7ODviR7iJ65MxiXFfGRaa157FquzSKlpqzfIc5IKR5MPPc9k
	 vMUqevEIgTZTAyNfyUNW4GaG794hdGVkaiirBMzWB1W1Q798kYzPUEsGw8/Rd/qZ961JW
	 1PQCfEI9Ef9JBPKbxCrjQGo0wX5U4oDYnrz5lo7oBY959esqXhcjavfKHuy3vM/ZRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KE+R1Uac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CB2606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KE+R1Uac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232741F000CA;
	Mon, 23 Nov 2026 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424189;
	bh=rU/hwjUMOH2CmEX8Wobn0fbNPt1MtW8gAwRD4Wq+9wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KE+R1UacCRJUoTVIjK+JhgZZA4hhS7zI88dpJLBUdGTB/ib5aDaDcwoEaigwl6I6J
	 thBFVJSjvKATc04alwumZOLNhAj2ukna7qZFaSMnGuSkpoe4w+5fVFrQEOR8JLAoAr
	 uPkdBIeBIivxLjxJt1LQOvGIys0T+x9xiimXQ6XBB1TZb6HsDEFSVNaKH/ZJbPWcOC
	 NER6K2yBPeyTB7iOuRpAB4oLWW5DSJO9t1rjgmqdREindb/hCLnk9MGuqzzLNNwPs5
	 eeWE2+uH9sBKeIq3nhRyHJTwyCLcPyc95/cuFsX60JIIShGyNdFNTvYgfP2dqAx2Qj
	 0EcWxNYspncMw==
Message-ID: <sashiko-outbox-228920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: 6fire: Don't resubmit an active MIDI URB
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123084846.7700-2-25031212351@stu.xidian.edu.cn>
References: <20261123084846.7700-1-25031212351@stu.xidian.edu.cn>
 <20261123084846.7700-2-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:56:28 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: 6fire: stale rt->out on submit failure in
  usb6fire_midi_out_handler()
--

commit e7fc7882a7e28efff90554bb8dc1de23ef94bfe7
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: 6fire: Don't resubmit an active MIDI URB

This commit adds an out_urb_active flag to struct midi_runtime so
usb6fire_midi_out_trigger() defers URB submission to the completion
handler when the output URB is still in flight after a stream stop and
restart.

> diff --git a/sound/usb/6fire/midi.c b/sound/usb/6fire/midi.c
> index 279b449936e75..ae8a0d48eb410 100644
> --- a/sound/usb/6fire/midi.c
> +++ b/sound/usb/6fire/midi.c
> @@ -25,6 +25,7 @@ static void usb6fire_midi_out_handler(struct urb *urb)
>  	int ret;
> =20
>  	guard(spinlock_irqsave)(&rt->out_lock);
> +	rt->out_urb_active =3D false;
> =20
>  	if (rt->out) {
>  		ret =3D snd_rawmidi_transmit(rt->out, rt->out_buffer + 4,
> @@ -39,6 +40,8 @@ static void usb6fire_midi_out_handler(struct urb *urb)
>  				dev_err(&urb->dev->dev,
>  					"midi out urb submit failed: %d\n",
>  					ret);
> +			else
> +				rt->out_urb_active =3D true;
>  		} else /* no more data to transmit */
>  			rt->out =3D NULL;
>  	}

[Severity: Medium]
Should usb6fire_midi_out_handler() also clear rt->out =3D NULL when
usb_submit_urb() fails, the way usb6fire_midi_out_trigger() does?

When usb6fire_midi_out_trigger() defers a restarted stream to the
completion handler, it sets rt->out =3D alsa_sub and returns while
rt->out_urb_active is true.  If usb_submit_urb() then fails in
usb6fire_midi_out_handler(), rt->out_urb_active remains false with no URB
in flight, but rt->out stays non-NULL, causing subsequent trigger(1) calls
to return early at the if (rt->out) check without submitting the URB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123084846.7700=
-1-25031212351@stu.xidian.edu.cn?part=3D1
