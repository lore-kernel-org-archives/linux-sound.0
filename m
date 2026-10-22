Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659495;
	b=EL9Y06ZQXKN+AMD0/j1Z1bCeuJFaLmBL4XpPVSA09f8funAD8gsaTMtgAonNueIsWeLp
	 VNOGXJaT8OuJ3pLwB9kCvHQuXUJRW4S4ZCayPc/4vTNtIpir7QkiyydCgR1oSU7h22xWt
	 XdJreTYX4Sd+PCziyrJxI4g1iroQrf565qIZNEaXGAPRauhN2ZEnm9GRh0PdFdIO8f/xB
	 PJXwdcRm1h+cTjxcQQZWNUqBV5u3pF4IJ+IAZ+1l4eboo4abiczj3MMTclEYQSZ7pBlph
	 LwK+GyX00QWTTFIQFowIzFnGMt0gi56GeyXwlaU07SsR6T7+ooBspckFdFlaQlAEUsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
	b=Wc2/H8j1yoyf+mVKcoljd4hM48Jpu0PMbgllhsov31EQsndGwVLKIhuea7XjxLdRv9L8
	 a74kYwwEQowecpLkhZKdz6LrHbAC7t2+6i4+VzGLPzz1BPdijCVmQiQaLtO86Q19+mKY9
	 qsHR33kmeHn9D41YbeabhsfsJ49HSl4Zz9q4CRcIV0DUmH2SOtyqMkCObHfvw21DYg4rJ
	 TnKveenyMwIxgUMyp9HwjqJZNShMfbHAQ5b4d5W9Xzfuq4cydMJPVsev2pgXbS7m04FqD
	 a+7cRfn/fHTtsCV3oczPCE4+AiIgLV+t2Ac/I+a+jcXHO/sR+1q6q9/mjBDUcxOoiuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j46CL9Fw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C49606A327
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j46CL9Fw
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10ac6ab7bso16311537b3.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659494; cv=none;
        d=google.com; s=arc-20260327;
        b=Wpnuz9CaATJdUzYxIq/KSve1ds+MTLp9KoS5eiufaJP3Dn8pN5US+6qHdTFx2CcD5E
         YXg+Y0X6zWU7ank9hWLV7WlVsWwm+cDgx2JwgJXiC9I3BbnfQdiN2MZTTjKGim5LThPZ
         ON4dgAnzf/9CwTLsciHdts62mrQ5Ue9/QOViLpISJVCYyV4q/bVnZoG2G0ketcNIfaBZ
         931ntles3VYegSBTtjZq3tPe4oOw1VJX1IeNrQkhVxjIIHz8KZ0mDo0t21itThyaHG44
         RPJTRUMymYwi+iyZGxcpC+uiHI0nRXjZ84zolc6J+OOt7m51Z3Qj6NS9F0+K6aLy0qVO
         qGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        fh=nOV2J5Xk2JpmnGo43+hH+oqu6BpKEn+p6Tpq5A8lqdU=;
        b=SbpHCez7PPTluW4JVmwfk2EqXpNME8rEqWOt4EUOoZNUUdFkzusoobJjZbDYeoAiIa
         Cmqhy5PLv4JDMreNX11baTAC7xQOTz5Xi0Ar3WK5BVxwA/hkxlArEA5989bprdpMg2Gv
         EXkq80KlmWDAtPylR1aUdZTVjxFnjzE/xhzfla2tR9OlwZbycZmPcDxdKF2ZmTgStVm1
         X3aH/7JwHxfb+nZaSn9LOYgNEKbbgVe4iwbS5dWY+v1Nt+r2BnYwdLPhXuKwksPCOriO
         3JUism8JnPhQNmgrWkKphxCtVY7DB1J2+h/bvU5WYvBShU+WcaIqL/2B5v4ZocM2JNsP
         9hXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659494; x=1793264294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        b=j46CL9Fw8zbdsKHuhcujRyc4AB3iUusYFtX+i793vmnpNOP/UxMsuy4b/FSS7LO4Be
         0H74pNKwkiLOpQ0CJxgSV9evNii90K3n8JlGFbKuvdDaNew4vPLYrSORMHenmmrt0RbY
         F9LOHLrmVSn1YrHYDGEW+9lSm5yHBXUkkoCaNRTOiLYMIIaHHHJFGoncvdW9D0uWt38s
         RLhgVWDo90uD0dN0WxZmFjZnMT2AlhdRUR1kfacCcZfSmDgy05voFH5dGa12lyAzmpXj
         XeOMnpVswsUuJDPXfKTFAIH2kQHJCEBAq8YIHEctUVfOHXAw6cmabZjMvWx/qGskqHWw
         ksrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659494; x=1793264294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        b=hlKkx7KhVDx+515UDIXgFljLwe/DnvRKDYg3u2uuiW+bL8c7iGkbfpbQPzbJvhmBoG
         ++vEhzem0TkWQJxGN4892Kh9kZnOU3cz6zdWgiaCsurjRzLqtW6pCR5HkLngSGirqX0J
         WdY2OlzFc6G3MRropmOHVy2+YYa6rrXnkNZAvVqmBsDKUfMobGWvRs6rw8CKzC9PKhk/
         PPMYz7/mdO65Umzgbeik4fe7Fw10My48kCQVsxi6LQowpFE8NzxLvg5mUTVwcgx0b1CO
         ybmTAV56NnrMY0/L5EIOpu4PnZGEiKifTTiVe/aJlouho5chwDjncaaw3QYrHb78A61f
         3D+g==
X-Forwarded-Encrypted: i=1; AKwUvBzpDepGx1NMx/TNN0AP6R6c6ph4rI/nxvS31KoCkAnhyV3b6HCfNsI+fP+UzAbiEkiyhOLP5QLWJrJ7tQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/GVLJgfv1YRH63EbfiKCwd1nieMbFcT7QOspnHzuEZn6RkPAT
	IUPz39Wz7PlVyF8qwC+rM+aQL736nmgvRMmT9w/+GRLB56IlSi0pIN9t4sXnImYhYGqCS4SgJmz
	/SNTBJZDKIiCZgemCeEpWLIIn9Tcmaaw=
X-Gm-Gg: AYBFou3JAqn9KnpNba9ib1QyxdDrs1acnR6DJvEEHZTM3xXFzTppupf+se+eeUEuh8l
	1MqMEiinWYmDSg9INzj5edpAvtvUi54Pwn65aF6A/hvwpxqpSIZzbzKKVOGT7tHIYWyze0bXCVJ
	SABzcd5QWen3ufCSAK5/OataXSw7bk/X585QTb52j60EpaRn8N625Hb86mWVuXPiy401q+IAUz2
	Uwdjy5Z9Fz9HLi/OBApMT1450sFF+GtJfUpxDxGWVVHVCBl5Vbt2HEeoTJE5cyvenwx5yzSWWRi
	aqYZsQoD8BbEWeVnXnGFDIYOBKbDWsyWr1rx/TI7jlztuQ5eXN6sEZRDJtX99x8uetW4sxmq5u/
	xEzkBMhX8OCZXyVjwZpecXQT9kE/bIjtVCuk3QY0NRVyVH+6IPH2rfTzVC2X+
X-Received: by 2002:a05:690c:fd5:b0:8b0:e13c:2870 with SMTP id
 00721157ae682-8b134178db5mr31027977b3.28.1792659494288; Thu, 22 Oct 2026
 01:58:14 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com> <87h5igix41.wl-tiwai@suse.de>
In-Reply-To: <87h5igix41.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 16:58:02 +0800
X-Gm-Features: AclHuK_53NLHLn_DC_3yQginArUaAMAdjmyV9fOzzaS6UQQkezfZDl5jh-MLCps
Message-ID: <CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=A5=
=E5=91=A8=E4=BA=8C 16:40=E5=86=99=E9=81=93=EF=BC=9A
>
> I believe a better fix is to handle the disconnection of procfs more
> properly.  The hda codec driver calls snd_device_disconnect() for each
> pcm, but in the PCM side, the procfs removal relies on the card level
> disconnection (snd_info_card_disconnect()).
>
> That is, something like below works instead?
>
>
> thanks,
>
> Takashi
>
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_device=
 *device)
>         for (cidx =3D 0; cidx < 2; cidx++) {
>                 if (pcm->streams[cidx].dev)
>                         snd_unregister_device(pcm->streams[cidx].dev);
> +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
>                 free_chmap(&pcm->streams[cidx]);
>         }
>         return 0;
>

Sorry for the delayed reply =E2=80=94 something came up to me over the past
few days.

Thanks for the review. Handling the proc entries at PCM disconnect
looks like a better approach.But I noticed two possible issues with
adding the call here: proc removal can invoke a prealloc release
callback that takes open_mutex, which is already held; freeing the
subtree also leaves pstr->oss.proc_entry pointing to freed storage
until final unregister.

I'll follow your approach, but perform proc rundown outside open_mutex
and retain the entry objects until final cleanup. I'll also prevent subsequ=
ent
card registration from republishing the disconnected entries.

Best regards,
Cen Zhang
