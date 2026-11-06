Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943511;
	b=DPIkgwsZVy1zvnFHIb/5QriRjTbySrm522wEeL5agwFO/tKxo5ODhpDCrU00OA1w5PRs
	 ZyrnHTfzc0yE05VyQJcxLiOt2e/4zmR+pUSsd8dK3kuyAxfPVrkpIlj3ySJiiIJXkArRl
	 F9bqE4NXCZJDCtp4TonK2ZY6zzbGwQL9bdzy/s+ur9Nunk7RtDdpwLA3ekL19Q+2A7HSa
	 A2edeOnDcmSrw11AN4LDhsAWoPi5iQWo2BWFFblRDGeHG3ZKVw7hIsD1xF7zx8V6U7MVh
	 B+oshFniuS30Kg0EGDCA0eyMcch19ougt+8P0keYvTpWQEnnsMt1jCxhrd8wzXBxrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943511;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JkkFwyiVZdm4DknOkWpOUjtiyOKc5a4lcGBS3erppz8=;
	b=3b4TfSt5aOALoG53lgWC6+nHrECjaRBoYvtSakZu2NAK1Lvg88Hnr6sXVhAyp5odC5wo
	 B/cS8ZLOtvkqvdt9t18VgVTBiplOTY8zdbleV7IkHlLjDlg1Z6tR+mS0qqpAIysjmbLNE
	 EWJ3vQ78pAuiSQTwHLlG9pytLkS8b1sISB2VBaGMzzSz7zvBuz1IMJFx6lXnGhSfkDmYi
	 5hdEbctg+uO7SKQ1sHBu6aayGJPNIuxwZ7q+ZuIeHwDLuaEcIuT/aH99y8x7JHiIrCYZS
	 jh6BgH3AhqMycVcJc4K3rCS22PdDp6TKdHYke46UsJbmI09vwMUZbvhdF6XyQIGjjmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpuJwhJK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D744606A328
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpuJwhJK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012CA1F008A1;
	Fri,  6 Nov 2026 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943511;
	bh=JkkFwyiVZdm4DknOkWpOUjtiyOKc5a4lcGBS3erppz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpuJwhJKCQ/WIa1pYUqb2xS32L6XuecEg8KnH/HYgYISjb+huCpwYXJRVeZdmSwa/
	 B8tBp+32m+G8enlbmGG8NjElEYqGJafA6BTXYL+7Cqt2PZPqOCdGpQuuBb5Y5LZsMj
	 dbVOks1IT0oMeqmXjxG+ESEvCUe0F+IwvcrtYU11mtZRmZ2Gu6mmWdJiKmq+B+Zsnm
	 KdQKcr1wIwJdw8Ap1G3e04uZxPzF1vWFIwKsbuP3HNtdU/YtMpaRN+OEbreql62si5
	 iPn6vDrSuHPL4TO2+D6Juc1Odx2ApiLyEGVH8Fwyfxy4MwjLLkCP6Ko59DskEpXfE+
	 GCApTeLZx+6LQ==
Message-ID: <sashiko-outbox-200839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: codecs: wcd-mbhc-v2: cancel button long-press
 work on deinit
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106052242.2000264-1-hj351016@gmail.com>
References: <20261106052242.2000264-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:38:30 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] ASoC: codecs: wcd-mbhc-v2: missing Fixes tag and inaccurate
  history in commit
- [Low] ASoC: codecs: wcd-mbhc-v2: open-coded work cancel in
  wcd_mbhc_deinit()
--

commit a47d9364ff0ce9007f9e61345767574491af9b38
Author: Hyunjung Ko <hj351016@gmail.com>

> ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
>
> wcd_mbhc_deinit() drains two of the three works embedded in struct
> wcd_mbhc before freeing it - correct_plug_swch (via
> wcd_cancel_hs_detect_plug()) and mbhc_plug_detect_work - but not the
> button long-press delayed work mbhc_btn_dwork:
>
>         mutex_lock(&mbhc->lock);
>         wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
>         cancel_work_sync(&mbhc->mbhc_plug_detect_work);
>         mutex_unlock(&mbhc->lock);
>
>         kfree(mbhc);
>
> mbhc_btn_dwork is armed from the button-press interrupt handler
> wcd_mbhc_btn_press_handler() with a 400 ms delay:
>
>         schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400=
));
>
> and its handler wcd_btn_long_press_fn() dereferences @mbhc
> (container_of(), mbhc->current_plug, mbhc->jack).
>
> wcd_mbhc_deinit() frees the MBHC interrupts first, which stops new work
> from being queued, but free_irq() does not cancel a delayed work that was
> already scheduled. If a button was pressed within ~400 ms of component
> removal, mbhc_btn_dwork is still pending when kfree(mbhc) runs, so
> wcd_btn_long_press_fn() later executes against freed memory
> (use-after-free).
>
> The asymmetry dates from the teardown rework in commit (CVE-2023-53842),
> which added the correct_plug_swch/mbhc_plug_detect_work cancellation but
> left mbhc_btn_dwork undrained.
>
> Cancel mbhc_btn_dwork alongside the other works. Its handler does not take
> mbhc->lock, so cancel_delayed_work_sync() is safe to call under the lock.
>
> Found by code review; not runtime-reproduced (requires WCD codec hardware
> and a button-press event racing component removal).
>
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

[Severity: Low]
Since this fixes a use-after-free on teardown, should it include a Fixes:
tag such as:

  Fixes: a5475829adcc ("ASoC: codecs: wcd-mbhc-v2: fix resource leaks on co=
mponent remove")

Also, the reference to CVE-2023-53842 in the commit description omits the
commit SHA and subject above, and misstates its changes:
wcd_cancel_hs_detect_plug() was present since 0e5c9e7ff899 ("ASoC: codecs:
wcd: add multi button Headset detection support"), a5475829adcc ("ASoC:
codecs: wcd-mbhc-v2: fix resource leaks on component remove") switched mbhc
to kzalloc() and added kfree(mbhc), and 0c105997eefd ("ASoC: codec:
wcd-mbhc-v2: add support when connected behind an USB-C audio mux") added
mbhc_plug_detect_work.

> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v=
2.c
> index fd40c1686d66a..3649ab1eba421 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1625,6 +1625,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
>  	mutex_lock(&mbhc->lock);
>  	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
>  	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
> +	cancel_delayed_work_sync(&mbhc->mbhc_btn_dwork);
>  	mutex_unlock(&mbhc->lock);
> =20
>  	kfree(mbhc);

[Severity: Low]
This isn't a bug, but could wcd_mbhc_deinit() call
wcd_mbhc_cancel_pending_work() instead of open-coding
cancel_delayed_work_sync(&mbhc->mbhc_btn_dwork) after
wcd_cancel_hs_detect_plug()?

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_cancel_pending_work() {
	/* cancel pending button press */
	wcd_cancel_btn_work(mbhc);
	/* cancel correct work function */
	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
}

Reusing wcd_mbhc_cancel_pending_work() matches the other cancellation sites
in this file and cancels mbhc_btn_dwork before wcd_cancel_hs_detect_plug()
temporarily drops mbhc->lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106052242.2000=
264-1-hj351016@gmail.com?part=3D1
