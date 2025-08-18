Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619429E112
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522795; cv=none; b=VhXv9qTOZ97c/J/NjWGRDgSkzutmEczcwvvMWG3LruIh3HI0n5Mr2EtyYvN6kWFT7TDlUDhgXobt6vsY9ML4lk8QtR7nJ+4mLTsAeD3masPjc7Oe8bJNeBQOuuOIguAjOmwhSMLiW9sWnSU4z00H5hhnz3fY+90iedyp0L6RwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522795; c=relaxed/simple;
	bh=D7pAxX/Bk1sxJr8LPcfqOuQy9rhkAoYFnaHXF2OeRSQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jgV6PjO9WPFba2i6NLCYu0Y0iDMyuc9FkxDp4/f0p4Oe0vJmk0ZGCCGELJfURyBJ1H85r5O50dRurfSM/y/dXlZuYKD6rugqeblfIMwTDtgn+N5etqVnBrlMvzIipSWjajc3or7UrpPEh8DjzqS0d8AwErFGZvCjXCw2/6TkhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn0f1nHO; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn0f1nHO"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e934735c552so1360625276.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755522793; x=1756127593; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3PC9/asXeGUXr3Hp56RSsVABYs+NXNUm1ZrVGsAhi2I=;
        b=mn0f1nHO4MxAXZAg+vbeMW5h60f77olDT5P+9xhGwwjd1pJ9N/Y7hb1OfaCIR4hiyf
         LjXOXk8iwKrLcdpBOb9iTDRXSPTvPo9QojdXazn883c91a7httT61gBwTO3RITDgHScd
         1RsYc2CULzwOwDPvTTET+Sau6opXbVDdukXEYUpSo67o+2hRGL4rA6Cr043EPR/SCCYe
         hL4CeCKV4hn9hNbxpcVyz04MY1nAoXw0VV0YoVMBJDBNhfPVr/bD4nELXdO4/fRdbSOi
         /FPOucft37Umu8lyvstpsw7kH16w9mRl0sPrha0lq9Y4jENNtMJczwvpkSRrylJ2zmGm
         0IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522793; x=1756127593;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PC9/asXeGUXr3Hp56RSsVABYs+NXNUm1ZrVGsAhi2I=;
        b=LPCMf66zJDnWu/RFpRdPRR2VoFfTqyfQjDyu3hDBMBP1gTH7pnrnZ4Nit9+IB57vOq
         I21X1XU8COvW59JHSNpJHyeWspdDxhXvjZexqd27ZpTfiW/MAX3A6noBukIFhhpPnPt3
         Bw2HpikJkeSKApCsc9UdE4G5cwMA6jlazyT8FdiTHUj0iyUwuM3mM4dTkmEsMIh0OZnQ
         jItsFTPnDqQFUpjGu7Q7R/i/slmkFOY26J4Mrw2g/rj/Kyv6HoCaMXIEbwhjFDtNPQOr
         72zOSibeSdMbiCjjF0mTjwx+Vz3eiduhCxXts0eco08zq6uWTUTcoCR/GYw1dgQQxyh2
         hnCA==
X-Gm-Message-State: AOJu0Ywgwnb3dWtBZbHpXPYTknFe53zuXeVFYXlalF90tq4/MMFscKBG
	hySxJ3SLmMijuCnuGRl9C6pVCj1jhdb7xPW4TPHL2i17P2aWoPefbwQGPnTmgTlz+f/89kexN4C
	LPYSpGyVEPYiRE4hdItY4DzSDUa+bKDy70LrYlp3clA==
X-Gm-Gg: ASbGncumiKQli4dSq4j1UEEMSRtFvA7DIQxktS/3CnuBS0ZcTwf0ingJncTop5PY8R/
	18ElpNP0BsBglxd2Z5kOSD/DUu9OQsfV44hA/P9UVf5MYi0kB4+Kgxs7vQ9VMSBw6BuH3mUpyip
	w46q5gLoSsfVwFMfakcqOKAfEZOXKNSGAWvpgZnia9yK6VPYG7x7+iRjarPZCwp6GwEftnQCEAW
	60Bi9zaJBbrBEi7+XCFag53o+TGco4wyuHAHacOvVFgnxdciaq1
X-Google-Smtp-Source: AGHT+IEZ2fBlwePjnrrR/mv5ZzmlTc/2xWI7k6q8gADs7MAIq9Uf1dqpnudQiCljBFGUkCKFK7YzrGWzoGnGWm+3p6Q=
X-Received: by 2002:a05:6902:70e:b0:e93:4e06:a77d with SMTP id
 3f1490d57ef6-e934e06a9d2mr5285914276.2.1755522792751; Mon, 18 Aug 2025
 06:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Carlisle Nightingale <thyriaen@gmail.com>
Date: Mon, 18 Aug 2025 15:13:01 +0200
X-Gm-Features: Ac12FXwZLbFusKu6INCd1FtgEW4f3Nt5KIB567CMrP8idcUmN95avYZiX27Iv0E
Message-ID: <CAAKYfHBCMbaaVaZBjzzvt47=JRTVm8Hz=mUwUJkJzp2aatk8Cw@mail.gmail.com>
Subject: 
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I=E2=80=99d like to share some information I received directly from the
manufacturer (ESI) regarding the new sound card Juli@ eX.

The alsa-project pointed me to this mailing list:
https://github.com/alsa-project/alsa-lib/issues/462

Currently the card does not work under Linux, since the kernel driver
would need to fully handle the DAC and ADC control, which has changed
compared to previous models from ESI. The manufacturer has no resources to
provide documentation right now, but shared the following details:

- DAC: ES9080Q (to be replaced by ES9081Q in a later revision =E2=80=93 thi=
s
  will affect driver support)
- ADC: ES9822PRO

Datasheets are available at: https://www.esstech.com

Hopefully this helps as a starting point if the community wants to
work on support for this card.
