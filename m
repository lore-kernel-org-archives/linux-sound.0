Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6543DA5AC
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496330; cv=none; b=dTVww+sXVmOCr3RZLKj+DBHewlgAttsTuaMEVbkxl9C2duNAPBS+UQcLisRBarwakXM4tkW8iZok366E/D3mwjnQ8PiSsjPhCAx/YtkyY+Hhxx/qQtwhJlncA5OBjhB1LbQywLSg34I6OTlGThb3SUmOQprsPDCGCbFCGZzR6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496330; c=relaxed/simple;
	bh=7Fb7gRlK9+DQznhHXVa9Lj5oly00fA+a3//pDOX4BMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZ8nndsOLXiJUMQrMMzh31zBbHTPHQNmB7rOMPoLpo7SaemkV9cB/oBY5fQB12Pxe+FGdvgtAdHI7RnqzA6k2LBhZLwiBOJwc7yb88fzHKpUE3K0RZrvRJPv5uelxklM1xh1O/41rWsiW6Rdsj/TF+d9zy4N0KR3/BWHfJ4pnr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=0W5Mfm88; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="0W5Mfm88"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so7983795e9.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778496326; x=1779101126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM6sTJtkORo6AhXXjWIf/WzX0WlvY9Be6RoWfTLlcx0=;
        b=0W5Mfm88xDGAVbDI5YvvwQ/vpyv+XiG8Va+2kO9LFOGbvJ1RJ1gNLcuMp/bM524Xm/
         NJ9EdxAfemd7l5rG2pUv+RKGlYuUQNwjP/McZ0nCuggVOoXGVjXV6lPJuMBw0hunf+Ma
         qYNAq/g1bad+uB86ca+8xwkVmjJvWwIf9lAlAycCiZaugzRpqdSfO6RGYxJlJfh05kzc
         mAJeilPlCYyF6VFPuu1yjzQcX2KpFQ//1qIJWYC2t/nxV701HANAhghB0FHlp3I64ugA
         KDZ/idYaT8z09ZwTPZAfg55rvdVuL1ZgrFgysh5NxrJJkTabFUb6DF+zN6LN+5NVlH72
         W3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496326; x=1779101126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gM6sTJtkORo6AhXXjWIf/WzX0WlvY9Be6RoWfTLlcx0=;
        b=nvPM72qPI2WMp30QvjPLKvQDQKlIlDzyGWPIwnEtf60uufzJxlPtw4OqapEaF936hf
         5ApAnkF1E4OjY2PRdMIpDgVll162CcMsXbMaQ/dk2ZLwxaA71XKRIIbuYDNZRWvcm9JE
         FbcWoMZzR5POVtlVC/lttG/LU1wjAEXrgf3xCj+EL/VWeM5o6Cyizi9TXkCdM8zRLLMh
         y3x3F1eOnGjDDMLHMTqERMIMJ8zoH23Q2NmcC1odzBlkz55Vgcv5j60jmQOfh9okBxl/
         w34VI+klDlkgOF6jR+ciIEMcEBGBL1uFi+QCta+F2gmpP/pXxDy2IOEKoK706XO970Bt
         DTTw==
X-Forwarded-Encrypted: i=1; AFNElJ/3SWItNHGmspt6IgPzTDKeWlo8y6ckvjUl5GqRvUIyWUV8CFnuOTG+RC155l+4wE3MYhJvznSDM6EINg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKW0sS9bIlxzHyZr+phoBNtLq2kxOOaJJjYIBqJLdfWV5n3e4K
	zHS1pHf8RSF4kWEqohsqnapFf0F+InFLZbTLJNe6mDXOB0h1FkwDuwS+N0iipktYRQw=
X-Gm-Gg: Acq92OHpXZrpNkHYr++Bk89wa7g2ta9T0MyPKLkNMhFVnMAOY2VEHg/N1JwCAfca8dU
	sYcijkA75zQwBnqXchRTmfCnEAwQsFNiRKSUIG+1uLan5Qzt2OW6HA7O6O94fUjvbS7OVpYd6D8
	QOkPDuOTIVzcLoBY9zPWctHjedO8XkjwJX/pMns7sw/NLyWxsZ4BjcU+b1tDUd3V5StOqiynM9u
	HDp8/VH7uiwHjlVvjT8yRAtZQvMsTw6lSbre8ot3Dr3dTMST3uMVLwYOBShUISSTZGHYXACONFr
	GIH1355oYgUkDm31k4nqI2mFdMfXISlVCoPt43ikCT21867kKv5pxMpHRUAvcWsC1x9sOGVJJ35
	tk/wWuKu3tO+XCHpivDsGj2eewxXJGPLqOKffbCNPjKT1q2Nvaaonge1ZCMvTHsrY76brHZafWu
	3B8WKTnOxHjhmCgQjdkyiFtoIgdcqIB8GcZLmp8IT+8Xp+NwbxFyh6m9xJGsNdGW4PLa3Pzxyyv
	YYdY0B0eqGCpYCtH3qPNjKxLJ4wqaX97fZe
X-Received: by 2002:a05:600c:6290:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48e51f3fd58mr414101285e9.20.1778496325795;
        Mon, 11 May 2026 03:45:25 -0700 (PDT)
Received: from localhost (p200300f65f114e0841c796eda31a14b3.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:41c7:96ed:a31a:14b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e702e5630sm163631495e9.8.2026.05.11.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:45:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [PATCH v2 1/2] firewire: Simplify storing pointers in device id struct
Date: Mon, 11 May 2026 12:45:02 +0200
Message-ID:  <e5ba45a7e386461c0b1a5001635aa008b01c2164.1778494204.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
References: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7Fb7gRlK9+DQznhHXVa9Lj5oly00fA+a3//pDOX4BMM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqAbMv1GRmnyfPztMd4yCbTsXjR2mNz8M/CKkfv k4zoMx6GrWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagGzLwAKCRCPgPtYfRL+ ThftB/9oZr27bQL9JfJLRl4dli6fUh9iQBPVO1QP0cDtJf3navjMpohr/qc6ykBuvlx1iMQCqzZ 7WWnzntxofusFSilQ5iDYW1EatKxqbFvz8ZGsk5PsMQNwKFKHDXIeOSC67mnauk3voX1j7KSztS w9EefO3c+9UZ2wv719o6L38x0Xs+BNK2B/eNlKFd2JESFsyy42kxbEAF1/IJ5Rw7Qsj9x0fj+cw M8IWa7Al4bBg3uccx2l/NqQZ3td2MySR/mcr9vpPGXy+2yJaUUtx0Srfz+iU8Dc0KEosGpIOtff srCKNUUCslKktmLV8q3WuPFUriUKyaqBg0JK/W4qttUpfmG4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Technically it is fine (on all current Linux architectures) to store a
pointer in an unsigned long variable. However this needs explicit
casting which is an easy source for type mismatches.

By replacing the plain unsigned long .driver_data in struct
ieee1394_device_id by an anonymous union, most of the casting can be
dropped. There is still some implicit casting involved (between a void *
and a driver specific pointer type), but that's better than the approach
to store a pointer in an unsigned long variable as this doesn't lose the
information that the data being pointed to is const.

This also helps the porting effort to let Linux support CHERI where an
unsigned long is unsuitable to hold a pointer.

All users of struct ieee1394_device_id are initialized in a way that is
compatible with the new definition, so no adaptions are needed there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mod_devicetable.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 23ff24080dfd..3b0c9a251a2e 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -61,7 +61,10 @@ struct ieee1394_device_id {
 	__u32 model_id;
 	__u32 specifier_id;
 	__u32 version;
-	kernel_ulong_t driver_data;
+	union {
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };
 
 
-- 
2.47.3

