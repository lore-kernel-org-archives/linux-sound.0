Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04BD2E92B3
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778125265; cv=none; b=FBkaT6EKNz3g+Q0XY8dz8jGUbfRd5D8bmbfwhVUgdumPFlMTYcMdMnVV37aH+WidK/QUUvfvaavt1V5OtfZlBkH0iYTj7gPdibFeJRLnicmKVqroqjudCcXca2DeKWjqGnoZgRQkp4GuCNRjxwBBREr4w0/AhNZFwuie6YEeX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778125265; c=relaxed/simple;
	bh=R13vLbMiQobZCeft4wigQy1eZvd+q8ciWDUl2RXDnSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1+AHYbmc7SYNYgE+zceg6RB7ViIAieb4QEkoWmifFZ5z23J+oYGLVflUh0OPG0hAtdGRVOnKok2Q6WzbuCZsbkSPJwt0ae5CHhs6ZYn3rEE1DFhe4Jgbg3FcbvzRbK0uHWZe5fIvRdd+VXdyV8ixsRkr6rBBjhN1bn85vOTttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jetE1igu; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jetE1igu"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f30a4601bbso421107eec.1
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 20:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778125264; x=1778730064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kzYvobmwTuDLJkkrhcaqeyyYJZesImpA5sRmM1ajfQ=;
        b=jetE1igu4yRztwEosAB0RUUM9CUct286nfoXid8c0JXdLvfmxzY+wzRpa4+gn1vOkV
         WSKLPcX3oDMwSoBVOdc0vl8/59kMvsQijFkfJ0v759cSWgPn8jR4dbiNckj/bki7u1k5
         siuq3dvUmjQ6Iw4Chk1istYkrvjVsfLGgYYqgcDe4lzSUW5Lkge6sSQDRIWIMjsKlUNL
         v0LXpuCEKKdPM6lpWHTEDBOMBKk2Flud2ByJz6F5SIi+crnGmsRjATw15uxrgpr19/Nq
         /A+fvyvJfnffacpG/lDYUna2E8Zrqg2UT6zZVmULSm8+NHF0nJh0m9OFTmKelqfyWm3X
         eWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778125264; x=1778730064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kzYvobmwTuDLJkkrhcaqeyyYJZesImpA5sRmM1ajfQ=;
        b=B8kj4q4ZIXXqsTzn4wLCk1j1naJ+fhJW331+Q/fxZalTz0Ji96GkEgRUR4e8zrND3z
         +kDHwGp9bS1Mo/PKKLobgYErnddUfPcqk6WdTArDKcNKHJPZ7zkc9Yjo6jv8i35bj6HL
         FWbECEvjga3oXkdKEh7tnHBwL20SHIJ8enZi9/prgAMtSGg1M3LIWY0qehchgsfOqh/4
         KY+lO/oAwHPmhmUHq6PwZsAoDrbZV/hYubfRWKlUupwqGuayMk3mUk82KzTn83+EO+Q9
         MupmrDAT9rIdlvRGQNBtTX3O1PeEAJ6udEzaWcrs5cxTO0+Mzm0Tv4Bfpr8mFRNTahBA
         R3JQ==
X-Gm-Message-State: AOJu0Yww4fRAt8xMjfSCEG/xZ3s/PU4ynKqKqGoE/PvxBqA3r0badqbp
	WMAFgfy+LXJPGgLkAMjLTPi+5im4rcMP5Ht47Vk3Yg2bZUiQembzcvHG
X-Gm-Gg: AeBDiesDv4c/PXrBm3Cw657wHxa9X1cgUBFamsi8CBKWvhO2Vea0hxaCy+ve+jnYCoF
	CtY4EjrZFrVeR/j/rYjKHgFq1qogJFrmdoWRkLnE5KP8eJZHol3XAXDmGX2ZoxxX2QXiwGHWKN2
	GtOOxYOP4+gZDEdSN6N30t8mTcyQTNsNWdZP0+mdSkAAuA/gOkPtKI79ZzlD77n+KnKsdjy7vdt
	mW+Du7g6h4e+fcG5ArBZ2B2xh1dacV+tQY5+41ySS13qDHjpn6eZlvgZKUvPI6zYaF0v72oOc27
	xF6M0i5l0RlBPezg3/5XpcEpXlr/Fl3Ag1Qcmrf3l694QlRKYf8L1GyQIHSAhZRE43q2w/6RLdW
	um8ZDpemJgahApgwGmqGLYr+S/7VrISySjAHqLPevnAEUaDUIj0b2cMpObqmzeOqNXitnZVKUa/
	Fch+Gr5jFIDsGK0OwODAhef8MpAT7NW5HFeq9KwytU8npDcukdYNbLoUEI+tOo6TqTdy/hB4yWr
	ZQuWZm7XI6d
X-Received: by 2002:a05:7300:2387:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2f54b897efemr3072912eec.4.1778125263705;
        Wed, 06 May 2026 20:41:03 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6882677eec.26.2026.05.06.20.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:41:03 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 07 May 2026 00:40:51 -0300
Subject: [PATCH 1/2] ALSA: usb-audio: Bound MIDI endpoint descriptor scans
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-usb-midi-endpoint-scan-bounds-v1-1-329d7348160e@gmail.com>
References: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
In-Reply-To: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Andreas Steinmetz <ast@domdv.de>, 
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=R13vLbMiQobZCeft4wigQy1eZvd+q8ciWDUl2RXDnSA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl/OE9qTbT50svyzOzVDX8/K6npH0/P27nuqP6qRUl1G
 zb79+eXdpSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBENnEz/DNRrj+19xDbxWuV
 bPeSph/obn1z1qivzHyBpMavjzf5Sr8xMrwMKrnks/Tb6/jl4aZvbc2EGISq24tbDs4r09HPLHN
 J4gQA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_usbmidi_get_ms_info() validates the internal MIDIStreaming endpoint
descriptor size before using baAssocJackID[], but the descriptor walker can
still return a class-specific endpoint descriptor whose bLength exceeds the
remaining bytes in the endpoint-extra scan.

That leaves later flexible-array reads bounded by bLength, but not by the
remaining bytes in the endpoint-extra scan.

Stop walking when bLength is zero or
extends past the remaining endpoint-extra scan.

Fixes: 5c6cd7021a05 ("ALSA: usb-audio: Fix case when USB MIDI interface has more than one extra endpoint descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/midi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 0a5b8941ebda..d87e3f357cf7 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1951,15 +1951,17 @@ static struct usb_ms_endpoint_descriptor *find_usb_ms_endpoint_descriptor(
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
 		    ms_ep->bDescriptorSubtype == UAC_MS_GENERAL)
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

