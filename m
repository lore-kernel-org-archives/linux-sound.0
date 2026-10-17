Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354593D9026
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226651; cv=pass; b=bEcDq98qXs0aZ3UIpub41h4RtLKOkB8ccWZm8p33tHKqfM9YF/anZcKSfnKBTev016czJWPgO2e2mLi+rOKyYTNXnizg1+el2hG2WdF+opdNySZaaxiwI0DOipr4px/Dz3ZT94iOseg5BMEwzSw23chV9sklTmVfVh3GKAJVDnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226651; c=relaxed/simple;
	bh=3qE/oq1xoEyQQ6WVnT2XThEzNvP+8AwZccRWWRu0iAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3J0edSO6f8P+RSCygbeLW7bvMkuv+LjANhvd7V6c7f1mVa0rjTVAF5BOrBpssK8loGerTHZPPo8Kv8usmztp37bZmfF0upXyzzMpJAmrdNX8/M1oILdXtCtlREbP1aB4W2+IXVWEirgfQh3SKHJDEKV9zlNkB5t+auWa+XzEnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6QmO0fb; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6QmO0fb"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67921b515a7so847201d50.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 01:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792226649; cv=none;
        d=google.com; s=arc-20260327;
        b=npF2/GCN2nwrUb5DzuXyxceuleTBFxDu1d/OvmshlIpXEYMbZDUff3JBuSRSseGpHq
         LvPKlfbLxQ/RfWNgQgvJ6ScMzyMvpRPdyVUCxQmLrqU1O1D1jfwQhXM2Hu8UGddVUEhx
         1oWuhA8mJTRwFtGrqE7QtJoYELhdAiLyjj+f0jwycA7nuBBidw037XkpEHoP4nBpD86w
         3yMWJVADHRfw0yPzL1TRALMzIcDpOxJVA+gnfjvY4o9YVgLvLi2s1sBHsV7Imu/sqnAZ
         muzstUM6bTCY4luAEFJBkO9pa6Vu8Ou096ejrTn+gSOWm0KMNYqnEtjl9f8DqxGCpKQU
         H4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        fh=tB1V2jQp2Wbo6XK4/G6F+qHTAKU43rkje3M9q66W0hY=;
        b=gHPEvbIzfBcM0IGYjTvmdxI+sM2hT5v2RsZjgo3bBXs2k7Z6UGj7NAJvyFzvfVveQF
         OUdaJ9Yk9gbb02MKwJuiXtNrYpGBp4F7eiVwvS/UNMEEh5SHablXGwKh7yiL2pB2gZWC
         e988ZM6WrPkfK2QmWU+xddrg5FgY6O8xZxEYV5dnvxgnpEVSQIxpJqnR+dJH228I3/FJ
         /WNa+lEpljE0DuZ6EBa2VzavtwnnmoiP4tTon/9OTxDQiEpJSQW3mt/R5nDgGkzqFnbc
         BMgmJA6muLVfo8fLrn4qVgY/pfAMYLxYbf9I5hr8/4AINoEQBH6aGCK1EYYLtVaiW7Qh
         CUnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226649; x=1792831449; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        b=Z6QmO0fbLnBmXcZ1gABtnwsRyQDqKCd2bZeftQeweT0noiFjjdWZUF7MTWzue6NDm9
         54j9wI+igagbbcWbDIlBjJyrfneTYB8L3pNosmz3iLx7bcoRZTwQyFuvD4F757N4I6yF
         ydGl397uB67XFllSpJPFfkq6ZSFlEh52OWkKOMqDtfy04ywxlLQmtcqPQnAyVvyM2/LV
         KeEJ7/jsyGbCVDULXB+d3lutvFqmYKm7VVNzBhl30oVReVHtikcdCy7vVUSbgfyBhnBA
         tLq+BJP12XOG4U6JisCOmFYU7tEMQAhz4eeHtrS7BHEoQ6pK5Ya62DNyBHWVR2TDBSDE
         9wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226649; x=1792831449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        b=Kiviz6ZLGE2omnD43Jrr2Hxqw+tg9JTlJAtxox7wivHx8wvQ4bM07cZXec2kK2nRId
         El8pf2UwkDG0QxJVbBGa92avSK6GTvfp6b0eW8zGuUvurvsxG6G6l7tCLQTH2M90gAIs
         jUH5SaRb/5Pmc78z2X3prbKxvYIyNRwg8BWvNTukgl9Ry4g593u6OvT+L+SH1WqUxIfo
         NnkrmNlV90RodbrFwaFIpQ0mZsv5Bv4YfWM18rhpMG8YBBxFDOgX7edJx5D9HOumMTx5
         gGOZjBuWx+Rk+Q3V3YAObI9xg3BfwQtBGmB6vb+Fu8CFT4y6d/Y43nQPxsXoV+BcvGhK
         LaYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdXe/NdX92K++hAI0T+egmov7eLJoTl5wzalmeujyeQcGuXF8pWViHGBxWRcHnX1q01dTKKpx4LwNMYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrSMimSrRV3QrqH0W2IRcs19vBzEHp3SXeOh80gw4Fcihr+Dzz
	JvRh3KUyWsejOHJfAhgspoXTyE2Bb81dL5wKPs+T1iB3D4bddlbFwBC/JsQjwtU1kalwXwEObb1
	CsGNr4MLuJDH03wM5zBP6tV45Q21hbuY=
X-Gm-Gg: AYBFou10bV1WQwCSmRpNUmpBJWxOBmuejDmQS9YNB7tAuDxzv6UGI/l629EqJXCplEd
	mTjdXekjSIgTuf5CY9qHyU0T4v+Kehe4SJ4AJJknOWDPvSbU2xRuxNrBdM25wl32calPwgpNs2I
	e5nFTFR+Nz79zft1ujpi4Yskn06qspDXVEdhU9TvxeoSny9cPpIs2u6tH4FZERf+bLm7kQS9bAF
	eb2ici8wWhnzAuZwbZnB1gj8oPRScbxXqRmeXzJuuBEN8i4FRT0B4DKirzA52f01FEVB5e/1mJS
	DC2TCLV3sMDFN1bVMC9yZb7Nxo32TTFmIzMBApQfNsrmVQOyK2374h+XMDu13LbFaKndu87FKr0
	e46fnTBGNqoI=
X-Received: by 2002:a05:690e:b4f:b0:674:7fa:6a3b with SMTP id
 956f58d0204a3-679ca4b2dabmr566540d50.5.1792226649005; Sat, 17 Oct 2026
 01:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com> <87o6cs20yr.wl-tiwai@suse.de>
In-Reply-To: <87o6cs20yr.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 16:43:57 +0800
X-Gm-Features: AclHuK9BynSqNLJeMNiD8leRvLVxNPBI2Tpv-07VMXfy1yJYuIsrXo7SIsx6iD4
Message-ID: <CAFRLqsWtGv=2Q48R1ZNeQ7WAekuo9o05u0iK7QmEZJieFygZBQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: oss: Serialize final setup list cleanup
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> How can this happen?  The PCM proc file belongs to the card, and
> snd_oss_proc_done() is called from snd_pcm_free() at the card removal,
> where all opened descriptors must have been released before reaching
> this point and no new open is allowed any longer.
>
>
> thanks,
>
> Takashi

The whole-card removal waits for the open files but the reported
case used codec-only sysfs unbind while the card remained registered:

  /sys/bus/hdaudio/drivers/snd_hda_codec_generic/unbind

The OSS open reaches snd_pcm_oss_look_for_setup() before acquiring
pcm->open_mutex and before azx_pcm_open() takes the codec PCM reference.
The card reference therefore does not make this early lookup visible
to the codec's snd_refcount_sync().

The original report came from a controlled QEMU run with scheduling
instrumentation. The teardown used the normal sysfs unbind path, and
the recorded free stack included:

  snd_pcm_oss_proc_free_setup_list()
  snd_pcm_oss_unregister_minor()
  snd_pcm_free()
  __snd_device_free()
  snd_device_free()
  snd_hda_codec_cleanup_for_unbind()
  hda_codec_driver_remove()
  ...
  unbind_store()

On rechecking the lifetime handling, I found that the added setup_mutex
only protects the setup-list lookup. It does not keep the PCM and codec
resources alive for the remainder of snd_pcm_oss_open(), so it is may not
a complete fix for the codec-unbind race.

Best regards,
Cen Zhang
