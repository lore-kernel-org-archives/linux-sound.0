Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C45C37754C
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525772; cv=none; b=a5k5WfrbTCcACNh6O17cwjHCHyWntLQBrPWpCjfKBrsjd/q/nwdpC5iBPgX3m8t75C3uU86uj+smXL80KzcZBERqUSPDGJogpvYJlrO1YVSEvqUbuoi5yXuR3LBuu0JiAHNP6362XAYH7n5OBHbB3oPPePzgbnvU2ANL+zVYQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525772; c=relaxed/simple;
	bh=nRXNGykhLfmcHCVV6o6XfqPpXRSfXmZFi7l+ShOgYco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HAEv9Kl5IUbQGhKv1IfX6FSivQ31wBSGrQra3l2f377HlU2GTz6k+sNMtjOLdzBFpdNn5InG9hTh9Hgq8/yEpUZcMQPpciisLrTA1Ecvpff4jU1XwF5zPax2srdqnOBOC+marvjZ2oLEyb5NnuowxXshjbBR/Tb1X52/ZmDXbBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjiIPuoM; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjiIPuoM"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28db31b89so593458b6e.1
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525770; x=1789130570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIenrDssYdUv0CKVLSoED7EnLzPHwTQHler0UZnQAmg=;
        b=CjiIPuoM3kw3JyEQIEyEGGNT40sz2lVLZu8aLcnkTSPU5ghffwgQdjdO7iClIFBz5q
         o9baJsgtHKh0aTWH1yQMM4/wc7NvlfRhBX1P44l+OChGcUN4qNIcJzeCspNz3wQi7mBj
         H/rx/8tFHFWCxbor3YVGHzpbrmkonSUBVX5OSffiU2NVw06Ji/nbotm06xylHpwh38Bm
         R+lAh6Y00B8Tm2g0pza+ydqb2j0iYivh3s+DRoc0gsjtj9OEB3x7a4+yoci6yfMPpSZX
         9Eda3Fhzq0V3697aKeMtUfOdZsOrx6K2NlpsnlE1IpDa5QJP3/DcA363EpyGlMIp8oUH
         8g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525770; x=1789130570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIenrDssYdUv0CKVLSoED7EnLzPHwTQHler0UZnQAmg=;
        b=PUuTro/ds2dm8nlM5PcYpv8kcQ5SoNGFFfqsHUX3Y8KQluznJZEBPsZR97kRh+PZTM
         dzMz3yuyapQC3sOBVMjo750zZwRyb4SQuz9JdS1w+JgsARg9r9UqDU4kOdTTOMPgdP6T
         wkDQ2IxQFHy5ORTlUOIkr6oZ8vfEbuW/Kslug5OLv/uw5YVKG7B5XcSMfcpo2Uk7LRaT
         0Uh89N+FK4uq8hxlqTnmS8HNhLK8r5Wr4P6AO/9JgbR2IPrFbrdy+LHIVGN4HukbwJpm
         XEmcluQZRs4ZZGde/IHHxjG9Af7e3YJUr2my/l/8wofeMz3M3xfkHd9ZpRM/F7EaiZ9m
         h6WA==
X-Forwarded-Encrypted: i=1; AKwUvByLNb8XKUgnNgLqbr4zHKm4lCe+G9g6kYPx3d/O3smpKc5l/yRxR1VZh4StxevexfHAKHJDHD0/gpxX+w==@vger.kernel.org
X-Gm-Message-State: AFuF++k2jYuV9Cc2UOARdrgziEemEHaFJ2hlPFgwIzDBzgd932hctAbR
	Wb5boCfy3HPnqC/WH65rFXCKJ1dxdac/dWolmTtUd5374ukw42YjprGE
X-Gm-Gg: AYBFou0UFP5mXO/0rM1fnLfL2HFXzu2dAdHg+Oqnl4kEW3NcGjKH42icHWoaUDQRzt1
	VsrOFj8XMoJWgpsp/vP1OC8Ac9Koe0OWFT3M1MNWYpizOfK6WPHghNp1h2FsQl+oFILEeeWvFkS
	/XrvOP871lOfsVd3bLY4pQozUbtCeN1A5EfdtiDiOb1AXx/hYJEazpDuDtddFVLYIBZXrPQHbtj
	5BDWR8Wls/55u1adM5UvDYJDJMMbkKb9Km1cC7ZgJl/V9hqVwPpO0/4W1HZBsXbfTAnRnT9ATzu
	z0wKIbeixgiU7YitUX46Yy+15DtL1Q/4Ikyln7VbJTvc+Z54PvQgVmJcVZqwXBmyMjrjF0iismX
	RcbTBA3Z1/CNFcfiQFVS9DZfvPmK2wQhM/ShTlp3yV3113LtnkJ3akBrYMrAIzVEKDFbBN6uxEy
	MUujRwbJ7p70BGcjsBylfFEwdaqXZ1ye4z6n1O/77CIZldgwkMOb2In2QeeDjp8pv+vB24pykY5
	wwlpZyoxgBB0T9woRmVdhYk9w==
X-Received: by 2002:a05:6820:4c8c:b0:6b7:83d6:293a with SMTP id 006d021491bc7-6b783d632bfmr1441341eaf.61.1788525770203;
        Fri, 04 Sep 2026 05:42:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243e6ed1sm6378020c88.12.2026.09.04.05.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:42:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] slimbus: fix typos in comments
Date: Fri,  4 Sep 2026 18:12:44 +0530
Message-ID: <20260904124245.5448-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/slimbus/slimbus.h | 2 +-
 include/linux/slimbus.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..3a03993c3ac8 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -325,7 +325,7 @@ enum slim_transport_protocol {
  * @prot: Transport protocol used in this stream
  * @rate: Data rate of samples *
  * @bps: bits per sample
- * @ratem: rate multipler which is super frame rate/data rate
+ * @ratem: rate multiplier which is super frame rate/data rate
  * @num_ports: number of ports
  * @ports: pointer to instance of ports
  * @node: list head for stream associated with slim device.
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index ca6f1da4bdf3..1a2d3aa0e033 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -98,7 +98,7 @@ struct slim_driver {
  * @start_offset: Specifies starting offset in information/value element map
  * @rbuf: buffer to read the values
  * @wbuf: buffer to write
- * @num_bytes: upto 16. This ensures that the message will fit the slicesize
+ * @num_bytes: up to 16. This ensures that the message will fit the slicesize
  *		per SLIMbus spec
  * @comp: completion for asynchronous operations, valid only if TID is
  *	  required for transaction, like REQUEST operations.
-- 
2.48.1

