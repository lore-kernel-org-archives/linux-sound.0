Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34E316199
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058040; cv=none; b=Fzw3XbcE49iT0sYkEaTdL2ku9sO6aQU5h4z9DHy/7OYDHVrkSkkVn1nyK6xdrGyz+nkFNRG29UZymR11OjLR50b7Yf+uVxdRG31pjwz/XxpdH1hGDiFz+T2TmMZrrsm1xhOninjyDKdCJwFDQg0eEjOdB5DHNW/Xl6C5xan/T8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058040; c=relaxed/simple;
	bh=7JbPPMC9KEMGlful8kZbuXTUQyPP8BqdUCabjv3tsqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+q9zL4aurFrmSz+lM74pDfypsT1MH524IuSPvtv7P774g3WXrpCDM86CHSh6qDff7ndnyojU92CzKWjuIRS/Qrg7I9LeZvvtH6ScEqW7S83SkigVyc7GIytcFo8yUxVYrvuyRr4X+c4onbjmqGTSarxTSABYczDV6IPrHMcTZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWD8gNSl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWD8gNSl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so7135185e9.1
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 13:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058037; x=1791662837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1zvj0uCRg+B5aiBl/n8A7h6RRgbM/5lvnwXxsY+iJY=;
        b=VWD8gNSlyz6iAoxaQdCnMqlK0cfEKUdF8i+ApIJ0beBxkzY76aTI5kaPqIWeQPt6cl
         9jp5KKtNcyHYpQGHJbWWNQWh3EYXMg1G6A74FNCJ6PDuLOtLvXmnAYesFqabe/1KeQRD
         wi+dL8L6lgsXS5T8QQSp570+/MrTvRgBUYEHEYRWZ4KEcXep4Nj1liFOLZoh40m70Nkt
         4RgCMOhXRDmWPdVnjTZfi8zXWYCigfcpPbt9FiqsfD6A/tmHTnjHxuTYM91GQ3TDuusg
         GMq9RVJZWzr5cFeHdAwhsNUzSwnZzk6DxojnlekQb0hcd9rmxsfTWNeV9BojAZfcj0vS
         joAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058037; x=1791662837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1zvj0uCRg+B5aiBl/n8A7h6RRgbM/5lvnwXxsY+iJY=;
        b=OV2DUQ1mNtvaebIn7G1iD7vywnK6nezN6sbYxMXig6nffsYARV47YTc+6vwEY0t+Sr
         8mkoG9tm4e+jOZ+JZuPtzeIk05VSw2NQyfs0XRf3BFFAUeNjbBbqGXU/fhamdbiF0S9E
         aO49XsJ+CdLQ7EzqNMe/ewCA3d8qRfqGFBZ5/yTP98GJbsEV+ihWP3922+17zQQwr5qf
         0goGMfEXyJsr0SDwogNZ+pHwsn5mi58mQ6jSwKk1DWMoTSLIYUeL+DfNSbd79OQVZ0To
         ly2sCpWQlc+48YrVZh96+YtTDZU2iZaAdJlNfgNoNS3hBnm61oA1zDNwQVDV+U4aadWF
         l8fA==
X-Forwarded-Encrypted: i=1; AKwUvBxXXlb88qeBALHT2u8uXsf08+YjId9oSX1o5lasiI4zE9K/xtdWm2HE8yF7rXdgIcv7iot/QYkboDTiXA==@vger.kernel.org
X-Gm-Message-State: AFuF++kEdJgrSQZI5b1u5iucptaRHqzEphjW5xTGGI5RB4oJ6Ac5rgIw
	QZZmSivq/9+PvIjBQPgSVxZaXU85mnJVF79OZ97qESm/BNvutHmHffP+
X-Gm-Gg: AYBFou3M1098yCPJcMdsGKjh9ggyGLuRLareeRCI+6UYEj1Zim92JAJvf/83V3O2Flb
	IyK63OAoiz/cbLooY0xOTweljFBS9Nkh5Nx585wUK640B+sDQ2804YMpNhZ2hXhEjWKWh1H8LUK
	nAMfoKdpMxHWJx8aBdQOGJvaK6Q1YgOqYrqv5j122NT+OPIpmXVE2+yorQ8j2gaEnryO+pGJ+7B
	fAEM+LbnsUCa3MRv6M+3rwKI5PihNUNrAU9dzigv3Xkks8xDggdKo3TJzMmJ6nRN840V6iWuHkP
	W/6b8T073fZBcMSvnQQZXhE3Ny0evFeOqBf95SMcpwQgNe98Ehj5ccKFOaPMrPOi0IReOIUV/Mk
	rId5RfDlzeemJqN9QZT9d2V+stAk0NrrRGB3e8/W3oCJig5IuBU7W137YBppTPTxKBq+JUaQEAr
	KrAHvQuXizk9bCurBMEU0UTNB999uo/aCwgEDCnZ83J1uZeud7AbZWFvtRLHvCEKBJ8yrsIcfEc
	V8Ep6xAchkfjUeoHR1u7oqmwdNA9mfKBs68hbVuNXyLHdncsgqh1uEA3+p6YMaG/9Jq4pkPIHwc
	P2uIXg==
X-Received: by 2002:a05:600c:a41:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a1680b9df0mr46578785e9.2.1791058036797;
        Sat, 03 Oct 2026 13:07:16 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm209114545e9.2.2026.10.03.13.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:07:15 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] the Topping M62's vendor controls, on the component framework
Date: Sun,  4 Oct 2026 01:07:13 +0500
Message-ID: <20261003200713.50742-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003184217.34671-1-mikhail.v.gavrilov@gmail.com>
References: <20261003184217.34671-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A correction to the Tested section: "other firmware" is wrong. The
card keeps its operating mode in the high byte of bcdDevice -- 01xx
Mobile, 02xx Live Streaming, 03xx Pro Audio -- so the second card's
1.45 is Mobile Mode, against Pro Audio Mode (3.27) on the first.

That also covers the one item the letter lists as not re-run for v8,
Mobile Mode without a UCM profile. The second card ran in Mobile Mode
throughout: its nine controls were created, it bound again in each of
the fifty reload cycles, its own knob reported to its own card after
the second suspend while the first card's knob left it alone before
and after, and its cable pull ended in a clean rebind.

Two items from the "Not tested" list have been run since, on the
first card, each time with all three of its snd-usb-audio interfaces
unbound and the control interface bound again:

  - with the HID driver left bound: the component bound again on the
    new card at once, all nineteen controls were back, and the
    headphone volume was as before the unbind;
  - with hid-topping unloaded first and loaded after the card had
    registered: both components bound at the load, and the nine
    controls appeared on the registered card. They start from the
    driver's defaults, the headphone volume at 0: the restorers act
    when the card appears, before these controls exist, so "alsactl
    restore" has to be run again, and it brings the saved values
    back.

No WARNING, BUG, KASAN, UBSAN, lockdep report or call trace in the
kernel log over these runs.

-- 
Thanks,
Mikhail.
