Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB313F54D9
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965019; cv=pass; b=AwHAlbdJaRzq5xWZpkNHFqIzSazrmN4Hxtx2/75IYi5Sc8LJmE9fk5PLVr77usR/a+p70QrDfHmbpyXD7OhF+uF4LNIxBncMQl2gOVFfHhyFNp0Qw+ODgZxDgmukUBJyrws7PjgQ9iHLWY3iGC2LyOp6sC4ZHgYPyvu/QkVj3T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965019; c=relaxed/simple;
	bh=J/Zd+Zv4Zx2sJoYVYws2iEyWELkp68yFmunwsVPDR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OysU5ITQ5C3a03Jl3sfTVnIUJwZ4BrslRqqOV/AG3eEXvlEa950naPy0EqK/ojBARn4+GKVLkL2CbVcVZexIs77EX6nOQL5MZrORYZgH93ouYLtcUxdRm4zGS4sZ95w4IcyFEStKC2Mx1NdQ1l8XBpStmwFSPOzS2xzYVDNw4Cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m12sam09; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m12sam09"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76b9efc299so53621a12.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774965016; cv=none;
        d=google.com; s=arc-20240605;
        b=TQ4Gp1qtpJ2rhTMe4OgrVnJ2+xiyiseDphnwXj/CYX1ZaPoZWojm4qMh1J0kSv58Ay
         pC/Z2SN4CS4MBqxCRz5wHdAUlPg9Olzpv0UcKdHr+EeMnCQwvKKZ8v9h1QTgMyiD8Aea
         q95h+3/ZCuyYmaQwAcom7IGDvVxMDofk9VdVepzWRF//27fKd/yPyFwY+eMy/Mi628TD
         huBiCH8bCW+0dAUEltDJZTabpBFH1hTy3tx7fyixlkHU7z8qG8gDmBVqIhEpxbJHeyNn
         fKmv2fpHai1hU++IBo1FnqiexZsNQBEV3PgsIX6tCyoqI/jShXLt2+7mynjWAT54lWAF
         eYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1qBqYHapfEK0lfRyQ72RjBAD9wjLPlTowcxM0WvHL8=;
        fh=O7KbEqCcepwLk0ON604JxM59DfuRMqWH7JH7Zu4Optw=;
        b=kXQHF8pbv06ykiauStHV3p3oe6Wl8STUbz1eEfwU/IsKO5ytboVwoEIL29L7EJBGdU
         ClKaraubzIUBBlIWiQmJ4VNuttN6niSTe3sRjVaoPDZez3+hwVXV2tJn4aRijVRGNf+O
         WX3DV6x6w5efmedvb2Z78aw6NCjYjJnl8UII/eQtooRdpMExthc7g6iYrNMNuP5MBLtl
         PNYBZLZVLI59KWB1SQfCqiQovGQFhFF18ik/bUD4CSqMgeKevNrLC6dVuhw/y5MxJFBh
         XvxvdyxqlBH0gvkLlKfFek1l8cLOdT25aR+H+iS0+CGnqi3m1QuCecUe5NjEkSTvaqkM
         RNhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774965016; x=1775569816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1qBqYHapfEK0lfRyQ72RjBAD9wjLPlTowcxM0WvHL8=;
        b=m12sam096Fn18TbApngdFsjbCyR/0nJ5lOHJEW1ul9WSoqqoaCvqNmpqp44/RHy+xP
         6CdOw7NnK4SMbkxTQaOG//oM/+M3F5UrWmNyDRRSZrP2TuzIdpPtEqWtcEL8YEdAdCM7
         59w0UyKD2PK1SB6+VhRcI+eKOXDWGwDFRd0fIPQGpHewvEFm4trxsXy0gfooHm6jh0Lg
         VYlWHj7C23Ox/POOMGnqM7i0uW2msLzlTv6RFnXypb4/dyULCrA8a45/5DZ0KlIPsV1I
         7CA7eJrYKGCkN5ov0eQogN8qaapiAUvfYCvB6nMyy4OO9nmgcXMmeAvHjNt95hYsDDYl
         tk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965016; x=1775569816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1qBqYHapfEK0lfRyQ72RjBAD9wjLPlTowcxM0WvHL8=;
        b=plqnHz4HKkvH9Up5nqNfathNQRnOmnoAsf02dhRRr0JCA0S1Wma+zFzL1TXbQ6+7i+
         eJVvnM0nll2oWBXHOuXTVcmN3/wvBAtCRD/2swxygEnQnGAqnI4NTFPQTaLk+8MqpW1g
         gNegzSIYTho6TB/yrUu2Nz0VgyfNvi1+JGuv7zINdqC7X7dHCZVeG+Hgctax9d8+TD8Y
         kPTCmTHI3iojfClc/GJWc1xNuRr/GSKOocMj18H3ArCmGSd/qUCBd+NJuSJJR61vJpnu
         OzR5Dr7yWuxpn6z7ercRZVmmL6dk3TYv2kTQ0/3AnWOiNqmqj0GrXDxtPSN2zEhI2Uqi
         jBOg==
X-Forwarded-Encrypted: i=1; AJvYcCWrsy2pP0y7g3/IZ58PjmWrXxO25BdapqZ2L24l2RLqi0Kg62ETQY3hdWmJThrUNAQs8qmuuERu3zBdEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKiulmLUjUW0yQ8Iqm1/aa/1hieUPs9+8vE3ganhuZtb8fJDNN
	ZmGhWo6VyDGsA2pqmb3atk+5Qpc1DpagS8bsvA5BLlhiMS9pcC2uHEFqTeLw8WpOIN7NlxYiKCv
	dHI23zp6kLVrPXl69ija40O4SZ/rQ1Wc=
X-Gm-Gg: ATEYQzxU//K6EOzS0LQhKnGxmc/nsqI6mxQTYm3rBsiFQnvYojUUkUofcJOj89Yn8Zu
	l9OUwZSfn20ZR5O8CsRK0A/fbZiC+GWvS2A6TxSReXu7dbE0PI1GcGQSTp4ETtGhTK+26AGNydz
	G3L3hZtWaDIosLYknZi8fSd+AuQPGO8ATcWYE2U4/Ks3U8arxqKPcUkaTIyyDDADeZXGrNerGkk
	OUjCH2UtF3T7bsCaN60FH4D+RG/qMWJTX0VjHiF3OXN81bg4F1hcTbo2CKbzKjGZCcs9GYUQIjd
	8Pz4nJ+K
X-Received: by 2002:a17:902:e78e:b0:2b0:61f8:9f01 with SMTP id
 d9443c01a7336-2b0cdd21fd8mr185405015ad.44.1774965016332; Tue, 31 Mar 2026
 06:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
 <20260330112555.3637002-12-shengjiu.wang@nxp.com> <be591d2b-9429-43de-8d5b-357a503607d0@sirena.org.uk>
 <CAA+D8AOsCg9ZO0f974Ds3Vev8uSVj52mano=vG+Rvrw7dJ8faQ@mail.gmail.com> <317fc80e-ec80-477d-80f6-53c395de4b4a@sirena.org.uk>
In-Reply-To: <317fc80e-ec80-477d-80f6-53c395de4b4a@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 31 Mar 2026 21:50:03 +0800
X-Gm-Features: AQROBzC6RhnjxCnVfj7ajFlij0eI6AQdxlZTct8_WFqmkpRLOUfhHdGV-721L0w
Message-ID: <CAA+D8AMaOEpuwuBjO1jYuDQuLSXsC3e6CAS1Rrz5G6Z6hFXtmg@mail.gmail.com>
Subject: Re: [PATCH 11/11] ASoC: fsl_easrc: Change the type for iec958 channel
 status controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Mar 31, 2026 at 09:58:22AM +0800, Shengjiu Wang wrote:
> > On Mon, Mar 30, 2026 at 9:23=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > This drops all the checking for changed values that we used to do so =
we
> > > won't generate notifications to userspace.
>
> > Yes,  as the type is changed to IEC958, the notification is not
> > acquired by the mixer-test.
>
> > Do we still need to add the notification?
>
> Yes, it should be there for all controls - it's just that mixer-test
> doesn't have support for the IEC958 controls wired up so it's mostly
> skipping them.  Someone should add that!  :P

Thanks.  I will add the notification back in the next version.

Best regards
Shengjiu Wang
