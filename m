Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD94A483B
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594552; cv=none; b=UmKFHtkEitgY7ItfsDzjVnDQFPsknWmrxlSQkkxpqQi7Zg2Yi0JB1dXIWCMQdnwM1lPBqSiRzzdEzpwZXKrwDY+G04NV0YY9xcocYKhi0nvm7GoUC7mHeZAsqJHk8mHgXo5DdpJN6/0JLYvQWcbeki1jimrzG4T3CaCzwcTSZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594552; c=relaxed/simple;
	bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiqLJwZoBdFyCbMcejJZEvn+8+/rpDU2PEz3pQ89ZtwVK9G21za71SASpPtk3yg3XrT2VI2eMOi71xz0hDnn/nEoto0kDLkw4xVNokNRabxMuWqBkylgsfd5xHpX+5tVjZqa6paSyXvo9e3Bau/ey1K4HgnwkOoGPFUB2kjCXtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB6Sqw7/; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB6Sqw7/"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3427977d677so227603eec.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594547; x=1791199347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
        b=VB6Sqw7/Z8GTAJ4kFlLJPwzaUQU0aEfmiFRiB8Fd1HtHmAZWNQHTzJEOFHS1A3fFfz
         0XkA5w0i3P/oigOeczsctzo+3eRrYpfe0RyBekSt7JmbpLyylp6UnYzfFap0N+2mn90/
         7uDf71wCAvXjLFxSpt1JKUbgQ5GJ1Ejy81ztIDkJEhTFKgKZDI47wlXJHVpf8onPIHaG
         74sXtp0BzOOXT50F/yMwMMissMNgagu8fJmEVpFSm9xWCrvu7W8QPyUp7ycb3LB4UyKz
         Afi37QxraaYdQr1B22WR9nP2G9VTYU8pB68FRDLPFOhKCfly/45MZnfFhXkTvPzsIR+R
         hD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594547; x=1791199347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
        b=1iNJIohUaKe37CB8ENgVSU8QIf3H6W3/zBTcnop5k1F5eDJiicENqoHP3V1zJMaDeC
         686mxIXttxgknwMgDyWHx9cEGVbs8iobCGlMTuGTVfLw3yVA0OQ50ytigUQwoOCxHI4c
         +QJ6iHiwUSvrGX44ifwHeEUjAW3uTBYovTLfiU+BtY6YgurO5mKBD41TlNgqVdhvEVdC
         +2dFUa9uDCjhuLXElnXRq1wudy77n2wZJcfaULb7S4ZYLlr8qxWJBt8s8/dm0fyxlGaf
         4D3zmcsjQAJcysVKoRLYcDt6A7AzmByjv5Yuk6IcyABhd+p9oJqXRdO1lrkAw3Z/VTNp
         KCJg==
X-Forwarded-Encrypted: i=1; AKwUvBzIia28pvwTEXLVbwQwf0ylhvTLaWzDm1zx2uhecEJLnCsavQr3JnZ26Kd19ukkr9NPDsKQvcT5cytM+w==@vger.kernel.org
X-Gm-Message-State: AFuF++lZMp0DMgQuCRPDFukb/WMnud47PzOm5kMiPcpTWqTY/x/hemfD
	YEPI9M5wqe+SH8fV7NquHeFMFsatWACz50RTH1JEzav3hmhErAXUSewi
X-Gm-Gg: AYBFou2JVRmMJ0vzhcvW5fYNqgbTXn3tw84nbsV84wGr7kDczZ6Ue5hShHfELEtMZzG
	6oc8fSFaxWr6YC+v2+CtNxwTkApxYByedWhWa6dRdsPudmzX6437N2klyu0zj6HWDlkr69Z8w1e
	7B1D7TxNTLMskZ1UvwZRKrJO9is/MppT3pNePQPKNlNaVHN+4/vI+XkKv5P+bYBJHd9dziGHUX0
	NrG4LCqNbqoGcQ3ZNLALMZZ/sqvnbJx66Bey3ZM/tDHYNpANzdlwFuqTfxds3PsrGCG9A7IcfKx
	I9uH50djhypI62wd5Ogy1e2lK+ZltW+uAnhMfmli71dM9TwiwUWAT4duWOZhk9Kn1WEye3iZ4/X
	UO1MwtyXhQCtlsyTdbEF/oxHLnGGj+BtuUntZ2TH9Ac4YSfm6YRwA/Y0O2zZVXy5pPvCr4n3b+Y
	UenHtmCSPJ4pS1fn1NiEc27jfRTl4SlsUe0u+OsUKZM4jEuoHTQJ8iJOepeEchR0ySjpWHp/l5g
	B4H1Xjs0PKy0WMP9IdjkygKWI0+uAMzMv5WswWmH/qTB8VbJe2W6hG+XlxjLThfmsBSxscbr7xe
	p7u9cqWE32XjPPtmHsY=
X-Received: by 2002:a05:7022:29c:20b0:12d:c389:ae54 with SMTP id a92af1059eb24-146cfdd1a65mr15123488c88.2.1790594546278;
        Mon, 28 Sep 2026 04:22:26 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm20689853c88.17.2026.09.28.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:22:25 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
Date: Mon, 28 Sep 2026 16:52:19 +0530
Message-ID: <20260928112219.713777-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87jyo57ifo.wl-tiwai@suse.de>
References: <20260914000308.108995-1-navonjohnlukose@gmail.com> <87jyo57ifo.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 12:56:43 +0200, Takashi Iwai wrote:
> The actual patch is missing?

Hi Takashi,

There is no patch, sorry for the confusion. This was a report about
the cs35l56 documentation rather than a code change, and I should have
made that clearer in the subject. Richard replied in this thread and
will reword the doc text.

Thanks,
Navon
