Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA337FF4D
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167236; cv=pass; b=ZE9Ijs8hBfpRKAmsi+ZKIKePNjxP3TOoay+I1qEuTfWln9gQdEHrhXEqSiglTXvPsWRGsEMGcxc6FZAvayEObz1pBcMLIHHEkSFUceX+E8/amdzLWBbzdCTYziE6Udi6aCXeG2Q7QobAUv4kJ2LopUSi0fYs+ezmQIOBQiDraxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167236; c=relaxed/simple;
	bh=xk6HJgySbLGZ9E10V7wcNrOFgYlLKqecRl7vQ5oOJu4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fZ7lYnfXNwTORHTJAV3f1rznZw85Q+mEKb60Mv/yUv/Dx4sKLht4tIiWyHsCM9aSoLCITtX8VdyQDvWrDCJe3xEjdl504Yz2dOQoqyNVO6PLVSvhfgjEt7e2c7NSURtI3Niyafj3ICgGHBh9Yf4HnxPwPTwuM+a+nzTFB01sH7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+p2fpjN; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+p2fpjN"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7dbcb505578so96068757b3.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 01:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167230; cv=none;
        d=google.com; s=arc-20240605;
        b=WnmPWpnz9LRDeH4SHe4d9uKaosmI1T30c4y+KaatgK1XQWC1J5fmOWQZC7kCASZ+lM
         i3SBCuPmPbNHNfdUBKDkwtgAUGEdis7oLzTzP2hs2m8Tg0VDXHnEnuWsPApyHQP9wfyK
         zqZGyOrvTP41i3owUWlHXXNfowkMd98S6h6rWsl511IV3wNhoFZ8nUJU6fBM1zBtLCgC
         ifu0yb8kfctd8U88NWmCq8bDkTV+ZS9RAnyxFR6smW6QSUyAj5q8DGoLnKNLu5rKcz7R
         7SR0g6h7KK1P1UOQHTo1khUTzGPUveHah+BB6+z6EhPzLyHCrd5ymnXRty3SQwdcpwDy
         I30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=KHSu0f6PsuuPXiRxnPDlYY5ZuC0ubFQ40ZGw7/whRQo=;
        fh=ai/ZWD0nmWSDkiWqO20IJp0RDJu5R20xOi5qpXc4Q3s=;
        b=YqKotc5wlM8G2Um0CnIpMo+JXJk9IL7jNpqVRxwfwsLKtb6QLvjxoILd7vYBrRyQB3
         a0MHcF7L89yS2CN+Cq10LqM03Su7E5J5aMuH1IKSiVqgXfZaWJ6/S1EeNQ5kqtARQXYC
         XSoHgbWq9758fT5xgC9/oY65YamJsB7GgoBbi9Z7zbhP5+Wdh93yWSpuk8Eh5i4jp4S3
         yWh3ICl6PEcnDAheQifXFJ93FneWFK8w1STWIP/7tvmUY5KYrf5ao4yL4oaZLHLs247S
         R+VAJaINY2cs1tft16R09nOFhQsHCFRgWb6eX6yRy9+IlIqhcSyRwtU6LWOKxTfClod+
         6New==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167230; x=1781772030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KHSu0f6PsuuPXiRxnPDlYY5ZuC0ubFQ40ZGw7/whRQo=;
        b=o+p2fpjNOryAX3P4NbpCGBFWyVZofOPAQtDhlrQiZ1bOiA1BsQjeVTC4DaqltyI8kD
         xF3PPYCyMEvUxizpJp+HO+zYrLPB7zNfXlSo7U6+4Pk0cHxzMrR3UnWr2mLuyX3zWn5P
         9jBS08RVAs+yEwigIR8VW2gvUadoLcEke5FtSPmc35aRtjbFq2oHoubK5uyx6bULZzE7
         U53aDz9fSXCzJLuVx+wzZLaUBbjXNJ9X3EqGy7Ts2rTwwTJI0iCbsOXs4JUPJez4xRVc
         z/Ww0Edqh/+xqlq3YN3BngigFSLUAi7K/UIku1pZAH948gZUswstKAEUnIhrxndGs62s
         9GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167230; x=1781772030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHSu0f6PsuuPXiRxnPDlYY5ZuC0ubFQ40ZGw7/whRQo=;
        b=fE/zHrF3ufOi6JAMakEe5gNf3I3uj15CLGlGNr2o9PmwOna9/r8OqH8r2ybYz3vJ3X
         zda2/013iQT8JS+MRSwzQ1EnLHTyV3JWnos/yN52xmE5sAGDhEhfctpYjv2YKKwYCzl3
         TzwPMPBw8p2ruB8oTtlvJ/fb3/ols2XpQf/lsbwchxTG+7Wcgu5/dLZgNGTI82/qJPWe
         3pXFkavq18bofgRFAa/3gy/BVkyPAx8KVDT+mSDXBj37Hf3HtOGViJFwbCbnRjZnuyss
         qOlc9/OL2zizB4ItxkTbAhh7g9eMenZqUvBV/aI4ywEbNakuDGw/eYEKUZEGih7lE6Rm
         3tuQ==
X-Gm-Message-State: AOJu0YzqvFigteMQseLYayZnZ15YAqWjsgkwHpJ4/I1cBh9vTDMhZq5O
	24LiePuDc2ykm01B+Hy4jF4KjNE4k5sFGwAGYLj7pV/Po7jyq6lF7RF8Q6/g6TWbnOI/JlM0kT3
	DK1uhIwJEwz5mBNsyKqG+uIWpWolF8S4=
X-Gm-Gg: Acq92OH+YBRY+iXJCiNvWPUEQsK5lq/9U7u+eoykR/OqQeYmNWV6Tp19KeXnmX5vw0g
	htKRdv3RTRfs0miMuJ3EEVptQoXJxECCyz6zcqZaqNNCQfhgfIctDWh1X0/a7F0C+C3Zv0C37MV
	GdBYhfg1upzl+2+iVXIDDR0h2RRSN1pUyhEnCX+RcU99xJI9girb7wEynQw3Kr65fQOaHuZ2Eya
	BZqBjGbdLW3SfYtsuYGYqZI8gX3zSdYVEg9vRVNvFt21t9uZbxWC6/F7g1Vzya1556BRgsEUPfH
	Eup3ekUk1WsEIXNZwoIq
X-Received: by 2002:a05:690c:62c7:b0:7ef:d039:a33f with SMTP id
 00721157ae682-7f655dd233emr19557077b3.20.1781167226940; Thu, 11 Jun 2026
 01:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Thu, 11 Jun 2026 16:40:16 +0800
X-Gm-Features: AVVi8CdPELJSfAIU7rPcwb4KXHX-jgbCs1T9BF2cvTV6C_aNoawaCh1dAASZnRw
Message-ID: <CAGp+u1bCenq8uBL0T6pCtLvNtk1+fyzjSVtri02AfDcy8tEQXQ@mail.gmail.com>
Subject: [bug report] Potential deadlock bug in 'sound/soc/atmel/mchp-spdiftx.c',
 between 'mchp_spdiftx_trigger()' and 'mchp_spdiftx_interrupt()'
To: claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux kernel maintainers,

My research-based static analyzer found a potential deadlock bug
within the 'sound/soc/atmel/' subsystem, more specifically, in
'sound/soc/atmel/mchp-spdiftx.c'.
This deadlock potentially occurs with the involvement of hard irq.

Upon checking, this potential issue is present as of git commit
eb3f4b7426cfd2b79d65b7d37155480b32259a11 of the mainline kernel.

Potential concurrent triggering executions:
CPU 0
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
T0:
 mchp_spdiftx_trigger()
  spin_lock(&ctrl->lock)       // =E2=86=90 lock acquired
    ...
                                T1:
                                // Interrupt fires on CPU 0
                                mchp_spdiftx_interrupt()
                                  spin_lock(&ctrl->lock)  // deadlock

Thank you for your time and consideration.

Best regards,
Ginger
