Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D335F19B
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438474; cv=none; b=JueSOn85BopOWGTikZKufuG4WHambFoPtcYPYWEGWTiHLU5FicpHYSBN+SzaLcuN6dHnn9JYOZO6G37FBKyKIEFGxCr7eEWhuE2soonF0emcIVfECzoz/aX0DkEW5hPwZxtL+w89S9dqAqkLJ8RDtpfC2teUFQH9QSn9QPOSp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438474; c=relaxed/simple;
	bh=IwwYiNeOHyhz45ypZjUBO9z6kWrIY/3PNxNRHBY0qDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMyB5sGr1frZm5+HJ5n13wRmf3yy9OaQb5bTWKVn+Vgx3iHgBKOhgFADKGP0neYzofi32NDjJqkNTogOzrI6gTY4CBL9jPGZCFmEPz+sqncig/QMB2f32m2mVqupwvmrFenboSzhn9q+tJ27xMd+CsJDLqv+NUxyyFfuQbTe+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALqf9T4E; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALqf9T4E"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2dbb4ad19a5so1276668eec.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776438472; x=1777043272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwwYiNeOHyhz45ypZjUBO9z6kWrIY/3PNxNRHBY0qDU=;
        b=ALqf9T4E3Vr4plVUa/TJAsVqcgUHzGDRYd6Ak7bQYZELqseMeg7O8vzo1PxAJI+9E8
         cDZcJy3o1z7GQaDVkVup4T9180oNfQed9vQTLZORW+ghWFMBMCcA1jqp+c9ToNxWDErk
         JfV27Y4o7sVfWvOZRplHrDt0/Jlr5L9T5IMJwZfx+0mLgbiqa1pbgb2VxO6NZ68QyC94
         i4Kq15xblRfR+XiDfUdEGD6RM6Hmx6C6/AkTgnLfr4S7tY52224aQhEcLxMKgatUC99B
         KukpcEZ2yamIkwx0A634FXIGAA/NmHtLwYqrjkHzGXuLRnh3Mc9d61bWaU+p2n+3u4+d
         UMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438472; x=1777043272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwwYiNeOHyhz45ypZjUBO9z6kWrIY/3PNxNRHBY0qDU=;
        b=jRQvUx1ErhaAqRl9s9w8u3/3Z0TbXC1CxtOrLl/VcBNm8UyeEi9X85F6ucoJRb5Bgq
         lTMUwjgI9XQaFjzAfjvk6zSKH789dejB91ZRf65e4wqeK6qMuigUQCojtCwHXe1jHXXO
         4DY3LX/kzEkOvye8917BR39UeHF4wAtsKzRod0JYTglFGjGVVl+Blu9hhN1lAh0XdIXS
         FlCWZdoWwvFUBJPvmJRtL0sEihi6DsOaOr75ZwRI5O6fsHoyF6vWq0zVsGMs2CoJIeO/
         njeRtwEUP7xAgptiOHNOeGSTN5guCjF5vk2GzUZ4sHRHnWr2DLEL/Y6Hxvl2rf/84jSp
         n1xQ==
X-Gm-Message-State: AOJu0Ywd4sf5CNRZ9PcBHfJc3CZFDFNT2XKZdfkwVz2dGAgDwEeU9w/I
	yx2Ay8qFPLgCJA4dMi/6jyKVP0qtEL9iC5+MJdFMF1kcrdIlXH5S9s+Rk7q2F1QY
X-Gm-Gg: AeBDiesiHgtyN7EhsU019mKGhFlQoXCVQaXyECkWN3s/sETjqeUGpNNufv3nnHH8NDJ
	qB7LE0NO3/XDyUN2PNWwrE+qfNZOWBXzX7dVA1YHMuThotyZiu6Bo4D6FUdTOxHKfi1pLk1psAP
	uOM36YN7+Vezm5L/pF7olts4MgAlo/qwXElL/npOWaB6itjUme7vc6EGv3u4JN4njdesA3RL+oE
	puDBUMeLOMsiYrOKU/WNvgvP1G30+RBdzhu38z8g5tlSAITeTi9q6wS1oH8iJFPWCaz/NGOythU
	oI4x9RETblAVdEBvub5QYHDtaReffCs2keTrfu8qKRUY7ySi7wrkeSpj40NQeSxCa/u8K8wkDQ8
	oVnC9veHOXxErspkt3ufQcc/D4N0c01QqliAgLvkXFMC0RHbPEyacUH37E2zaxsQwEP08qM8mya
	SrwiR4mTFMCP6fOeBdJDCnVCZCN8Mnzns9XIIy7hE=
X-Received: by 2002:a05:7301:1f01:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2e465770823mr1772735eec.8.1776438471999;
        Fri, 17 Apr 2026 08:07:51 -0700 (PDT)
Received: from MSI ([2803:c600:d219:caa8:ca92:d824:5198:4486])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm2474703eec.28.2026.04.17.08.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:07:51 -0700 (PDT)
From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Subject: Re: [PATCH v3] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
Date: Fri, 17 Apr 2026 11:07:48 -0400
Message-ID: <20260417150748.6684-1-jpfuentealbabizama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87o6jido5j.wl-tiwai@suse.de>
References: <87o6jido5j.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

I've been testing this patch on the actual hardware (SmartlinkTechnology M01, 301a:159b) with a custom compiled kernel, and unfortunately it seems to cause a regression.

While the device is correctly detected and appears in /proc/asound/cards, it fails to create any PCM capture device (it's not listed by arecord -l). Before the patch, the device worked, albeit with low volume. Now it seems the quirk is insufficient to enable audio capture on this specific device, effectively muting it.

Given this, could we please revert this patch for now? I can prepare the revert patch and send it as v4 if that's the correct procedure.

Thanks,
Juan Pablo
