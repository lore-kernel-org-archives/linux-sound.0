Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142204;
	b=F53ndHKIS3Jt3S7+vqTQrVlPeu2fiq5ToUxaDR0x3M2/sqUtlQO9e98THIAd4bkECHST
	 6pP0OHxoHBhJuRN3ecLdIANn+oXDi4A3k/C9zbbFs2PH30EiwrN8IDObJQ6zqqspawQ6O
	 Swxpsbqp0we/q0OE+62yHqd9akRpolP7WxodQVtNZuX5RBdcSSS6PHG9vV4zUhZZhcf+V
	 lzDU4yBhwGd3sFFY0ccP5ntdff1lqg7O76zSQ6z+lNHwDwk0tCQ+2qdcdq5+OfJJTyCVg
	 wq+Qi5m0HBoLJbSB3aMPbysPwgPfhhOunaSq7l9br5RJ42zXTbsMjeEOA4fmUiWlxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
	b=YYZky9PqgdtLaMU6B+TvNGXZlugliOBtD3VMWApUvj2ftRaHWgqFjOnp8+1YZSQQvDgG
	 hUZMr+iCYb7NBChnkQL20tW7QTZqxpeV+UwUfc85MBoyuRNRqh+QOe1clvb8InBijhfpk
	 OUaHX5z1a/vhMm54NXYvtx8PNwyJkf9nX2hBwKyfqIWWdriLeO+0NotimWmM3ymJ6DkPv
	 wwG7bmjIou4ZgIAzaSBFOAz6BwVs6tV2PAikE1oqb/gqguNkXnefdOBY1EEjW1DomBJuJ
	 dGiRopnnEuDzN9qOVN6WFMyC7/oUZ/TUnRYgNrNeEsAfvkCWtq9qTogbK1pr18Rjq4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vietNS6N;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A5606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vietNS6N
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so216637eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142203; x=1794747003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
        b=vietNS6N5zCsXv6MLfVJkKW9Da18RJa+gqmlpEKL3gTzyuenpPTs8Flg+8jYPloUwr
         QKxqjzIvVYnGgRI0CEJdbogCArqwHSilB7AI/kAl6NlhcH+EtjTFdw2W2RywsB3rh40s
         Bnn//LrSSnqlq+58nWsayWK/ofII7wwbdWPbF2T/1lwWnm2yEKEb6A03pJif/gb2G7h7
         DI3eXF6KBpW0zQZqamjz5TAFCZNLJuEzPod3UXSoM2fUxjOLQB5aOqShpV0KTbAhV2fS
         LiU6SwIA+bYlmAvJ9M/ux2wVmaq4rakvWSI1oDiW60uPtRgbeCvWjg75E9BbrUE6JGeO
         iahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142203; x=1794747003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
        b=Ls5ZWThWHMEldHLR4NhIwKLgNpKGrwiSmuN5IuvabEjunbmUwEn7gU4deHaeWtmg/7
         BLPJOmCNoVuVGQ2S/bfG3noNtioTWs4lvu6DdHcOx+Yjwp/H+4CcmaAvL1lxsB/nVK5X
         l6qUAtrG/BlW4l2miXfq2rKN6D95ZbUEmvHLG+pzZr7GeT1vDvMDjbKh9bkYjjuAJHDE
         eugdCKBlFhprWhiY0y0Thvv66cDbOq6EONUPijSYq4yKuiCJvD74wlbhK98Bxw3EzXTa
         RTfYhRjWxppH0Dj25Gf4WULVy12yuvWz76sSd1LbAG0TgW60Nhg6JCRk7ySga4AkpA3i
         tc1A==
X-Forwarded-Encrypted: i=1; AL+hErHcDGwKEtwpppHp8p3FT99bWR4FKV3JR1KAbwHw7NmnWmtTdJBCRdstlkKRV8V3wonuXvj3zsOBtNyqEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1XeYIEMNIQe0C7ct6SPFbhUoDL23pxYbQEAr7Ji3sU3rh1jbi
	Pf6PjfVgUhXOfY35sXa5bslwQtENKeQz593OCZyl3juoDGTS/67t6ka8
X-Gm-Gg: AYBFou3juq82uLi2SW7ZHatlSnacAyTiCM2ADBvVrRO3rdOAziucePldF9evukmS2SM
	jaTe/+22SnyVM5Li4PTsH9pEKY0ZmOZqPYUjly/BT6+vJ5n8+VqF1AAcb4FO980DuR906rcSqZg
	e2f4bWZ3t0Qp82UfMcgkc2Y6L6CQLaatggcR/T6xBkNcyVi4sGh5SmW8JiuNNjQyoHcRQGwLP64
	CNusjMa0ncRPZt73d7stv2zlPs4tHXZmCEKqPkjsLFtS8XfHtVPwYmvxjoKjI2cRw+dpadgBTFZ
	tx0oPdrvImj85N5zyduaKG17gfGSn6tn3fOmGkLEYTBE9ExGVNejKNBezKE1Vwa+C0iv6FPtg0I
	PLpK4SCEZkdzLUm/e9XaKgIAAHD9OQPqPp7yLzyYMunky9dqdRRrLz7c5guEPTygURndfChDz2N
	3Tb0Y4Ws+5AJFigSDL33wgm6IyBmfcOtp+MbDbyp318rHkuZvY3bSQpZ21dUdubJZJRLpr20Az3
	X0nUqkVvHPs7cYa7N3SxalQ016JyOxghst4zb361BlOG+XGqYi9x0XR0Lrr80NvJKXZWEhR5obM
	lSC+HdoSaYtQmzCt81YKoTZi3Lk/YQ1rhTHOgSExn0DraMYxSiEy2gl1ut1+HaHYTm/NSMsJkVB
	dW3NbQNq/42z7WcLRLoQ1IdEyUWoN1TT2OcxikaGw
X-Received: by 2002:a05:693c:8347:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-3725e91fa89mr3067487eec.29.1794142202678;
        Sun, 08 Nov 2026 04:50:02 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:50:02 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] ALSA: seq: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
Date: Sun,  8 Nov 2026 21:47:51 +0900
Message-ID: <81e86fb562df29953314f754b1daace962e85566.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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

The sequencer converts MIDI 1.0 CC and CONTROL14 events to MIDI 2.0 UMP
with the same RPN/NRPN state handling as the UMP core helper. It has
the same problems:

- Data Entry without a selection is sent at the next RPN/NRPN
  selection, with the number only half updated.
- A repeated Data Entry for the same RPN is not sent right away and
  ends up as above.
- A Null NRPN is not handled.

Apply the same fix as for the UMP core helper to both the CC and the
CONTROL14 paths.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Fixes: a4ff92ff0bdd ("ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/20261104121508.3972314-1-sammiee5311@gmail.com/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index bac37d4ef43c..62bdef6dca58 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -790,13 +790,22 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 	return 1;
 }
 
+static void reset_rpn_data(struct ump_cvt_to_ump_bank *cc)
+{
+	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+}
+
+/*
+ * Deselect on a Null RPN/NRPN, but keep the 7f/7f numbers as a MIDI 1.0
+ * receiver does. Otherwise, when the LSB was already 127, the second
+ * message of a Null would select RPN or NRPN 0/127.
+ */
 static void reset_rpn(struct ump_cvt_to_ump_bank *cc)
 {
 	cc->rpn_set = 0;
 	cc->nrpn_set = 0;
-	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	cc->cc_data_msb = cc->cc_data_lsb = 0;
-	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	reset_rpn_data(cc);
 }
 
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
@@ -820,6 +829,8 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		data->rpn.bank = cc->cc_nrpn_msb;
 		data->rpn.index = cc->cc_nrpn_lsb;
 	} else {
+		/* no RPN/NRPN selected (e.g. after a Null), drop the data */
+		reset_rpn_data(cc);
 		return 0; // skip
 	}
 
@@ -827,7 +838,8 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 					     cc->cc_data_lsb);
 	data->rpn.channel = channel;
 
-	reset_rpn(cc);
+	/* keep the RPN/NRPN selection for a following Data Entry */
+	reset_rpn_data(cc);
 	return 1;
 }
 
@@ -866,12 +878,16 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		break;
 	case UMP_CC_DATA:
 		cc->cc_data_msb_set = 1;
@@ -993,6 +1009,8 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		return ret;
 	case UMP_CC_DATA:
 	case UMP_CC_DATA_LSB:
-- 
2.43.0

