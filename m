Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853469;
	b=sa5if9mdJH3YVVC+yBe56zmNPZ2SbxES89Vk/aXENV362sRP37ck4Phgn4alk/dzZm/R
	 GEHY76T2lQisbES6kiZUhJSnWKhf+s9m2bGr+QArinstivOF/YTvLo1hrg/VGtl/GoXdc
	 PLipAECu5dJmDHbg7TqhWjc/WuCw/2JHxkAFyo7+Rb6sJh5JTmJQJBZs9KzRMHKeWUocm
	 O7f8B8rDV2qZUyUS0iT+5WAuELlaPtQoVyvNj8giPYoPtX+Cq9GDsN2VZ8GxWwXoWSKtA
	 xAME7Pjjs7je61tkTu8fE9dEfRUGHaAN0RAdgr619uwJ/kCyEUNaR8jIdsr000U5dEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
	b=qCVWQZUDFUMQxe4MWd2/OBYIJd4uss5ft0ObF2yTfix3nKPBIc4DHxCEWH4EPB0nFGFc
	 fdFu8GJsUxfwY6LhsSAshkr2YiHE/pJy3z7EXo7Ub+nM2mc1hWFnvHw9AH2kxbWFiYipa
	 rFxczjglOUu9TZOwfgr7gSXS42lZMW6DhlYDNqrAUiIffVFgI6ois9VjCP1y1+20mVuhW
	 zR41EPTxvqzXY3u/5Ev6HXeMfEDc4iVnXoKiU4Okq6Xtbp+MQaWkUcxboRmGNQWuKn9VY
	 /7ws1TaHMllOGMM/FJVQL3YfOFDa8/ul5073BqdIJ0prr6NBo3Hha1q9D312FaQdSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/frIY+x";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18DE606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/frIY+x
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so16788669eec.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853468; x=1796458268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
        b=s/frIY+xdUnqUWX2PGNcV4XTjxeqcBdbvf7pP16W1uLXqyfhFX+t+muWMK0eNwuz4S
         dh5RLB2E6yauBykK+xC09CC+W8pGiaZTyssxl5WUuYDFqr3qVsjto67xn+F9vLDkv1q0
         IJi3ceWg9i+86JqWIpk4ETv63A1XOsODniUoEa9k1OuhM6mhL1D/T9VB6/X0kaQMv1Q8
         /jebq2ctg+LJTBqu+yXQELal7prns9V+GvVSxNCidKYa4P3cKx+2dOGSyk0tsU6wgZRC
         3yNth/XZa0GtO5Ys1zPQzSqMNCeKYIuH4VBIXccFMZ2AVE8r69bVS+9zvyjPSoHKwXFC
         KySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853468; x=1796458268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
        b=dT8zjGnnVJ7Aq6FpnGiGGMs5BvIEMiiFcBX1tblgiU5ZvnenFaohy2vJbrHlrgKjjg
         Vd5kF5Ju2q64oLQqsYBmeSuzbIiGfdvyRYVjhpjXlkSaXV2A1dd1W2SHHeVRR3V0w+Jn
         /j17W4z+mupSsAXazcAil1oOdXe4b6WA0Ysis2l+NASIvxDaM1nhS8p5AfrOzIcuJd4a
         rVDlTlZ6d+L8Xm8gW3STkr4Bhq7Ju5Sh3aMjA27Nnavv7d0DAMCUlnmnCHkKSG91ifXI
         nXISr0Qzd6JOTy7mlB8oGQM7p218l4ZdFYTa3IgUUX/nkHPEI8ACZURKT9uWqJNdmqdC
         0PFg==
X-Forwarded-Encrypted: i=1; AL+hErGb3SXN4gj+b94ekYOQTge8TJ7Oq6R9QfjmDhTq9Tlk84ATm0/n9o+T/OZ/11u7D5+rdgvS7T9YmBXalw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yNzHU39/4k6wzECuvsICDdObo2cuvNFBemRcF7kvMzSASw0dU
	8Xi+ITCT2+lZQCcN3H3F3Tqm/f/GTeoTqVzC+OUp4qjNvDVAGbpf6HFf
X-Gm-Gg: AZFdTZedmDdNd/mUgNwyyCYVUuFwnJbDsJxxXj9PDEb7o2VAvaYH23ynEdmr/M1EIXQ
	pjtWMdE4oNacwviQHJbqubVU3vBYeLlA/kgXHqx6/O42pCFd0gnS1lJzxraHdO7jTeIm3bJacy8
	97SwwcLhXxnofMd28Q+WMg6KNyP2RuDFYje2biuVJVgrdB0cFlu+ffR2asL8KARRlTl2xqviqEL
	ycqg6IU12os4YKQFox0oVtyHlBOr5E7MQ2wqMJH0XDEmmbUvqhBC2XQPRw5+sb+DGQ3LbOw4lJM
	pbIbnljxNKQjz9y8Dfltz369mfiKxcV79dsssB/Hs3HaGNw4T4DoT19CbUfPCMSE2vu/HVjsPDN
	SVFjruj7GrSt3DLV+/kSbeUX2Zazw0/gWuV3Qxm+qmjt2nFkUa63kMNbk7tfZlceGlc/F5pOxzu
	39lkajl4GchEA+nm5aPnvnvYeCwSRl5CXKD2njM6mq/9euciXwKcbN74bC2462l0QL8XwzAykoB
	jpgxDvx6uVqOo8Iue3h90Q1Ilmfzb4HuW9YTWW1giL828PM3XJWUD3ieYEdz6Xcft+5VADt17Cm
	kUGAzw3OUM0ETr7dM1MLFWabHzNT6KGbhsQoV6SfcKQBOOVtRwjM
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr26545761eec.27.1795853467909;
        Sat, 28 Nov 2026 00:11:07 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm47038711eec.9.2026.11.28.00.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:11:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] aoa: Fix codec unregister handling
Date: Sat, 28 Nov 2026 08:10:25 +0000
Message-ID: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Fix aoa_codec_unregister() to use the codec's own fabric pointer
when removing a codec.

Previously, the function checked the global fabric pointer instead
of codec->fabric. This could call the fabric's remove_codec()
callback for a codec that was never attached to the fabric.

The function also called module_put() unconditionally, even when
no module reference had been acquired by attach_codec_to_fabric().
This could cause an incorrect module reference count.

Save codec->fabric before unregistering the codec, and call
exit(), remove_codec(), and module_put() only when the codec is
actually attached to a fabric.

This also prevents releasing the module reference a second time
when codec initialization has already failed and the attach path
has cleaned up.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/aoa/core/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/aoa/core/core.c b/sound/aoa/core/core.c
index 99b032a4081f..41a3b79ca93a 100644
--- a/sound/aoa/core/core.c
+++ b/sound/aoa/core/core.c
@@ -71,13 +71,18 @@ EXPORT_SYMBOL_GPL(aoa_codec_register);
 
 void aoa_codec_unregister(struct aoa_codec *codec)
 {
+	struct aoa_fabric *codec_fabric = codec->fabric;
+
 	list_del(&codec->list);
-	if (codec->fabric && codec->exit)
-		codec->exit(codec);
-	if (fabric && fabric->remove_codec)
-		fabric->remove_codec(codec);
-	codec->fabric = NULL;
-	module_put(codec->owner);
+	if (codec_fabric) {
+		if (codec->exit)
+			codec->exit(codec);
+		if (codec_fabric->remove_codec)
+			codec_fabric->remove_codec(codec);
+
+		codec->fabric = NULL;
+		module_put(codec->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(aoa_codec_unregister);
 
-- 
2.55.0

