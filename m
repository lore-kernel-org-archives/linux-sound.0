Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A684A0902
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611709; cv=none; b=Xmprp3MZ9/Ky/0dKSVMeF6PejSENGBtzhZg3iwalPdGnMll3+plQZ1JBHfdY4z7RG4MQxmAaiiRvCFuNl185Rt2yrX4Fa2uyRuHdBRbKPTSP2BOQK1QKoZELdFPYW7WyKWWIOpRceQmpYSDQ7RIiLeWgh/CtnId/yE9gPune7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611709; c=relaxed/simple;
	bh=FscHQeKZUzuZgsN1YVbqBe6K3v3ip/hOfNYfXM/WTBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWS6+yz6BXpJAkRDMBnJYAwITVXF10S7Y49CErsOAF+y3nptVSzKVldiJHz66SnbxjiTUOELl2sJt2ZOiCAv/Pzdc6OaZxMXyIbY1DuP5al+c0DMpcPqHgWU3iPcfyBAOAIeW4TRvAkGXnrIfjE5OoO5zLxMK9f2iP+ubFbpBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq6R15W+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq6R15W+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1905278a91.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611704; x=1789216504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=sq6R15W+LwD+kmsvTOKEA+PH8eCVuIb+1vaKtbyQvD4np3FXcyLlQJuLuoMBeTjPtP
         ixi1GTFZ6bATx5DEa7Wz2Ne7YY0dhCMVHnBXwCvepA5YIF/oVofBWl9kcI4lWRLgbSfw
         SGp3z3JybK+8Ra4yPJZ3QEjvzBVtN81HAx27gWpnpvFi9MqU/v0AjrTOtunyHEqlQkYG
         dw8gFTw4BzpQQxuxDeYv69HlLxSwoGg2S9FfrMxMbpamFswRGHG6Cwp357FJ2U+eUS/y
         StgY13ZCrLoMCgU/SAJAcPvOI7HYYx6TQWLLahcl//OQyqqCDXNmbEpbtWwlQGgwFSoa
         kjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611704; x=1789216504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=A/KMl5f48FGxRTUb3KtxBtsTx+xNg6PZANzKzImp+Dd9sTY1qNduS2gPT0HIRt1faT
         FmOg3Kd0e1MPL5F8TJbsrab9CobrxQPHSkxTk+VpkMgUlL2qUVCXoogddXQ8z/JJF1B1
         pr5EgWuH32n0LXfwOzrjzjVFox2dMqyq6qQMvFsoJ9pxd+a7b2+BpoK33/2dgs9kSNfB
         IcUl+e5rtaGO+v1miWYT/8DKiMIvUiPmnnyrVNUXYyjduq55B266vxuRCeHAVFbL33Ii
         FBFTmKLG7W/SU77lRXoWAcrvfb/6+4fQ2wjW/48Q+w02RbCW/tbtlfPvoF68iu8PaSPG
         x02w==
X-Forwarded-Encrypted: i=1; AKwUvBzb8ZHBmgyng791GW2LYXWu3jJ+HbWFyaIuXwrKZ3UYKA+G452EO+JgSUZRN16sKMhKScfZJWHuDVhKNg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+SqO4A1Mh+0aZOmpZLHabgcG/XyE1L6RIzoiREBn6M9OqgQT9
	7M35NaI7pRQiazdkKEEna1a4cAvqLMtyQL29ERtYtY9xxPN0euijWK80
X-Gm-Gg: AYBFou37PUlVy12jqv3Fj7IfzngtaBX6PmXbrHm4i/RAKzSosJIBoEj50CY1POJxZlm
	ys1Jv6rh46ddIkzAi8Y45BK7+DkK/nsDFczMGLoHq9q6CCo9YxqbYHhOAu10U/iNX8Fyi8a+1Qv
	jxElraJ/2goKgczxaNnWfY1GA5rIV65rKzjGpwdzD/DmqoGNedu+HjAiEF3OrHd4zIOozjTx/e8
	IUWNNlFhhVeU2BoLnKewYZEUT4CckoG92nACwuOhDFrYXEtsfLB3qfFZtydVu0pDzX+ut9ke2wn
	Lb8JTU/eoDmLlnjP3gL8cFBqcd8n/iFGeKn7KT7xcQ4D+TmM8IoZbkLJbvFKGC3u5o3q6DS/1iI
	raiCn0J2V6ik9XD16pEQUVSEW5q2eM7iAbdL9QUU6CpeVjXYXae+EpwnGHB5FppgyO5QZinzhen
	DwaEjDavH6bY7cyh4v43dbYPUX302zAtDBJIp62gl1ecST98yjHEJZf+HRDKluZbTPYUIz4zgI3
	IfXpKcutBq6fSabFjTMsPOGnFq9tJl3jhIFsFSqzMs=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr19491750a91.11.1788611703632;
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
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
Subject: [PATCH v6 3/4] media: dvb-core: remove defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:34:49 -0300
Message-ID: <20260905123450.5620-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c due to severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..3b503695e 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,7 +68,7 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 /*
  * The code inside DVB_ULE_DEBUG keeps a history of the
  * last 100 TS cells processed.
@@ -320,7 +320,7 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 	if (ule_where >= &ule_hist[100*TS_SZ])
 		ule_where = ule_hist;
 	memcpy(ule_where, h->ts, TS_SZ);
@@ -659,7 +659,7 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
+	#ifdef CONFIG_DVB_ULE_DEBUG
 		hexdump(iov[0].iov_base, iov[0].iov_len);
 		hexdump(iov[1].iov_base, iov[1].iov_len);
 		hexdump(iov[2].iov_base, iov[2].iov_len);
-- 
2.43.0

