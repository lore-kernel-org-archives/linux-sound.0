Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494867;
	b=UXD32K7KwWBXO5OeVeKHYtIidhadKER6GHaXAOKSYwekZkmFwFG3eYUC+j5I0iLykoZa
	 Lxp7sxEk/b0PEC2mjJQcd4KNuv/ouOGr21DSzjZizON5JAeaas+THXk9bDZw3MyWHLsiO
	 dzlsAjLEKskh/ZIANz5/lzEf6PA500H8vvXLMTMnaydW4Dg65dYbSUOClBgNn13WYYeI7
	 lbpG9OE01LGDdWcvHB/7EUl6NXtO+yjGssKeaOqHeg1SHiPtjX6lsgbTlXLcTjWvYSiXb
	 phlnL/E2pTZoVXtuTM1rdP9gV8lNWj2cYMe2uskprER0WG3m1vkB7GtbrURgNsKrHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494867;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=P5N0JEP5ejcvC7nFlE0Zn8HSzONrn/YAOlThtpbyJMQ=;
	b=n1l7EJi2UogFQtaxoeAE2chjk5Ri48zAJ+nSNnryqrEATLWD9Nk5tcVjTwi833zxx29e
	 fVdu0jvFV13D6msltyZ0IFZBC0WG5kC3u1ydDCmKGzYehtoDIUdTVVAqCWa1qWPmbB9o7
	 84z5JL/lPSlc2KfsjehYrI1i55XqH6tuLZZ5puS6UsBc7AAXJDRhVTvF8EemJ6cqx2+zG
	 d4tCsn1xC+CxtRCFuHsFDbG7ZFVwehzJRr6Eya0DZC+SSjxJ2TWNJdJXCFrQssw+KnaWr
	 L7eiba0756uWhT1I3zxGTVOteXU6/Xunyra15P5JM3eryiHyToJOzAffs0rnKJ84DhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244B606A331
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 04:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F244B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4cd576f2aso30217307b3.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 20:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494866; x=1796099666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5N0JEP5ejcvC7nFlE0Zn8HSzONrn/YAOlThtpbyJMQ=;
        b=qEIn+czbNcDaW7unsg72f6kFCteuKXNUcd8Jo5lNmKK10uuSDYWViDcVNpFmwoCyJA
         rLrnibp3Imnz/45pS9TIH3007PYuQS6QvzuhI7tMvQPRuDOP6kHdDnXPnIqLduSYRr6y
         VwNxanT0ZZaLbYpgZzMCZaZBoSLA/BofI0NBJJiEdlR1xxwnIIW3xqe1DGeGCaCgIDpb
         iRgmMjj5Fv7tIOPyqNC+2SLMlgXAnRW5XrNKfWZfP6YnDs8t+6/NdX1+Arq1Gus770jb
         +jHPz82ANhEa92NuEu/Jgx8XzHkckKxmgZ0OtCegdUOzvStgG/EbokgdKGEOdTSfkbE+
         Di8g==
X-Gm-Message-State: APuU4Z+Y4G1T1PLV/I6wXVPPujvcQfy/m03ziVHbvbLRxOnFg8UhQOyT
	Ho3Fw40E13d161tUeT09DqG1obhXzOWPjmgMN2ZznNkQ1hpPi8Xjq+fr
X-Gm-Gg: AZFdTZfWEeQupMBv3sz8903SrvPSwbdKaT8D3cBzLFZ9sR4suXaKaJyxka9cJP6PNQ4
	HOtd2z+avXKLZgKoIEDCDuqBXSPmQp80LOPDshUwwHdwQRPrtVhV2d5zLGz31C3UpZkj+4sBWs+
	AtAU+BuRl5YofBS/BcuwqC15gLMK/TtPjhEyTwMhgbDIx3/U0TsM4XCLqZCt+PQ6JAjiwiS28Ez
	DEVxQM7PGu4+Xlarrk8NPwirsflx2uRD5vTsnEOTJuBIO+FoMInvBR75PJsAsU1LbcKAazSpioo
	SgTr9y9GE3gF4RA7ERgZbR7SXuol07YyEFYeTnMb/AXKjvCakvPdfiB8NIvP5gXrVhnPt/WUOJe
	W+UydhVv/xFUPZArJAvKC1rf/a0Xu2NG8Q9ZFZbZsuX/4YQHXpdS32e5FFVwfvgUdM/kh7Crgja
	XsSJ8fHrI9rHFGceakFUkSY6E8/OspigZOt9fKTONlAYsUFUhDSxVKzIIvSPI7z2lhKOOn7L/OG
	6Rw3eIocK5LbgVWQYlG60Zv9qt+al1Qn6Olxtt2D7MGrydOWtVKsS7kRap2iWkK8aHt7NZzafhn
	FmeJ5Vrt/xDnxKBWZ/4mP0cElrLcJULpHbSW3tNHW8740iK3G1aeJ58083yLtCluvJ//3KM+s/L
	aePOWxd1g5tNPre8qNlrr93vtNH36LJz8aenC1bZkr4/N2BotQKwDG/xzfnjJz3+K+QcmXbDw9K
	uhJwalpr43Fd+61Uu4WNQC0acX
X-Received: by 2002:a05:690c:610d:b0:8b3:5121:3d7d with SMTP id 00721157ae682-8b520475df4mr57774267b3.30.1795494865986;
        Mon, 23 Nov 2026 20:34:25 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb0a2sm53106397b3.27.2026.11.23.20.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:34:25 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 23 Nov 2026 23:34:20 -0500
Subject: [PATCH v2 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-omap-mcbsp-tdm-slot-v2-1-3e3aae215952@telaak.dev>
References: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
In-Reply-To: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
a divider above 128 is programmed 128 lower.

Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
so nothing changes for it; this lets the set_tdm_slot() support that
follows use dividers up to 256.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 sound/soc/ti/omap-mcbsp-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index da519ea1f303..324c5d7d431d 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -136,7 +136,7 @@ enum {
 #define XPHASE			BIT(15)
 
 /************************* McBSP SRGR1 bit definitions ************************/
-#define CLKGDV(value)		((value) & 0x7f)		/* Bits 0:7 */
+#define CLKGDV(value)		((value) & 0xff)		/* Bits 0:7 */
 #define FWID(value)		(((value) & 0xff) << 8)	/* Bits 8:15 */
 
 /************************* McBSP SRGR2 bit definitions ************************/

-- 
Git-155)

