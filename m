Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FF21C167
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759153080; cv=none; b=UT7i/ZwhXOHOAyQo3ztFSDjaecbeznJs3GDlVJJqXVrWn9P9PpyRW2fsFyyCpZ0R1u2hrJW5UYh5j4jYkscNsyU/JbUgvwXpPKsCwtN+1FR1vsI9Xx6lMOp1uJLmr3kcl/+DfT92m1nC299omrk0gJAIIXwwgWVF2Hl/rYCqn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759153080; c=relaxed/simple;
	bh=FY1LjOpDLpksUSLmXGZUKzGIe9ouVn1mPmzbxhAS2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0loptWupNQCx38nzEOFwPjJYZEhSL6KsWtgTVqoBWJOatcPqlvZFrKAqE8WwpDw0km2yE9iYUJT342sAkHT0qMyA4aw3SR0T50KQ+q4jlIGVZxLY4Fq7ALSqjEYhM7ZbkQFXVVVbeS7w3Fpm2b27Vzk6G9sCiuEQv9zgqM9uGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzKy2w11; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzKy2w11"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-26e68904f0eso46084465ad.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759153078; x=1759757878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXzHidEDJyzmTDhhwCWrD5gyTm2wXdwOJ8l86bMR2yA=;
        b=EzKy2w11DZBdf8gqS0groFj2FauR0sR2+6P/SoYDYidj7ka533uWVnRkpPiw/+hRud
         Tb8YCbjJepoyFXxLnvJX3l61lIu4S0LTDo0xyJzSdMRZrAk60cZjsze+6rNt2cXszcfy
         7qL+MDIz782x7YoKkJpDabKOYqKFUQwhJPD9jf7t5+CzONCzGjBUcq/orD21y77npJ2l
         GqrQJls38pd00U0fIQeaywmok3HLzRkZQjOGsl79JKqJAop5h2ZtWNg+8Aa4eSUHmb08
         nwRvD55pQMxLVSL8Kb3IIpwKlAYdyvXF/8FyPhLEpTjarVtPvNJnx5Ymri5FpkSS71Zj
         6ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759153078; x=1759757878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXzHidEDJyzmTDhhwCWrD5gyTm2wXdwOJ8l86bMR2yA=;
        b=bHDapeJylJNm9YM9Iq0+UkqDrbl1+ezMoy7qo0Wq3QNuFv39pU9I02ps/oNiLrFldX
         lZoLsZxlS9BNQG7go/hnyEbFxAW1ghMtecSilJ/hgbURjch8wob+Zwe+mr8Bp41PhmCQ
         bEpSyAen1pFHSyPg8unLmXOU1FWk2/2PLuzCy/l2Ra0W2Fim3SQFaUjBTaGTf9kObvb7
         EPua30zAEUcb0wUL4BFIdWXcSxd13VZHMeKVS0tK3/ZIjMGHgq/oAyYfMZYB7u4THARV
         UaPKRSU+20UuboZe+SiEOBxB19sO5BCSFWxDC1d1BZ9HcDf6nsLn27p7YmXB15py1Bbb
         BGBQ==
X-Gm-Message-State: AOJu0YzlUV08I0fwpnqE+zP2LdB5WAUBBAuwSMS9iuKJ1RLxzRxTCz8c
	vWjT4RHd+ORBgcwZi5j2eQwk185Vo1P1F5U4EQk/izTLyqufzqtM8DgN
X-Gm-Gg: ASbGncswIxF1qwMB/u/3t5NNqPgr55thN13N2DtSR1CLxWF39o7VLz5VaEr+MktTXxp
	4nQupL3VpHIiNU9P1raZLTQYYCoyyc8dBMJv1LOKGh8tGhOCRX2SJdZXi/oAWT7U7PIlAMkOlTn
	h3zuSlMBQTyX3ZznaTTayf3KYoMps4BHHFcT8aCWPvbMUbYZ52lB+cz+/o2vDdOynJuzrtk253p
	bUtJDtR6NUy6Vi6nOJQcEr+jiuvuVW3c2C1QCwTXaMHJXBiCvpYf8w8H0RKKjFJtX7UWouFNqE1
	LBFNG8TpSpYYz/XxU/PiJ4xNdGuUIGfZ9TH0+J+YsK+Qx1ogA768ODhsy5x/h2itUtP1aehC81U
	T0OpJ8plzR+G6Qg1xvGLIb+UddGcj
X-Google-Smtp-Source: AGHT+IH4R/GxdVbMosbKSLCpbqs8Cb8AEuNL0zYMxkhHdazFExlSy3pz64QZN8YVF5/yYX8seCi2Iw==
X-Received: by 2002:a17:903:3c6f:b0:286:d3c5:4d11 with SMTP id d9443c01a7336-286d3c554b6mr71165805ad.17.1759153077780;
        Mon, 29 Sep 2025 06:37:57 -0700 (PDT)
Received: from y740.local ([2401:4900:1f30:25ff:36cb:10ee:ba03:839f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm133290095ad.49.2025.09.29.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:37:57 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	zhujun2@cmss.chinamobile.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC]sound:usb:mixer.c: Solving 'Generic AB13X USB Audio' Unlikely volume range.
Date: Mon, 29 Sep 2025 19:07:52 +0530
Message-ID: <20250929133752.31847-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Maintainers,
I am using a generic "boat" make earphones, which are too loud across
different systems with eg: iOS, macOS, Debian Linux. And hence I believe
the issue is not with a driver but the headphones.

After connecting this device to laptop I get the following in dmesg logs:
	usb 1-5: New USB device found, idVendor=001f, idProduct=0b21, bcdDevice= 1.00
	usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
	usb 1-5: Product: AB13X USB Audio
	usb 1-5: Manufacturer: Generic
	usb 1-5: SerialNumber: 20210726905926
	usb 1-5: Warning! Unlikely big volume range (=11520), cval->res is probably wrong.
	usb 1-5: [2] FU [PCM Playback Volume] ch = 2, val = -11520/0/1
	usb 1-5: Warning! Unlikely big volume range (=8191), cval->res is probably wrong.
	usb 1-5: [5] FU [Mic Capture Volume] ch = 1, val = 0/8191/1

By using pavucontrol, I am able to get fair sound, after reducing 17dB in
Analog Stereo Output and reducing 6dB in Digital Stereo Output.

I believe this issue could be solved by adding a quirk patch to
sound/usb/mixer.c:1096 (/* volume control quriks */).


BR,
Sidharth Seela
