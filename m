Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792693692;
	b=JbcT2qlrupqm0g0+oyTJDHHTiL6Om8kU1S8yFk/wN8FXLFzkBGwEQIzBJUbj4TDq7Vx8
	 RtqRm+5CUpkQL/CyGg4Hb04gBWFDJHEBOHLAIgaZcldcj19pHYiVgeDJjUFXnHwLYuyM6
	 6FLXsbbdNp8rsndNwe2ujYnQ65DmpjrMXPT+me7JmMw7+ry2nekoeexb3mcaX4A6AuvT8
	 EF468RCwWutATNycRV3FPONxq3d8JFe7zzZDjZaIhsLpYXzB7XByYQ5XIdQUYCr6pMOzo
	 SYIsFHywG7tcfPZ90lDeeBd53nfEoZEKBsR9YrPyXAWRCNheUo2lp3k2yCaDXVx6WmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
	b=NlmQHCxGinTl02YtSH9k/FD+UJO0v6SCwwtrc9qwYiS0PUz2H8nPf9CFOczp7BLnz+6N
	 Y1iygOl7qm0N0XdzWcz/zCQM0zW/YtW8zYFgOd7k4j6VN3T9TSR3nnMdjGY5dLmU9sfHD
	 4dNHgk3nWkim1lcs8G0rqRJOoOmn0cWPqsmnS50Us7V8kADx6FIefIWVonBSBbZmGy4q2
	 clXw1w0DdzLrLzVIDFBarM62AMifC7FBJsq4yCnYLH0RIqvfs1NnOzA2U2HLG85vNPT1a
	 eDeEiFprjqM7QaKTYnAejOSLYASeazi2WSdMaJ1DcdLjdPB/OWgxIGUzNI9FBKG91eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdSzZV66;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B2606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 18:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74B2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdSzZV66
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso57510c88.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 11:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792693690; cv=none;
        d=google.com; s=arc-20260327;
        b=DR8BtuYPwV7XBQ/2MObuUnpscgki/JA0u7tGcx4hDYKkg1pLc771l8ejZhQY4r4ZIk
         EesCrhREv+SvijBUoQSgGFUEmjLdCyzX/fT5nnwbzd3X+DWep55a+wY9xCLEyls6CQEW
         RiqMdYx9rciNscKXywmRJxQDOTgNi5tBzB+QlY5+G7Q+SdSe/CHSVFgFrlr1kljaH4Du
         swNK9glEiqaf8LV1rykdjQieBPDJnXfe2sBMxz/z0llYnvNe9qghUrSJgTkOVo9soJ1l
         L0/BfFfs3ntVD7mkN7hoggK+pxwTetvLRkXtQbfrPHLlrFHhWJ9gsYEwmIVj0GgDdcmZ
         2Yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        fh=xs/5kfrZjthyZHLcQRzp6VeSTPwSRWf+6FM6i/iuS2M=;
        b=KztrGtEP0OqLSHlRWfe/z+yscAwY8g+s13Yzr03g2FNx/mbYgAIUnzu7MmUmcYWFaO
         wi2b6QyhDG5hjR5oBYPT3tSSOX2EF41Y97i4kXvEMcutnKJETQ1RTgYbpSEu7hNRBISN
         9kMoDLnnbizCVdKkoRj6bmr1dDYwOUiUCTakMfgw6QLxiKVHG1pz0khTp7PVaUFAOheO
         QMUJ5Rx+yQn2mP9zBtE55pfXA6dCLrMjt7x0uFPZkUjR3kbe5OC/XtHzLYL1oERMsrfB
         m2cM1HZCbVejM4UOdudNw2DjkiiAu4WhvX1k/iikT0l/UVMDhHxxT8Nusn+DSgS+wnAk
         n7hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792693690; x=1793298490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        b=gdSzZV66Whs1yT6V5lTsMpJmNYjTchtBvkIP0XNjJvGHR4e4uc9Zb0Wz7lCtrbDj6w
         dM74nZTziYfb0JmosgubFM93InqfTEQm4JqX5ElxxFl5fCuXpV1RZ5fFlViKt6XLNPza
         FCMoRnL5Wkz8Cj4P8bUZfSTzu67S8c3WfVXJhsCnvz1b86fbkmfVlVIiO9t6lhBdi5zM
         6+FVvcCq3H46NBkfWdGUuzELwc3LSXZHeAq9bX9zbMic+3RpcmqGOTXUGKqsPFUXs/Jy
         usxkHv6/X4Hv7uISr4zxhI8G+J3vTqq0jeDvZLK89DMmx7nPUc4EYCEyDSqgouzoU8O1
         uomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693690; x=1793298490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        b=J1AddMm7NQRL1DP6AEHhNU/mmJTCh0iygm2J1BiYiostjxNMKNsT6YB0OozouLJ66E
         NfpQcgjrpRdKo2mCcl9zaBC24ZmPpSzIIF63wXQ/kUF0VaRhI/F8eX0biFD4U35c0BbT
         LVWA4qjUcNwt/OfuVO96y2rvWNPyJhsvKTqKOP/2yOs1CwN6KMiruzQEgRusDZSY/keK
         XC4gsAJuiQY5S//16fiDNnBPvV5ewUCDls+884KOKCOCAAzalQDEdPG8r5pN2lmmDd5f
         qB5c7Emi1lkCN8k6wDx/l2/0V3HpswS3mijsRtAjysTKlg4GmZWTcwmBWhlr1E6TkqYV
         5c9g==
X-Forwarded-Encrypted: i=1; AKwUvBxVzRugqvNYLBYEsYn9+U46+7vYKpUHp+RgdKmQmpqLsfuzi8GezLFquN4YNeCELPwVGrA3fmY/dnRWIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOjhRCHod0TYjtxNTgn+GUUuNKkGamQbZDx1RUwamr/5PAEhJ8
	yXbvEpqs/TnXf0P2VmmHDV/ECwboPxysuc18VtRWixbw7gMqL//vh8/leEFLyvaLGJp0ok5TOa0
	i+N4YveeX1+IMSAK1RfBGQ8ScMjvWmvFtcDIq2kU=
X-Gm-Gg: AYBFou1+Lqj0kZZe6v+3y6O/DcYEw4maj0OuKeo5N5UKo9UA53z5LBmgTG8kmGEK+x5
	ZnePXOfkgze4tIQeUm+7wchJqNb2lj8ZNubdQ9xZBIr/Wu21oitUmaaM3FCP70isi4n0kWp1e6C
	mNiHc4PXl8IodjYJVAqA2gRbVdUoYeKsi3e09GixRUde0V610ktDKVKGnwCtuK3sDvb6p/IhQNl
	SPzt7K4O40U9ABvWe9s1cvcJW9w6HmXHKKaF9y0Lp/bDTugrSH0TpQcsmPci5a65mzd2b+/6bu6
	Q9hsWAQY4DAjpex479lvOLtD6eXkEYhYN5sk/WzVv9nhklsSvkVprxiFfG5WJWE15nAcVPF1lGX
	2CvRIA15gD7at9Aio/jKRkJOuQmNF6/GZLGJc409ytsl+u36EjdYlfJgn/PY=
X-Received: by 2002:a05:701b:454d:20b0:165:dd90:1f54 with SMTP id
 a92af1059eb24-195c74c48cdmr52805c88.47.1792693690270; Thu, 22 Oct 2026
 11:28:10 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260911045911.1327413-1-lcy8047@gmail.com> <2026091111-appear-stopper-6fd6@gregkh>
 <CAKefsHtZ-S1Gjm7YQFhmYSh=rozsrBJ0muL7JEEXc6uhMUOnwA@mail.gmail.com>
In-Reply-To: <CAKefsHtZ-S1Gjm7YQFhmYSh=rozsrBJ0muL7JEEXc6uhMUOnwA@mail.gmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 22 Oct 2026 14:27:58 -0400
X-Gm-Features: AclHuK9w2-Pb_7bsR25XQi13p0o3nGGrXKm-nzXqbp1vNTqP3Xs_2IWseSyaOyI
Message-ID: <CAKefsHuMzUr6LForJnx4ZQiBUMLQm60_iNEKmjxnGDTVxr88Cg@mail.gmail.com>
Subject: Re: [PATCH] slimbus: messaging: hold lock until transaction is completed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 08:00:28AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
> > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework"=
)
> >
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> No blank line between these please.

Will fix in v2.

> And how was this found and tested?

Sorry for the delayed reply. I wanted to reproduce the issue on real
hardware in addition to QEMU, and obtaining the board took longer than
expected.

I found the issue using a static analysis tool I developed. The tool
reported that slim_msg_response() accesses txn after releasing
ctrl->txn_lock.

I also used LLM assistants to help verify the report. I reviewed their
output and ran the tests below myself.

The race window is small because slim_msg_response() accesses txn only
a few instructions after releasing the lock. However, the bug can occur
when a response arrives just before the request times out. The request
can then return while slim_msg_response() is still accessing txn.

I tested this in QEMU and on a DragonBoard 845c. Both tests use a
test-only delay to widen the race window.

1) QEMU

I first reproduced the issue in QEMU on v7.3 (c03c1a14507d), x86_64,
with 2 CPUs, CONFIG_KASAN=3Dy, CONFIG_KASAN_INLINE=3Dy, and
CONFIG_KASAN_STACK=3Dy.

QEMU has no SLIMbus controller, so a test module registers a dummy
controller using slim_register_controller(). The controller's
->xfer_msg() only records the TID. A kthread on CPU 0 calls
slim_readb() and waits for the response. A kthread on CPU 1 calls
slim_msg_response() with the recorded TID.

A response arriving after the request has timed out does not trigger
the bug because the timeout path has already removed the TID, and
idr_find() returns NULL. The response must instead find the transaction
before the timeout path removes it, but access txn after the request
has returned.

The request timeout is txn->rl + HZ milliseconds. With HZ=3D1000, it is
about 1000 ms. To reproduce the race, I added a 1200 ms delay after
releasing txn_lock, between idr_find() and the access to txn.

Without the fix patch, slim_readb() returns -110 first. Then
slim_msg_response() accesses txn from the stack frame of the returned
request, and KASAN reports a use-after-free.

  BUG: KASAN: use-after-free in slim_msg_response+0x29e/0x2b0 [slimbus]
  Read of size 8 at addr ffff88800340fd20 by task slim091-resp/72
  Call Trace:
   slim_msg_response+0x29e/0x2b0 [slimbus]
   resp_fn+0x9d/0xc0 [slim091_test]
   kthread+0x32a/0x410
   ret_from_fork+0x365/0x570

With the fix patch, there is no KASAN report or oops. The timeout
path waits for txn_lock in slim_free_txn_tid(), so slim_readb()
returns -110 only after slim_msg_response() has called complete()
and released the lock.

2) DragonBoard 845c

Since the QEMU test uses a dummy controller, I also reproduced the issue
on a DragonBoard 845c with a Qualcomm SLIMbus controller (qcom-ngd-ctrl)
and a WCD9340 codec.

The board runs v7.3 on arm64 with CONFIG_HZ=3D250, so the request timeout
is about 250 ms. I added mdelay(500) after releasing txn_lock following
a idr_find() in the unpatched kernel. A module parameter controls the
delay after boot.

I enabled the delay and triggered read requests through regmap debugfs
by reading a WCD9340 register.

  echo 1 > /sys/module/slimbus/parameters/test_delay
  echo 1 > /sys/kernel/debug/regmap/217:250:1:0/cache_bypass
  dd if=3D/sys/kernel/debug/regmap/217:250:1:0/registers of=3D/dev/null bs=
=3D9 count=3D1

On kernel A (without the fix patch, with KASAN), the read crashed in
memcpy(). The msg pointer was read from the stack frame of the returned
request, so msg->rbuf contained an invalid address.

  Unable to handle kernel paging request at virtual address 17ffff3dd280000=
1
  CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
  pc : __pi_memcpy_generic+0x7c/0x22c
  Call trace:
   __pi_memcpy_generic+0x7c/0x22c (P)
   slim_msg_response+0x118/0x2a0
   qcom_slim_ngd_rx_msgq_cb+0x16c/0x56c [slim_qcom_ngd_ctrl]
   vchan_complete+0x400/0x5e8

On kernel B (without the fix patch, without KASAN), the read also
crashed. The txn->msg pointer was read from the stack frame of the
returned request, and its value was 1. The kernel then crashed while
accessing msg->rbuf at address 0x9 (1 + 8).

  Unable to handle kernel NULL pointer dereference at virtual address
0000000000000009
  pc : slim_msg_response+0x74/0x140
  Call trace:
   slim_msg_response+0x74/0x140 (P)
   qcom_slim_ngd_rx_msgq_cb+0x8c/0x1a8 [slim_qcom_ngd_ctrl]
   vchan_complete+0x1f8/0x228
   tasklet_action_common+0x128/0x180
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

On kernel C (with the fix patch and KASAN, using the same test delay),
I ran 7 reads followed by about 170 seconds of continuous reads, with
196 timeouts in total. There was no oops or KASAN report in
slim_msg_response(), and "Got response to invalid TID" did not appear.

I should have included the discovery and testing details in the
original submission. I'll include them in future reports and respond
to review comments more promptly.

I will send v2 with the blank line removed, a summary of the
reproduction and testing results in the commit message, and an
Assisted-by: LLM tag. I'll include the detailed test results below
the --- separator.

Thanks,
Changyul


2026=EB=85=84 10=EC=9B=94 22=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 1:05, =
Changyul Lee <lcy8047@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 11, 2026 at 08:00:28AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
> > > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framewor=
k")
> > >
> > > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> >
> > No blank line between these please.
>
> Will fix in v2.
>
> > And how was this found and tested?
>
> Sorry for the delayed reply. I wanted to reproduce the issue on real
> hardware in addition to QEMU, and obtaining the board took longer than
> expected.
>
> I found the issue using a static analysis tool I developed. The tool
> reported that slim_msg_response() accesses txn after releasing
> ctrl->txn_lock.
>
> I also used LLM assistants to help verify the report. I reviewed their
> output and ran the tests below myself.
>
> The race window is small because slim_msg_response() accesses txn only
> a few instructions after releasing the lock. However, the bug can occur
> when a response arrives just before the request times out. The request
> can then return while slim_msg_response() is still accessing txn.
>
> I tested this in QEMU and on a DragonBoard 845c. Both tests use a
> test-only delay to widen the race window.
>
> 1) QEMU
>
> I first reproduced the issue in QEMU on v7.3 (c03c1a14507d), x86_64,
> with 2 CPUs, CONFIG_KASAN=3Dy, CONFIG_KASAN_INLINE=3Dy, and
> CONFIG_KASAN_STACK=3Dy.
>
> QEMU has no SLIMbus controller, so a test module registers a dummy
> controller using slim_register_controller(). The controller's
> ->xfer_msg() only records the TID. A kthread on CPU 0 calls
> slim_readb() and waits for the response. A kthread on CPU 1 calls
> slim_msg_response() with the recorded TID.
>
> A response arriving after the request has timed out does not trigger
> the bug because the timeout path has already removed the TID, and
> idr_find() returns NULL. The response must instead find the transaction
> before the timeout path removes it, but access txn after the request
> has returned.
>
> The request timeout is txn->rl + HZ milliseconds. With HZ=3D1000, it is
> about 1000 ms. To reproduce the race, I added a 1200 ms delay after
> releasing txn_lock, between idr_find() and the access to txn.
>
> Without the fix patch, slim_readb() returns -110 first. Then
> slim_msg_response() accesses txn from the stack frame of the returned
> request, and KASAN reports a use-after-free.
>
>   BUG: KASAN: use-after-free in slim_msg_response+0x29e/0x2b0 [slimbus]
>   Read of size 8 at addr ffff88800340fd20 by task slim091-resp/72
>   Call Trace:
>    slim_msg_response+0x29e/0x2b0 [slimbus]
>    resp_fn+0x9d/0xc0 [slim091_test]
>    kthread+0x32a/0x410
>    ret_from_fork+0x365/0x570
>
> With the fix patch, there is no KASAN report or oops. The timeout
> path waits for txn_lock in slim_free_txn_tid(), so slim_readb()
> returns -110 only after slim_msg_response() has called complete()
> and released the lock.
>
> 2) DragonBoard 845c
>
> Since the QEMU test uses a dummy controller, I also reproduced the issue
> on a DragonBoard 845c with a Qualcomm SLIMbus controller (qcom-ngd-ctrl)
> and a WCD9340 codec.
>
> The board runs v7.3 on arm64 with CONFIG_HZ=3D250, so the request timeout
> is about 250 ms. I added mdelay(500) after releasing txn_lock following
> a idr_find() in the unpatched kernel. A module parameter controls the
> delay after boot.
>
> I enabled the delay and triggered read requests through regmap debugfs
> by reading a WCD9340 register.
>
>   echo 1 > /sys/module/slimbus/parameters/test_delay
>   echo 1 > /sys/kernel/debug/regmap/217:250:1:0/cache_bypass
>   dd if=3D/sys/kernel/debug/regmap/217:250:1:0/registers of=3D/dev/null b=
s=3D9 count=3D1
>
> On kernel A (without the fix patch, with KASAN), the read crashed in
> memcpy(). The msg pointer was read from the stack frame of the returned
> request, so msg->rbuf contained an invalid address.
>
>   Unable to handle kernel paging request at virtual address 17ffff3dd2800=
001
>   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
>   pc : __pi_memcpy_generic+0x7c/0x22c
>   Call trace:
>    __pi_memcpy_generic+0x7c/0x22c (P)
>    slim_msg_response+0x118/0x2a0
>    qcom_slim_ngd_rx_msgq_cb+0x16c/0x56c [slim_qcom_ngd_ctrl]
>    vchan_complete+0x400/0x5e8
>
> On kernel B (without the fix patch, without KASAN), the read also
> crashed. The txn->msg pointer was read from the stack frame of the
> returned request, and its value was 1. The kernel then crashed while
> accessing msg->rbuf at address 0x9 (1 + 8).
>
>   Unable to handle kernel NULL pointer dereference at virtual address 000=
0000000000009
>   pc : slim_msg_response+0x74/0x140
>   Call trace:
>    slim_msg_response+0x74/0x140 (P)
>    qcom_slim_ngd_rx_msgq_cb+0x8c/0x1a8 [slim_qcom_ngd_ctrl]
>    vchan_complete+0x1f8/0x228
>    tasklet_action_common+0x128/0x180
>   Kernel panic - not syncing: Oops: Fatal exception in interrupt
>
> On kernel C (with the fix patch and KASAN, using the same test delay),
> I ran 7 reads followed by about 170 seconds of continuous reads, with
> 196 timeouts in total. There was no oops or KASAN report in
> slim_msg_response(), and "Got response to invalid TID" did not appear.
>
> I should have included the discovery and testing details in the
> original submission. I'll include them in future reports and respond
> to review comments more promptly.
>
> I will send v2 with the blank line removed, a summary of the
> reproduction and testing results in the commit message, and an
> Assisted-by: LLM tag. I'll include the detailed test results below
> the --- separator.
>
> Thanks,
> Changyul
>
> 2026=EB=85=84 9=EC=9B=94 11=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 2:02,=
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>>
>> On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
>> > slim_msg_response() drops lock after idr_find() and dereferences txn.
>> > If the requester times out in the meantime, it frees the TID and
>> > returns, so the handler writes the reply into msg->rbuf and calls
>> > complete() on txn->comp, both of which have already benn freed.
>> >
>> > Keep lock held until complete(txn->comp) finishes, so a requester
>> > in slim_free_txn_tid() and cannot return while txn is still in use.
>> > Call idr_remove() because slim_free_txn_tid() takes the same lock.
>> >
>> > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework=
")
>> >
>> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>>
>> No blank line between these please.
>>
>> And how was this found and tested?
>>
>> thanks,
>>
>> greg k-h
