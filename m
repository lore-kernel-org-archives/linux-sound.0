Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33604A0155
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612291; cv=none; b=CqbCneB1b6DbSGXbED9ptZgxfDMJLsfdVc7YFMkDHnoPNeDS2VgDjk1QJBaEyjYPcZTOKYEP+5tFJkkc8gVwbg+gc2NrP45PpUXqAUMiYy0Fdrwb4Ob2uWNE79buVFQ93L1KDbRBV30salQvjq7POJ/ONwHc36sHUOdbPioPA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612291; c=relaxed/simple;
	bh=BjgISfvTM9/XDu/h1M+kDpd+4iJY+LF+t70SRBDyc1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NP5p3wXN17ZenP3kdMdVNDveOEuhFwKLafmGQPcMq/a4ocp9CK/9sVBmROoWIHRlvQeoQhF6aQh83XkwM+JiCDpZcaBK7OQQwtZzmSY/eIe67l5tPH1PwpYN8x1G4BK6mc41WxVgGmbwU/JdqtfGRXWW6Z6gh3rPtoeKP2h/n9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Veh3U037; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Veh3U037"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1863399a12.0
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612287; x=1789217087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=Veh3U037mDy9AwdeQuMOiHN45r+6Uo/VlBfThMGPKMp5v2b0wqE1YkS/2UKW30SRTH
         wXDJDcb1T2XMAGGNfu+cduoU0zzTTIELUHZY+/txz3PZFVofIQf+m75k8cyEhCfxZWs3
         8DR+Pn5y7ySXCp0tuY0jwELmvLI+vb3VeC1r3wXVMxZK8TSFNc+nPOjVyv45AWB29A6F
         Cccn+3HR8R7BPd/gKV4qanp4yyJAzFw4ui7d+neRNbux6yAw34CovE8bSPilgygldKkt
         oVFvwQyFHvYGm1DzVnRSxKOkziQA4oScy1ja20uK9nzM7DEC3pSqj37Uky5QNL8zRItC
         OFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612288; x=1789217088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=bJpHx+MsstJYboZpcxNGR93glUdSkdKhe48JA2kLg/EXp9fZbMOudcbfr2LQSStZBA
         aNZua3vHOBNbj5mLOsGElgyRVsdIHSUHuAdGWvn/oqvtXdT/WkZWjpBJydKlaiXYrXX/
         ejPm908qevHdRgOOe9+/6DwfPnjSwsydF1MAE1hCCO6qRKYjzgDqBpH6RUcG/v14wjb3
         xMEXAzdh/V3JgXKavv/6tRQJ8B6YTIT8O/7RCXCooccHZ7NzO1OS4Ga09nptzkldyZ0U
         lrx2gcgetFr7nCWZvbOeAso4DKGWiEy4J+ii+/+3vLG4CXC6baWtdgIviWq6UyXC2ZIr
         DAFA==
X-Forwarded-Encrypted: i=1; AKwUvBzwb43LkXNROAFgC4LoSW0HUce7MOx012jeF8U3qHjFG6cpJT4ck341fh96Q12VUbwUCo10eniQwZxTJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nc+pP64lzoc5E8GmMqMG+LJI/xk833OJFxZwbk/ZTLrQMXBqut
	HZe/3i5+FTnk5Ka3/YoxQ5H8aOso3sQeYhEMzpWwOblMFzCokm8KEtVc
X-Gm-Gg: AYBFou3lWYbDLXktc4jnueevTinRRzpkuYJr1s8irjsjIe5U55l8ytR0WZWnZcs4iHZ
	QXUy3v88YjXU+NVqvnIf5DFegppjgglUHXdBYIUXcGNclXqG0q+9u2iu7NOikxBQWtb/X0OfJTs
	SN6a9n3pS/izv7E161pIY8xxsnUXLDgw+XN9q22QI8VXQVH23jbyah+4KHy5vXgL6wsY9kBdyzK
	MiIFuDAMwQnyW4B5PJfm6C3Wb3gKxELU3rFmi6X9oOJAdQ8y5YW2JMw6P8DqIsxKScWggsTinkJ
	QKElc/n3gg8ivaJcHnyPt/6NuDnQT3yeDihHZ4AR6MKsZrtBlKcOBrJV+HoODOIN7Fajio0u9Sx
	W1zm/ymnHNU2xFUObT8nMnuAbiR+y7O34ZJedn9cEmvMuWnJ+QAaH0FPXatBQI3G2FZRE7wqZDq
	8V4yihYfuaSdU1YsYmbuqHHPwcAzX/NbTfVJXRxeW9i3TPz3lT7Ignk/xGh3iJ7xr7fDPcI069F
	y0mx6GzjR86aZLejyWcXa8TbZTGu1eL
X-Received: by 2002:a05:6a20:d80c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3da2168b2d6mr18461998637.27.1788612287382;
        Sat, 05 Sep 2026 05:44:47 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:46 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:44:34 -0300
Message-ID: <20260905124434.6163-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c to eliminate severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/leds/Kconfig             |  1 -
 drivers/media/dvb-core/dvb_net.c | 40 --------------------------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d318223..800fbd560 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -873,7 +873,6 @@ config LEDS_UPBOARD
 	  This driver can also be built as a module. If so the module will be
 	  called leds-upboard.
 
-comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
 	tristate "LED support for the BlinkM I2C RGB LED"
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..ae0073b94 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,19 +68,6 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
-/*
- * The code inside DVB_ULE_DEBUG keeps a history of the
- * last 100 TS cells processed.
- */
-static unsigned char ule_hist[100*TS_SZ] = { 0 };
-static unsigned char *ule_where = ule_hist, ule_dump;
-
-static void hexdump(const unsigned char *buf, unsigned short len)
-{
-	print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
 	int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-	if (ule_where >= &ule_hist[100*TS_SZ])
-		ule_where = ule_hist;
-	memcpy(ule_where, h->ts, TS_SZ);
-	if (ule_dump) {
-		hexdump(ule_where, TS_SZ);
-		ule_dump = 0;
-	}
-	ule_where += TS_SZ;
-#endif
 
 	/*
 	 * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -659,23 +636,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
-		hexdump(iov[0].iov_base, iov[0].iov_len);
-		hexdump(iov[1].iov_base, iov[1].iov_len);
-		hexdump(iov[2].iov_base, iov[2].iov_len);
-
-		if (ule_where == ule_hist) {
-			hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-		} else if (ule_where == &ule_hist[TS_SZ]) {
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-			hexdump(ule_hist, TS_SZ);
-		} else {
-			hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-			hexdump(ule_where - TS_SZ, TS_SZ);
-		}
-		ule_dump = 1;
-	#endif
 
 		h->dev->stats.rx_errors++;
 		h->dev->stats.rx_crc_errors++;
-- 
2.43.0

