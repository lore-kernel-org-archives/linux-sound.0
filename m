Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A65D4A3D54
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613051; cv=none; b=AHEh8r/Nkqu2j9KjKvrMePuL0EPgZjymjaDxsO2ptAUNWKfm6bacKmZU7/L1ZuTI+y3Ah2K11vgV8EJ79jZ63aMt2SpoRAO4TaoluWOuKt+hlmoUnyZrxFQZufP39alHCswA4DcdfSVCukVvatcLTowcyIogOdmojnrDn3Vh2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613051; c=relaxed/simple;
	bh=0GbiNyL6PaCeFSnzxifaG0jpg42+buGimYKFRJQqiJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCUm6sznyw6IIAOruLHvwS/rcdoT+VX0rk+3UFa2sogoT/hpb86xSmb3knPr4THp0nWeR7kDmi/dSmKfyeuPtYNpA4R3Bd2U3zbzNLWmy1+04OfSLtBgxQ1ZiTnRChr/yLZTz+siU/fIVb0G+MPjKb7sM41RpDUoTOxn5VMJVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3oLJKZa; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3oLJKZa"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso1029146e0c.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613048; x=1789217848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiwxf8iLXv/0xdcKcz3UiNeEjss20ShbniaWoqOFMcg=;
        b=n3oLJKZaNXmFW6Yf2Cypg3MGiS2SsM328KySSP0gUAGCFp8qiyietkXsCCfYTj1hOA
         EuqFdMK1nntLl/8Kpeyzr5QV5Ov6Cncq1Jyn7k+GrVl6X/bDACbqr17tHfwTSFYD3he0
         WqggruOPZ4xYJz0wdut63nVeCvOlzi+QRkx+SXOe2hSt9KDiJIRrVf/HGhUkS65V2T8m
         JiSiflHBiD6AYGZCODOljRLwUQh+UpZxemZnWobR4F/os790afQhlalP97TsP0V68UWd
         /GmvwHP6Fw0Y9J32X6bX7XTfTVBWsebp/ISCrC0Q952ETaP0GpN018G6JgXLIMrAakQX
         tbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613048; x=1789217848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iiwxf8iLXv/0xdcKcz3UiNeEjss20ShbniaWoqOFMcg=;
        b=gBjMP5J6WM3Hsp2k+dRtRoQmQYkgq4cCefy1CKmW5U1p8bGTR3svONw2hhLC13KHAm
         mfkeAolbmt7UFlIQpsXcvMiOuxz6tOSRn6iHv+D4G6txuwMCpEzartC9dOwZlSrFusEF
         4p4hWIAuf9m9xn6JJ7pqyQNAGdCS6I1O1JLyiNYonSKqznA0CgP3fWCAbmLkst/VweZJ
         XDKsabR44OTy15SpP+5E1/T/VVc/OJOXI1sHV+VvAYfYBgJopDKGuxxmamipwHEM2IRg
         waZN2R8bjN17uNbvfbKXa6IuFTnCOMGUMadzA1kAa6tCKEyKd0WuAmvt34dvjiRwKUGD
         jVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbhb+0bAP2Eho9J6JSgGoxM9xe2QnjmrDBNUZgO/LtZ53uvfk7PFHGFK7QgoR/34Ihq2tFuSHM0HqdGw==@vger.kernel.org
X-Gm-Message-State: AFuF++nyle6lCgSQjSkrEqx96tPCjjVw+/v0/Fuq4zmeUo1YObDxoiSi
	shu3M7W7w2n9I8CjtBGXMJ+lv8KIMQxrsVKdiA10pNcnATU4jXVI9EmJ
X-Gm-Gg: AYBFou3D6EF99SPJ20W6HAxbsqNRHikdyuIyo4WYuultLcX8bSC7EtSPQ7jQQv1brxV
	jEJwmBSJwzULClu5QYNvhS5je3MSusQqYm/WABmbhnbo7QKkkPWEzBGSwkztIbqvt4c5773Z4WG
	Vqnkc17tck/ZkrtjMaAv5Z/WxKC/eFfnrH6x3/lhsqhclomGjDejz5Y6uScgf9KNKbsEka0GVyK
	cwePFOHNMXOJ7CDyxDbQi+EaxLfvfrRnVZFChHp7202M5ty8oRZZ+N56jdIFmw7xKGxtstEnm7l
	8eFRu92LsmAWxfhTth+3NPGXIDaaU/s/B0DZaavgjJ6da7ybB6EkuNdQQuFhtxiFAywjjisDMmD
	T8OidH7nmyMNFtdpo3zAfIBfebjF6298oag8i+toybLkceR+gnOvCdViX7FyiY7PqUwMa2SzyjZ
	ywtEeSav/DrsdIAD9kQSw84schM+xb6lj1aGoVQsP7qmaO5d2sRhMuH7T8EJAorG4fBtTFVkG7H
	j/adQWDc50yFcbVKqkHEi8uV8Z2FO4RHPTzAhWAh4o=
X-Received: by 2002:a05:6122:1d47:b0:5c4:1f03:a1fe with SMTP id 71dfb90a1353d-5c7ed298c90mr4817731e0c.1.1788613047695;
        Sat, 05 Sep 2026 05:57:27 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:27 -0700 (PDT)
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
Subject: [PATCH v8 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:57:06 -0300
Message-ID: <20260905125706.6550-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up unused function parameters.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 40 --------------------------------
 2 files changed, 51 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
 	  If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-	bool "Enable DVB net ULE packet debug messages"
-	depends on DVB_CORE
-	help
-	  Enable extra log messages meant to detect problems while
-	  handling DVB network ULE packet loss inside the Kernel.
-
-	  Should not be enabled on normal cases, as logs can
-	  be very verbose.
-
-	  If you are unsure about this, say N here.
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

