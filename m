Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278596;
	b=oUusP0f0ZBY4PaWyQTtNlSuDBGOG+Bow7mYfRDkExftkOiZLpuUlPwcT20reEwL1+RIl
	 ieKNE3nvgur+sWSzkj97Ti0tACfgDxMKBAB2fKc5TE74qEMUpn0PwoIwIPkRazdobdx6q
	 KoK8bTRTLYS8m/ab1AxDR0GwMpHToGd/aiyMn7HPcY0YC0GtNOwRUK1XHkk3mHfYERTsI
	 CEdM7o4rhtdnrZl8/n7ZBI//eiCAtBEegcxKaH3ecNr8FLd+vbTDDCz9NO2+R0xJg+sEV
	 P5KBA+sH3srEbIlsbkaCD54Z45VSui/vz2todZ2yXX8SXmCdRBK4Mj689RoLpG8VbRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
	b=lPVKIzZgPvSRiJRT2RoZyTKehSzbodYJHLTsEyT04HRk4Xdj6cXjJq3hhdj8U83VywIA
	 ep5sYX/ff6VbAUgLseUuTeCZs5wq6FK/hK+OStb5u/BX9UXFajiaGjvD1kP2vb7CqJNrc
	 iFOs4/uaM7gi3FnUeT2e+QslA0TlXZ7kKNgkMOtQc5fhqVqhULES3NTY/8wKR8PbwYs77
	 fo3875zE6bCi1MtVJNTEDn+VZ7HxCH11ZvbyTxVV3MpfRYyjhHlfTOVWMQveBnJUIa1qW
	 JZebhZoHqFgqI8CIqal3OK+u5XNh0pn+Db/yxmaNjupjWpjAahazkdJ2RWdb3CSfvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpkGXqll;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72A606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 12:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D72A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpkGXqll
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9661815e9.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278595; x=1793883395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
        b=WpkGXqllcpaOtVUp1WiDef8+FU4QYF21b+R7GKBxnBh/VxVJJtVqPqMXMkTU5sYEn0
         ghNrF6Hsd4juhbXHYY0Pbq8zmM5nCDNAcy2a+jVuMacGFDTfEgCmqfex7C1yf45ZXQdU
         qsiUng+5MCYDbpy7JmJfjWM855F2llXFitxodea6mMwRlZEhIg2+6/pJ4RlAnzxAUUpk
         myYz+asg2wQtOtm1CpRgOf8y9tJTwcK4aeGR7fhNloroh0+Xdl5vwmphrAOQ0uCICf/I
         JOCrOWNZwMq71Q2I5xlrtDCeom06d37uCREup9Fys/pCZFBi2NgYdg5SnsZ+MWV13GEC
         81mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278595; x=1793883395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
        b=GaH4AfgsWRh31MhKXnmtGB95lSYlNsk9yN2rOqyCenLi4NwLt2/lw+FcroOECosmA3
         SANqsKK4DbrFgNBGP7HS7xR4QhjX3oKperiPOzUlULR8OIwlP6FuQ+muE4238OQk6z+8
         GiYfJN3rsr7G0ssSg+4LncLNsf1RNmSOP0emRFwy5yBwBXgWaxlGUBHhSMuytHZQ5wD7
         7OvCe70dPYiTEKBincvMGoDtSkMwg+opsaByKHFLBqaM1tbTCJBFimmU4k7+LL1OdySj
         RcPZLleyweQBbwO2FZa9dMG3h7VvUjCXGWXmICaexQc5GGYxacQIdsZYFWf+PdRP3XNG
         rTaw==
X-Forwarded-Encrypted: i=1; AKwUvBwfv9t/f8fpVo0Dc3Jr+64BMjGul/nmrCDwDLtjKw9P90kCZ+2AY1G+nPKGz4PJOR/Wxyl7vX0C77pqGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI21eRaHS4tFKOF+fjnjpP9rbZaYOkX7DO2gyNRzUwvjHbYK3Cj
	4QgySkOMubV6BvQFZ5jsJYzML2RjjyDOBgKjF1Ea4hyC8jZnH1XCNekv
X-Gm-Gg: AYBFou0CDNmYyEqzImBOF8nbTFmwniLpktKrm7s+nOW+GQHZUb1tbKrd1nu3TZPMie2
	fvcggYGt6unZc1T0ME15bGRd0FiOIoFhKLgykUPXeXrtA8hqugIbni9D2oAPEaJSZrM7bP4M88W
	8KLdSt0tZ7b7dNuHbFoyDYFK9/hpLzWTU7+jyc/oIW0IXxB1dIb3Dpz7rPRSX7a9Swh68oPPDna
	limbwybju4pbS+B8dimOYUw8X/q3J8hsProoJzj9zACPCdzKWgT5mkomFxkP9hGCej0zQp8CQ6F
	SumNcAUQ32Y9GwMBQ5vJE6KDiIcmEfU4ASeLKWRNHol/O9tYGu/Y/DKUJKNA7eAuaiUVuMuUFiR
	v3sk7+xioxGJeqWpTsRoOOnNvjPHQl5Ec/eR+fvunf+Mwq7b2v+0ZGUDqpDiTKROE8GCGXRupdx
	GqEcd2SqBp7Mtrsiz7ue1jTo1a/5NCa02a7qh2QZk8kxNdgz5zQDWzxclX3X+oaUsJGeENXcd0D
	qYd4QITXWwq5EpOrICELKyiwdSFo1up55ykrhsTHFPgP1E908ar+7sEbnM0C/UoA+dBbDVMmX2O
	KcDfj9GNL+yQHmVI/sAW0K442lLviHFHHoM=
X-Received: by 2002:a05:600c:1387:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4aa877ae8b3mr64502615e9.11.1793278594547;
        Thu, 29 Oct 2026 05:56:34 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:ff14:b834:842:6dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm64711245e9.13.2026.10.29.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:34 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] slimbus: return port disconnect errors from stream unprepare
Date: Thu, 29 Oct 2026 14:56:32 +0200
Message-ID: <20261029125631.1551141-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

slim_stream_unprepare() ignores errors from slim_disconnect_port()
and returns success even when a port disconnect transaction fails.

Continue attempting to disconnect all ports, but return the first
error to the caller. Keep freeing the port array after the attempts
so a failed disconnect does not prevent a subsequent stream prepare.

Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- limit the fix to reporting the first disconnect error (still attempt
  every port and always release the port array)
- dropped v1's retained port state, selective retry, and stream_free()
  change to avoid blocking re-prepare in existing codec callers

A complete recovery solution would also require the codec callers to
handle disconnect failures and coordinate hardware state, retries, and
stream lifetime across stop/start cycles. That broader work is left for
future submissions - this revision fixes error reporting without changing
stream cleanup semantics.

v1: https://lore.kernel.org/r/20261028145508.1111792-2-thnkslprpt@gmail.com

 drivers/slimbus/stream.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index b4e70a7edd1cc..220e22088f8f6 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -448,19 +448,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
  */
 int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
-	int i;
+	int ret = 0, err, i;
 
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
-	for (i = 0; i < stream->num_ports; i++)
-		slim_disconnect_port(stream, &stream->ports[i]);
+	for (i = 0; i < stream->num_ports; i++) {
+		err = slim_disconnect_port(stream, &stream->ports[i]);
+		if (err && !ret)
+			ret = err;
+	}
 
 	kfree(stream->ports);
 	stream->ports = NULL;
 	stream->num_ports = 0;
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(slim_stream_unprepare);
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

