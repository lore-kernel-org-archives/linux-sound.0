Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48703E0C5F
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298991; cv=none; b=QaP+x+uzFltGgLrQ4n7TO6Ih9gX9ssrI1p2WT0dFrI7l+DXy/Kb3igrJUhqzbyu5a7FkdLKOnB99srq8IFmB4m04wgEr4I0c7JRhtmFtziTkzc/TkGN6e/XC/wqhC0ta3tnkyYpl0UXt/XvjWqvy+tz52s2uiOmaMiOp6tWq1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298991; c=relaxed/simple;
	bh=3vI6rf/svV3U6XCNx4chxIHGVRMOUu99UZ90arwseCw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8sKFWVcON0rYT5mSkG6oHPCHP9wHdIA+PLa7lHJS+J2cITe25m/QOlyl/bM1BqRWunv9lje0wVtNOOC7uxGjmmxoTz+NQBcdbudU4PS2FPydsy6h0nGml44vuNDKq1Og7OvgTZgZUwXam/nNtciTpHgZWqn+abYs8Ct86cQ/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gFxU7fmA; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gFxU7fmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774298980; x=1774558180;
	bh=3vI6rf/svV3U6XCNx4chxIHGVRMOUu99UZ90arwseCw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gFxU7fmAr8gPxWU4qlDInoOaCClJJlv6P2ce7xYLMJgiy5CVrzORbJ7ND/OKKfMuX
	 zaz9kIzr3H746JJzOPlWEF5sjKF6bYkFzBbGhfqrCjnM0pykqBwhxBfEMeYlL4Tv3O
	 nMnANxcN1s06rQCyoSOTGovogy9DN2TZHD0Fi6NeM+aBfi3yq602w7UlBj/qjs5t4L
	 W/cQeO2VeuxGyZzq1SeMdIKc228bHykGorx1Zj45x+8rTR0dNobqV3UpNNGiuNntiT
	 SAunmvUaw3H2Br2mZNJdvRx+a8bLHwzHBj1sKyaL9BFFnvzzyCnt560/Yis6ElAL7J
	 jL+A9TrIXiXZw==
Date: Mon, 23 Mar 2026 20:49:38 +0000
To: zhangheng <zhangheng@kylinos.cn>
From: =?utf-8?Q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>, Stefan Binding <sbinding@opensource.cirrus.com>, Chris Chiu <chris.chiu@canonical.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Sound quirk for Legion Slim 7 16IRH8 breaks volume control on Yoga 7 2-in-1 16AKP10
Message-ID: <o-G6zwiKXBnWimUZ-qvEPzimcxQIy7EBwkWwnIicjHc5ojKqzJHLFS0PXdIRt6wlRbK6tPW22BBP1UIMt-k0FW5U4vbs4XEuPx-BSuupUPc=@protonmail.com>
In-Reply-To: <7fa11848-2497-40f4-b61f-a609cd77c67c@kylinos.cn>
References: <i_S7iS6mWHUQexU6eMS8mOTAzBhZjnV3XUZlbfNkXVtGJN-tnGpBVMC_mTit5moylkFcCtpQpjospNM-S7X4a05cl-gdL1sQSk0BKuqYbhQ=@protonmail.com> <7fa11848-2497-40f4-b61f-a609cd77c67c@kylinos.cn>
Feedback-ID: 121526638:user:proton
X-Pm-Message-ID: c1cd96e3ce2ea5c7ad93a33361fb63e06ce35d14
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I recompiled my kernel with the patch applied, and it works as intended.
Thank you.

Best regards
Kamil Go=C5=82da

On Monday, March 23rd, 2026 at 3:16 AM, zhangheng <zhangheng@kylinos.cn> wr=
ote:

> This issue has been resolved and a new quirk
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN for 17aa:391d has been added to
> the code. If you have the latest code on your end, you can download
> patch 7bae956cac04.
