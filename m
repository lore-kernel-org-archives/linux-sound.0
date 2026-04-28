Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254A37BE60
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386956; cv=none; b=f2+ONgJz8bD+sbk6fNRacRSX0Ivyhn641dmq8+TpCO/lmhAPNky6s/88mhrtMUAUitjkRwMOQ9BXLuqoaEoz953orkFPr4AYheWMohNj4oBzt5vuyHcpi8AWj0v3i8DPiFJDon33VTKXrV1Jk8Tcre4JKKRoMJ/T78dSv5PT524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386956; c=relaxed/simple;
	bh=ULXCE/DINPDcPZJLLNwFuv60Sr/9WbWueODASFxRFj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su3v1Ofrt5yAAkm5aW9H3HaK1Fq+kMj7GWAnfHLYRINfcBOp/zIAmmcdFP0bUdvMQ8N+6LWZEXoQeGmtpBdZQNFqRpFeXcequUmrY9YkTp2fP36jyPwY/ZEP1wGst+Oyl8Mh7sW7VIcBy8hp1f6dfCkU+5eiVy9qiKJiqE4Sg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo8hxx2G; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo8hxx2G"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so4640907a12.2
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386953; x=1777991753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TbURgcn4892JYCU7p3QwlNvRYpU8IqpPWAeAR1LEww=;
        b=Wo8hxx2Gj120yzPFkAxlIC0CXNDdralwhXlub8ZqhrkeEXEdiLifNwDQp1kEQ3iGaf
         CfFzYZsIfZDY3BI16NJq06hfccfNVbUmM6p7FDndZgba5tJPYyYL3+o2/yfckI4kWwyR
         3LhYb7FqJfdKInpxOK1DFeHN73ZlgwI2Y+uZ5UhLaxvm4XtKOdHXUFr7Ce/AWt5pRSYy
         tEmS6RwMXyBiKhU9kNO8uQn8LgFYrQ5Ge7O1dMfVrgiBfBTrYv6VLspnp/VuxLwm1YNA
         zXEpZXZtbwjwMGXYEJrcfK1ktCTh5PNqm8G3IxUJ0jH8ZW1fK7Bhot1XRb5nQrBxrH44
         CCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386953; x=1777991753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TbURgcn4892JYCU7p3QwlNvRYpU8IqpPWAeAR1LEww=;
        b=gVEM1QIsd9QkYQf59E2MHUi1xbOviV/el2g1v+U/4+i+RGrFNQsVo1P/iiJKuHLbq4
         uMnAyXX2l4AFj1xH5oueLsmqWVoHWO2ay4LFKZwz5cPKsW+MVN109nPdLJUW+tNCDZBS
         tZVY311WasSuSKUykV4o47wtcWtjDboX/hmgeff0QrPtjMGXZSBBaucXlIYIglqMpIR/
         uciGok+tdz0cja8zuVkZPt61D+5b2u4VFUch3P5hEYe2J+tp6C9oVQMHgbGkVifr5wZ3
         nt6HsI8G4pW0+nMCy/oBPQBj1gGMA9K1rPqaNXGrVJdkvNZDMcqbK9UF4lucb+RnlSx+
         TQwg==
X-Forwarded-Encrypted: i=1; AFNElJ/KNMMS/tISkre0lCgRYhGt8N8FDz0aNA++hbTaNu0rLxBoyI4N9OPXslkhZ0sskqFOYLNy1MMqt87wlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/vFP+Fg0nNndKF2H+gP5LbdWaNbm2Vx9scWHH2hZV8u/37Wh
	crz7Fq2vBCqX1r1sw/wW+aRcz8ZAQiVzg/mu51OxLCPgPKohYGkYi4HqmAAMK9jfjqg=
X-Gm-Gg: AeBDievPTczpLDVwg7qkZusZFXmWqshmEOHhtqZEflbYYuoJsNLZqEQaH9170QGpXdU
	jL+dJNXUEtoutMUoTYV2rFCg2GGCD5ZNLpBeXXDrPrSb79JZ/9n4/Wscbl6Jy9/QmYuw+8BRBWj
	2ZJA8Hbs9nJlG9U+vuU/vOlPgLi1G4JOcoFaPY9PU6eKxTTkyFSl7yDlDuvkR0HvmOUkdecCu8i
	zsgGrGAc1bLJOcCde1p+B055G9bXoxQ2jpRLdJz/ieFDCe7e9jXeuuhW0drG8CXaRBVDfzdTQUt
	IrD5fbswbbz3Fn6B5Fq6okeSDngNAyioauboKwAvwjfkPWVckNeK4vSniVbQfM2FC6SPDnEv8nw
	NFqCwCf0W1ESGqJXoOdFFRuIyaj0MIrTYTFoSYmL6hLjQ8wJKG0G5Ch752A9db0i0JaipleQHDN
	JcDkGtiY2nXs+g1JCplLSKxZYJndlJew6VDPO+anhcL7eHNLOZ/oTcSrzt0Lxyu5Gk0SoRRY0Lu
	EARqgxUsaifGsci5gX3iZ+GS5HLEjIMCEL88vEaCSUOZSadc296WAz0O7/nSm0c
X-Received: by 2002:a05:6a20:e212:b0:39f:216:f400 with SMTP id adf61e73a8af0-3a39c078403mr4405658637.14.1777386952949;
        Tue, 28 Apr 2026 07:35:52 -0700 (PDT)
Received: from abhinav-victus.tailde2db8.ts.net ([2401:4900:8938:3da0:d553:4c7:c6e7:70ae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc33d8c29sm3689181a12.26.2026.04.28.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:35:52 -0700 (PDT)
From: Abhinav Mahadevan <abhi220204@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>
Subject: [PATCH v3] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
Date: Tue, 28 Apr 2026 20:03:38 +0530
Message-ID: <20260428143527.5453-1-abhi220204@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410143335.5974-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PreSonus AudioBox USB (0x194f:0x0301) only advertises S24_3LE
for both playback and capture interfaces. Add an explicit entry to
the quirks table to ensure correct format handling for this device.

Fixes: 099cce2b5 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>
---

v3: Update patch description to accurately reflect the change
(adding a quirks table entry, not fixing format negotiation).
Add Fixes tag referencing the original commit.

v2: Fix placement - entry was incorrectly inside a #if 0 disabled
block. Moved to after the #endif /* disabled */.

 sound/usb/quirks-table.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d..4e9cfff40 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2652,6 +2652,9 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+
+#endif /* disabled */
+
 {
 	/*
 	 * The AudioBox USB advertises S24_3LE as the only supported format
@@ -2700,7 +2703,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
-#endif /* disabled */
 
 {
 	/*
-- 
2.43.0

