Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158749E5CB
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966938; cv=pass; b=Wr5uF0kbdHWJF6N+Ix6BsEZ55611FgX12DVolPuV5P41aTBM9A7Evt4RtOhwyqJJ9ra2n45508OGqsPCJoAdlmtg5LuRBwzEJ+MhHv9wUBLLFFWMjUvzX7YFdT5CCbmRv5N2ge2m9rVXqG8pV8ik41erxOe2AhOw5qqRs/yNm40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966938; c=relaxed/simple;
	bh=EOo4ek3sK6EryqudhrF3c1RJnay8BTHASgr1GNhq5uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nh2i3dC9VyooI3WZzUvPV4tv66uRGEunN1s+MUePK5GeEQc1r/I+G215qKykN1Xw0Z7L+bo/a+Us/jMDjatH8NS+e/4tDno8NmxLjaUb/a1uSj+Nmej5kAx2hCCRM3ML4LJ3DV143RO4zFuBMNuxIcfigrRuYXD6Aaf2UK51CKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxsO9EWs; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxsO9EWs"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0a921ee46so7481287b3.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 01:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791966935; cv=none;
        d=google.com; s=arc-20260327;
        b=Yxf8iF3sE6Q/y9g/boSXIjrs2HZGF08LQGwERDn7/e/28Q8vG5u18SXSgIB3wjxPni
         IKPAho60dMK6DK/tg0RC4Ivyt51apaXBk6IRuLa+4YCQaiCvZO3NkRSKJlLrz41U2QFy
         f1we2yv3eJ+ovAkZyW5aBMo6SBtHxbYaK6V82Dpikcswvnn1DS/sqmlMa37LIYxDFW0N
         d7YHgnHE2siY+eONnEOZClRzpJo885q4LxysPa9WeDfIvbbHWS1o/mHOuc2s15DTuD+u
         bk4ZR2xW9PUOHyXnvf3JDkYwXte4kI8GQHfHkmxGekfhuF4qVf4o6/a8mWJCH3Rh1T6s
         8bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        fh=7cgzzSQ+iN6LlvReKGb5ame3uN0M3QhC3CDfvkKsXtA=;
        b=dKPddVJMAjPfhvWmtobeNxSQ1Oa41pqK78tlmy5T/yvB6q+nq9ikVJ2jqWkg2BTEis
         8Wr5OOLlIomyqFJzitRbv+wg2tA8hj7iM+kvWKQdylIlsazSvEsbxXkxVUklP/jSuGHH
         IZqhk4XyGcd+oNcjExBlnw0XaAcYr156u+30fiShfgiT+BnGWJS+CGcyI8vRqo1lAx5E
         0CW/TFWk+Ob178zi+OOCtPghLlG+pbxhpNpd5ysU54/8cygu8E0ILvDzIFPbJccQQysr
         /VgLrKaCZubeEROQXpjfs1ZybnjdYlyJ0p5c3K+o2q5CCwiv3HoC31MAmMfbYm7Fyt8L
         7Vtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966935; x=1792571735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        b=ZxsO9EWsUTYMGnvvQCpNC63zdBpwNHrjaE4jMOgtWqL31bfcKZiUiHD4mIvu9ttOG3
         v5S3oyT99MeWkg5gAAfYMHCEneSsYH2QJXftPUwHEO8x2Ef1Lt5ubgFbNcT+jVSIki1p
         jQ2JJP/MBJIFj/RlxYBE2QIKqDWlAm0Oj/pZ2LMMMxJn4XnFbS54/ekpXgFDkpHPtxvx
         hpuvIeYU0DkMop6FCqlW1aBZRN8zhZm2u5dZkwlZJME67MG1KVh8gY36bZ/1XMvIEl6G
         1VIxmsnNPjm78J7R/fzuwyH5hBycp6PURfM540HExetl68Vm65XySDoIRgEPwoRll5DW
         EsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966935; x=1792571735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETcizyd6ycOmRvJMMDx15TzJljr7TKeRir1WfAEDwqw=;
        b=nBJRBlFhktivfysMvgl+Kg6l1n533hCUBXYsxSG+o9ilOYZWXOFXebwe6P8E31PALy
         rlFq3KzsJ/JWnubpTQSGydZ0Jd3FkxPA8gBJUrY1Kxm1NLaakbdZIC3CwptvQYsrHFp6
         VlxWaaGkdAkXgpP668p868FJA/ZOIunpycZOxnnHgQELEnLm808NLNLVNQhrefdxbb85
         LZVuRkMiNblBP4nTqRDxJbVjvjYoAZvvhRBe9o2Dl8RRd1Xkvof14JLTjeAoha3BRsXE
         jaQIfDNtD7zL1KTGvEQaBK63da7Apkb+VFQwI48HHwJ8y/gx6lOgiYRNTP1DpmDaV1YE
         lHBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNTOKAVa+POet/wtBHyDUQpuUhrS9dEgrlz9IVi+RTUWa7UpuBqvb1ZgB/J84dxzNFH89qA1hEBTL1NA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmH2utOjzDKR3I0n8u5qqVgeyk7b+OM3cFb4Wr9BHpooCCWIMP
	FyGHXbdzVfXJMbLGGpPWy/Idp6peqypU97KC+SE4eOgjeBujCbqSbBwrjwHZCrqsExRjAtSqFJt
	tI3ddHYav32vG/v+6ncVvk/H6KFVwCtA=
X-Gm-Gg: AYBFou1xiQjbitRJaFzzkqmPqbcp6XGXpinTSIH7+3mluEOMBFTEi+WL+ZTMyUBwm78
	K8mvh2xMUH7JdFSLiAzssyyZagVsXfSqrfZV50TtnOsmXVJ1q3NIk9ERT7VCGPkNKYb8kSfQqz1
	j4AJ3cI9dFhmslI1ZY2uszzQhbLT5yv43nIgaP7EQ/YK2EUw+PKGLyFXmwY1w+zhTpCxEfLSzEn
	u+QcTvwGiI/srlruhwPThSlK6xJ/iBnqKLGDSHEp+CY44KNzbYwQwKwmXXZRzr/Qk7RhNszfqrN
	S9Vfr4v1PN4+e60AP+qcjZHWb+UTBbXjzOFpxMRuIthbnUfMH54ukQjmig==
X-Received: by 2002:a05:690c:c684:b0:8b0:cc54:f0ee with SMTP id
 00721157ae682-8b0cc54f4fcmr1364507b3.59.1791966935614; Wed, 14 Oct 2026
 01:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com> <877bjkg35f.wl-tiwai@suse.de>
In-Reply-To: <877bjkg35f.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 16:35:24 +0800
X-Gm-Features: AclHuK8EpU1F5sxfdmuxWTFmmBSQu87mqg4s6v1v80j8imeHsdfxPk56f1ZNi4Q
Message-ID: <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Hmm, it's not clear how this happens.  It looks like a typical
> obscuration by AI reports...
>
> Basically dummy_hrtimer_sync_stop should handled the hrtimer cancel,
> but maybe the problem is rather its lack at releasing?  If so, the
> patch below should cover instead.
>
>
> thanks,
>
> Takashi

Thank you for looking at this. My commit message did not explain the
scenario clearly. Sorry for the confusion.

The observed failure involves a PREPARE ioctl on a surviving linked
substream. The test opens two dummy capture substreams, A and B, with
the hrtimer backend selected, configures both with HW_PARAMS, and links
them with LINK. It then performs the final close of A while issuing
PREPARE on B. It does not issue START.

On the current for-next source, the close path is:

  snd_pcm_release_substream(A)
    snd_pcm_drop(A)
    do_hw_free(A)
      snd_pcm_sync_stop(A, true)
    dummy_pcm_close(A)
      dummy_hrtimer_free(A)
        kfree(dpcm)
    pcm_release_private(A)
      snd_pcm_unlink(A)
    snd_pcm_detach_substream(A)

So the close path already synchronizes the timer before freeing dpcm.
The gap is between driver close and unlink. snd_pcm_drop() leaves the
linked group in SETUP. The release path calls do_hw_free() directly;
unlike the HW_FREE ioctl wrapper, that helper does not change the
runtime state to OPEN. A therefore remains linked and in a state that
snd_pcm_pre_prepare() accepts until the later unlink.

The relevant ordering is:

  Target A final close              PREPARE on linked peer B
  --------------------              ------------------------
  snd_pcm_drop(): group -> SETUP
  do_hw_free(): synchronize timer
  dummy_pcm_close(): free dpcm
                                    Take link read lock
                                    Walk group, including A
                                    Accept A's SETUP state
                                    dummy_pcm_prepare(A)
                                      Read freed timer_ops
  pcm_release_private()
    snd_pcm_unlink(): link write lock

PREPARE holds the link read lock and the participating runtime buffer
mutexes. Driver close does not hold those locks across the free. Timer
cancellation waits for timer callbacks, but does not wait for this
separate PREPARE action. The later unlink is what prevents another
group action from visiting A.

>
> -- 8< --
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2301,6 +2301,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
>         result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
>         /* runtime->control->appl_ptr = runtime->status->hw_ptr; */
>
> +       snd_pcm_sync_stop(substream, true);
> +
>         return result;
>  }
>

Synchronizing a pending hrtimer callback before release is sensible.
For the linked PREPARE ordering above, though, I think an additional
lifetime step may still be needed. PREPARE on B can start after the
extra sync_stop() has completed and after A's close has freed dpcm,
while A is still linked. It can then reach A's prepare callback as
shown above. Waiting for timer callbacks alone does not exclude that
later group action.

Best regards,
Cen Zhang
