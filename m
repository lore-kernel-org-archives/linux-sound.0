Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0730AABE
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776580965; cv=none; b=GDAFY2DLlXpxQk3Kigv9Id/KiuAaNsXx5BViNQznxR5hZRh0tLHS296vF4OcI7N08r66wYY93heHSx/0WWYveOAC4F1NbaX6TDJqtSTX//OCFWPKfD5tBs4xNZyKXYC31lTYd/JhueQlAm5ZAvXGNFIf0CPZxqgXWDUomhw8dak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776580965; c=relaxed/simple;
	bh=JpnIAJKaBTOF2aIBi2ey6Mhdvkg5IjmjGwHSvXOSr/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/juOTDQcVuAH6dWU1POexNBhQNGKiLO/uf/mFhNoWWCSXIKw3iJQTO9i31ShoCV0X3/YK26Vv6GZseZVm47DVTjXUmG+L4soq+pQ+yEv6j30cvxTycRAHvNSjfFIb41on1cFEMfAWnbGRQC/6EJE0XDDBF94538F5EQh76PQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rxyFPK8C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rxyFPK8C"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so14457065e9.0
        for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776580962; x=1777185762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT4/6AZ3YhKrXxiWSOdiimOrp+DlB6MtaXqeF/OJAwg=;
        b=rxyFPK8CnvVlNgkdaYz4oPOEpRNKbz7Br2VbIKkG8v6IW+A4LTMJP7uW5Ov4UggS55
         4ZjQaZFI7pbQaQMLWv1/3MphtjSsLZQUSXJOF1wuXnZez5NwVchFINtEhZ3qIcZUgx5g
         KpMdiKq1rooKB8YWN+rK3zUHZVvQuTSelIybDcWBWAvyFz+KJV9uKIsO9KkWwQ1HBXDE
         zs89rff18Zx8ucpsblfnovFV2tReWV0ha+NnASVBQm7Fwdz6saUXRTXcX0Z6Dj4kAuyE
         6g2szN7AOXGMdzmsoJh1qTRw8IG0KEcyfBIhTJDceFyfmYa5dSPSs42kzqYrwo4iJkCZ
         b7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776580962; x=1777185762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AT4/6AZ3YhKrXxiWSOdiimOrp+DlB6MtaXqeF/OJAwg=;
        b=H8w1rnIrviZ01scLJ0px30pF0Lm0GG/UWKVnQhdF1CDB0xiszTUfoi8ryzhoz+9/zz
         5925fE8bQHa10cvUZk1xPtgVFgD9PQdSHD7hsBgS1L4U6UfzR5UCgmoeqqFCsJMDRkAv
         bo6/Fj8iAiulDi+SBVRM3YUXTSbtDwcU1kwE9RLdMo7z3+TU1qe7mPDdLQ2TPmdh8rVN
         +1GoE4f8kQ8N+ueSPROCG/bt+Bg3tjlCS+nbgzNegj1ptlMgLeaxGemUQRkHKRr01BqF
         gmfcJuptUtREx3YummI2LaukNfrG3Ik+5N3qNLNPwIfMJogG0wm2Eka91e/iB3kZS8YU
         Lsng==
X-Forwarded-Encrypted: i=1; AFNElJ8x+xPlywBFRI7ssL4o6BQNLK17FoJs1gEOYxigmG9mZsIoWvce8sWg8B9Btmb479hna8lBbe0+NXTZRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSWEsm9xUb9t6Nd1BgrJgrhQNc3kR64yaeVYfmQ+acZP/81RK
	5TqvGUZwfZ3d7Qp9kcRcjHAesHwfUzDjbFBLWa/+tXkOes46vusEOgIkWiuBnXj3RVU=
X-Gm-Gg: AeBDieu7/JXuLMeGGnjg8rz61T97jenTYWjgyb1UoBJIU45yaCuYt2XCemFQNm5/QP4
	bpFplkUj7Q/hxDmlQMBRD968ue2qfO35L8IP2knDMAvbkGFjU6Mq/qse5GAHBs0KKRYvq2TRX1E
	3naP7Z4O4d+nKckiNGPTFGb34c+6p50PXhvUbTEdIPB/dTCa5e3hT17dLYNA77h95ZmLHA/29cE
	YS17yl6COPaZwIffaoGwvQtdT4/FgmWXKBsW9b6vNDJ4XRKTDFKNuqf8DLU0D0aHjndhY641Dak
	QUDpLfxQuw1klSVrpw7rFQJ5f9e1I60HNkOxBBSX5ewTTAtBgtZxOWvfOpQ80XA1vhDoqWYd4eE
	6b+syErAHVhbllfSuuzjH4h1Urw9YnnSekzBBpbDvFDwoIcf7cKcXAZH0ZHw1mFBK6/ETJa3Hoj
	1nSYZbpQRBVVLtJoWRTONB1XvTeRwHPCfzpd2N3C8=
X-Received: by 2002:a05:600c:628b:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-488fb8afffcmr122841645e9.9.1776580962069;
        Sat, 18 Apr 2026 23:42:42 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fb72d365sm87244615e9.1.2026.04.18.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 23:42:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] firewire: Simplify storing pointers in device id struct
Date: Sun, 19 Apr 2026 08:42:13 +0200
Message-ID:  <9a94a6d8977f9595bc374931f0e53e68a884b4b2.1776579304.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JpnIAJKaBTOF2aIBi2ey6Mhdvkg5IjmjGwHSvXOSr/w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhswnld7JbyYKXyrJNPhm9eySTs/MdXNefrdODYhz2aghK t85S8muk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJRGzkYFhS4hMkoG7/5XWq oeXy35/qjcR5v15tyVbhdsz+pM6565Nbz6fCtze1T9ZFvHg95xf3I4aZ7i9Wbdu8iZP/48GAbcV X4vacijFLO3mgtElt09JmfXsv/WWydR4P897V/CpxlLXKjfwm9fvS7iextdrXwysufU5V3rxHfc Nb51N8Dlu9nSISk15Nv8QY/sLSZqp+e5yOWaWRxy+tCXbWrWvV/KuD5tkuzchrfPgrZOmc5hyh+ PMyfWyFx6/YXmLetUOLK+6ufNKamSnW6gd6+rw/LGmsKsy0fLnF3tyhvKaw3XDLLEOFd1VbtU/t vLHNfnOY2/pT0kHv1ItVJnT0Mmdu6nkk/nbW5r/TeeOrAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

On all current Linux architectures sizeof(long) == sizeof(void *) and
this is used a lot through the kernel. For example it enables the usual
practice to store pointers in ieee1394_device_id's .driver_data member.

This works fine, but involves casting and thus isn't type-safe.
Additionally with the CHERI architecture extension there are machines
with sizeof(void *) > sizeof(long) for with the traditional approach of
storing a pointer in .driver_data doesn't work.

By replacing the plain unsigned long .driver_data by an anonymous union,
most of the casting can be dropped and it yields a working solution for
CHERI.

All users of struct ieee1394_device_id are initialized in a way that is
compatible with the new definition, so no adaptions are needed there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mod_devicetable.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b1725fe9707..2ee6b66ca9a2 100644
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

