Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657F2E7635
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778125271; cv=none; b=gVz3j0LRSeXs1Jq5nmi46OSGkUkvBAlEjd6ykQPKcgiQTZaeexHhXxPb5g8t7EHVBKE1x6EPX6rNhYAa7zLtbEuvAP1/cW9Mul1ulYU3Kgo3AwTBTcBBU0bD/0bzeCq1+yXBlD06Qwy5v1UpJ8+hUFKaNGRMFnDAyvpipQSJvy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778125271; c=relaxed/simple;
	bh=5ZxZyVybouA1Mduqbo3hKVa/J06PZ5yuIW+r71ae+mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSBqbwJj4X9Koy2x2H3FiH1j/G39SzNe7xpKp/zHmJWtKar3ru4RZ192dSzBMBXFBGSoLqBTMNm67OKVWMU66UOVBn4ryGYVA6SeFvQ8SQ+PB/bp3JDvU5ozZsgeMdJVSI+VnP/v2AvLbbQc+LbYpRkYQ77jBLoY/7PAdSmv+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ckc78MDN; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ckc78MDN"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-130c653cce4so1169128c88.1
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778125267; x=1778730067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nleLAQUlrvdfXv9QhDg66/S/1PB+xB3gu8412xW8j5s=;
        b=Ckc78MDNLJRna3a8udTpjqtPB7GgSb1Lfr1P23wEVvk41m7O4hLedsnRb2qsi86Yiu
         qAvh/24esl/egLk4+HMw2W76QZDiYVc9qTAS4lwIqutjYvkOudK/xM8ub5DDI892rQ0E
         hQD6x2xgbCiiwUTrBU4vk9WHY5UvzbyWn4p0cN3Gt4VxqV6zg2nk3qyY5EWROXfvyhv0
         E3C604/vyZPVWxoAsKb9aFk8FJwd8mqGAOIsxS/2DsAtO0hKxXlVmzZdUdygb9SvVbz/
         AhGQRhTvM9Gc8h0iM2Fue3g2l3+Wz+j7+wGAP3PlWbFpT/s1LjrKzEOkLn9cKQLAG3Q5
         7rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778125267; x=1778730067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nleLAQUlrvdfXv9QhDg66/S/1PB+xB3gu8412xW8j5s=;
        b=GIQSyYJvnekMq8szYKxLu03YF8NSK9gRi4mvsUNANGJk91nZ63vFIrxZr6lAplqdMF
         M0Gp1L9yyfSQ+nKw9zNgr9wcGZaEChSyYV82+It3pJhjlRSlqz/+8UqBcwQMxxZzpuYb
         uFLkYan6T9iXZSH1fT72Azi6fJAI2Be9J7GLyNr1JHEyUxvCtgr/JYDSf3n18vvfy24K
         DFEXou+8PYCT7QA4wJjyjs62yV9oauOkPQKjmcuBSgfwIPYNDXucWnY+QGqQJ5FtL/af
         k69NiWZaUm2LCenm3ESLr9jqX4Cob0/pcPz3+irInLyNDJj+bXG84kRl5kusneDeBrAm
         5Y/A==
X-Gm-Message-State: AOJu0Yxigfw78RTA1DaXLf8xBnUi+SWBWjRoaLrbRTfzAljUC7jlCRM1
	jhhVRAo8Vxt8OWUPnskFaHBCuimt1iebvMreucKJgpayptOE5A6DhnKe
X-Gm-Gg: AeBDies7MsMAYs2ZoggRkca6C5qfJCltpnCyWnqs+2habhzSLNLqVMpdD4L4vMJDu8S
	a8fTgiqOUkRKL3ToM4rMTq/ThfXA33RmUzbBnj0eoZpT6TS4G0cfvoMzdeIaYKQQXDogSFo4b2s
	gPT3Mv5yaVPSbvsh6oUTO8SIYt0znI/0yUZStxRV1EvbQfAcQXjr/oUI4L32+Pjo6hIzx2gGn/e
	nkW/Ce/fLYJqiXpE9CvYcRID3nTQXeKlqd7zwVL+0YDxBdBgxtvY++DWOV2lOayJN3+6pzH//Kt
	DVbRmDpmtHwhL4fNy7SUNFAWQL25REQg2dYmq+UC5RsolekEllEXPcPmONQbNyj73Gq6cqvjoct
	hZJBdGDW4ihbRtg9q2PxNhMWFHxVwg0EyRn++whq4HZPnNJz5QNfSWD+CHbM5v3eaA1G7GNtP71
	IO7rnIWGhfTHBMRCePEhxAizc3/lwa+zaIy5YEDchag9VVEqhnzszGXJE781CKzPRnsPznOQVvm
	fqAMjUujPq0
X-Received: by 2002:a05:7022:61a:b0:12d:de3f:d847 with SMTP id a92af1059eb24-1319cf558acmr3091983c88.42.1778125266546;
        Wed, 06 May 2026 20:41:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6882677eec.26.2026.05.06.20.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:41:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 07 May 2026 00:40:52 -0300
Subject: [PATCH 2/2] ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor
 scans
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-usb-midi-endpoint-scan-bounds-v1-2-329d7348160e@gmail.com>
References: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
In-Reply-To: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Andreas Steinmetz <ast@domdv.de>, 
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=5ZxZyVybouA1Mduqbo3hKVa/J06PZ5yuIW+r71ae+mc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl/OE9d/lZ7Veedv5TJ87eHvH3Tz4mtsXwY3DxPYZ1t0
 MkgpcPtHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjAR22CG/+7Kj/U3ygWn/ZAJ
 CX+5+8S12x8sVnKpyqh4yd+YtWfexA0M/xQ41nlzGR9nTzx+5uTzNSmii1p2tjfIGUxf/XBb/I/
 vPlwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The USB MIDI 2.0 endpoint parser has the same descriptor walking
pattern as the legacy MIDI parser. It validates bLength against
bNumGrpTrmBlock before reading baAssoGrpTrmBlkID[], but not against the
remaining bytes in the endpoint-extra scan.

A malformed device can therefore make later baAssoGrpTrmBlkID[] reads
consume bytes past the walked descriptor.

Reject zero-length and overlong descriptors while walking endpoint
extras.

Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/midi2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 2785600d2312..04aeb9052f13 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -496,15 +496,17 @@ static void *find_usb_ms_endpoint_descriptor(struct usb_host_endpoint *hostep,
 	while (extralen > 3) {
 		struct usb_ms_endpoint_descriptor *ms_ep =
 			(struct usb_ms_endpoint_descriptor *)extra;
+		int length = ms_ep->bLength;
 
-		if (ms_ep->bLength > 3 &&
+		if (!length || length > extralen)
+			break;
+
+		if (length > 3 &&
 		    ms_ep->bDescriptorType == USB_DT_CS_ENDPOINT &&
 		    ms_ep->bDescriptorSubtype == subtype)
 			return ms_ep;
-		if (!extra[0])
-			break;
-		extralen -= extra[0];
-		extra += extra[0];
+		extralen -= length;
+		extra += length;
 	}
 	return NULL;
 }

-- 
2.54.0

