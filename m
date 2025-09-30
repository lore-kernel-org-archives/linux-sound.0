Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DC1BBBE5
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240009; cv=none; b=Eu4ItTe598Azz5RNXuLZjQ1sVSCe2dHooONlOY6X3O9Lsu9dGz5uYwsXtqqOV0vygmvonY9ggcSswWzEkG6pkFS4ynHG+3eCTz6I+mf5lz0vXqOiBIUDWilspSpf3//tNuI4jEraXHMQiTK3D2Jn68cHz7BG3Kb9RsdZv1OTAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240009; c=relaxed/simple;
	bh=YlStPwqNZ4oWC4pGA2dvTo0+R+SqBxsrbV3mpimCF3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+wEOF31oQ619QW5WKspJ6xBKfBEvkZqnzu21Z2sEwhDeHKZ/7KVC/ivbsXtxBV/n/ZfwnStytKSWWVasrB+63aPyt5XQ0hpCjI/bjWN4Lq5U2ioTuo6sDyrlEsACpgnjpfOmEQ0wqP9TxUepklSC7VsdqzIiSCxwIXGZth237k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkyG+3Lb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkyG+3Lb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7800ff158d5so3905060b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 06:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759240007; x=1759844807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqBeS8DsUEmSCXznbj/dxds17JMLW1MF4WQuWheFD+s=;
        b=YkyG+3LbCzkGMP+Qs9tqKHTmME/yHNu8G6B30sXUK+b0+8PP8HaQc3wn5Gfs0aWSjc
         rjJyPZuOSPL8TY7608p6nat0/d2hTnZFERIANstiLx+kiGef0PG+ARPPzPpifhcLPmr+
         DBaftYC2CSycgWvFVfQP/0iwph8lrB9SH038UuDo8BTQT382Udim3DLwdySM7Qj2bCbS
         i6o0Lc54/oh5A9zlx/TK456MCTwxMd2Fs69ZP7MNs10KGaJTL2ys16y+yQSVahGoBDMW
         5NzubPW0cGhmyG6TTt7YPbHn4QJMKxs6FkA/sbmJ3vTmYuPxJ8b0h570qLhqW1d7khGN
         /rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240007; x=1759844807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqBeS8DsUEmSCXznbj/dxds17JMLW1MF4WQuWheFD+s=;
        b=mA/IBxy+IUk0GVdqjMQz76RRmPe/HBtFAJ5amXdnihZPTJXbnrBSHTZ16q6y9mPf0e
         wS1Ra8VSQpE7ZU+68jIAyIf8VIFmQ8SA0+qCw5bsIpzcNODsueUbQuiymboXT9WcUISZ
         hpsBq69mzDkKpcvpTk3m3zMsA0/464Q61rE7J9qfYCBvVEBDbFfZTfESTX6CwF1HYW2W
         Yu1mhXtqCJn/Xwr4EiT76n34slRIH6DXIsy1F8D33ihE6xW6pCveT8OJ4C0X6Jd/ga35
         hwOcQUgAW5KrExXnFnPWsPl5uRkpYsBe2OG4qZcAV573beok/T6JXdaCTfXBUT7TuNkD
         dYxA==
X-Forwarded-Encrypted: i=1; AJvYcCUvIqaas2tCvCQcKGM6f7AVumUxgQU55Ha3CfbVwd/zeOlgUDEXQu6ERsUGDtaT2yy9Hf8CHJr9uihZyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JLDLiidbgB6n5KmJE7IKweUuB9AUc5+x4LC4CWanufVL988o
	G/3uLH3sbDk7nOUCNRVZB+0gHk7afKBRdsLEUg6DzjmvyNqi0vP3EqDOLiJybwSJSs+uC4dljHt
	DxgjAuRG/BKPCwJ/Yfm0OKLAM7Srv82U=
X-Gm-Gg: ASbGnctWrsEq9Sv076+B1Ixhf/px5DCMcik63b0quRralAGLD8CgmZMAtE4/Tdj+56B
	95FueWq/aIBnSD7vYfYZYp2oaieSIN5RZxSej6AI25J8ueAIFytrq9FzxE2QRttILWo68LkSc0/
	BsmsWHnpRoXROvyoxc3WcZ2PHGmjiTc+xscteO02Rh91Vr0xZtDg+w8dgkPuvYeFfkcUuy3unTx
	zirULiCXxgLbcFsgg+VXzr5siZE5I+gQVSMtGugnKA0Rrw3vhQ8w3aCcoblyW9qQ7J/XUj24upc
X-Google-Smtp-Source: AGHT+IGhjy6Ww2FYMoSsIzm1JAs0fFsr+Cq1rs8o9HJCNO8rElUTkiUNDOuA4xzAvcy982PmHLW7KiEcwrxcKTrjzXg=
X-Received: by 2002:a17:903:4b07:b0:286:d3c5:4d15 with SMTP id
 d9443c01a7336-286d3c5548amr104887435ad.36.1759240007002; Tue, 30 Sep 2025
 06:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929133752.31847-1-sidharthseela@gmail.com> <87bjmtmgis.wl-tiwai@suse.de>
In-Reply-To: <87bjmtmgis.wl-tiwai@suse.de>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 30 Sep 2025 19:16:32 +0530
X-Gm-Features: AS18NWBf-tvZ0c7w_qRCR1tGIEM-sOtTfgSUYGymXk8Dpi7__37mC7Xze8xDi9s
Message-ID: <CAJE-K+AFBeEtK_e66r2VkeeayQW_H9H69uDQvtbAEKgQZ1QVHA@mail.gmail.com>
Subject: Re: [RFC]sound:usb:mixer.c: Solving 'Generic AB13X USB Audio'
 Unlikely volume range.
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, zhujun2@cmss.chinamobile.com, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thankyou Takashi for your reply,

On Mon, Sep 29, 2025 at 8:51=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> An oft-seen firmware bug is that it provides the wrong mixer range
> that confuses the driver.  USB audio firmware should provide the above
> volume range in 1/256 dB level.

If possible, could you explain/ point me to a doc regarding cval->max,
cval->min,
and cval->res and its meanings, its relation to power and dB.


> Try to figure out the volume level and you'd need to hard-code the
> actual volume range there for your device
.
I am able to change the values and load in the module. But unable to exactl=
y
understand how the values are related.

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
