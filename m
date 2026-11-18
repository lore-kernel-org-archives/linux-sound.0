Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990281;
	b=13Lvo7WEotJWS/LtmNKlofrd0NF+aP0Z/si+kRFFfVlQA1dWuFN8g39vnarpdg4oYKld
	 FlexUYbzeogdHo3/75ix1q+/iLcYpxrc7KVdSYFKi8axAK9MMOD4R4fohiMHd5vf7XGUB
	 Q/Z1OhscJxuhHli6tGyKuN5MOCSzPQeuKEoA6W+d6jPaaPiYnIQw5qGHm4y32cxUVJfKc
	 6GorUiQ4/p69PUneq0/IBudKXIS0/D+19wCFiVgI1VOHncTdVyjAXoOtMaJE+HoUo+pxy
	 TOiZZgxiKoE6hXL50N0p5AXBzjZltJQirbA+VjeQHBQtDvihe4FSiNmsUXAsr3jOCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990281;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=820pQUqaUHDX2GM9UQ/wkFPS9tJvZUSCeS9jBYqVfCQ=;
	b=CJPNfn/Kippj4m72+UeDHIbGTmhayJ9/2ynmGNn1Il4eBsk0kZ4GMGf3M8dT/qNBt/x9
	 dFlZbOIumKqw0Jhg9mQhlvsebzEXf8oNkBgnakaXVmFzjhFRvTHJdPz6F6dTHcmrlnt2g
	 TK9RBOCmUpbjomYK/SiIxcChTuk1BEhg2275HMne8CQmubbHbiF1ShzRz/5knM8IAAsIi
	 vvfhMv6SbZ5q+QWY4DfFCsy4+lz3WKjX+97BgmPqs9ZonIoWamfGC6B7ASTqvj6YW+dCf
	 J7dyjebnbaxcWOnyE5bm6sVT42o3GcJHYavSvU+zfIQvb124fzN3PrTpmo1KHb+cgIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=hxdPU9yw;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEB3606A31C;
	Wed, 18 Nov 2026 08:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CEB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=hxdPU9yw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794990214;
	bh=820pQUqaUHDX2GM9UQ/wkFPS9tJvZUSCeS9jBYqVfCQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hxdPU9ywCeZYFahEscYL2Pc0wMZCTjZAanLbpM9+LGP+5qstez7vFBdfW+e0ounzi
	 rYl4L3RXCdf8wNRxwaLt++gg7b8bITvtU5WUYbjFjaps4tfnOlvkrQ0DcKMRGdDlz4
	 IR8XC26+hKTftEMr+8aqnmvBATbzrzwMtKRUDvMo=
X-QQ-mid: zesmtpgz7t1794990209t60ac6531
X-QQ-Originating-IP: Ec3UQ3CTl6PAjraZqq9pW6x6npDildNMx0o2+AgWK/E=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 16:23:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4243911746232227252
EX-QQ-RecipientCnt: 10
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: cs42xx8: Restore cache-only mode on resume failure
Date: Wed, 18 Nov 2026 16:23:24 +0800
Message-ID: <31EF1D727C977B5E+20261118082325.3915977-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MBKLumFSBSSxEOJcgdbIEUEuk2EdaycLAHlgC4CAL7uAo5qbB8ITfOYZ
	BCD33a8nOkakGy2vKJQI3PAXY7YzU8JWjgjkjEilwQm9ne2843cWFTq/yqNcI2BWsPReN+s
	GQCbcAXEjqiUhPbQJKPKIN3VlLdTUgSiYNvGzz5Qgb102t8bmK+tD8Tgh2/KoglLFO/af+p
	DyTmkq4+Tf2Qzn89LqcWkSCrQuzdp9JuYaXR8MkQytt4p0B622f7mEtR0RcnKLfmpwxEfBB
	rThJnZv1zse8o2/NRtPcGO029YYO3laOsdrjwy1HxEkhodGr+Dz1pB5zMZn8Y9jxdv8iUF7
	0DnWxIdVQg402d2IhPdNHTqz0WQJntDqmMQbqfKOCss3GB2H13UeUNKREjLK+5zkv0m+9/8
	oZ4yKpYDa25GeSFUEiFDWYFJCdCqUU8WWuS5w3KkMLe1lg5m0gq57amtjo6a1Rb6HQLOpCN
	EBC5h0fJx565JHOpd77IezSmLSX/VllLuh/lUoMH18slz9V2MTxXzhdXOR3FeMYzdmzA1mN
	5wra2OCAb7DAuvzKsUdXAbbzrrW64n7UcNND/gYCSrubQStbdxnu39MoVpCMulpyR8CjsaX
	84nLf8buKSC57SXqIRF8gr5Y0mEjurXw33Q5wma86ZEdX2lMlRA3Io6eHVLz3YFK5/yvnL4
	PVanYuVtQXUfRSvL0kSlqIhM6HZcSvoXmpXapgaaVmvZ2LnSucjuAlU0663x5EdFN5Pn5nu
	wh2pmdNmDI2PLYuJ/4UoReb4vgT1rxTu1tuqKLsJzJnbID6PMBti8hKvo4RxWZowrEgvM5y
	tHQOMgTAHqKr4p2QKu4TnuSQVYmmNfzXBCs8LhbN7cNYYqMZ2Ju+hsGc+D/TU5uAm3KBLDL
	Ou0FogOERgRRe19RPKXKbMkT2bUsT59tCkcrxnPZtDSKE26OA2/ofqpjHb5Y8FbcnTBV4v6
	QU5NksBv0j4yxyf809YoguV9bv4+Ttk/MPnPNhtUMtdTCe+wjmfzYR6TWDUAmfEjDnx2bto
	q+G8PqxRgwfxPa2bTu9hl7jx3wTDdc4tfm/JPULygo8mIEg9vQ
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The runtime resume callback leaves cache-only mode before synchronizing
the register cache. If regcache_sync() fails, it disables the supplies and
clock but leaves cache-only mode disabled. Subsequent register accesses
can therefore reach the unpowered device instead of using the cache.

Restore cache-only mode before disabling the supplies on a cache sync
failure, as the runtime suspend callback does before powering down.

Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver support for CS42448/CS42888")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/cs42xx8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 94860e2802fe..797bb67eafca 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -671,6 +671,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
 	return 0;
 
 err_bulk:
+	regcache_cache_only(cs42xx8->regmap, true);
 	regulator_bulk_disable(ARRAY_SIZE(cs42xx8->supplies),
 			       cs42xx8->supplies);
 err_clk:
-- 
2.50.1


