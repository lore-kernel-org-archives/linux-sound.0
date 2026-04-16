Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416932D452
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366718; cv=none; b=onACggC27i6fLdI/99enfyE8n8UClR2uDc62JEUE9e3qHra9VPwCJdZFOArFs5GuQylTdi0Hrj0ZbTI0gS+dP+6EivsSCZvXXlbjwhRdiw/YZbkoAsWXm1hChyYK3E25V73XSAsstVEc8evSdbStYsrIp3W1MJwrpByd1AxBiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366718; c=relaxed/simple;
	bh=ZooAt7p6jPntW1YbeP2aqO8rsXxoS/oUytCS7sk08aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mj6H4SWzsKfjV7wBRE67yxkiFb4Hp2pxzPg1Fy08dOnvAxsqIPHk/cJolXrtQFC2PgTrtjERKPE7FS+KUQvG3mCJ2+Q4xc+th6I/afo2lsY2FHREAGAAmkwnqmOizS7grwX1F2lbA9NGhQVT6V9S847wNYRvBjU9ZN5MpZrwntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7rZLkHK; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7rZLkHK"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95697b46831so2195917241.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776366716; x=1776971516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei8DlWRj/5LvEuu82gy17xwjpCba51gok+pto1yd8aA=;
        b=e7rZLkHKnWGHVsSbX25ej252qAnw2sLwQmgtCKpSZ0tKcx/ZNH3cKZV0kcS/ppErqi
         1GNUML1B3JAp7x0qntFFpdLbP36xac3hwfOyqT+WYYe1Enq19iLI9yaTvRZC89WPQVjg
         kz1EL+c1ut5I5dv5MtZl0ZfP1wJLwnvjexUApt2OvHasrq81JZ5qayddKcP0Q6shfkZV
         ThO2+IOz6OF+d9KU4jr++FRggqBdxx0PPPb1TmCUrZQbMZ0MJpnACetFCelsbXjgcAr0
         uRC7ff1VyrQBk+4oRo6sgyz54mhhIZx6i7Cvb3uTO9Ok37WZgY5Rehm1ML5ANoryiJ90
         g2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776366716; x=1776971516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei8DlWRj/5LvEuu82gy17xwjpCba51gok+pto1yd8aA=;
        b=rUJfORKdXBDXIMgbTqSX4QyYmryRhFgMe6E2LHwcPplEeF50vsWKuuxgEafKf6Nk1R
         NwrPgD6GCwP3Il0f7Ml4Buy6LsH81LD3RGzcTZWSNin5P1cXJomoYp1IO4c7QsQQ0gSK
         DnCdq/I/fgC+qVVQshnBJrsp4Qc7lzfK3VCCyjfIM7OERGFrXbDtFlFDeBXceDDIdIBG
         tKIjxAPBMG0B8prF6QuXHKmX+oJgVodQ8hulb4Ov0UvzHDLeO3ihDMSiaRIEoTFfGn5i
         An7ixZ2iMXym3c3me7EyrqbwTTs0QQUxtR2sFzfJHzduIXocQwpTw8OOTU0TKTDdUG1J
         IanA==
X-Forwarded-Encrypted: i=1; AFNElJ83Csm7UQsRSUHFo0fT4nGHzJnLzSz61UZWOWbi9td/I6CQzYcd/+vci4ho1ejkKCKw8HGPL3mkZL8lQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcuR509Xk0afkSJim+8AamFUNevvjisQis02Lbp8SLUjJeUohs
	JY3CI483hiKtEfbt71cRqRmBRmL7wbLoq+KcW05wtQ+ZpKRs4NDNXP5MVdsvtsky
X-Gm-Gg: AeBDietG1TStCPCZnXhyVDEtZEin2pDRO6rtzcURYZj6Ot67ARJyo/l8WCjNjuIlDLb
	IKuyoXnm6e7dBa/B3D0S1fDFhf23k3tq2mk0K7u5hJYj+2zc/iEacQ5qvgIq3VrQtMSrdkja3Jd
	Zu8x59umnJQoIhhLLKyS3Hh+NxRO9yHUhNH97F7h+9OKsnUT6oWk4soGszGZNp1NHLMZxa6tK4e
	L5Bxtvuf9Zzu1/MEHdr0h+2xUbaCeBPdJkxkHbUnN0AofZycL1XlQPXmvrwYAbUf8M1UixVr4sN
	U1ZiUwhyanI1sl1PIUfRSBuTfQhqkZgIwHiUS19dmGEdba5lNgly8HneFurfYuniZM/hGxnqD6P
	QW3LKDvJxziPbVn9WvDTP6BrRXoAymjiTvKBhAYhwVPLVsx3Bngf4LrtDvjQnh8Wl8sKpGY9ZFG
	bwIJoufkf2i+cEKjAFxY3IOFg8dcE9n1TgHgsz90U=
X-Received: by 2002:a05:6102:4a89:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-616cafd45d6mr305957137.4.1776366716109;
        Thu, 16 Apr 2026 12:11:56 -0700 (PDT)
Received: from MSI ([2803:c600:d219:caa8:ca92:d824:5198:4486])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-616638ef7c1sm537219137.0.2026.04.16.12.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:11:55 -0700 (PDT)
From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Subject: [PATCH v3] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
Date: Thu, 16 Apr 2026 15:11:49 -0400
Message-ID: <20260416191149.12088-1-jpfuentealbabizama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add quirk entry for SmartlinkTechnology M01 USB microphone to enable the standard mixer interface.

Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
---
 sound/usb/quirks-table.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d77b..283135d880db 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3772,6 +3772,18 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * SmartlinkTechnology M01
+	 * USB audio device that needs standard mixer quirk
+	 */
+	USB_DEVICE(0x301a, 0x159b),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "SmartlinkTechnology",
+		.product_name = "M01",
+		QUIRK_DATA_STANDARD_MIXER(QUIRK_ANY_INTERFACE)
+	}
+},
 #define QUIRK_RME_DIGIFACE(pid) \
 { \
 	/* Only claim interface 0 */ \
-- 
2.53.0

