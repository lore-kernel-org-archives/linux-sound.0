Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049888;
	b=lQ+0G/qI27RYhA/8mxHgvzRdTvQub1sLQcbDI+xnr5QUCwPBBY6pSD2447Lld+SZSqi1
	 v4Xex6xOWKjhfEQ6BeiOjt3E5ODm/I8CyxWRaFREh07UnfcaurF6/yosS45R7hnkmVPJm
	 iHwnm/7FGqV01Am7xq/qyMxd0Rht/PC4UeMzqZgDJvy71PrT8BNJgG9S5AwWvqJT+Tb9P
	 Pv4vkis+8xpz9D2at3LfCipf89BUjHOSLhrBXL1gCrmHcgmyEebSeqhjGS6ajk+fsVrEt
	 C0dNEQI3Ix25nfGHbUSjrklUxEt+FFzp2PX7Hy10V5YC98F0BC7soHylQDGpO7q8dkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
	b=mL4wS4iR3HytHH62OgPyo0w1JqzYUM5Q51ErD16VY1HIvmOj1s6I40IXNG73yXbYivvf
	 GyK8ZoLq1zTTNbwByXEhgG8tvbCmuZVXhSm9LCDgQJvdR5tfPZlOBNESdCzWC8p2g7RZe
	 5jyGRDf5AcozY+FEXdBVsL5FCSmoJ/UvV/5CJhVh5e3kPBIQwB/36sL2P5p/I70znCy1y
	 kZ7oeFtvhG6NHl9gHZg8Pw1mItIhX+bIRgKHIE3X74UbF6O3CNlNlxEeMODoOPbUFtAX+
	 a2jgQmY2ymhVK132QRLhbe0bh7cxHMjdj6CiIB5ygYz9aaCXjChXiuCgmaBrnZTr6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublbcDVg;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720E606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6720E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublbcDVg
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso323056eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049886; x=1794654686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
        b=ublbcDVg2tEYPKewsQpukaBaBzxDJovRTOC2RkH9BuQJxOrpDI/XXMCm8+ctvS2Cp7
         Of3irGlYInwGu2Cs9tT1/Q8iwhv6fxQwNWKOj8NGKFv5BjA58iKT1r+XMG3Z8OdOdD+B
         jCiTEyc3lTVpMwROBDgG2Z91EbodPmy//A5vdE3G6pjwZW0dWy4qf1ChVZglKJk+hX/P
         vWkFhQowxAjbWR4vnUedm3QtiCu+t6sYrmX814ke/5r1034MUw7/0amZz36MiOo4bDy/
         90k1Ee1gytzEIQxVzj70rZZD0SA9sdLU82QYoNpFBYTMS8CAWxrsaoNTLmSQugdVu664
         OB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049886; x=1794654686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
        b=c0v07S+riX60fOrjmhxQG39DvL2axXHpQUOiS1+AQDh9YjdWQzwvMnX8WH1kyo88fV
         I46ax+1XimjEXUPJFC38NUoegUa6LXO/XbUkTrvTwV8ybF0j161+MsalOECLWRDHBS7C
         XikB2pSVESPTPmakuCJwUBvPeEcMG/5VYgF9GNuyyNAGKpMPO/40Zon8MTxzrMStilz8
         bQHUFXV4shAazj5YzMdqtGDqXxWhwTxnPam1/lGzoY9jAHHOjzUjK4V5R7dFcinI/qST
         kQ0OH8/MRJ+doExXaev/S40S0nakz92ft6bLm98akJ21otpfWrPfClQboaYrH3vM975X
         DEBQ==
X-Forwarded-Encrypted: i=1; AL+hErH/FK8SzUBbIl1r+MKrpn08ld0Ky0wXxTcZRPznn5ZKj+lhJATQFck2RSzbuo/zmDLhICheVtXY0dhF8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hXuoBxrIR7R51rZOrIRAdezf4upLVgsdOdFHoYkDgp9qfji+V
	IEsGmGdrnsRneSKofB+ncBpY3VvhEbB98FMo8lMfzWfzo/OUriwNUs3K
X-Gm-Gg: AYBFou3gvgzKp9CX2aaJVSLh2G6f8HNtYPax0LmaRxVDNImR01l6kIukKDsmRWursne
	SBY801Bmpd0oWSxqiExMcEKysVcVHLm3Z0lgTJhZLzeX1fDRVo9YVnJ0Mxeh9A4N7k46G6rgpP5
	Ga1dCkwH6duyaZui0Aan7WUTC4e9eCqMDEbsghyKfbCSkbT3Oo8WAAVOy8nHsaguJzh02DQHKSa
	71Z4cI/HPPaPN8J9Jn3Yvsfg6/fkTMnGiyxEDkW09WwET4G3MLBkxO7cLx3x2B7YwLLpEey9Vg6
	z9mvr05Dvnf1kAn78GWZkP4HZ3uvyxOFXj+RRetJuCvL1/puJnyjjk5hOpRMeUvqtfmEfsrKQ22
	LP1VSjJVdvyzhJSyczd8gFbGPyJWF8YvhD5npA3i5/KzD4e9XlYb0jYZt+gCTfbxbKD/B/R+FI2
	SKbHnlAAfyCcD2OXe2WLtDmdJGsgXch8NZCRfPs0aA6aJdpUvV9saWrBg/P8CO6qCUKy4Rxck4W
	5CggT+MijtQ1uHfdij6cT3KDVPMM9F+GuKkf+0jBxWQPK68KsU8SqEUwNymTxguAVWWYUj5Zkg0
	hQeRbnchKTlVzpau9rXjCFY7xYbpCgEd+VR4qFeXYMx/N6O7I0aV1MY2Vrdiy9ZpZz87yiKtQeC
	5
X-Received: by 2002:a05:693c:26cc:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36f7611ec47mr6077505eec.15.1794049886246;
        Sat, 07 Nov 2026 03:11:26 -0800 (PST)
Received: from WIN-GDFRURIH76O ([45.198.20.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm15105878eec.29.2026.11.07.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:11:25 -0800 (PST)
From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sat,  7 Nov 2026 18:10:54 +0700
Message-ID: <20261107111056.667-1-alyandra5b@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

The legacy-to-UMP converter keeps separate RPN and NRPN selector
flags. When a stream changes selector type without sending data first,
both flags remain set and fill_rpn() gives RPN priority, so subsequent
NRPN data is emitted as RPN.

Clear the previous selector flag after flushing any pending parameter
data and before recording the newly selected parameter type.

Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
---
 sound/core/ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 0a7972d91..b112064cb 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -378,6 +378,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 		switch (buf[1]) {
 		case UMP_CC_RPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_msb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -385,6 +386,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_RPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_lsb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -392,11 +394,13 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_NRPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_msb = buf[2];
 			return ret;
 		case UMP_CC_NRPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_lsb = buf[2];
 			return ret;
