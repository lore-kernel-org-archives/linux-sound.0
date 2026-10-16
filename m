Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9502383316
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157454; cv=pass; b=FttOzysFIWAq63jhNVNYr/T4KIHJheJSyzDJFpbl8TJxrdEELa8+TpEqS6wBEeROwA389AbdinC7qxGErX9L7/i77oEERnNrh/7sGfaow7vfTXRfFt8bXoZ71a+ckaFTBXxR5XifrzZzWCMDUHJJbPNlMEoCYBknZROnnNeONaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157454; c=relaxed/simple;
	bh=Tg8osBMlJW2gUg24u+geNatqsk8I0c48ehEw/o0APJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtDHeAicOkn3KN/W0qViId4ou8hWnzHtWUZ4DXUDbiQNMEoNmjYVGKBHaCXa3iRouc4Q/9f+eAfJQi/K5oKL1CaFCLSzPyKqx2JILwj8e59XnOnwBsqoJBI8POCJs7GfuhwqXVMu784DVNpDHFe+4MDkKPOYmNxaGG+/kRZuygk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drEAeZ4I; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drEAeZ4I"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ae8607e8afso47401477b3.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 06:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792157448; cv=none;
        d=google.com; s=arc-20260327;
        b=hSqKGZ91tTrH1gydthMJe20r0h4LEd36Kbn66HQ6xBQ3jve8hamjxFMw3YxBC4a2CT
         hBYxwXRUqGgPicZ79zlg6uWOCINRKDBhCsK/w2IwNjU8PguWR1EWhiEfotYSty0Klw7v
         7sEH4tB7WjMYXF1JoDhDvAr3a4sAkGWFj9LZ3cdoI7dpu/V0hheBR8Es8zYoNUa4yp/S
         H601GZHw6HimjbAM7LFQFnianRe4yUcw3h2x1wJtBabMP1Ppt1AAVUqEZY6H662fJA3T
         k+proWlJmkJPuICRgBkoXIzrgv/I6cCN6aEZ20LHhf0LxO+biqLBUfmMFxWjr4r+E32x
         yzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        fh=RaESTP/amFbZaQ/YAmNo4/heMvzbURowXk7nKGS1824=;
        b=SbYPwi0DVp9a2IOGTZPYnSnMU7QWxpRSfinS5lyUbhj1bjOdP1hZ6HBQQZfY2Pfhwj
         XtRkiX+nZDVejwq5PqtPJjanzB5V2oCrB9OKHeVafceR/qDktvnYtsQ+BgsKyAhsQIB6
         SytWY+vW5E3NIdLBKnAQkTbaF6hFmZ/EDLmgFcC2/8s8AOhDYBqpUVRWxTsfqAq/FBFF
         M2dwUIufY04jEjTTCJ9B/KDNRFxOQVNK5AHonPOXckIs+IwmOqCOKJI9Gs2S+bjmOHx7
         clYvVFJqH5HLFnIhnIEBXiGt51OCKVTSNgC/te0vxxeLowsbs4gvKwM0KtTVrRKbz3OC
         t2aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157448; x=1792762248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        b=drEAeZ4Is2P5qjLVtmTBn+HFfFgR4BV+4prbSVsy6JLOuS4BGHjO4PFOPmIA0KLGHg
         L4NI1XiPtQRCnJHavS2o3aEWXxuh0BfJJ/2QtpJdGCv841wWJCb10mJTSl5IpxYiQAuJ
         4OngJdPXGmgpdBKl3Si6Vceep5jQadSpHtPsqEPIzipMyhjT8uwTyio7d/Qh10hX9Pv+
         5eKO86JQ89huoEKcCwSwCihFNc4fNu2f1Ccqpzx8mihXZjwzsNN85xwQaOI8eM5NIqpe
         bER78hba6NXXXmw32BnzR9JHo8wWr4Hwc12Ny82TE+Dk3nSR3wgqZZe/lbfvtcd9kw1y
         MeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157448; x=1792762248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        b=iKTCbkGuSyLOeMTp3WqjcKNBpJ2Ul4mTmCVPbE8bjNTCMNYOZ7cAzi8oS7D7qYkr9M
         dXZzaw8a13rvtxFEaRzfX/9dVGaMdrDSHZVaLxN+tfV5pGacA1jaygnfekywltFByu43
         eQ/be+u/THX3yp1MYHy1Bb7m4TmLdx+Wk0U+9oijIU9WEDUs6bb2q+jUCL9kUlA0FG+d
         CK4xvKHN8rUoMD+dTT4jUWx6lKHzHYZsQkdrOegJ90w39um7UADEUdWIjRY0EIMLer7l
         cq4bX0WojSbv+d1mxc0KEdCdfutWIAb7cb3VVLtrW3WUaONXwJtlVq3JxOXwEIsONxrW
         Du1A==
X-Forwarded-Encrypted: i=1; AKwUvBzzfsnWye3iHdu4DYBzpfEBcUBmr9GYc/W+xCQfqn3B9Lc5qA80GJZ+36lW8/LJ+cbpevzfqseB+LKKNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEIn02X7snThO0wSn7ER5f7+y1TdR5cA0CjfVvBb+CvS3kAQFt
	HWcLIim0g7SzwP+F8Vo3MHbn8K/0feeogSPOS4fnCMQ8/dVbUtKia0tWO6OHniUi28As+Qy/u1L
	tc3PIN+BnAuU7/1s2GvwdzYYYIL+mL6c=
X-Gm-Gg: AYBFou1DzaTNDM+bMKiEjvlTHi/xKbOvMLpEOh26Zm8dJDbS+ZPZ4RWYxQueOwpVEXE
	Atcs1GUgaKpncBqZhR2GaJ0ORg6faJzAmA3N3gnSueKRfxXk4kWyGIvlUTlYlNIjnF+ghaRFrhS
	BNorZvhFF2VWFwEJIrPNR+0yfO5ylERs22Ug3yOcDCIKtonCEmCHaxddqFTVU/8nc4aLzoEWUWo
	DJfLgWtzhZFE3y7k8ufl7q4OX+poVn7gFZmoWK9utLe0VdpZGz16ZvS34fQyQkCDm5E5RWP1BRz
	IWc83bOjisPYrmduyZb1cdF9RIhbg9YEWfhuTNIV03AFiJgGkCKMXMibZFHqqS0MniqOdNMGGzO
	1VgkVkHEZHg==
X-Received: by 2002:a05:690c:350d:b0:8ab:4b1b:fb27 with SMTP id
 00721157ae682-8b07ed90e31mr80020807b3.23.1792157448333; Fri, 16 Oct 2026
 06:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com>
 <87ik316gq4.wl-tiwai@suse.de> <CAFRLqsVH=Xkeoh2icgSftWCnk3uEUGPst=N3qeGoZ7Zy9+W6WA@mail.gmail.com>
 <87cxt9u74s.wl-tiwai@suse.de>
In-Reply-To: <87cxt9u74s.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 21:30:36 +0800
X-Gm-Features: AclHuK_-8NTVn4hstDmRuq6xyfPlF3KXeqTSQtUBU9lQ4ZX21sfTb7zarC3sCB4
Message-ID: <CAFRLqsWCmGOf6HfEN=NY9JJQBLEXi58ccUr5cijSDPM_ARcc1g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Protect debugfs setup against control removal
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, kees@kernel.org, 
	blum@kernel.org, hui.wang@canonical.com, kai.vehmanen@linux.intel.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 21:06=E5=86=99=E9=81=93=EF=BC=9A
>
> OK.  Meanwhile, I think we should work on the jack driver code a bit
> more regarding the debugfs: namely, the debugfs is exposed already at
> the creation of kctls, so they are accessible before other interface
> registration via snd_card_register().  The debugfs addition should be
> rather moved to the register phase for avoiding the unexpected access
> via debugfs, instead.  I'm going to submit a patch later.
>
>
> thanks,
>
> Takashi

It seems that this problem does indeed exist. Once you send this patch,
I=E2=80=99ll be happy to help review it. Thank you very much.

Best regards,
Cen Zhang
