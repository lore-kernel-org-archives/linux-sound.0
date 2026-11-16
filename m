Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866626;
	b=xWLAdT2cs15ufYbIfcM6CSwUveiG3+dhhWOTVoLevbJ+viGQ+8jZilbZDgzSh5focS5q
	 SoZ1fnEvC6EbxT2gB/kKMLB2/3N3O+gA1tmSFmXnWkBs+XxkRnLC5LUL7ChtUMzKx+Qt6
	 hiJKahaxsWEcvTzXgOKU5OLL5XgdXhZu1z8RYR9pJ4I45KEqwy7hRBHsKgYIQljfnaIN5
	 fCPT6RLYXpOlXdfktFR4eo8xnhnz8R+428Vodg4x82U9Q4QQd8Ogi/QdVbUJ6MGyAUMIu
	 UznFUl1tU7WnEqs7AKC2kz3Jw1ylSWikLnIi126Ujq9l9tH1UPcNM/UU3ojMBE/dfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866626;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=LB+H1KfzRZwbsIbgdOQxyz35ct4YMH+KJmEsb1/UgSU=;
	b=AXtbr3IJTv4xhLJT3vxqZmMw4YMErlo+ofw0PKomgsBWlhgB+C2hHWWGM6N0C2LjLzW1
	 pxBQZh9wPyzF+pJ7IXstGygEwpS4DZPkM5BqjUjq3ZOwDdRZDBS2o0GMIvjrgFzjtwSBF
	 KrkQ2QysOP6Cz2uAH+zjsrri/lS5wm6TKd4HlnTDZKYa6l+r7EUBGruHZrM4sOCEGUCNi
	 ExBMyS1tHPfemHTJIVl8q9AWSZuwmXDRiz0arMYO1BRR3bHIorNnsR3+MVHykasw6torS
	 WMB0Ni47pkCXl+OgPf8aE4JkG4+YRjuMdrCPvJdyE0GmF5CEEPoWFJaFn3yjqCa16BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE74606A33A
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE74606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67db3a48dc6so2027373d50.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866625; x=1795471425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+H1KfzRZwbsIbgdOQxyz35ct4YMH+KJmEsb1/UgSU=;
        b=FVJlNN3+3ZyuYn2CtycWOKQ+li7p7hlaf1EGyK5xZxqvqzv0yYEkUwtLPJnbOWlq8/
         fAzIswFHmgZejUKpX/wRDGOPTM0xIvuii8UaVGcIA866JXbUzfVqf+gPMgpS5inAkjxx
         id2WPYpl1ByztGwJh1vE1eWcBn9pyQC251e6D1p91ID/BSv7+1RCcHeV6FBENzrOlbm7
         xOb/fIY0LrF898GVe3hGnJwb69VFU3kvQrjmO4mQxTh+xEvnEmSZMX+Dba4CwZJcaVMD
         +b1JlPy8S4ARDl5sFvj2uaMt/U+zYCfCQ4El1iOBIIX3YhRBfMxajTlhGnctuVBnLfYg
         ZEEQ==
X-Gm-Message-State: APuU4Z8QwxW22kT8UKnX8A7L9XKRh75YTiyUN+2qemcDnmsieIHUM5wm
	wc/re9qINaj3zFATiu643DqTPscPtpf1wdppj3UW3c98PBv6jal1Jr+6
X-Gm-Gg: AZFdTZcKs5UU7PG46hyNXLezo0MeXaQUmgRupwZzChcANadMHXsWsqwctNxVIRXwVRN
	0tVB96mYwQtzMr6Mehf5p2zeFvsGgd3GQxse4r2nT5JnBfa4C1lzeMJOqKUcQbK6Xt/RW2ug+ak
	12EALdMx0AIaN8nnp++FFLTWwvTIiRqjfn09oe3J+Am52CP3h6VyrJfbxdhu4L0mys1RLuUEn/x
	NdhADckorNlLnDKNvvKtv+/hAnjtI17oY7McYa4H0pu4rapH7so5w8uFgeiRXODKYEcjVe+FFSg
	zerX4/GAFEekAtjE0meYIhOWz3bpTuF00CeGKZPlBjIcOf3rFdTojM64rVqYfYRlAFuSOTVPqBW
	UCQW/7x801OQ/YWzqTobGL7/GFbf5rgB2V3Cy83UdRCNpEHUGCy1JyYDMcHHRcwBo7XjbByFh/S
	gFxbyOG4vzfZQhndUWG1zo8XuWoqrYicatWxe61lFgqrSIclXMmiBvrLEDVWY/SaF+QXloEbqXM
	ncfDJzZxdie2ZtsR9vNM905l2JvgtnhYJUHawaos7wht3zxRnHaGonX4MI4foV4bin9fkX3IwS5
	PG340F9oa4haTGc1E2/ydsWrAOu24e8PyCHj0DPkZASqYZRaheA9LG9UjqWOtkeawsTOPtglRG8
	CAsqypEMJ6jyp0NDc+KFoAovHv/LdBxsg
X-Received: by 2002:a05:690e:12c1:b0:67d:b0df:9095 with SMTP id 956f58d0204a3-67db0df9d3cmr2820810d50.126.1794866624543;
        Mon, 16 Nov 2026 14:03:44 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm11133078d50.21.2026.11.16.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:03:44 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:03:21 -0500
Subject: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
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
Message-Id: <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
In-Reply-To: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
a divider above 128 is written modulo 128.

Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
so nothing changes for it; this lets the set_tdm_slot() support that
follows use dividers up to 256.

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

